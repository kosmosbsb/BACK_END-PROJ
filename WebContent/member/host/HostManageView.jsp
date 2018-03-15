<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/common/IsMember.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>

<style>
@media only screen and (max-width: 1026px) {
	#picture {
		display: none;
	}
	#picture2 {
		display: show;
	}
	#info {
		width: 90%;
	}
}

@media only screen and (min-width: 1026px) {
	#picture2 {
		display: none;
	}
	#picture {
		display: show;
	}
}
</style>

<!-- Main CSS-->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/css/main.css"/>">

<!-- Font-icon css-->
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<title>SC 관리자 페이지</title>
<style>
.table td {
	text-align: center;
}
</style>

</head>

<body class="app sidebar-mini">
	<!-- Navbar-->
	<jsp:include page="../../Top.jsp"/>
	<!-- Sidebar menu Left-->
	<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
	<jsp:include page="../../Left.jsp" />

	<main class="app-content">
	<div class="app-title">
		<div>
			<h1>
				<i class="fa fa-dashboard"></i> Dashboard
			</h1>
			<p>호스트 회원 상세보기</p>
		</div>
		<ul class="app-breadcrumb breadcrumb">
			<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
			<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
		</ul>
	</div>
	<div class="col-md-12">
		<div class="tile">
			<div class="panel-heading">
				<h3 class="panel-title">${hid}님정보</h3>
			</div>
			<div class="row justify-content-center">
				<table class="table">
					<tr id="picture2">
						<td colspan="3"><img id="picture2" src="${imgurl}"
							alt="${imgurl}" height="auto" width="200px"/></td>
					</tr>
					<tr>
						<td rowspan="6" width="5%"><img id="picture" src="${imgurl}"
							alt="${imgurl}" height="auto" width="200px"/></td>
						<td width="10%"
							style="text-align: center; vertical-align: middle;">아이디</td>
						<td id="info" style="text-align: center; vertical-align: middle;">${hid}</td>
					</tr>
					<tr>
						<td width="10%"
							style="text-align: center; vertical-align: middle;">호스트 닉네임</td>
						<td style="text-align: center; vertical-align: middle;">${hnick}</td>
					</tr>
					<tr>
						<td width="10%"
							style="text-align: center; vertical-align: middle;">이메일</td>
						<td style="text-align: center; vertical-align: middle;">${mail}</td>
					</tr>
					<tr>
						<td width="10%"
							style="text-align: center; vertical-align: middle;">연락처</td>
						<td style="text-align: center; vertical-align: middle;">${phone}</td>
					</tr>
					<tr>
						<td width="10%"
							style="text-align: center; vertical-align: middle;">성별</td>
						<c:if test="${gender == 'm'}" var="gender">
							<td style="text-align: center; vertical-align: middle;">남자</td>
						</c:if>
						<c:if test="${not gender}">
							<td style="text-align: center; vertical-align: middle;">여자</td>
						</c:if>
					</tr>
					<tr>
						<td width="10%"
							style="text-align: center; vertical-align: middle;">나이</td>
						<td style="text-align: center; vertical-align: middle;">${age}</td>
					</tr>
					
					<tr>
						<td colspan="3">자기 소개</td>
					</tr>
					<tr>
						<td rowspan="3" colspan="3">
							<div style="width: 80%; margin-left: auto; margin-right: auto;"
								align="center">${introduce}</div>
						</td>
					</tr>

					<tr>

					</tr>
					<tr>

					</tr>
					<tr>
						<td colspan="2"><a href="<c:url value='/MEMBER/HostMng.do'/>"
							class="btn btn-primary">목록으로 이동</a> <a
							href="<c:url value='/member/normal/NormalManage.do?id=${hid}'/>"
							class="btn btn-primary">일반회원 정보로 이동</a></td>
						<td style="text-align: center; vertical-align: middle;">호스트
							관련 소식 수신 여부<br /> 이메일 : <c:if test="${alarmMail == 'y'}" var="almmail">수신</c:if><c:if test="${not almmail}">비 수신</c:if> / SNS : <c:if test="${alarmSns == 'y'}" var="almsns">수신</c:if><c:if test="${not almsns}">비 수신</c:if>
						</td>
					</tr>


				</table>
			</div>
		</div>
	</div>

	</main>
	<!-- Essential javascripts for application to work-->
	<script src="<c:url value="/js/jquery-3.2.1.min.js"/>"></script>
	<script src="<c:url value="/js/popper.min.js"/>"></script>
	<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/js/main.js"/>"></script>
	<!-- The javascript plugin to display page loading on top-->
	<script src="<c:url value="/js/plugins/pace.min.js"/>"></script>
	<script type="text/javascript"
		src="<c:url value="/js/plugins/chart.js"/>"></script>
	<script type="text/javascript">
		var url = window.location.href;
		console.log(url);
	</script>

</body>
</html>