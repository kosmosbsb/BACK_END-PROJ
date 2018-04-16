<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/common/IsMember.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>

<!-- Open Graph Meta-->
<meta property="og:type" content="website">
<meta property="og:site_name" content="Vali Admin">
<meta property="og:title" content="Vali - Free Bootstrap 4 admin theme">
<meta property="og:url"
	content="http://pratikborsadiya.in/blog/vali-admin">
<meta property="og:image"
	content="http://pratikborsadiya.in/blog/vali-admin/hero-social.png">
<meta property="og:description"
	content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->

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
	<div class="app-sidebar__overlay" data-t oggle="sidebar"></div>
	<jsp:include page="../../Left.jsp" />

	<main class="app-content">
	<div class="app-title">
		<div>
			<h1>
				<i class="fa fa-dashboard"></i> Dashboard
			</h1>
			<p>호스트 회원 관리 페이지</p>
		</div>
		<ul class="app-breadcrumb breadcrumb">
			<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
			<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
		</ul>
	</div>
	<div class="row">
		<div class="col-md-6">
			<div class="widget-small primary coloured-icon">
				<i class="icon fa fa-users fa-3x"></i>
				<div class="info">
					<h4>일반 회원</h4>
					<p>
						<b>${chartdataset[0]}명</b>
					</p>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="widget-small danger coloured-icon">
				<i class="icon fa fa-star fa-3x"></i>
				<div class="info">
					<h4>호스트 회원</h4>
					<p>
						<b>${chartdataset[1]}명</b>
					</p>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<div class="tile">
				<div class="tile-body">
					<table class="table table-hover table-bordered" id="sampleTable"
						style="text-align: center;">
						<thead>
							<tr>
								<th style="width: 20%;">아이디</th>
								<th style="width: 15%;">이름</th>
								<th>호스트명</th>
								<th style="width: 10%;">성별</th>
								<th style="width: 10%;">나이</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${requestScope.list==null}" var="flag">
								<tr>
									<td colspan="6"><a href="<c:url value='#'/>">등록된 자료가
											없습니다</a></td>
								</tr>
							</c:if>

							<c:if test="${not flag}">
								<c:forEach var="host" items="${list}" varStatus="loop">
									<tr>
										<td><a
											href="<c:url value='/MEMBER/HostMng.do?id=${host.id}'/>">${host.id}</a></td>
										<td>${host.name}</td>
										<td>${host.h_nickname}</td>
										<c:if test="${host.gender == 'M'}" var="gender">
											<td>남자</td>
										</c:if>
										<c:if test="${not gender}">
											<td>여자</td>
										</c:if>
										<td>${host.age}</td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-4">
			<div class="tile">
				<h3 class="tile-title">일반회원 중 호스트 회원 비율</h3>
				<div>
					<ul style="list-style-type: none;">
						<li><span style='color:#FFC700;background-color:#FFC700;'>시</span>일반 회원 : ${chartdataset[0]}명 / <fmt:formatNumber value="${(chartdataset[0]/(chartdataset[0]+chartdataset[1]))*100}" type="number" pattern="#" />%</li>
						<li><span style='color:#6D3BFF;background-color:#6D3BFF;'>시</span>호스트 회원 : ${chartdataset[1]}명 / <fmt:formatNumber value="${(chartdataset[1]/(chartdataset[0]+chartdataset[1]))*100}" type="number" pattern="#" />%</li>
					</ul>
				</div>
				<div class="embed-responsive embed-responsive-16by9">
					<canvas class="embed-responsive-item" id="pieChartDemo"></canvas>
				</div>
			</div>
		</div>

		<div class="col-md-4">
			<div class="tile">
				<h3 class="tile-title">일반 회원 성별 비율</h3>
				<div>
					<ul style="list-style-type: none;">
						<li><span style='color:#FFC700;background-color:#FFC700;'>시</span>일반 회원 남성 : ${chartdataset[2]}명 / <fmt:formatNumber value="${(chartdataset[2]/(chartdataset[2]+chartdataset[3]))*100}" type="number" pattern="#" />%</li>
						<li><span style='color:#FFEFB8;background-color:#FFEFB8;'>시</span>일반 회원 여성 : ${chartdataset[3]}명 / <fmt:formatNumber value="${(chartdataset[3]/(chartdataset[2]+chartdataset[3]))*100}" type="number" pattern="#" />%</li>
					</ul>
				</div>
				<div class="embed-responsive embed-responsive-16by9">
					<canvas class="embed-responsive-item" id="pieChartDemo2"></canvas>
				</div>
			</div>
		</div>

		<div class="col-md-4">
			<div class="tile">
				<h3 class="tile-title">호스트 회원 성별 비율</h3>
				<div>
					<ul style="list-style-type: none;">
						<li><span style='color:#6D3BFF;background-color:#6D3BFF;'>시</span>호스트 회원 남성 : ${chartdataset[4]}명 / <fmt:formatNumber value="${(chartdataset[4]/(chartdataset[4]+chartdataset[5]))*100}" type="number" pattern="#" />%</li>
						<li><span style='color:#BFAAFF;background-color:#BFAAFF;'>시</span>호스트 회원 여성 : ${chartdataset[5]}명 / <fmt:formatNumber value="${(chartdataset[5]/(chartdataset[4]+chartdataset[5]))*100}" type="number" pattern="#" />%</li>
					</ul>
				</div>
				<div class="embed-responsive embed-responsive-16by9">
					<canvas class="embed-responsive-item" id="pieChartDemo3"></canvas>
				</div>
			</div>
		</div>
		
	</div>

	<div class="row">
		<div class="col-md-12">
			<div class="tile">
				<h3 class="tile-title">연령별 일반/호스트 회원 그래프</h3>
				<table>
				<tr>
				</tr>
				</table>
				<div class="embed-responsive embed-responsive-16by9">
					<canvas class="embed-responsive-item" id="barChartDemo"></canvas>
				</div>
			</div>
		</div>
	</div>


	
	<!-- 페이징 추가해야함 기억! -->

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
	<script type="text/javascript">
      var data = {
      	labels: ["10대","20대","30대","40대","50대","60대","70대","80대","90대"],
      	datasets: [
      		{
      			label: "My First dataset",
      			fillColor: "#FFC700",
      			strokeColor: "#fff",
      			pointColor: "#fff",
      			pointStrokeColor: "#fff",
      			pointHighlightFill: "#fff",
      			pointHighlightStroke: "rgba(220,220,220,1)",
      			data: [${chartdataset3[0]}, ${chartdataset3[1]}, ${chartdataset3[2]}, 
      				${chartdataset3[3]}, ${chartdataset3[4]}, ${chartdataset3[5]}, 
      				${chartdataset3[6]}, ${chartdataset3[7]}, ${chartdataset3[8]}]
      		},
      		{
      			label: "My Second dataset",
      			fillColor: "#6D3BFF",
      			strokeColor: "#fff",
      			pointColor: "#fff",
      			pointStrokeColor: "#fff",
      			pointHighlightFill: "#fff",
      			pointHighlightStroke: "rgba(151,187,205,1)",
      			data: [${chartdataset2[0]}, ${chartdataset2[1]}, ${chartdataset2[2]}, 
      				${chartdataset2[3]}, ${chartdataset2[4]}, ${chartdataset2[5]}, 
      				${chartdataset2[6]}, ${chartdataset2[7]}, ${chartdataset2[8]}]
      		}
      	]
      };
      var pdata = [
      	{
      		value: ${chartdataset[0]},
      		color:"#FFC700",
      		highlight: "#FFD642",
      		label: "일반 회원"
      	},
      	{
      		value: ${chartdataset[1]},
      		color: "#6D3BFF",
      		highlight: "#9C7AFF",
      		label: "호스트 회원"
      	}
      ]
      
      var pdata2 = [
        	{
          		value: ${chartdataset[2]},
          		color:"#E4B200",
          		highlight: "#DFC054",
          		label: "남성"
          	},
          	{
          		value: ${chartdataset[3]},
          		color: "#FFEFB8",
          		highlight: "#FFE485",
          		label: "여성"
          	}
        ]
      
      var pdata3 = [
       	{
         	value: ${chartdataset[4]},
         	color: "#6D3BFF",
         	highlight: "#9C7AFF",
         	label: "남성"
         },
      	{
      		value: ${chartdataset[5]},
      		color:"#BFAAFF",
      		highlight: "#8474B2",
      		label: "여성"
      	}
         
        ]
      
      var ctxp = $("#pieChartDemo").get(0).getContext("2d");
      var pieChart = new Chart(ctxp).Pie(pdata).generateLegend();
      
      var ctxp2 = $("#pieChartDemo2").get(0).getContext("2d");
      var pieChart = new Chart(ctxp2).Pie(pdata2);
      
      var ctxp3 = $("#pieChartDemo3").get(0).getContext("2d");
      var pieChart = new Chart(ctxp3).Pie(pdata3);
      
      var ctxb = $("#barChartDemo").get(0).getContext("2d");
      var barChart = new Chart(ctxb).Bar(data);
      
    </script>

	<!-- Data table plugin-->
	<script type="text/javascript" src="<c:url value="/js/plugins/jquery.dataTables.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/js/plugins/dataTables.bootstrap.min.js" />"></script>
    
	<script type="text/javascript">$('#sampleTable').DataTable({
    "lengthMenu": [[3, 6, 9, -1], [3, 6, 9, "All"]]}
    );</script>

	<!-- Google analytics script-->
	<script type="text/javascript">
      if(document.location.hostname == 'pratikborsadiya.in') {
      	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
      	ga('create', 'UA-72504830-1', 'auto');
      	ga('send', 'pageview');
      }
    </script>
</body>
</html>