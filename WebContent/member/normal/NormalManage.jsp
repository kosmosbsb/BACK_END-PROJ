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
  
 <body class="app sidebar-mini">
    <!-- Navbar-->
    <header class="app-header"><a class="app-header__logo" href="index.jsp" ><img src="<c:url value='/Images/backend_logo.png'/>" style="width: 220px; height: auto; margin-left: -10px; margin-top: -10px;"/></a>
      <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"></a>
      <!-- Navbar Right Menu-->
      <ul class="app-nav">
        <li class="app-search">
          <input class="app-search__input" type="search" placeholder="Search">
          <button class="app-search__button"><i class="fa fa-search"></i></button>
        </li>
        <!--Notification Menu-->
        <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown"><i class="fa fa-bell-o fa-lg"></i></a>
          <ul class="app-notification dropdown-menu dropdown-menu-right">
            <li class="app-notification__title">You have 4 new notifications.</li>
            <div class="app-notification__content">
            <!-- 
            <i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa fa-envelope fa-stack-1x fa-inverse">
            <i class="fa fa-circle fa-stack-2x text-danger"></i><i class="fa fa-hdd-o fa-stack-1x fa-inverse"></i>
            <i class="fa fa-circle fa-stack-2x text-success"></i><i class="fa fa-money fa-stack-1x fa-inverse"></i>
             -->
              <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa fa-envelope fa-stack-1x fa-inverse"></i></span></span>
                  <div>
                    <p class="app-notification__message">Lisa sent you a mail</p>
                    <p class="app-notification__meta">2 min ago</p>
                  </div></a></li>
              <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-danger"></i><i class="fa fa-hdd-o fa-stack-1x fa-inverse"></i></span></span>
                  <div>
                    <p class="app-notification__message">Mail server not working</p>
                    <p class="app-notification__meta">5 min ago</p>
                  </div></a></li>
              <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-success"></i><i class="fa fa-money fa-stack-1x fa-inverse"></i></span></span>
                  <div>
                    <p class="app-notification__message">Transaction complete</p>
                    <p class="app-notification__meta">2 days ago</p>
                  </div></a></li>

            </div>
            <li class="app-notification__footer"><a href="#">See all notifications.</a></li>
          </ul>
        </li>
        <!-- User Menu-->
        <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown"><i class="fa fa-user fa-lg"></i></a>
          <ul class="dropdown-menu settings-menu dropdown-menu-right">
            <li><a class="dropdown-item" href="page-user.html"><i class="fa fa-cog fa-lg"></i> Settings</a></li>
            <li><a class="dropdown-item" href="page-user.html"><i class="fa fa-user fa-lg"></i> Profile</a></li>
            <li><a class="dropdown-item" href="<c:url value="/page-login.html" />"><i class="fa fa-sign-out fa-lg"></i> Logout</a></li>
          </ul>
        </li>
      </ul>
    </header>
    
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
			            <p><b>100명</b></p>
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
				<div class="col-md-12">
					<div class="tile">
					<h3 class="tile-title">일반 회원 목록</h3>
						<div class="form-group" style="float: right">
		                    <select class="form-control" id="exampleSelect">
		                      <option>성별</option>
		                      <option>나이</option>
		                      <option>등급</option>
		                      <option>적립금</option>
		                    </select>
	                  	</div>
						<table class="table table-hover table-bordered" style="text-align: center">
							<tr>
								<th style="width: 23%;">아이디</th>
								<th style="width: 18%;">이름</th>
								<th style="width: 7%;">성별</th>
								<th style="width: 7%;">나이</th>
								<th style="width: 15%;">등급</th>
								<th style="width: 20%;">적립금</th>
								<th style="width: 15%;">예약현황</th>
							</tr>
							
							<c:if test="${requestScope.list==null}" var="flag">
								<tr>
									<td colspan="7"><a href="<c:url value='/MEMBER/HostMng.do'/>">등록된 자료가 없습니다</a></td>
								</tr>
							</c:if>
							
							<c:if test="${not flag}">
								<!-- 
								<tr>
									<th><a href="<c:url value='view.go?no=${no}'/>">xxx_Chun69_xxx</a></th>
									<th>츈리</th>
									<th>허벅지살인마</th>
									<th>여</th>
									<th>50</th>
								</tr>
								 -->
								<c:forEach var="host" items="${list}" varStatus="loop">
									<tr>
										<td><a href="<c:url value='view.go?no=${no}'/>">${host.id}</a></td>
										<td>${host.name}</td>
										<td>${host.hostname}</td>
										<td>${host.gender}</td>
										<td>${host.age}</td>
									</tr>
								</c:forEach>
							
							</c:if>
			
						</table>
					</div>
				</div>	
			</div>
		<!-- 페이징 추가해야함 기억! -->
		<div class="">
		<div class="row justify-content-center">${pagingString}</div>
		<nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		        <span class="sr-only">Previous</span>
		      </a>
		    </li>
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		        <span class="sr-only">Next</span>
		      </a>
		    </li>
		  </ul>
		</nav>
		</div>

	</main>
	<!-- Essential javascripts for application to work-->
	<script src="<c:url value="/js/jquery-3.2.1.min.js"/>"></script>
	<script src="<c:url value="/js/popper.min.js"/>"></script>
	<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/js/main.js"/>"></script>
	<!-- The javascript plugin to display page loading on top-->
	<script src="<c:url value="/js/plugins/pace.min.js"/>"></script>
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
      			data: [18, 25, 30, 12, 10, 2, 1, 1, 1]
      		}
      	]
      };
      var pdata = [
      	{
      		value: 45,
      		color:"#58FAD0",
      		highlight: "#FFD642",
      		label: "20대"
      	},
      	{
      		value: 35,
      		color: "#ACFA58",
      		highlight: "#E1F5A9",
      		label: "30대"
      	},
      	{
      		value: 7,
      		color: "#F781BE",
      		highlight: "#F6CEE3",
      		label: "40대"
      	},
      	{
      		value: 3,
      		color: "#F79F81",
      		highlight: "#D0A9F5",
      		label: "50대"
      	}
      	
      ]
      
      var pdata2 = [
        	{
          		value: 55,
          		color:"#58D3F7",
          		highlight: "#BCF5A9",
          		label: "남성"
          	},
          	{
          		value: 45,
          		color: "#F6CEF5",
          		highlight: "#E1F5A9",
          		label: "여성"
          	}
        ]
      
      var pdata3 = [
       	{
         	value: 35,
         	color: "#FAAC58",
         	label: "브론즈"
         },
      	{
      		value: 27,
      		color:"#D8D8D8",
      		label: "실버"
      	},
      	{
      		value: 23,
      		color:"#FACC2E",
      		label: "골드"
      	},
      	{
      		value: 10,
      		color:"#2EFEF7",
      		label: "플레티넘"
      	},
      	{
      		value: 5,
      		color:"#F5A9F2",
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