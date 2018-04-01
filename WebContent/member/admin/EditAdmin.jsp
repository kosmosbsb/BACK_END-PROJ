<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/IsMember.jsp" %>

<!DOCTYPE html>
<html>
  <head>
   	<meta charset="utf-8">
	
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="../../css/main.css">
    
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <title>SC 관리자 페이지</title>
  </head>
  
  

  	<!-- Navbar menu -->
	<body class="app sidebar-mini">
    <jsp:include page="/Top.jsp"/>
  
	<body class="app sidebar-mini">

    <!-- Navbar-->
    <header class="app-header"><a class="app-header__logo" href="index.jsp" ><img src="<c:url value='/Images/backend_logo.png'/>" style="width: 220px; height: auto; margin-left: -10px; margin-top: -10px;"/></a>
      <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"></a>
      <!-- Navbar Right Menu-->
      <ul class="app-nav">
        <li class="app-search">
          <input class="app-search__input" type="search" placeholder="Search">
          <button class="app-search__button"><i class="fa fa-search"></i></button>
        </li>
        <!--Notification Menu-->
        <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown"><i class="fa fa-bell-o fa-lg"></i></a>
          <ul class="app-notification dropdown-menu dropdown-menu-right">
            <li class="app-notification__title">You have 4 new notifications.</li>
            <div class="app-notification__content">
              <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa fa-envelope fa-stack-1x fa-inverse"></i></span></span>
                  <div>
                    <p class="app-notification__message">Lisa sent you a mail</p>
                    <p class="app-notification__meta">2 min ago</p>
                  </div></a></li>
              <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-danger"></i><i class="fa fa-hdd-o fa-stack-1x fa-inverse"></i></span></span>
                  <div>
                    <p class="app-notification__message">Mail server not working</p>
                    <p class="app-notification__meta">5 min ago</p>
                  </div></a></li>
              <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-success"></i><i class="fa fa-money fa-stack-1x fa-inverse"></i></span></span>
                  <div>
                    <p class="app-notification__message">Transaction complete</p>
                    <p class="app-notification__meta">2 days ago</p>
                  </div></a></li>
              <div class="app-notification__content">
                <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa fa-envelope fa-stack-1x fa-inverse"></i></span></span>
                    <div>
                      <p class="app-notification__message">Lisa sent you a mail</p>
                      <p class="app-notification__meta">2 min ago</p>
                    </div></a></li>
                <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-danger"></i><i class="fa fa-hdd-o fa-stack-1x fa-inverse"></i></span></span>
                    <div>
                      <p class="app-notification__message">Mail server not working</p>
                      <p class="app-notification__meta">5 min ago</p>
                    </div></a></li>
                <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-success"></i><i class="fa fa-money fa-stack-1x fa-inverse"></i></span></span>
                    <div>
                      <p class="app-notification__message">Transaction complete</p>
                      <p class="app-notification__meta">2 days ago</p>
                    </div></a></li>
              </div>
            </div>
            <li class="app-notification__footer"><a href="#">See all notifications.</a></li>
          </ul>
        </li>
        <!-- User Menu-->
        <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown"><i class="fa fa-user fa-lg"></i></a>
          <ul class="dropdown-menu settings-menu dropdown-menu-right">
            <li><a class="dropdown-item" href="page-user.html"><i class="fa fa-cog fa-lg"></i> Settings</a></li>
            <li><a class="dropdown-item" href="page-user.html"><i class="fa fa-user fa-lg"></i> Profile</a></li>
            <li><a class="dropdown-item" href='<c:url value="/Session06/Logout.jsp"/>'><i class="fa fa-sign-out fa-lg"></i> Logout</a></li>
          </ul>
        </li>
      </ul>
    </header>
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    
    <jsp:include page="../../Left.jsp"/>


    <main class="app-content">
      <div class="app-title">

