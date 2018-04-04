<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="controller.lmy.HelpDAO"%>
<%@page import="controller.lmy.HelpDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!DOCTYPE html>
<html lang="en">
  <head>
   	
   	<meta charset="utf-8">
	
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css'/>">
    
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>HelpView.jsp</title>
 <!--   <script>
  $( function() {
    $( "#accordion" ).accordion({
      collapsible: true
    });
  } );
  </script> -->
  
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  </head>
    <!-- Navbar menu -->  
<body class="app sidebar-mini">
    <jsp:include page="/Top.jsp"/>
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <jsp:include page="/Left.jsp"/>
      
   <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-dashboard"></i>도움말 관리</h1>
        </div>
      </div>
      <div class="row">
         <div class="col-md-12" >
          <div class="tile">
            <div class="tile-body">
              <table class="table table-hover table-bordered" id="sampleTable">
               
               <thead>
                  <tr>
                  
                    <th style="width: 10%"  class="text-center">카테고리</th>
             		<th  class="text-center">타이틀</th>    
                    <th style="width: 10%"  class="text-center">등록일</th>
                   	<th style="width: 10%"  class="text-center">작성자</th>
                    <th style="width: 10%" class="text-center">게시물관리</th>
                     
                  </tr>
                
                </thead>
                
                 <tr>
                 	
                     <td class="text-center">${dto.category}</td>
                     <td class="text-center"> ${dto.title}</td>
                     <td class="text-center">${dto.regidate}</td>
                     <td class="text-center">${dto.normal_or_host}</td>
                     <td class="text-center">${dto.id}</td>
			      </tr>   
                	
              </table>
			    <td colspan="2">
	  				<ul style="width:50%" class="nav nav-pills center-block"  role="tablist">
	 						<li role="presentation" ><a href="#" id="update">수정</a></li>
	  						<li role="presentation"><a href="#" id="delete">삭제</a></li>
	  						<li role="presentation"><a href="#">목록</a></li>
					</ul>						
	  			</td>
            </div>
          </div>
        </div>
      </div>
		<!--  키값 -->
<div>
 <input type="hidden" name="key" value="${dto.notice_no}"/>

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
    <script type="text/javascript">$('#sampleTable').DataTable();</script>
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