<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<aside class="app-sidebar">
      <div class="app-sidebar__user" style="margin-left: 5px;">
      	<i class="fa fa-address-card fa-lg"></i>
        <div style="margin-left: 20px;">
           <p class="app-sidebar__user-name">
          <%= session.getAttribute("USER_ID")==null? "로그인 안되있다.": session.getAttribute("USER_ID")%></p>
          <p class="app-sidebar__user-designation">
          <!-- 타 페이지 에러방지용 임시값 추가 -->
          <%= session.getAttribute("USER_LEVEL")==null? "임시" :
        	  session.getAttribute("USER_LEVEL").equals("M") ? "마스터 관리자" :
        	  session.getAttribute("USER_LEVEL").equals("A") ? "통계관리자" :
        	  session.getAttribute("USER_LEVEL").equals("S") ? "서비스관리자" :  "CS관리자"%></p>
        </div>
      </div>
      <hr style="background-color: gray;"/>
      <ul class="app-menu">
      
        <li><a class="app-menu__item ${requestScope.active}" href="<c:url value='/ADMIN/List.do'/>"><i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">관리자 관리</span></a></li>
   
   
   		<c:if test="${sessionScope.USER_LEVEL=='M' or sessionScope.USER_LEVEL=='C' or sessionScope.USER_LEVEL=='A'}">
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-th-list"></i><span class="app-menu__label">회원 관리</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="<c:url value='/member/normal/NormalManage.do'/>"><i class="icon fa fa-circle-o"></i>일반 회원</a></li>
            <li><a class="treeview-item" href="<c:url value='/MEMBER/HostMng.do'/>"><i class="icon fa fa-circle-o"></i>호스트 회원</a></li>
          </ul>
        </li>
        </c:if>
        
        <c:if test="${sessionScope.USER_LEVEL=='M' or sessionScope.USER_LEVEL=='A'}">
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-th-list"></i><span class="app-menu__label">통계 관리</span><i class="treeview-indicator fa fa-angle-right"></i></a>
      	  <ul class="treeview-menu">
            <li><a class="treeview-item" href="<c:url value='/analysis/Reserve.do'/>"><i class="icon fa fa-circle-o"></i>이용 통계</a></li>
          </ul>
        </li>
        </c:if>
        
        <c:if test="${sessionScope.USER_LEVEL=='M' or sessionScope.USER_LEVEL=='C'}">
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-th-list"></i><span class="app-menu__label">문의 관리</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="<c:url value='/question/current/Current.do'/>"><i class="icon fa fa-circle-o"></i>처리 현황</a></li>
            <li><a class="treeview-item" href="<c:url value='/question/current/Processing.do'/>"><i class="icon fa fa-circle-o"></i>문의 통계</a></li>
          </ul>
        </li>
        </c:if>
        
        <c:if test="${sessionScope.USER_LEVEL=='M' or sessionScope.USER_LEVEL=='S'}">
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-th-list"></i><span class="app-menu__label">서비스 정보 관리</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="<c:url value='/serviceinfo/notice/NoticeShow.jsp'/>"><i class="icon fa fa-circle-o"></i>공지사항 관리</a></li>
            <li><a class="treeview-item" href="<c:url value='/serviceinfo/help/HelpList.do'/>"><i class="icon fa fa-circle-o"></i>도움말 관리</a></li>
            <li><a class="treeview-item" href="#"><i class="icon fa fa-circle-o"></i>FAQ 관리</a></li>
            <li><a class="treeview-item" href="<c:url value='/NormalInfo/List.do'/>"><i class="icon fa fa-circle-o"></i>일반 이용정보</a></li>
            <li><a class="treeview-item" href="<c:url value='/HostInfoList/Listhost.do'/>"><i class="icon fa fa-circle-o"></i>호스트 이용정보</a></li>
           </ul>
        </li>
        </c:if>
 
      </ul>
    </aside>