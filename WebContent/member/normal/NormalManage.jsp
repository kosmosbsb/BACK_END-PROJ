<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/IsMember.jsp" %>

<!DOCTYPE html>
<html lang="en">
  <head>

  	<!-- Open Graph Meta-->
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="Vali Admin">
    <meta property="og:title" content="Vali - Free Bootstrap 4 admin theme">
    <meta property="og:url" content="http://pratikborsadiya.in/blog/vali-admin">
    <meta property="og:image" content="http://pratikborsadiya.in/blog/vali-admin/hero-social.png">
    <meta property="og:description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  	
   	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
   
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/main.css"/>">
    
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <title>SC 관리자 페이지</title>
    <style>
	    .table td {
			   text-align: center;   
			}
		 
		h3.tile-title {
			text-align: center;
		}
    </style>
    
    <script>
	    $(document).ready(function() {
	        $('.js-example-basic-single').select();
	    });
    </script>
    
    <script type="text/javascript" src="<c:url value="/js/plugins/chart.js"/>"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
     
      function drawChart() {
           
           var data = google.visualization.arrayToDataTable([
               ['Task', 'Age'],
               ['10대', ${agedatearray[0]}],
               ['20대', ${agedatearray[1]}],
               ['30대', ${agedatearray[2]}],
               ['40대', ${agedatearray[3]}],
               ['50대', ${agedatearray[4]}],
               ['60대', ${agedatearray[5]}],
               ['70대', ${agedatearray[6]}],
               ['80대', ${agedatearray[7]}],
               ['90대', ${agedatearray[8]}]
             ]);

             var options = {
       			width: 470,
       			height: 220,
             	is3D: true,
             	sliceVisibilityThreshold:0,
       			"bold": true,
             	"fontSize": 11,
               	colors: ['#F5A9A9', '#58FAD0', '#ACFA58', '#F781BE', '#F79F81', '#BDBDBD',"#819FF7","#F3F781","#FA5858"]
             };

             var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
             chart.draw(data,options);
             
             
             var data = google.visualization.arrayToDataTable([
                 ['Task', 'Gender'],
                 ['남자', ${genderdataarray[0]}],
                 ['여자', ${genderdataarray[1]}]
               ]);
             
             var options = {
           		  	width: 510,
           		  	height: 220,
                 	pieHole: 0.4,
                  	sliceVisibilityThreshold:0,
                    "bold": true,
                    "fontSize": 11,
                    colors: ['#58D3F7', '#FA5858']
                   };

            var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
            chart.draw(data, options);
            
               
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'grade');
            data.addColumn('number', 'Populartiy');
            data.addRows([
              ['브론즈', ${gradedataarray[0]}],
              ['실버', ${gradedataarray[1]}],
              ['골드', ${gradedataarray[2]}],
              ['플레티넘', ${gradedataarray[3]}],
              ['VIP', ${gradedataarray[4]}]
            ]);

            var options = {
          		width: 470,
          		height: 220,
          		sliceVisibilityThreshold:0,
          		"bold": true,
               	"fontSize": 11,
           		colors: ['#FAAC58', '#D8D8D8',"#FACC2E","#2EFEF7","#F5A9F2"]
            };

            var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
            chart.draw(data, options);
            
            var data = google.visualization.arrayToDataTable([
             	["Title","10대", {role:'annotation'}, "20대", {role:'annotation'},"30대", {role:'annotation'},"40대", {role:'annotation'},"50대", {role:'annotation'},"60대", {role:'annotation'},"70대", {role:'annotation'},"80대", {role:'annotation'},"90대", {role:'annotation'}],
				[""
                    ,${agedatearray[0]}, ${agedatearray[0]}
                    ,${agedatearray[1]}, ${agedatearray[1]}
                    ,${agedatearray[2]}, ${agedatearray[2]}
                    ,${agedatearray[3]}, ${agedatearray[3]}
                    ,${agedatearray[4]}, ${agedatearray[4]}
                    ,${agedatearray[5]}, ${agedatearray[5]}
                    ,${agedatearray[6]}, ${agedatearray[6]}
                    ,${agedatearray[7]}, ${agedatearray[7]}
                    ,${agedatearray[8]}, ${agedatearray[8]}] 
              ]);
        
              var barChartOption = {
                      bars: 'vertical',
                      height :'100%',
                      width :'100%',
                      legend: { position: "top" },
                      colors: ['#F5A9A9', '#58FAD0', '#ACFA58', '#F781BE', '#F79F81', '#BDBDBD',"#819FF7","#F3F781","#FA5858"],
                      isStacked: false,
                      tooltip:{textStyle : {fontSize:12}, showColorCode : true},
                      animation: { //차트가 뿌려질때 실행될 애니메이션 효과
                     	startup: true,
                      	duration: 1000,
                      	easing: 'linear'},
                      annotations: {
                      	textStyle: {
	                        fontSize: 15,
	                        bold: true,
	                        italic: true,
	                        color: '#871b47',
	                        auraColor: '#871b47',
	                        opacity: 1.8
                        }
                     }
               };
         
               var chart = new google.visualization.BarChart(document.getElementById('bar_chart_div'));
               chart.draw(data, barChartOption);
               
               window.addEventListener('resize', function() {chart.draw(data, barChartOption)}, false);
      }
      </script>
      
      
  </head>
  	<!-- Navbar menu -->
	<body class="app sidebar-mini">
	<jsp:include page="../../Top.jsp"/>
    
    <!-- Sidebar menu Left-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <jsp:include page="../../Left.jsp"/>
   



	<main class="app-content">
		<div class="app-title">
			<div>
				<h1>
					<i class="fa fa-dashboard"></i> Dashboard
				</h1>
				<p>일반회원 관리 페이지</p>
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
							<b>${totalRecordCount}명</b>
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
									<th style="width: 10%;">성별</th>
									<th style="width: 10%;">나이</th>
									<th style="width: 18%;">등급</th>
									<th>적립금</th>
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
												href="<c:url value='/member/normal/NormalManage.do?id=${host.id}'/>">${host.id}</a></td>
											<td>${host.name}</td>
											<c:if test="${host.gender == 'm'}" var="gender">
												<td>남자</td>
											</c:if>
											<c:if test="${not gender}">
												<td>여자</td>
											</c:if>
											<td>${host.age}</td>
											<td>${host.grade}</td>
											<td>${host.credit}</td>
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
					<h3 class="tile-title">회원 나이 비율</h3>
					<div class="embed-responsive embed-responsive-16by9">
						<div class="embed-responsive-item" id="piechart_3d"
							style="width: 500px; height: 230px;"></div>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="tile">
					<h3 class="tile-title">회원 남/녀 비율</h3>
					<div class="embed-responsive embed-responsive-16by9">
						<div class="embed-responsive-item" id="donutchart"
							style="width: 530px; height: 240px;"></div>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="tile">
					<h3 class="tile-title">회원 등급 비율</h3>
					<div class="embed-responsive embed-responsive-16by9">
						<div class="embed-responsive-item" id="chart_div"
							style="width: 510px; height: 230px;"></div>
					</div>
				</div>
			</div>

		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="tile">
					<h3 class="tile-title">나이별 일반 회원 그래프</h3>
					<div class="embed-responsive embed-responsive-16by9">
						<div class="embed-responsive-item" id="bar_chart_div"></div>
					</div>
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
	!-- Page specific javascripts-->
    <!-- Data table plugin-->
    <script type="text/javascript" src="../../js/plugins/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="../../js/plugins/dataTables.bootstrap.min.js"></script>
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
	<script type="text/javascript">
    	var url = window.location.href;
    	console.log(url);
	</script>
   
</body>
</html>