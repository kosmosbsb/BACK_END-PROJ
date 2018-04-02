<%@page import="controller.lmy.HelpDTO"%>
<%@page import="controller.lmy.HelpDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//1]한글처리
	request.setCharacterEncoding("UTF-8");
	//2]파라미터 받기
	String title= request.getParameter("title");
	String content= request.getParameter("content");
	String category = request.getParameter("category");
	String normal_or_host = request.getParameter("normal_or_host");
	String id = request.getParameter("id");
	
	//3]데이타를 전달할 DTO객체 생성및 데이타 설정
	HelpDTO dto = new HelpDTO();
	
	dto.setTitle(title);
	dto.setContent(content);
	dto.setCategory(category);
	dto.setNormal_or_host(normal_or_host);
	dto.setId(id);
	
	//4]CRUD작업용 DAO계열 객체 생성
	HelpDAO dao = new HelpDAO(application);
	int affected = dao.insert(dto);
	dao.close();
	if(affected == 1){
		response.sendRedirect("HelpView.do");
	}
	else{%>
		<script>
			alert("입력 실패했어요");
			history.back();
		</script>
		<%
	}
	
%>