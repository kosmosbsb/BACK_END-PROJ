<%@page import="controller.lmy.DataRoomDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%

	//파라미터 받기]
	//1]파라미터(키값) 받기
	String articleId = request.getParameter("articleId");
	//현재 페이지번호 받기
	//2]CRUD작업용 BbsDAO생성
	DataRoomDAO dao = new DataRoomDAO(application);
	int affected=dao.delete(articleId);
	//3]자원반납
	dao.close();	

	
	if(affected == 1){
		response.sendRedirect("NoticeShow.jsp");
	}
	else{%>
		<script>
			alert("삭제 실패했어요");
			history.back();
		</script>
		<%
	}

%>