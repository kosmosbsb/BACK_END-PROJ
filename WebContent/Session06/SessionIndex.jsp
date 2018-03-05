<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>SessionIndex.jsp</title>
</head>
<body>
	<fieldset>
		<legend>session(HttpSession)내장객체의 주요 메소드</legend>
		<ul style="list-style-type: upper-roman;">
			<li>session의 유효기간(web.xml -단위:분)</li>
			<li>session의 유효기간(메소드 -단위:초)</li>
			<!-- 메소드로 설정하는게 우선 순위 -->
			<% session.setMaxInactiveInterval(3600); %>
			<li>세션 유효시간 얻기: <%= session.getMaxInactiveInterval() %>초</li>
			<li>세션 아이디:<a href="SessionResult.jsp"> <%= session.getId() %></a></li>
			<%
				// 세션의 최초 생성시간
				long creation = session.getCreationTime();
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String creationString = dateFormat.format(new Date(creation));
				// 클라이언트의 마지막 요청시간
				long lastAccess = session.getLastAccessedTime();
				String lastAccessString = dateFormat.format(new Date(lastAccess));
			%>
			<li>세션 최초 생성시간: <%= creationString %></li>
			<li>마지막 요청 시간: <%= lastAccessString %></li>
		</ul>
		<h2>세션 및 리퀘스트 영역에 저장</h2>
		<%
			request.setAttribute("requestScope", "리퀘스트 영역입니다");
			session.setAttribute("sessionScope", "세션 영역입니다");
		%>
	</fieldset>

</body>
</html>