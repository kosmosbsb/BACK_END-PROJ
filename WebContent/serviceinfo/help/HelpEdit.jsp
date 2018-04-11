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
    
    <title>HelpEdits.jsp</title>
 	
 
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
			
			
			
			if(form.content.value.length==0){
				alert("내용을 입력하세요");
				form.content.focus();
				return false;
			}
			
		}////////////////////////////////////////	
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
          <h1><i class="fa fa-dashboard"></i>도움말 수정</h1>
      
        </div>
      
      </div>
      
       <div class="row">
         <div class="col-md-12" >
          <div class="tile">
            <div class="tile-body">
           
           <form action="<c:url value='/serviceinfo/help/HelpEdit.do'/>" 
				      method="post"
				      onsubmit="return isValidate(this)">
				      <!-- 키값 -->
				      <input type="hidden" name="key" value="${dto.notice_no}">
				      
              <table class="table table-bordered">
              		   <tr>
				                  <td class="text-center">제목</td>
				                  	<td >
				                  		<input value="${dto.title}" type="text"  name="title" style="width:98%" />
				                  	
				                  	</td>
			                  </tr>
			                 
			                  <tr>
			                  		<td class="text-center">내용</td>
			                  			<td>
			                  				<textarea rows="10"  style="width:98%" name="content"> ${dto.content}</textarea>
			                  				
			                  			</td>
			                  </tr>
			              	 
			              	  <tr>
				                  <td class="text-center">N_OR_H</td>
				                  	<td >
				                  		<input type="checkbox"  name="normal_or_host"  value="N"<c:if test="${dto.normal_or_host =='N' }">checked</c:if> />N
				                  		<input type="checkbox"  name="normal_or_host"  value="H"<c:if test="${dto.normal_or_host =='H' }">checked</c:if> />H
				                  	</td>
			                  </tr>
			                		  <tr>
				                  <td class="text-center">카테고리</td>
				                  	<td>
				                  		<input type="radio"  name="category"  value="결제사항"<c:if test="${dto.category =='결제사항' }">checked</c:if> />결제사항
				                  		<input type="radio"  name="category"  value="무뇽사항"<c:if test="${dto.category =='무뇽사항' }">checked</c:if> />무뇽사항
				                  		<input type="radio"  name="category"  value="지훈사항"<c:if test="${dto.category =='지훈사항' }">checked</c:if> />지훈사항
				                  		<input type="radio"  name="category"  value="나윤사항"<c:if test="${dto.category =='나윤사항' }">checked</c:if> />나윤사항
				                  	</td>
			                  </tr>
			                			                   
			                    
			                   <tr>
				                  <td class="text-center">작성자</td>
				                  	<td >
				                  		<input type="radio"  name="id" style="width:98%" value="master1"<c:if test="${dto.id =='master1' }">checked</c:if> />master1
				                  	</td>
			                  </tr>
			            
			                  		<tr bgcolor="white" align="center">
			                  			<td colspan="2">
			                  			<button type="submit" class="btn btn-primary"><i class="fa fa-fw fa-lg fa-wrench"></i>완료</button>
			                  			</td>
			                  		</tr>                  	
			          
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
   
  
  </body>
</html>
    
    