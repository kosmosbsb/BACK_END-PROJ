<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
	<c:when test="${WHERE =='INS' }">
		<c:set var="SUC_MSG" value="입력 성공했어요" />
		<c:set var="FAIL_MSG" value="입력 실패했어요" />
		<c:set var="SUC_URL" value="/serviceinfo/help/HelpList.do"/>
	</c:when>
	
	<c:when test="${WHERE =='EDT' }">
		<c:set var="SUC_MSG" value="수정 성공했어요" />
		<c:set var="FAIL_MSG" value="수정 실패했어요" />
		<c:set var="SUC_URL" value="/serviceinfo/help/HelpList.do" />
	</c:when>
	
	<c:otherwise>
		<c:set var="SUC_MSG" value="삭제성공했어요" />
		<c:set var="FAIL_MSG" value="삭제 실패했어요" />
		<c:set var="SUC_URL" value="/serviceinfo/help/HelpList.do" />
	</c:otherwise>


</c:choose>
<script>
<c:choose>
	<c:when test ="${SUC_FAIL==1}">
		alert("${SUC_MSG}");
		location.replace("<c:url value='${SUC_URL}'/>");
	</c:when>
		<c:when test ="${SUC_FAIL==0}">
		alert("${FAIL_MSG}");
		history.back();
	</c:when>
	
</c:choose>

</script>