<div class="col-md-6">
          <div class="tile">
            <h3 class="tile-title">관리자 수정</h3>
            <div class="tile-body">
            <!-- form 전송 전, 자바스크립트 함수로 유효성체크! true-전송 false-전송 취소 -->
              <form class="form-horizontal" method="post" name="editForm" onsubmit="return editOK();" action="<c:url value='/ADMIN/Edit.do'/>" >
              	<div class="form-group row">
                  <label class="control-label col-md-3">아이디</label>
                  <div class="col-md-8">
                    <input class="form-control" name="id" type="text" value="${param.id}" disabled>
                  </div>
                </div>
                <div class="form-group row">
                  <label class="control-label col-md-3">비밀번호</label>
                  <div class="col-md-8">
                    <input class="form-control" name="pwd" type="password">
                  </div>
                </div>
                <div class="form-group row">
                  <label class="control-label col-md-3">비밀번호 확인</label>
                  <div class="col-md-8">
                    <input class="form-control" name="pwd2" type="password">
                  </div>
                </div>
                <div class="form-group row">
                  <label class="control-label col-md-3">이름</label>
                  <div class="col-md-8">
                    <input class="form-control" name="admin_name" type="text">
                  </div>
                </div>
                <c:if test="${sessionScope.USER_LEVEL!='M'}">
                	<input type="hidden" name="admin_level" value="${param.admin_level}">
                	<div class="form-group row">
	                  <label class="control-label col-md-3">관리자 등급</label>
	                  <div class="col-md-9">
	                    <div class="form-check">
	                      <label class="form-check-label">
	                        <input class="form-check-input" type="radio" name="admin_level" value="M" <c:if test="${param.admin_level=='M'}">checked</c:if> disabled>마스터 관리자
	                      </label>
	                    </div>
	                    <div class="form-check">
	                      <label class="form-check-label">
	                        <input class="form-check-input" type="radio" name="admin_level" value="S" <c:if test="${param.admin_level=='S'}">checked</c:if> disabled>서비스 관리자
	                      </label>
	                    </div>
	                    <div class="form-check">
	                      <label class="form-check-label">
	                        <input class="form-check-input" type="radio" name="admin_level" value="C" <c:if test="${param.admin_level=='C'}">checked</c:if> disabled>CS 관리자
	                      </label>
	                    </div>
	                    <div class="form-check">
	                      <label class="form-check-label">
	                        <input class="form-check-input" type="radio" name="admin_level" value="A" <c:if test="${param.admin_level=='A'}">checked</c:if> disabled>통계 관리자
	                      </label>
	                    </div>
	                  </div>
	                </div>
                </c:if>
           	 <c:if test="${sessionScope.USER_LEVEL=='M' and param.id==sessionScope.USER_ID}">
	                <div class="form-group row">
	                  <label class="control-label col-md-3">관리자 등급</label>
	                  <div class="col-md-9">
	                    <div class="form-check">
	                      <label class="form-check-label">
	                        <input class="form-check-input" type="radio" name="admin_level" value="M" <c:if test="${param.admin_level=='M'}">checked</c:if> disabled>마스터 관리자
	                      </label>
	                    </div>
	                    <div class="form-check">
	                      <label class="form-check-label">
	                        <input class="form-check-input" type="radio" name="admin_level" value="S" <c:if test="${param.admin_level=='S'}">checked</c:if> disabled>서비스 관리자
	                      </label>
	                    </div>
	                    <div class="form-check">
	                      <label class="form-check-label">
	                        <input class="form-check-input" type="radio" name="admin_level" value="C" <c:if test="${param.admin_level=='C'}">checked</c:if> disabled>CS 관리자
	                      </label>
	                    </div>
	                    <div class="form-check">
	                      <label class="form-check-label">
	                        <input class="form-check-input" type="radio" name="admin_level" value="A" <c:if test="${param.admin_level=='A'}">checked</c:if> disabled>통계 관리자
	                      </label>
	                    </div>
	                  </div>
	                </div>
               </c:if>
               <c:if test="${sessionScope.USER_LEVEL=='M' and param.id!=sessionScope.USER_ID}">
	                <div class="form-group row">
	                  <label class="control-label col-md-3">관리자 등급</label>
	                  <div class="col-md-9">
	                    <div class="form-check">
	                      <label class="form-check-label">
	                        <input class="form-check-input" type="radio" name="admin_level" value="M" <c:if test="${param.admin_level=='M'}">checked</c:if> >마스터 관리자
	                      </label>
	                    </div>
	                    <div class="form-check">
	                      <label class="form-check-label">
	                        <input class="form-check-input" type="radio" name="admin_level" value="S" <c:if test="${param.admin_level=='S'}">checked</c:if> >서비스 관리자
	                      </label>
	                    </div>
	                    <div class="form-check">
	                      <label class="form-check-label">
	                        <input class="form-check-input" type="radio" name="admin_level" value="C" <c:if test="${param.admin_level=='C'}">checked</c:if> >CS 관리자
	                      </label>
	                    </div>
	                    <div class="form-check">
	                      <label class="form-check-label">
	                        <input class="form-check-input" type="radio" name="admin_level" value="A" <c:if test="${param.admin_level=='A'}">checked</c:if> >통계 관리자
	                      </label>
	                    </div>
	                  </div>
	                </div>
               </c:if>
		            <div class="tile-footer">
		              <div class="row">
		                <div class="col-md-8 col-md-offset-3">
		                  <input class="btn btn-primary" type="submit" value="수정하기"/>
		                  <button class="btn btn-danger" type="button" onclick='location.href="<c:url value='/ADMIN/List.do'/>"'><i class="fa fa-ban fa-lg"></i>취소</button>
		                </div>
		              </div>
		            </div>
              </form>
            </div>

          </div>
        </div>



      </div>
    </main>
        <!-- Essential javascripts for application to work-->
    <script src="../../js/jquery-3.2.1.min.js"></script>
    <script src="../../js/popper.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <script src="../../js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="../../js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <!-- Google analytics script-->
    <script type="text/javascript">
      if(document.location.hostname == 'pratikborsadiya.in') {
      	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
      	ga('create', 'UA-72504830-1', 'auto');
      	ga('send', 'pageview');
      }
    </script>
 <script>
 
	function editOK(){

		if(document.forms['editForm'].elements['pwd'].value.trim() == ''){
			alert('비밀번호를 입력해주세요.');
			document.forms['editForm'].elements['pwd'].focus();
			return false;
		}
		
		if(document.forms['editForm'].elements['pwd2'].value.trim() =='' || 
			document.forms['editForm'].elements['pwd'].value.trim() != document.forms['editForm'].elements['pwd2'].value.trim()){
			document.forms['editForm'].elements['pwd2'].focus();
			alert('비밀번호가 일치하지 않습니다.');
			return false;
		}

		if(document.forms['editForm'].elements['admin_name'].value.trim() == ''){
			document.forms['editForm'].elements['admin_name'].focus();
			alert('이름을 입력해주세요.');
			return false;
		}
		
		if(confirm("정말 수정하시겠습니까?")){
			document.forms['editForm'].elements['id'].removeAttribute('disabled');

			var radioTagArr = document.getElementsByName('admin_level');
			for(var i=0 ; i < radioTagArr.length ; i++){
				document.getElementsByName('admin_level')[i].removeAttribute('disabled');
			}
			
			return true;
		}
	}
</script>
</body>

</html>
