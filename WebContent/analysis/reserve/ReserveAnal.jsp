<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--@ include file="/common/IsMember.jsp" --%>

<!DOCTYPE html>
<html>

  <head>
   	<meta charset="utf-8">
	
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css'/>">
    
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <title>SC 관리자 페이지</title>
  </head>

    <!-- Navbar menu -->
	<body class="app sidebar-mini">
    <jsp:include page="/Top.jsp"/>
    
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    
    <jsp:include page="/Left.jsp"/>
    
    
   <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-th-list"></i> 이용 통계</h1>
          <p>고객들의 서비스 이용 패턴을 확인하세요.</p>
        </div>
      </div>
      
      <div class="btn-group btn-group-toggle" data-toggle="buttons">
		<button type="radio" class="btn btn-primary btn-filter" data-target="month_anal">월별 통계</button>
		<button type="radio" class="btn btn-primary btn-filter" data-target="gender_anal">성별 통계</button>
		<button type="radio" class="btn btn-primary btn-filter" data-target="age_anal">나이별 통계</button>
	  </div>
							
      <div class="row" data-status="month_anal" >
        <div class="col-md-12" >
          <div class="tile">
            <h3 class="tile-title">월별 이용 통계</h3>
            <div class="embed-responsive embed-responsive-16by9">
              <canvas class="embed-responsive-item" id="barChart_month"></canvas>
            </div>
          </div>
        </div>
   	  </div>
   	  
  	   <div class="row" data-status="gender_anal">
         <div class="col-md-12" >
         <div class="tile">
           <h3 class="tile-title">성별 이용 통계</h3>
           <div class="embed-responsive embed-responsive-16by9">
             <canvas class="embed-responsive-item" id="pieChart_gender"></canvas>
           	 </div>
           </div>
         </div>
      </div>
   	  
   	  <div class="row" data-status="age_anal" >
        <div class="col-md-12" >
          <div class="tile">
            <h3 class="tile-title">나이별 이용 통계</h3>
            <div class="embed-responsive embed-responsive-16by9">
              <canvas class="embed-responsive-item" id="barChart_age"></canvas>
            </div>
          </div>
        </div>
   	  </div>
   	  
    </main>
    <!-- Essential javascripts for application to work-->
    <script src="<c:url value='/js/jquery-3.2.1.min.js'/>"></script>
    <script src="<c:url value='/js/popper.min.js'/>"></script>
    <script src="<c:url value='/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/js/main.js'/>"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="<c:url value='/js/plugins/pace.min.js'/>"></script>
 
    <script type="text/javascript" src="<c:url value='/js/plugins/chart.js'/>"></script>
    <script type="text/javascript">
    /* 버튼클릭시 활성/비활성*/
	$(document).ready(function () {
		$('div[data-status="gender_anal"]').css('display', 'none');
		$('div[data-status="age_anal"]').css('display', 'none');
	$('.btn-filter').on('click', function () {
		var $target = $(this).data('target');
		if ($target != 'all') {
			$('div[data-status="month_anal"]').css('display', 'none');
			$('div[data-status="gender_anal"]').css('display', 'none');
			$('div[data-status="age_anal"]').css('display', 'none');
			$('div[data-status="' + $target + '"]').fadeIn('slow');
		}
	});
	
	});


    var barChart_month_data = {
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
      			data: [	${barChartResult_month[0]}, ${barChartResult_month[1]},
		      			${barChartResult_month[2]}, ${barChartResult_month[3]},
		      			${barChartResult_month[4]}, ${barChartResult_month[5]},
		      			${barChartResult_month[6]}, ${barChartResult_month[7]},
		      			${barChartResult_month[8]}, ${barChartResult_month[9]},
		      			${barChartResult_month[10]},${barChartResult_month[11]}]
      		}
      	]
      };
 
      var barChart_age_data = {
    	      	labels: ["10대", "20대","30대","40대","50대","60대","70대","80대","90대 이상"],
    	      	datasets: [
    	      		{
    	      			label: "My First dataset",
    	      			fillColor: "rgba(220,220,220,0.2)",
    	      			strokeColor: "rgba(220,220,220,1)",
    	      			pointColor: "rgba(220,220,220,1)",
    	      			pointStrokeColor: "#fff",
    	      			pointHighlightFill: "#fff",
    	      			pointHighlightStroke: "rgba(220,220,220,1)",
    	      			data: [	${barChartResult_month[0]}, ${barChartResult_month[1]},
    			      			${barChartResult_month[2]}, ${barChartResult_month[3]},
    			      			${barChartResult_month[4]}, ${barChartResult_month[5]},
    			      			${barChartResult_month[6]}, ${barChartResult_month[7]},
    			      			${barChartResult_month[8]}, ${barChartResult_month[9]},
    			      			${barChartResult_month[10]},${barChartResult_month[11]}]
    	      		}
    	      	]
    	      };

      var pieChart_gender_data = [
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
      
      var ctxb = $("#barChart_month").get(0).getContext("2d");
      var barChart_month = new Chart(ctxb).Bar(barChart_month_data);

      var ctxb = $("#barChart_month").get(0).getContext("2d");
      var barChart_age = new Chart(ctxb).Bar(barChart_age_data);
      
      var ctxp = $("#pieChart_gender").get(0).getContext("2d");
      var pieChart_gender = new Chart(ctxp).Pie(pieChart_gender_data);
      
    </script>
  </body>
</html>