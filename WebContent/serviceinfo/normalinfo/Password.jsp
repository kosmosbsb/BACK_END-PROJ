<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
	<c:when test="${param.mode=='UPDATE' }">
		<c:set var="moveUrl" value="/DATAROOM/Edit.do?key=${param.key}"/>
	</c:when>
	<c:otherwise>	
		<c:set var="moveUrl" value="/DATAROOM/Delete.do?key=${param.key}"/>
	</c:otherwise>
</c:choose>
<script>
	<c:choose>
		<c:when test="${PASS_CORRECT}">
			location.replace("<c:url value='${moveUrl}'/>");
		</c:when>
		<c:otherwise>	
			alert('비밀번호가 일치하지 않아요');
			history.back();
		</c:otherwise>	
	</c:choose>

</script>