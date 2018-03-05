<%@page import="model.PBKDF2"%>
<%@page import="model.BbsDAO"%>
<%@page import="model.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1] 한글처리
	request.setCharacterEncoding("UTF-8");
	// 2] 파라미터 받기
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	
	// 3] 데이타를 전달할 DTO객체 생성 및 데이타 설정
	BbsDTO dto = new BbsDTO();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setName(name);
	
	// 4] CRUD작업용 DAO계열 객체 생성
	BbsDAO dao = new BbsDAO(application);
	int affected = dao.createUser(dto);
	dao.close();
	
	if(affected == 1){
		response.sendRedirect("Login.jsp");
		
	}
	else{ %>
	<script>
		alert("입력 실패 했어요");
		history.back();
	</script>
	<%	
}
%>