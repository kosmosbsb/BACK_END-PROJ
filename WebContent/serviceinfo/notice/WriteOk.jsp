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
	//3]데이타를 전달할 DTO객체 생성및 데이타 설정
	DataRoomDTO dto = new DataRoomDTO();
	dto.setTitle(title);
	dto.setContent(content);
	dto.setName(name);
	//4]CRUD작업용 DAO계열 객체 생성
	DataRoomDAO dao = new DataRoomDAO(application);
	int affected = dao.insert(dto);
	dao.close();
	if(affected == 1){
		response.sendRedirect("NoticeShow.jsp");
	}
	else{%>
		<script>
			alert("입력 실패했어요");
			history.back();
		</script>
		<%
	}
	
%>