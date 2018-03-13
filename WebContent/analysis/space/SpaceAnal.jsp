<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--@ include file="/common/IsMember.jsp" --%>

<!DOCTYPE html>
<html>

    <jsp:include page="/Top.jsp"/>
    
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    
    <jsp:include page="/Left.jsp"/>
    
    
   <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-th-list"></i> 공간 통계</h1>
          <p>각 항목별 공간 운영현황을 확인하세요.</p>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item active"><a href="#">공간 통계</a></li>
        </ul>
      </div>

      <div class="row">
        <div class="col-md-12">
        
          <div class="tile">
          <c:if test="${USER_LEVEL=='M'}">
          <button class="btn btn-primary pull-right" type="button" onclick='location.href="<c:url value='/member/admin/IncludeAdmin.jsp'/>"'><i class="fa fa-user fa-lg"></i>새 관리자 등록</button>
          </c:if>
            <div class="tile-body">
              <table class="table table-hover table-bordered" id="sampleTable">
                <thead>
                  <tr>
                    <th style="width: 12%">유형</th>
                    <th>아이디</th>
                    <th>관리자명</th>
                    <th style="width: 12%">등록일</th>
                    <th style="width: 16%">계정관리</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${list}" varStatus="loop">
	   				<tr>
	   					<td>${item.admin_level == 'M' ? '마스터관리자' : item.admin_level == 'A' ? '통계관리자' : 'CS관리자'}</td>
	   					<td>${item.id}</td>
	   					<td>${item.admin_name}</td>
	   					<td>${item.regidate}</td>
	   					<td>
	   						<c:if test="${item.id == USER_ID}">
	   						&nbsp;&nbsp;<button class="btn btn-primary" type="button" onclick='location.href="<c:url value='/member/admin/IncludeAdmin.jsp'/>"'><i class="fa fa-fw fa-lg fa-wrench"></i>수정&nbsp;</button>
	   						</c:if>
	   						<c:if test="${USER_LEVEL == 'M'}">
	   						&nbsp;&nbsp;<button class="btn btn-danger" type="button" onclick="deleteOK('${item.id}')"><i class="fa fa-fw fa-lg fa-times-circle"></i>삭제&nbsp;</button>
	   						</c:if>
	   					</td>
	   				</tr>
		   		</c:forEach>
                </tbody>
              </table>	
            </div>
          </div>
        </div>
      </div>
    </main>
    <!-- Essential javascripts for application to work-->
    <script src="<c:url value='/js/jquery-3.2.1.min.js'/>"></script>
    <script src="<c:url value='/js/popper.min.js'/>"></script>
    <script src="<c:url value='/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/js/main.js'/>"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="<c:url value='/js/plugins/pace.min.js'/>"></script>
    <!-- Page specific javascripts-->
    <!-- Data table plugin-->
    <script type="text/javascript" src="<c:url value='/js/plugins/jquery.dataTables.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/js/plugins/dataTables.bootstrap.min.js'/>"></script>
    <script type="text/javascript">
    	$('#sampleTable').DataTable({
    		"lengthMenu": [[3, 6, 9, -1], [3, 6, 9, "All"]]
        });</script>
    <!-- Google analytics script-->
    <script type="text/javascript">

      function deleteOK(id){
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href='<c:url value="/ADMIN/Delete.do?id='+id+'"/>';
		}
      };
    </script>
  </body>
</html>