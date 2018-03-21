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
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <div class="tile-body">
              <table class="table table-hover table-bordered" id="sampleTable">
          
                <thead>
                  <tr style="text-align: center;">
                    <th>유형</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>날짜</th>
                    <th>처리 여부</th>
                    <th>처리 날짜</th>
                    <th>담당자</th>
                  </tr>
                  </thead>
                  
                  <tbody class="text-center">
						
							<c:forEach var="item" items="${list}" varStatus="loop">
								<tr>
									<td>${item.question_type}</td>
									<td><a href="<c:url value='/question/current/Current.do?no=${item.no}&realid=${item.realid}'/>">${item.question_title}</a></td>
									<td>${item.id}</td>
									<td>${item.regidate}</td>
									<td>답변 완료</td>
									<td>${item.answer_date}</td>
									<td>${item.admin_id}</td>
								</tr>
							</c:forEach>
							<c:forEach var="itemn" items="${listn}" varStatus="loop">
								<tr>
									<td>${itemn.question_type}</td>
									<td><a href="<c:url value='/question/current/Current.do?no=${itemn.no}&realid=${itemn.realid}'/>">${itemn.question_title}</a></td>
									<td>${itemn.id}</td>
									<td>${itemn.regidate}</td>
									<td>처리 대기중</td>
									<td>처리 대기중</td>
									<td>담당자 없음</td>
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