<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/common/IsMember.jsp" %>
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
				<i class="fa fa-dashboard"></i> QnA 상세보기
			</h1>
			<p>QnA 상세보기</p>
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
              <h3 class="panel-title">TITLE</h3>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class="col-md-3 col-lg-3 " align="center">
                 	<img alt="User Pic" src="${img}" class="img-circle img-responsive"> 
                 	</div>
                <div class=" col-md-9 col-lg-9 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>질문유형</td>
                        <td>${question_type}</td>
                      </tr>
                      <tr>
                        <td>제목</td>
                        <td>${question_title}</td>
                      </tr>
                      <tr>
                        <td>작성일</td>
                        <td>${regidate}</td>
                      </tr>
                      <tr>
                      <td>처리 여부</td>
                      <td>${state eq "0"?'처리 대기중':'답변 완료' }</td>
                      </tr>
                      <tr>
                      	<td>아이디</td>
	                    <td>${realid}</td>
                      </tr>
                      <tr>
                      	<td>등급</td>
	                    <td>${grade}</td>
                      </tr>
                       <tr>
                        <td>이메일</td>
                        <td>${mail}</td>
                      </tr>
                      <tr>
                        <td>연락처</td>
                        <td>${phone}</td>
                      </tr>
                        <tr>
                        <td>메일수신여부   |   sns수신여부</td>
                        <td>${n_alarm_mail}|${n_alarm_sms}</td>
                      </tr>
                      <tr>
                        <td>질문내용</td>
                        <td>${question_content}</td>
                      </tr>
                      
                    </tbody>
                  </table>
                  
                     <c:if test="${admin_id eq null && state eq '0'}">
		                  <div class="row justify-content-center">
			                  <div class="row justify-content-center" style="margin-right: 1.5em;">
			                  	<a href="<c:url value='/question/current/Current.do'/>" class="btn btn-primary">목록으로 이동</a>
			                  </div>
			                  <!-- ---------------------답변하기--------------------------------------------- -->
			                  <div class="row justify-content-center">
			                  	<a href="#reply" class="btn btn-primary" data-toggle="collapse"  aria-expanded="false" aria-controls="collapseExample">답변하기</a>
			                  
			                  </div>
			              </div>
							<div class="collapse" id="reply">
								<!-- ---------------------답변하기--------------------------------------------- -->
								<form action="<c:url value='/question/current/Reply.do'/>" method="post" onsubmit="return isValidate(this)">
								
								<input type="hidden" name="no" value="${no }"/>
								<input type="hidden" name="admin_id" value="${sessionScope.USER_ID}"/>
								
									<div class="form-group">
										<label for="comment">답변 내용</label>
										<textarea name="content" class="form-control" rows="3"></textarea>
									</div>
										<button type="submit" class="btn btn-primary" id="complete">완료</button>
								</form>
							</div>
					  </c:if>
					  
					  <c:if test="${state eq '1' }">
					  		<div>
								<div class="form-group">
									<label for="comment">답변 내용</label>
									<article class="form-control" rows="3">${content}</article>
								</div>
							</div>
					  		<div class="row justify-content-center">
			                  <div class="row justify-content-center" style="margin-right: 1.5em;">
			                  	<a href="<c:url value='/question/current/Current.do'/>" class="btn btn-primary">목록으로 이동</a>
			                  </div>
			                
			              	</div>
			           </c:if>
              <!-- ------------------------------------------------------------------- -->
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
<!-- 완료 버튼클릭시 박아주는 함수-------------------------------------------------- -->	
	<script>
	/* $(function(){
		$('button[id*="complete"]').click(function(){
			$('textarea').replaceWith('<article>'+$('textarea').text()+'</article>');
		});
	}); */
</script>

<script>
function isValidate(form){
	if(form.content.value.length==0){
		alert("내용을 입력하세요");
		form.content.focus();
		return false;
	}
}
</script>
<!-- 완료 버튼클릭시 박아주는 함수-------------------------------------------------- -->	

</body>
</html>

