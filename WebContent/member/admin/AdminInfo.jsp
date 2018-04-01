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
          <h1><i class="fa fa-th-list"></i> 관리자 관리</h1>
          <p>관리자 정보를 아래 테이블에서 확인하세요.</p>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item active"><a href="#">관리자 관리</a></li>
        </ul>
      </div>

      <div class="row">
        <div class="col-md-12">
        
          <div class="tile">
          <c:if test="${USER_LEVEL=='M'}">
          <button class="btn btn-primary pull-right" type="button" onclick='location.href="<c:url value='/member/admin/IncludeAdmin.jsp'/>"'><i class="fa fa-user fa-lg"></i>새 관리자 등록</button>
          </c:if>
            <div class="tile-body">
              <table class="table table-hover table-bordered" id="sampleTable">
                <thead>
                  <tr>
                    <th style="width: 12%">유형</th>
                    <th>아이디</th>
                    <th>관리자명</th>
                    <th style="width: 12%">등록일</th>
                    <th style="width: 16%">계정관리</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${list}" varStatus="loop">
	   				<tr>
	   					<td>${item.admin_level == 'M' ? '마스터관리자' :
	   							item.admin_level == 'A' ? '통계관리자' :
	   							item.admin_level == 'S' ? '서비스관리자' : 'CS관리자'}</td>
	   					<td>${item.id}</td>
	   					<td>${item.admin_name}</td>
	   					<td>${item.regidate}</td>
	   					<td>
	   						<c:if test="${item.id == USER_ID or USER_LEVEL == 'M'}">
	   						<button class="btn btn-primary" type="button" onclick='location.href="<c:url value='/member/admin/EditAdmin.jsp?id=${item.id}&admin_level=${item.admin_level}'/>"'><i class="fa fa-fw fa-lg fa-wrench"></i>수정&nbsp;</button>
	   						</c:if>
	   						<c:if test="${USER_LEVEL == 'M' and item.id != USER_ID}">
	   						&nbsp;<button class="btn btn-danger" type="button" onclick="deleteOK('${item.id}')"><i class="fa fa-fw fa-lg fa-times-circle"></i>삭제&nbsp;</button>
	   						</c:if>
	   					</td>
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
    		"lengthMenu": [[5, 10, 15, -1], [5, 10, 15, "All"]]
        });</script>
    <!-- Google analytics script-->
    <script type="text/javascript">

      function deleteOK(id){
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href='<c:url value="/ADMIN/Delete.do?id='+id+'"/>';
		}
      };
    </script>
  </body>
</html>