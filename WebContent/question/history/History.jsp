<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/IsMember.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
   	<meta charset="utf-8">
	
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href='<c:url value="/css/main.css"/>'/>
    
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <title>SC 관리자 페이지</title>
<!-- --------------------------------------------------------------- -->
    <style>
    
	.invisible{
		display: none;
	}	
    </style>
<!-- --------------------------------------------------------------- -->    
  </head>
  
 <body class="app sidebar-mini">
    <!-- Navbar-->
    <jsp:include page="/Top.jsp"/>
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <!-- 사이드바 Left.jsp-------------------------------- -->
    <jsp:include page="/Left.jsp"/>
    
    
    
 <!-- --------------------------------------------------------------- -->   
   <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-dashboard"></i>문의 통계</h1>
          <p style="font-style: normal;">고객들의 문의를 기간별,유형별 그래프를 통해 한눈으로 !</p>
        </div>
        
        <!-- 차트 버튼 -->
     		<div class="btn-group btn-group-toggle" data-toggle="buttons">
				<button type="radio" class="btn btn-primary btn-filter" data-target="pagado">기간별</button>
								<!-- <div class="btn-group" role="group">
				                  <button class="btn btn-primary dropdown-toggle" id="btnGroupDrop1" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
				                  <div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item" href="#">Dropdown link</a><a class="dropdown-item" href="#">Dropdown link</a></div>
				                </div> -->
				<button type="radio" class="btn btn-primary btn-filter" data-target="pendiente">유형별</button>
			</div>
      </div>
      <!-- --------------------------------------------------------------- -->
      
      <!-- 기간별 차트 -->
    <div class="table-container">
							<table class="table table-filter">
								<tbody>
									<tr data-status="pagado">
										<td>
										<!-- --------------------------------------------------------------- --> 
											<div class="row" id="periodchart">
												<div class="col-md-10" style="padding-left: 200px">
													<div class="tile">
														<h3 class="tile-title">기간별 문의 통계</h3>
														<div class="embed-responsive embed-responsive-16by9">
															<canvas class="embed-responsive-item" id="lineChartDemo"></canvas>
														</div>
													</div>
												</div>
											</div>
											<!-- --------------------------------------------------------------- --> 
										</td>
										</tr>
									<tr data-status="pendiente">
										<td>
										<!-- --------------------------------------------------------------- --> 
											<div class="row" id="typechart">
												<div class="col-md-10" style="padding-left: 200px">
													<div class="tile">
														<h3 class="tile-title">유형별 문의 통계</h3>
														<div class="embed-responsive embed-responsive-16by9">
															<canvas class="embed-responsive-item" id="pieChartDemo"/>
														</div>
													</div>
												</div>
											</div>
											<!-- --------------------------------------------------------------- --> 
											</td>
										</tr>
								</tbody>
							</table>
						</div>
		</main>
 <!-- --------------------------------------------------------------- -->   

    <!-- Essential javascripts for application to work-->
    <script src="<c:url value='/js/jquery-3.2.1.min.js'/>"></script>
    <script src="<c:url value='/js/popper.min.js'/>"></script>
    <script src="<c:url value='/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/js/main.js'/>"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="<c:url value='/js/plugins/pace.min.js'/>"></script>
    <!-- Page specific javascripts-->
    <script type="text/javascript" src="<c:url value='/js/plugins/chart.js'/>"></script>
    <script type="text/javascript">
      var data = {
      	labels: ["1월", "2월", "3월", "4월", "5월","6월","7월","8월","9월","10월","11월","12월"],
      	datasets: [
      		{
      			label: "My First dataset",
      			fillColor: "rgba(220,220,220,0.2)",
      			strokeColor: "rgba(220,220,220,1)",
      			pointColor: "rgba(220,220,220,1)",
      			pointStrokeColor: "#fff",
      			pointHighlightFill: "#fff",
      			pointHighlightStroke: "rgba(220,220,220,1)",
      			data: [65, 59, 80, 81, 56,90,20,30,30,70,60,100]
      		},
      		{
      			label: "My Second dataset",
      			fillColor: "rgba(151,187,205,0.2)",
      			strokeColor: "rgba(151,187,205,1)",
      			pointColor: "rgba(151,187,205,1)",
      			pointStrokeColor: "#fff",
      			pointHighlightFill: "#fff",
      			pointHighlightStroke: "rgba(151,187,205,1)",
      			data: [28, 48, 40, 19, 86,50,65, 59, 80, 81, 56,90]
      		}
      	]
      };
      var pdata = [
        	{
        		value: 300,
        		color:"#F7464A",
        		highlight: "#FF5A5E",
        		label: "공간"
        	},
        	{
        		value: 50,
        		color: "#46BFBD",
        		highlight: "#5AD3D1",
        		label: "예약"
        	},
        	{
        		value: 100,
        		color: "#FDB45C",
        		highlight: "#FFC870",
        		label: "결제"
        	}
        ]
      
      var ctxl = $("#lineChartDemo").get(0).getContext("2d");
      var lineChart = new Chart(ctxl).Line(data);
      
      var ctxp = $("#pieChartDemo").get(0).getContext("2d");
      var pieChart = new Chart(ctxp).Pie(pdata);
      
      /* 버튼클릭시 활성/비활성*/
			$(document).ready(function () {
				$('.table tr[data-status="pendiente"]').css('display', 'none');
    $('.btn-filter').on('click', function () {
      var $target = $(this).data('target');
      if ($target != 'all') {
        $('.table tr').css('display', 'none');
        $('.table tr[data-status="' + $target + '"]').fadeIn('slow');
      } else {
        $('.table tr').css('display', 'none').fadeIn('slow');
      }
    });

 });
      
    </script>
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