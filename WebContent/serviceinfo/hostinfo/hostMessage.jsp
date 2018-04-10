<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 어느 컨트롤러에서 왔는지에 따라 분기 -->
<c:choose>
	<c:when test="${WHERE == 'INS' }">
		<c:set var="SUC_MSG" value="입력 성공했어요"/>
		<c:set var="FAIL_MSG" value="입력 실패했어요"/>
		<c:set var="SUC_URL" value="/NormalInfo/List.do"/>
	</c:when>
	<c:when test="${WHERE == 'EDT' }">
		<c:set var="SUC_MSG" value="수정 성공했어요"/>
		<c:set var="FAIL_MSG" value="수정 실패했어요"/>
		<c:set var="SUC_URL" value="/NormalInfoView/View.do?no=${key}"/>
	</c:when>
	<c:otherwise>
		<c:set var="SUC_MSG" value="삭제 성공했어요"/>
		<c:set var="FAIL_MSG" value="삭제 실패했어요"/>
		<c:set var="SUC_URL" value="/NormalInfo/List.do"/>	
	</c:otherwise>
</c:choose>

<script>
	<c:choose>
		<c:when test="${SUC_FAIL == 1 }">
			alert("${SUC_MSG}");
			location.replace("<c:url value='${SUC_URL}'/>");
		</c:when>
		<c:when test="${SUC_FAIL == 0 }">
			alert("${FAIL_MSG}");
			history.back();
		</c:when>
		<c:otherwise>
			alert('파일용량을 초과 했어요');
			history.back();
		</c:otherwise>
	</c:choose>
</script>
