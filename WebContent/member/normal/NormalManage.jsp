<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
  </head>
  
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
				<div class="widget-small primary coloured-icon"><i class="icon fa fa-users fa-3x"></i>
					<div class="info">
			            <h4>일반 회원</h4>
			            <p><b>${totalRecordCount}명</b></p>
		            </div>
	            </div>
	        </div>
	       </div>

			<div class="row">
		        <div class="col-md-4">
		          <div class="tile">
		            <h3 class="tile-title">회원 나이 비율</h3>
	            		<div class="embed-responsive embed-responsive-16by9">
			            	<canvas class="embed-responsive-item" id="pieChartDemo"></canvas>
			            </div>
		          </div>
		        </div>
		        
		        <div class="col-md-4">
		          <div class="tile">
		            <h3 class="tile-title">회원 남/녀 비율</h3>
		            <div class="embed-responsive embed-responsive-16by9">
		              <canvas class="embed-responsive-item" id="doughnutChartDemo"></canvas>
		            </div>
		          </div>
		        </div>
		        
		        <div class="col-md-4">
		          <div class="tile">
		          <h3 class="tile-title">회원 등급 비율</h3>
	            		<div class="embed-responsive embed-responsive-16by9">
			            	<canvas class="embed-responsive-item" id="pieChartDemo3"></canvas>
			            </div>
		          </div>
		        </div>
		        
			</div>
			
			<div class="row">
				<div class="col-md-12">
		          	<div class="tile">
			            <h3 class="tile-title">연령별 일반 회원 그래프</h3>
			            <div class="embed-responsive embed-responsive-16by9">
			              <canvas class="embed-responsive-item" id="barChartDemo"></canvas>
			            </div>
					</div>
	        	</div>
			</div>
			
			
		<div class="row">
         <div class="col-md-12" >
          <div class="tile">
            <div class="tile-body">
              <table class="table table-hover table-bordered" id="sampleTable" style="text-align: center;" >
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
								<td colspan="6"><a href="<c:url value='#'/>">등록된 자료가 없습니다</a></td>
							</tr>
					</c:if>
							
					<c:if test="${not flag}">
						<c:forEach var="host" items="${list}" varStatus="loop">
							<tr>
								<td><a href="<c:url value='/member/normal/NormalManage.do?id=${host.id}'/>">${host.id}</a></td>
								<td>${host.name}</td>
								<c:if test="${host.gender == 'm'}" var="gender" >
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
	<script type="text/javascript" src="<c:url value="/js/plugins/chart.js"/>"></script>
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
      			fillColor: "#81BEF7",
      			strokeColor: "#fff",
      			pointColor: "#fff",
      			pointStrokeColor: "#fff",
      			pointHighlightFill: "#fff",
      			pointHighlightStroke: "rgba(220,220,220,1)",
      			data: [${agedatearray[0]}, ${agedatearray[1]}, ${agedatearray[2]}, ${agedatearray[3]}, ${agedatearray[4]}, ${agedatearray[5]}, ${agedatearray[6]}, ${agedatearray[7]}, ${agedatearray[8]}]
      		}
      	]
      };
      var pdata = [
   	  {
       		value: ${agedatearray[0]},
       		color:"#F5A9A9",
       		highlight: "#F6CECE",
       		label: "10대"
       	},
      	{
      		value: ${agedatearray[1]},
      		color:"#58FAD0",
      		highlight: "#FFD642",
      		label: "20대"
      	},
      	{
      		value: ${agedatearray[2]},
      		color: "#ACFA58",
      		highlight: "#E1F5A9",
      		label: "30대"
      	},
      	{
      		value: ${agedatearray[3]},
      		color: "#F781BE",
      		highlight: "#F6CEE3",
      		label: "40대"
      	},
      	{
      		value: ${agedatearray[4]},
      		color: "#F79F81",
      		highlight: "#D0A9F5",
      		label: "50대"
      	},
      	{
      		value: ${agedatearray[5]},
      		color: "#BDBDBD",
      		highlight: "#E6E6E6",
      		label: "60대"
      	},
      	{
      		value: ${agedatearray[6]},
      		color: "#819FF7",
      		highlight: "#A9D0F5",
      		label: "70대"
      	},
      	{
      		value: ${agedatearray[7]},
      		color: "#F3F781",
      		highlight: "#F2F5A9",
      		label: "80대"
      	},
      	{
      		value: ${agedatearray[8]},
      		color: "#FA5858",
      		highlight: "#F78181",
      		label: "90대"
      	}
      	
      ]
      
      var pdata2 = [
        	{
          		value: ${genderdataarray[0]},
          		color:"#58D3F7",
          		highlight: "#BCF5A9",
          		label: "남성"
          	},
          	{
          		value: ${genderdataarray[1]},
          		color: "#F6CEF5",
          		highlight: "#E1F5A9",
          		label: "여성"
          	}
        ]
      
      var pdata3 = [
       	{
         	value: ${gradedataarray[0]},
         	color: "#FAAC58",
         	highlight: "#F5D0A9",
         	label: "브론즈"
         },
      	{
      		value: ${gradedataarray[1]},
      		color:"#D8D8D8",
      		highlight: "#E6E6E6",
      		label: "실버"
      	},
      	{
      		value: ${gradedataarray[2]},
      		color:"#FACC2E",
      		highlight: "#F5D0A9",
      		label: "골드"
      	},
      	{
      		value: ${gradedataarray[3]},
      		color:"#2EFEF7",
      		highlight: "#81F7F3",
      		label: "플레티넘"
      	},
      	{
      		value: ${gradedataarray[4]},
      		color:"#F5A9F2",
      		highlight: "#F6CEE3",
      		label: "VIP"
      	}
         
        ]
  
      var ctxp = $("#pieChartDemo").get(0).getContext("2d");
      var pieChart = new Chart(ctxp).Pie(pdata);
      
      var ctxd = $("#doughnutChartDemo").get(0).getContext("2d");
      var doughnutChart = new Chart(ctxd).Doughnut(pdata2);
      
      var ctxp3 = $("#pieChartDemo3").get(0).getContext("2d");
      var pieChart = new Chart(ctxp3).Pie(pdata3);
      
      var ctxb = $("#barChartDemo").get(0).getContext("2d");
      var barChart = new Chart(ctxb).Bar(data);
      
    </script>
   
</body>
</html>