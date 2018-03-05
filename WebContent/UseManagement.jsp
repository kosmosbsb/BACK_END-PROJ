<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
  <head>
   	<meta charset="utf-8">
	
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="css/main.css">
    
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <title>테스트 페이지</title>
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
              <div class="app-notification__content">
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
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-th-list"></i><span class="app-menu__label">회원 관리</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="이동할 페이지!"><i class="icon fa fa-circle-o"></i>일반 회원</a></li>
            <li><a class="treeview-item" href="이동할 페이지!" target="_blank"><i class="icon fa fa-circle-o"></i>호스트 회원</a></li>
          </ul>
        </li>
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-th-list"></i><span class="app-menu__label">통계 관리</span><i class="treeview-indicator fa fa-angle-right"></i></a>
      	  <ul class="treeview-menu">
            <li><a class="treeview-item" href="<c:url value='UseManagement.do'/>"><i class="icon fa fa-circle-o"></i>이용 통계</a></li>
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
          <h1><i class="fa fa-dashboard"></i> Dashboard</h1>
          <p>A free and modular admin template</p>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
        </ul>
      </div>
      <div class="row">
      <div class="col-md-6">
          <div class="tile">
            <h3 class="tile-title">Radar Chart</h3>
            <div class="embed-responsive embed-responsive-16by9">
              <canvas class="embed-responsive-item" id="radarChartDemo"></canvas>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="tile">
            <h3 class="tile-title">Polar Chart</h3>
            <div class="embed-responsive embed-responsive-16by9">
              <canvas class="embed-responsive-item" id="polarChartDemo"></canvas>
            </div>
          </div>
        </div>
     </main>
     
     <!-- Essential javascripts for application to work-->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <script type="text/javascript" src="js/plugins/chart.js"></script>
    <script type="text/javascript">
    
    var data = {
          	labels: ["January", "February", "March", "April", "May"],
          	datasets: [
          		{
          			label: "My First dataset",
          			fillColor: "rgba(220,220,220,0.2)",
          			strokeColor: "rgba(220,220,220,1)",
          			pointColor: "rgba(220,220,220,1)",
          			pointStrokeColor: "#fff",
          			pointHighlightFill: "#fff",
          			pointHighlightStroke: "rgba(220,220,220,1)",
          			data: [65, 59, 80, 81, 56]
          		},
          		{
          			label: "My Second dataset",
          			fillColor: "rgba(151,187,205,0.2)",
          			strokeColor: "rgba(151,187,205,1)",
          			pointColor: "rgba(151,187,205,1)",
          			pointStrokeColor: "#fff",
          			pointHighlightFill: "#fff",
          			pointHighlightStroke: "rgba(151,187,205,1)",
          			data: [28, 48, 40, 19, 86]
          		}
          	]
          };
          var pdata = [
          	{
          		value: 300,
          		color: "#46BFBD",
          		highlight: "#5AD3D1",
          		label: "Complete"
          	},
          	{
          		value: 50,
          		color:"#F7464A",
          		highlight: "#FF5A5E",
          		label: "In-Progress"
          	}
          ]
          
          
          var ctxr = $("#radarChartDemo").get(0).getContext("2d");
          var radarChart = new Chart(ctxr).Radar(data);
          
          var ctxpo = $("#polarChartDemo").get(0).getContext("2d");
          var polarChart = new Chart(ctxpo).PolarArea(pdata);
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