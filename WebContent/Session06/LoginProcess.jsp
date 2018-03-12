<%@page import="model.admin.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- LoginProcess.jsp -->
<%
	// 사용자 입력값 받기]
	String user = request.getParameter("user");
	String pass = request.getParameter("pass");
	
	AdminDAO dao = new AdminDAO(application);
	boolean flag = dao.isMember(user, pass);
	
	if(flag){
		// 1. 로그인 처리] 세션영역에 속성(주로 식별자만) 저장
		session.setAttribute("USER_ID", user);
		session.setAttribute("USER_LEVEL", dao.getAdminLevel(user));
		
		// 2. 로그인 처리후 마이 페이지로 이동]
		response.sendRedirect("../index.jsp");
	} 
	else{ // 비회원 - 다시 로그인 페이지로 포워드
		
		// 리퀘스트 영역에 필요한 데이터 저장
		request.setAttribute("ERROR", "아이디와 비밀번호가 틀려요");
		// 로그인 페이지로 포워드]
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}
	dao.close();
%>