<%@page import="model.admin.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- LoginProcess.jsp -->
<%
	request.setCharacterEncoding("UTF-8");
	// 사용자 입력값 받기]
	String user = request.getParameter("user");
	String pass = request.getParameter("pass");

	AdminDAO dao = new AdminDAO(application);
	boolean flag = dao.isMember(user, pass);
	
	if(flag){
		//로그인 처리
		session.setAttribute("USER_ID", user);
		session.setAttribute("USER_LEVEL", dao.getAdminLevel(user));
		
		//로그인 처리후 관리자 관리 페이지로 이동
		//response.sendRedirect("/ADMIN/List.do");
		//리다이렉트로 서블릿요청을 발생시킬 순 없군!
		request.getRequestDispatcher("/ADMIN/List.do").forward(request, response);//브라우저 url창이 드러워져.. 일단 별수없지 뭐
	} 
	else{ // 비회원 - 다시 로그인 페이지로 포워드
		
		// 리퀘스트 영역에 필요한 데이터 저장
		//아이디 비번 불일치 여부 구분용 파라미터
		request.setAttribute("ERROR", "CREATE");
		//입력창에 박혀있던거 안사라지도록 해주는 파라미터
		request.setAttribute("USER_ID", user);
		// 로그인 페이지로 포워드]
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}
	dao.close();
%>