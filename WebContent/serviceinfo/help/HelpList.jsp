<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="controller.lmy.HelpDAO"%>
<%@page import="controller.lmy.HelpDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
  <head>
   	<meta charset="utf-8">
	
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
   
   
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css'/>">
    
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <title>HelpList.jsp</title>
 	  <meta name="viewport" content="width=device-width, initial-scale=1">
 <style>
.accordion {
    background-color: #eee;
    color: #444;
    cursor: pointer;
    padding: 18px;
    width: 100%;
    border: none;
    text-align: left;
    outline: none;
    font-size: 15px;
    transition: 0.4s;
}

.active, .accordion:hover {
    background-color: #ccc; 
}

.panel {
    padding: 0 18px;
    display: none;
    background-color: white;
    overflow: hidden;
}
 </style>
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
          <h1><i class="fa fa-dashboard"></i>자료실 목록</h1>
      
        </div>
      
      </div>
      
       <div class="row">
         <div class="col-md-12" >
          <div class="tile">
            <div class="tile-body">
           
              <table class="table table-hover table-bordered">
			       <tr >
	   					<th style="width:10%">번호</th>
	   					<th style="width:40%">제목</th>
	   					<th style="width:10%">등록일</th>
	   					<th style="width:10%">N RO H</th>
	   					<th style="width:10%">카테고리</th>
	   					<th style="width:10%">작성자</th>
	   					<th style="width:10%">관리</th>
	   				</tr>

			      <c:if test="${empty requestScope.list }" var="flag">
		   				<tr>
		   					<td colspan="7" style="text-align: center">등록된 자료가 없습니다</td>
		   				</tr>
	   			 </c:if>   
			         
			       <c:if test="${not flag}">
	   					<c:forEach var="item" items="${list}" varStatus="loop">
			   				<tr>
			   					<td>${item.notice_no}</td>
			   					
			   					<td>
			   					<button class=accordion>${item.title}</button>
			   					<div class="panel">
			   					<p>${item.content}</p>
			   					</div>
			   					</td>
			   					<td>${item.regidate}</td>
			   					<td>${item.normal_or_host}</td>
			   					<td>${item.category}</td>
			   					<td>${item.id}</td>
			   					<td><a href="#"  onclick="isDelete(${item.notice_no})" id="delete">삭제</a>||
			   						<a href="HelpEdit.do?notice_no=${item.notice_no}" id="update" >수정</a>
			   					</td>
			   				</tr>
		   				</c:forEach>
	   			  </c:if> 
			                	
			  </table> 
		        <a href="/HelpWrite.jsp">등록</a>            	
                   		 </div>
               		 </div>
 				</div>
			</div>
      
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
   
    <script>
	var isDelete = function(KeyString){
		if(confirm("정말로 삭제 하시겠습니까?")){			
			
			location.replace("<c:url value='/serviceinfo/help/HelpDelete.do?notice_no="+KeyString+"'/>");
		}
		
	};

	var acc = document.getElementsByClassName("accordion");
	var i;

	for (i = 0; i < acc.length; i++) {
	    acc[i].addEventListener("click", function() {
	        this.classList.toggle("active");
	        var panel = this.nextElementSibling;
	        if (panel.style.display === "block") {
	            panel.style.display = "none";
	        } else {
	            panel.style.display = "block";
	        }
	    });
	}

	</script>
  </body>
</html>
    
    