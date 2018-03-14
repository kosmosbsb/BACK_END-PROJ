<%@page import="model.analysis.ExcelOuter"%>
<%@page import="model.admin.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");

	// 사용자 입력값 받기]
	String barChartResult_month = request.getParameter("input");
	System.out.println(barChartResult_month);
	
	ExcelOuter eo = new ExcelOuter();
	
	eo.createExcelFile(barChartResult_month);
	
	%>
	<script>
		alert("파일 생성을 완료했습니다.");
		history.back();
	</script>
	<%
	
	//request.getRequestDispatcher("/ADMIN/List.do").forward(request, response);
	
	
%>