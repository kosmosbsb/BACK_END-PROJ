<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
  <head>
  
  	<style>
	  	.chart {
		  width: 100%; 
		}
		.random {
		  margin:0 !important;
		}
  	</style>
  	
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
    </style>
    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">//일반회원 vs 호스트회원 비율

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'HoeOrCunt');
        data.addColumn('number', 'Percentage');
        data.addRows([
          ['일반 회원', 118],
          ['호스트 회원', 43],
        ]);

        // Set chart options
        var options = {'title':'일반회원 대 호스트 회원 비율',
                       'width':400,
                       'height':300};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('hovcun'));
        chart.draw(data, options);
      }
    </script>
    <script type="text/javascript">//일반회원 성별 비율

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'cunsexpercentage');
        data.addColumn('number', 'Percentage');
        data.addRows([
          ['남성', 43],
          ['여성', 75],
        ]);

        // Set chart options
        var options = {'title':'일반 회원 성별 비율',
                       'width':400,
                       'height':300};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('cunsexperc'));
        chart.draw(data, options);
      }
    </script>
    <script type="text/javascript">//호스트 회원 성별 비율

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'hosexpercentage');
        data.addColumn('number', 'Percentage');
        data.addRows([
          ['남성', 23],
          ['여성', 20],
        ]);

        // Set chart options
        var options = {'title':'일반 회원 성별 비율',
                       'width':400,
                       'height':300};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('hosexperc'));
        chart.draw(data, options);
      }
    </script>
    <script>
    google.charts.load('current', {packages: ['corechart', 'bar']});
    google.charts.setOnLoadCallback(drawMultSeries);

    function drawMultSeries() {
          var data = new google.visualization.DataTable();
          data.addColumn('string', 'ageGroup');
          data.addColumn('number', '일반 회원 수');
          data.addColumn('number', '호스트 회원 수');

          data.addRows([
            ['10대', 33, 1],
            ['20대', 26, 3],
            ['30대', 12, 8],
            ['40대', 4, 12],
            ['50대', 12, 9],
            ['60대', 11, 4],
            ['70대', 12, 3],
            ['80대', 6, 2],
            ['90대', 2, 1],
          ]);

          var options = {
            title: '일반/호스트 회원 나이대별 분포율',
            hAxis: {
              viewWindow: {
                min: [0],
                max: [9]
              }
            }
          };

          var chart = new google.visualization.ColumnChart(
            document.getElementById('chart_agegroup'));

          chart.draw(data, options);
        }
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
            <li><a class="dropdown-item" href="page-login.html"><i class="fa fa-sign-out fa-lg"></i> Logout</a></li>
          </ul>
        </li>
      </ul>
    </header>
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
      <div class="app-sidebar__user" style="margin-left: 5px;">
      	<i class="fa fa-address-card fa-lg"></i>
        <div style="margin-left: 20px;">
          <p class="app-sidebar__user-name">찰리8</p>
          <p class="app-sidebar__user-designation">마스터 관리자</p>
        </div>
      </div>
      <hr style="background-color: gray;"/>
      <ul class="app-menu">
      <!--
        <li><a class="app-menu__item active" href="index.html"><i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">DashBoard</span></a></li>
      -->
        <li class="treeview is-expanded"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-th-list"></i><span class="app-menu__label">회원 관리</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="이동할 페이지!"><i class="icon fa fa-circle-o"></i>일반 회원</a></li>
            <li><a class="treeview-item" href="#" target="_blank"><i class="icon fa fa-circle-o"></i>호스트 회원</a></li>
          </ul>
        </li>
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-th-list"></i><span class="app-menu__label">통계 관리</span><i class="treeview-indicator fa fa-angle-right"></i></a>
      	  <ul class="treeview-menu">
            <li><a class="treeview-item" href="이동할 페이지!"><i class="icon fa fa-circle-o"></i>이용 통계</a></li>
            <li><a class="treeview-item" href="이동할 페이지!" target="_blank"><i class="icon fa fa-circle-o"></i>공간 통계</a></li>
          	 <li><a class="treeview-item" href="이동할 페이지!"><i class="icon fa fa-circle-o"></i>회원 통계</a></li>
          </ul>
        </li>
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-th-list"></i><span class="app-menu__label">문의 관리</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="이동할 페이지!"><i class="icon fa fa-circle-o"></i>처리 현황</a></li>
            <li><a class="treeview-item" href="이동할 페이지!"><i class="icon fa fa-circle-o"></i>문의 통계</a></li>
          </ul>
        </li>
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-th-list"></i><span class="app-menu__label">서비스 정보 관리</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="이동할 페이지!"><i class="icon fa fa-circle-o"></i>공지사항 관리</a></li>
            <li><a class="treeview-item" href="이동할 페이지!"><i class="icon fa fa-circle-o"></i>도움말 관리</a></li>
            <li><a class="treeview-item" href="이동할 페이지!"><i class="icon fa fa-circle-o"></i>FAQ 관리</a></li>
            <li><a class="treeview-item" href="이동할 페이지!"><i class="icon fa fa-circle-o"></i>일반 이용정보</a></li>
            <li><a class="treeview-item" href="이동할 페이지!"><i class="icon fa fa-circle-o"></i>호스트 이용정보</a></li>
          </ul>
        </li>
         <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-th-list"></i><span class="app-menu__label">이벤트 관리</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="이동할 페이지!"><i class="icon fa fa-circle-o"></i>컨시어지 서비스</a></li>
            <li><a class="treeview-item" href="이동할 페이지!"><i class="icon fa fa-circle-o"></i>베스트 공간 리스트</a></li>
            <li><a class="treeview-item" href="이동할 페이지!"><i class="icon fa fa-circle-o"></i>기획전(공간톡톡)</a></li>
          </ul>
        </li>
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-th-list"></i><span class="app-menu__label">수수료 관리</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="이동할 페이지!"><i class="icon fa fa-circle-o"></i>정산 정책 관리</a></li>
            <li><a class="treeview-item" href="이동할 페이지!"><i class="icon fa fa-circle-o"></i>서비스 이용 현황</a></li>
          </ul>
        </li>
      </ul>
    </aside>





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
					<div class="widget-small primary coloured-icon"><i class="icon fa fa-users fa-3x"></i>
						<div class="info">
				            <h4>일반 회원</h4>
				            <p><b>118명</b></p>
			            </div>
		            </div>
		        </div>
				<div class="col-md-6">
		          <div class="widget-small danger coloured-icon"><i class="icon fa fa-star fa-3x"></i>
		            <div class="info">
		              <h4>호스트 회원</h4>
		              <p><b>43명</b></p>
		            </div>
		          </div>
		        </div>
			</div>

			
			<div style="background-color:white;">
				<table class="table table-hover table-bordered">
				
					<tr>
						<th><div id="hovcun" class="chart"></div></th>
						<th><div id="cunsexperc" class="chart"></div></th>
						<th><div id="hosexperc" class="chart"></div></th>
					</tr>
					
				</table>
			</div>
			
			<div style="background-color:white;">
				<table class="table table-hover table-bordered">
					<tr>
						<th>
						<div id="chart_agegroup" class="chart"></div>
						</th>
					</tr>
				</table>
			</div>
			
			<div style="background-color:white;">
			<table class="table table-hover table-bordered">
			
				<tr>
					<th style="width: 20%;">아이디</th>
					<th style="width: 20%;">이름</th>
					<th style="width: 40%;">호스트명</th>
					<th style="width: 10%;">성별</th>
					<th style="width: 10%;">나이</th>
				</tr>
				
				<c:if test="${!empty requestScope.hosts}" var="flag">
					<tr>
						<td colspan="5">등록된 자료가 없습니다</td>
					</tr>
				</c:if>
				
				<c:if test="${not flag}">
				
					<tr>
						<th><a href="<c:url value='view.go?no=${no}'/>">kim</a></th>
						<th>김호</th>
						<th>킴치맨</th>
						<th>남</th>
						<th>13</th>
					</tr>
					<tr>
						<th><a href="<c:url value='view.go?no=${no}'/>">park</a></th>
						<th>박수영</th>
						<th>황제</th>
						<th>남</th>
						<th>26</th>
					</tr>
					<tr>
						<th><a href="<c:url value='view.go?no=${no}'/>">gwak</a></th>
						<th>곽우유</th>
						<th>Duckwoman</th>
						<th>여</th>
						<th>40</th>
					</tr>
					<tr>
						<th><a href="<c:url value='view.go?no=${no}'/>">something69</a></th>
						<th>이소룡</th>
						<th>츄리닝</th>
						<th>남</th>
						<th>80</th>
					</tr>
					<tr>
						<th><a href="<c:url value='view.go?no=${no}'/>">xxx_Chun69_xxx</a></th>
						<th>츈리</th>
						<th>허벅지살인마</th>
						<th>여</th>
						<th>50</th>
					</tr>
					
					<c:forEach var="host" items="${hosts}" varStatus="loop">
						<tr>
							<td>${host.id}</td>
							<td>${host.name}</td>
							<td>${host.hostname}</td>
							<td>${host.gender}</td>
							<td>${host.age}</td>
						</tr>
					</c:forEach>
				
				</c:if>
				


			</table>
		</div>
		<!-- 페이징 추가해야함 기억! -->
		<div class="row">${pagingString}</div>
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

	</main>
	<!-- Essential javascripts for application to work-->
	<script src="<c:url value="/js/jquery-3.2.1.min.js"/>"></script>
	<script src="<c:url value="/js/popper.min.js"/>"></script>
	<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/js/main.js"/>"></script>
	<!-- The javascript plugin to display page loading on top-->
	<script src="<c:url value="/js/plugins/pace.min.js"/>"></script>
</body>
</html>