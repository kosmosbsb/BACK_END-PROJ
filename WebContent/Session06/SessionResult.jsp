<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>SessionResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>세션 확인 페이지</legend>
		<ul style="list-style-type: decimal;">
			<li>세션아이디: <%= session.getId() %></li>
			<li>세션 유효기간: <%= session.getMaxInactiveInterval() %>초</li>
			<li>리퀘스트 영역: <%= request.getAttribute("requestScope") %></li>
			<li>리퀘스트 영역: <%= session.getAttribute("sessionScope") %></li>
		</ul>
	</fieldset>

</body>
</html>