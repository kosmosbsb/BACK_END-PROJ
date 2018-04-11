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
    <meta name="viewport" content="width=device-width, initial-scale=1">
   
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css'/>">
    
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <title>수정폼 관리</title>
 	<style>
		body {
		   	min-height: 2000px;
  			padding-top: 70px;
		}
		table,table th{
			text-align:center;
		}		
		
	</style>
	<script>
		function isValidate(form){
			if(form.name.value==""){
				alert("작성자를 입력하세요");
				form.name.focus();
				return false;
			}
			else if(form.title.value.length==0){
				alert("제목을 입력하세요");
				form.title.focus();
				return false;
			}
			else (form.content.value.length==0){
				alert("내용을 입력하세요");
				form.content.focus();
				return false;
			}

		}
		</script>
 
 
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
          <h1><i class="fa fa-dashboard"></i>글 등록</h1>
        </div>
      </div>
       <div class="row">
         <div class="col-md-12" >
          <div class="tile">
            <div class="tile-body">
            <form action="<c:url value='/serviceinfo/help/HelpWrite.do'/>" 
				      method="post"
				      onsubmit="return isValidate(this)"
				
				>
              <table class="table table-hover table-bordered">
			                 <tr>
				                  <td class="text-center">제목</td>
				                  	<td >
				                  		<input type="text"  name="title" style="width:98%" value="${dto.title}"/>
				                  	</td>
			                  </tr>
			                 
			                  <tr>
			                  		<td align="center">내용</td>
			                  			<td>
			                  				<textarea rows="10"  style="width:98%" name="content" value="${dto.content}"></textarea>
			                  			</td>
			                  </tr>
			              	  
			              	  <tr>
				                  <td class="text-center">N_OR_H</td>
				                  	<td >
				                  		<input type="checkbox"  name="normal_or_host"  value="N">N
				                  		<input type="checkbox"  name="normal_or_host"  value="H">H
				                  	</td>
			                  </tr>
			                
			                  <tr>
				                  <td class="text-center">카테고리</td>
				                  	<td >
				                  		<input type="radio"  name="category"  value="결제사항">결제사항
				                  		<input type="radio"  name="category"  value="무뇽사항">무뇽사항
				                  		<input type="radio"  name="category"  value="지훈사항">지훈사항
				                  		<input type="radio"  name="category"  value="나윤사항">나윤사항
				                  	
				                  	
				                  	
				                  	</td>
			                  </tr>
			                   
			                   <tr>
				                  <td class="text-center">작성자</td>
				                  	<td >
				                  		<input type="text"  name="id" style="width:98%" value="${sessionScope.USER_ID}" >
				                  	
				                  	</td>
			                  </tr>
			            
			            
			                  		<tr bgcolor="white" align="center">
			                  			<td colspan="2">
			                  			<input type="submit" value="확인"/>
			                  			</td>
			                  		</tr>                  	
			                
			                  	</tbody>
			                  </table> 
		                  	</form>
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
   
    <script type="text/javascript">
      if(document.location.hostname == 'pratikborsadiya.in') {
      	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
      	ga('create', 'UA-72504830-1','auto');
      	ga('send', 'pageview');
      }
    </script>
  </body>
</html>
    
