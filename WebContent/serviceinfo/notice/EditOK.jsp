<%@page import="java.sql.Array"%>
<%@page import="controller.lmy.DataRoomDAO"%>
<%@page import="controller.lmy.DataRoomDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1]한글처리
	request.setCharacterEncoding("UTF-8");
	//2]파라미터 받기
	String title= request.getParameter("title");
	String content= request.getParameter("content");
	String articleId= request.getParameter("articleId");
	String category= request.getParameter("category");
	String normal_or_host = request.getParameter("normal_or_host");

	//3]데이타를 전달할 DTO객체 생성및 데이타 설정
	
	
	DataRoomDTO dto = new DataRoomDTO();
	DataRoomDAO dao = new DataRoomDAO(application);
	
	dto.setTitle(title);
	dto.setContent(content);
	dto.setNotice_no(articleId);
	dto.setCategory(category);
	dto.setNormal_or_host(normal_or_host);
	//4]CRUD작업용 DAO계열 객체 생성
	
	int affected = dao.update(dto);
	dao.close();
	if(affected == 1){
		response.sendRedirect("NoticeShow.jsp");
	}
	else{%>
		<script>
			alert("수정 실패했어요");
			history.back();
		</script>
		<%
	}



%>