<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>

<style>

	@media only screen and (max-width: 1026px) {
    #picture {
        display: none;
    }
    #picture2 {
        display: show;
    }
    #info{
    	width:90%;
    }
}
	@media only screen and (min-width: 1026px) {
	#picture2 {
        display: none;
    }
    #picture {
        display: show;
    }
}

</style>

<!-- Main CSS-->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/css/main.css"/>">

<!-- Font-icon css-->
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->


<title>SC 관리자 페이지</title>
<style>
.table td {
	text-align: center;
}

</style>

</head>
	<!-- Navbar menu -->
	<body class="app sidebar-mini">
	<jsp:include page="../../Top.jsp" />
	
	<!-- Sidebar menu Left-->
	<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
	<jsp:include page="../../Left.jsp" />


	<main class="app-content">
	<div class="app-title">
		<div>
		
			<h1>
				<i class="fa fa-dashboard"></i> Dashboard
			</h1>
			<p>일반 회원 상세보기</p>
		</div>
		<ul class="app-breadcrumb breadcrumb">
			<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
			<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
		</ul>
	</div>
	
	<div class="container">
      <div class="row">
      <!-- 
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
         -->
         <div class="col-md-12 toppad" >
          <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title">${id}님 정보</h3>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class="col-md-3 col-lg-3 " align="center">
                 	<img alt="User Pic" src="<c:url value='9.png'/>" class="img-circle img-responsive"> 
                 	</div>
                <div class=" col-md-9 col-lg-9 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>ID</td>
                        <td>${id}</td>
                      </tr>
                       <tr>
                        <td>NickName</td>
                        <td>${nickname}</td>
                      </tr>
                      <tr>
                        <td>NAME</td>
                        <td>${name}</td>
                      </tr>
                      <c:if test="${gender eq 'm'}" var="flag">
                      <tr>
                        	<td>성별</td>
                        	<td>남자</td>
                      </tr>
                      </c:if>
                      <c:if test="${not flag}">
                      	<tr>
                        	<td>성별</td>
                        	<td>여자</td>
                      	</tr>
                      </c:if>
                      <tr>
                        <td>나이</td>
                        <td>${age}</td>
                      </tr>
                        <tr>
                        <td>등급</td>
                        <td>${grade}</td>
                      </tr>
                      <tr>
                        <td>Email</td>
                        <td>${mail}</td>
                      </tr>
                      <tr>
                        <td>ALARM_MAIL</td>
                        <td>${n_alarm_mail}</td>
                      </tr> 
                      <tr>
                        <td>Phone Number</td>
                        <td>${phone}</td>
                      </tr>
                      <tr>
                        <td>ALARM_SMS</td>
                        <td>${n_alarm_sms}</td>
                      </tr>
                    </tbody>
                  </table>
                  <div class="row justify-content-center">
                  	<a href="<c:url value='/member/normal/NormalManage.do'/>" class="btn btn-primary">목록으로 이동</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

	</main>
	<!-- Essential javascripts for application to work-->
	<script src="<c:url value="/js/jquery-3.2.1.min.js"/>"></script>
	<script src="<c:url value="/js/popper.min.js"/>"></script>
	<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/js/main.js"/>"></script>
	<!-- The javascript plugin to display page loading on top-->
	<script src="<c:url value="/js/plugins/pace.min.js"/>"></script>
	<script type="text/javascript"
		src="<c:url value="/js/plugins/chart.js"/>"></script>
	<script type="text/javascript">
		var url = window.location.href;
		console.log(url);
	</script>

</body>
</html>