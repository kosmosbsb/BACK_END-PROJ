<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/common/IsMember.jsp" %>

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
    
    <title>호스트 이용정보</title>
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
          <h1><i class="fa fa-th-list"></i> 호스트 이용정보 관리</h1>
          <p></p>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item active"><a href="#">hostinfo</a></li>
        </ul>
      </div>

      <div class="row">
        <div class="col-md-12">
        
          <div class="tile">
          <a class="btn btn-primary pull-right" href="<c:url value='/HostInfoWrite/Writehost.do'/>"><i class="fa fa-user fa-lg"></i>글 등록</a>
          <!-- <button class="btn btn-primary pull-right" type="button" href="<c:url value='/normalwrite.jsp'/>"><i class="fa fa-user fa-lg"></i>글 등록</button> -->
            <div class="tile-body">
              <table class="table table-hover table-bordered" id="sampleTable">
                <thead>
                  <tr>
                  	
                    <th style="width: 12%">유형</th>
                    <th>제목</th>
                    <th style="width: 20%">작성자</th>
                    <th style="width: 15%">등록일</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${list}" varStatus="loop">
	   				<tr>
	   					
	   					<td>${item.category}</td>
	   					<td><a href="<c:url value='/HostInfoView/Viewhost.do?no=${item.no}'/>">${item.title}</a></td>
	   					<td>${item.name}</td>
	   					<td>${item.postdate}</td>
	   				</tr>
		   		</c:forEach>
                </tbody>
              </table>	
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
    <!-- Page specific javascripts-->
    <!-- Data table plugin-->
    <script type="text/javascript" src="<c:url value='/js/plugins/jquery.dataTables.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/js/plugins/dataTables.bootstrap.min.js'/>"></script>
    <script type="text/javascript">
    	$('#sampleTable').DataTable({
    		"lengthMenu": [[5, 10, 20, -1], [5, 10, 20, "All"]]
        });</script>
    <!-- Google analytics script-->
    <script type="text/javascript">

    </script>
  </body>
</html>