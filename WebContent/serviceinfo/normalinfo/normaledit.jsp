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
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css'/>">
    
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <title>일반이용정보</title>
    
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
		
			<h1>
				<i class="fa fa-dashboard"></i> 수정
			</h1>
			<p>일반 정보 수정</p>
		</div>
		<ul class="app-breadcrumb breadcrumb">
			<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
			<li class="breadcrumb-item"><a href="#">normalinfo edit</a></li>
		</ul>
	</div>
	
	<div class="container">
		<div class="page-header">
  			<h2>일반정보 수정</h2>
		</div>	
		<div class="row">
			
			<div class="col-md-6 col-md-offset-3">
				<form action="<c:url value='/NormalInfoView/Edit.do'/>" 
				      method="post"
				      onsubmit="return isValidate(this)"
				>
					<!-- 키값 -->
					<input type="hidden" name="key" value="${dto.no}"/>
					<input type="hidden" name="category" value="${dto.category}"/>
					
					<!-- 수정전 파일명 -->					
					<table class="table table-bordered">
	  					<tr>
	  						<td>작성자</td>
	  						<td>
	  							<input value="${dto.name}" name="name" type="text"  style="width:50%" class="form-control"/>
	  						</td>
	  					</tr>
	  					<tr>
	  						<td>제 목</td>
	  						<td>
	  							<input value="${dto.title}" name="title" type="text" class="form-control"/>
	  						</td>
	  					</tr>
	  						  					
	  					<tr>
	  						<td colspan="2">내 용</td>  						
	  					</tr>
	  					<tr>
	  						<td colspan="2"><textarea name="content" class="form-control" rows="10">${dto.content}</textarea></td>  						
	  					</tr>
	  					<tr>
	  						<td colspan="2"><button type="submit" class="btn btn-primary">수정</button></td>  						
	  					</tr>
					</table>
				</form>
			</div>	
				
		</div>	
		
    </div> <!-- /container -->
	
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
    
    <!-- Google analytics script-->
    <script type="text/javascript">

    </script>
  </body>
</html>