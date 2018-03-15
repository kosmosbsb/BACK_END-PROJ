<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="robots" content="noindex, nofollow">

    <title>Easy Table Filter - Bootsnipp.com</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

    </style>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container">
	<div class="row">

		<section class="content">
			<div class="col-md-8 col-md-offset-2">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="pull-right">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<button type="radio" class="btn btn-primary btn-filter" data-target="pagado">기간별</button>
								<button type="radio" class="btn btn-primary btn-filter" data-target="pendiente">유형별</button>
							</div>
							<!-- --------------------------------------------------------------- --> 
							
							<!-- --------------------------------------------------------------- --> 
						</div>
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
															<canvas class="embed-responsive-item" id="pieChartDemo"></canvas>
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
					</div>
				</div>

			</div>
		</section>
		
	</div>
</div>

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
      	labels: ["January", "February", "March", "April", "May","June"],
      	datasets: [
      		{
      			label: "My First dataset",
      			fillColor: "rgba(220,220,220,0.2)",
      			strokeColor: "rgba(220,220,220,1)",
      			pointColor: "rgba(220,220,220,1)",
      			pointStrokeColor: "#fff",
      			pointHighlightFill: "#fff",
      			pointHighlightStroke: "rgba(220,220,220,1)",
      			data: [65, 59, 80, 81, 56,90]
      		},
      		{
      			label: "My Second dataset",
      			fillColor: "rgba(151,187,205,0.2)",
      			strokeColor: "rgba(151,187,205,1)",
      			pointColor: "rgba(151,187,205,1)",
      			pointStrokeColor: "#fff",
      			pointHighlightFill: "#fff",
      			pointHighlightStroke: "rgba(151,187,205,1)",
      			data: [28, 48, 40, 19, 86,50]
      		}
      	]
      };
      var pdata = [
        	{
        		value: 300,
        		color:"#F7464A",
        		highlight: "#FF5A5E",
        		label: "Red"
        	},
        	{
        		value: 50,
        		color: "#46BFBD",
        		highlight: "#5AD3D1",
        		label: "Green"
        	},
        	{
        		value: 100,
        		color: "#FDB45C",
        		highlight: "#FFC870",
        		label: "Yellow"
        	}
        ]
      
      var ctxl = $("#lineChartDemo").get(0).getContext("2d");
      var lineChart = new Chart(ctxl).Line(data);
      
      var ctxp = $("#pieChartDemo").get(0).getContext("2d");
      var pieChart = new Chart(ctxp).Pie(pdata);
      
	$(document).ready(function () {
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
	<!-- ------------------------------------------------------------------- -->
</body>
</html>
