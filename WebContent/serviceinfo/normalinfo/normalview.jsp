<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="/common/IsMember.jsp" %> 

<!DOCTYPE html>
<html>
  <head>
  <style>

	@media only screen and (max-width: 1026px) {
    #picture {
        display: none;
    }
    #picture2 {
        display: show;
    }
    #info{
    	width:90%;
    }
}
	@media only screen and (min-width: 1026px) {
	#picture2 {
        display: none;
    }
    #picture {
        display: show;
    }
}

</style>
   	<meta charset="utf-8">
	
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css'/>">
    
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <title>상세보기</title>
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
          <h1><i class="fa fa-th-list"></i> 상세보기</h1>
          <p></p>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item active"><a href="#">normalinfo view</a></li>
        </ul>
      </div>
      <!-- 상단 페이지소개 바 끝 -->
      
      <div class="tile">
            <h3 class="tile-title">상세보기</h3>
            <div class="tile-body">
              <form>
                <div class="form-group">
                  <label class="control-label">작성자</label>
                  <input class="form-control" type="text" placeholder="Enter full name">
                </div>
                <div class="form-group">
                  <label class="control-label">제목</label>
                  <input class="form-control" type="email" placeholder="Enter email address">
                </div>
                <div class="form-group">
                  <label class="control-label">내용</label>
                  <textarea class="form-control" rows="4" placeholder="Enter your address"></textarea>
                </div>
                
                
                
              </form>
            </div>
            <div class="tile-footer">
              <button class="btn btn-primary" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i>목록</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="#"><i class="fa fa-fw fa-lg fa-times-circle"></i>수정</a>
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