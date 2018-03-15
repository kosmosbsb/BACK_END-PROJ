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
	//현재 페이지번호 받기
	String nowPage = request.getParameter("nowPage");
	
	//3]데이타를 전달할 DTO객체 생성및 데이타 설정
	DataRoomDTO dto = new DataRoomDTO();
	dto.setTitle(title);
	dto.setContent(content);
	dto.setNo(articleId);
	//4]CRUD작업용 DAO계열 객체 생성
	DataRoomDAO dao = new DataRoomDAO(application);
	int affected = dao.update(dto);
	dao.close();
	if(affected == 1){
		response.sendRedirect("NoticeShow.jsp?articleId="+articleId+"&nowPage="+nowPage);
	}
	else{%>
		<script>
			alert("수정 실패했어요");
			history.back();
		</script>
		<%
	}



%>