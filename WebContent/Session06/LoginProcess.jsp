<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- LoginProcess.jsp -->
<%
	// 사용자 입력값 받기]
	String user = request.getParameter("user");
	String pass = request.getParameter("pass");
	
	// 아이디: KIM 비밀번호: 1234면 회원이라고 가정
	//if("KIM".equals(user) && "1234".equals(pass)){ // 회원
	BbsDAO dao = new BbsDAO(application);
	boolean flag = dao.isMember(user, pass);
	dao.close();
	if(flag){
		// 1. 로그인 처리] 세션영역에 속성(주로 식별자만) 저장
		session.setAttribute("USER_ID", user);
		session.setAttribute("USER_PWD", pass);
		// 2. 로그인 처리후 마이 페이지로 이동]
		response.sendRedirect("MyPage.jsp");
	} 
	else{ // 비회원 - 다시 로그인 페이지로 포워드
		// out.println("<script>");
		// out.println("alert('회원정보가 틀려요');");
		// out.println("history.back();");
		// out.println("</script>");
		
		// 리퀘스트 영역에 필요한 데이터 저장
		request.setAttribute("ERROR", "아이디와 비밀번호가 틀려요");
		// 로그인 페이지로 포워드]
		request.getRequestDispatcher("test.jsp").forward(request, response);
	}
%>