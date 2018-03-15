<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/IsMember.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
   	<meta charset="utf-8">
	
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/main.css"/>">
    
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <title>SC 관리자 페이지</title>
  </head>
  
 <body class="app sidebar-mini">
    <!-- Navbar-->
    <jsp:include page="/Top.jsp"/>
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <!--LEFT.JSP  --><!--LEFT.JSP  --><!--LEFT.JSP  --><!--LEFT.JSP  --><!--LEFT.JSP  --><!--LEFT.JSP  -->
    <jsp:include page="/Left.jsp"/>
    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-th-list"></i>처리 현황</h1>
          <p>문의 처리현황을 아래 테이블에서 확인하세요.</p>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item active"><a href="#">문의 처리 현황</a></li>
        </ul>
      </div>
		<div class="col-md-12">
		<div class="tile">
			<div class="panel-heading">
				<h3 class="panel-title">QnA 상세보기</h3>
			</div>
			<div class="row justify-content-center">
				<table class="table bordered">
					<tr>
						<td colspan="3" rowspan="4"><img src="${img}" height="auto" width="200px" alt="<c:url value="Images/missing_img.png"/>"/></td>
						<td>질문유형 : ${question_type}</td>
						<td>제목 : ${question_title}</td>
						<td>작성일 : ${regidate}</td>
						<td>처리 대기중</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td rowspan="2">${realid} ( ${n_nickname} )<br/>${gender} | ${age}</td>
						<td>${grade} 회원</td>
						<td>이메일 : ${mail}</td>
						<td>연락처 : ${phone}</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="4" style="text-align:center">일반 회원 소식 이메일 수신여부 : ${n_alarm_mail} | SMS 수신여부 : ${n_alarm_sms}</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="8" style="text-align:center">질문 내용</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="8" style="text-align:center"><div style="width: 80%; margin-left: auto; margin-right: auto;"
								align="center">${question_content}</div></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td><a href="<c:url value='/question/current/Current.do'/>"
							class="btn btn-primary">목록으로 이동</a></td>
						<td></td>
						<td></td>
						<td></td>
						<td><a href="<c:url value='/question/current/Current.do'/>"
							class="btn btn-primary">답변 달기</a></td>
						<td></td>
						<td></td>
					</tr>
				</table>
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
    
    <script type="text/javascript" src="<c:url value="/js/plugins/jquery.dataTables.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/js/plugins/dataTables.bootstrap.min.js" />"></script>
    
    <script type="text/javascript">
    $('#sampleTable').DataTable({
		"lengthMenu": [[3, 6, 9, -1], [3, 6, 9, "All"]]
    });
    </script>
   
    
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
  </body>
</html>