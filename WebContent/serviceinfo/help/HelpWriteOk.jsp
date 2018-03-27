<%@page import="controller.lmy.DataRoomDTO"%>
<%@page import="controller.lmy.DataRoomDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//1]한글처리
	request.setCharacterEncoding("UTF-8");
	//2]파라미터 받기
	String title= request.getParameter("title");
	String content= request.getParameter("content");
	String name  = request.getParameter("name");
	String category = request.getParameter("category");
	String notice_no = request.getParameter("notice_no");
	String normal_or_host = request.getParameter("normal_or_host");
	//3]데이타를 전달할 DTO객체 생성및 데이타 설정
	DataRoomDTO dto = new DataRoomDTO();
	dto.setNotice_no(notice_no);
	dto.setTitle(title);
	dto.setContent(content);
	dto.setCategory(category);
	dto.setId(name);
	dto.setNormal_or_host(normal_or_host);
	//4]CRUD작업용 DAO계열 객체 생성
	DataRoomDAO dao = new DataRoomDAO(application);
	int affected = dao.insert(dto);
	dao.close();
	if(affected == 1){
		response.sendRedirect("HelpWrite.jsp");
	}
	else{%>
		<script>
			alert("입력 실패했어요");
			history.back();
		</script>
		<%
	}
	
%>