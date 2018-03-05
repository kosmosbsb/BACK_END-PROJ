<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>MyPage.jsp</title>
	<meta charset="utf-8" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/Styles/divLayout.css" type="text/css" />
    
   <style>
		table,table th{
			text-align: center;
		}
	</style>
</head>
<body>
	<div class="jumbotron">
      <div class="container">
        <h1>Hello MyPage</h1>
        <p>This is a page for MyPage.</p>
        <p><a class="btn btn-primary btn-lg" role="button" href="<c:url value='/MyPage.jsp' />" >게시판 &raquo;</a></p>
      </div>
    </div>
    <div class="container">
		<div class="row" style="height:10px;"></div>
     	<div class="row">
   			<div class="col-md-4 col-md-offset-4">
	   			<table class="table table-bordered"
				style="width: 300px; border-spacing: 1px; background-color: green">
					<tr style="background-color: white">
						<td style="width: 30%">아이디</td>
						<td><%=session.getAttribute("USER_ID")%></td>
					</tr>
					<tr style="background-color: white">
						<td>비밀번호</td>
						<td><%=session.getAttribute("USER_PWD")%></td>
					</tr>
					<tr style="background-color: white; text-align: center" >
						<td colspan="2"><a href="Logout.jsp" role="button" class="btn btn-primary btn-sm" >로그아웃</a></td>
					</tr>
				</table>
   			</div>
   		</div>		
    </div> <!-- /container -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js' />"></script>
</body>
</html>
