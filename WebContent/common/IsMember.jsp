<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//회원인 경우만 이용가능하도록
	//로그인 여부 판단
	if(session.getAttribute("USER_ID") == null){
		out.println("<script>");
		out.println("alert('로그인 후에 이용하세요');");
		out.println("location.replace('"+request.getContextPath()+"/Session06/Login.jsp');");
		out.println("</script>");
		return;
	}


%>