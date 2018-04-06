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
    
    <title>일반이용정보</title>
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
		
			<h1>
				<i class="fa fa-dashboard"></i> 상세보기
			</h1>
			<p>일반 정보 상세보기</p>
		</div>
		<ul class="app-breadcrumb breadcrumb">
			<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
			<li class="breadcrumb-item"><a href="#">normalinfo view</a></li>
		</ul>
	</div>
	
	<div class="container" style="width: 55%">
	<div class="row">
	<!-- col-md-6 -->
	<div class="col-md-12">
	
          <div class="tile">
            <h2 class="tile-title">글번호 NO. ${dto.no}</h2>
            <div class="tile-body">
              <form>
              	<input type="hidden" name="category" value="${dto.category}"/>
                <div class="form-group">
                  <label class="control-label">작성자</label>
                  <label class="form-control">${dto.name}</label>
                </div>
                <div class="form-group">
                  <label class="control-label">작성일</label>
                  <label class="form-control">${dto.postdate}</label>
                </div>
                <div class="form-group">
                  <label class="control-label">제목</label>
                  <label class="form-control">${dto.title}</label>
                </div>
                <div class="form-group">
                  <label class="control-label">내용</label>
                  <textarea name="content" class="form-control" rows="10" disabled style="background-color: white ">${dto.content}</textarea>
                </div>
                
              </form>
            </div>
            <div class="row justify-content-center">   
            
              <a class="btn btn-primary" href="<c:url value='/NormalInfoView/Edit.do?no=${dto.no}&category=${dto.category}'/>"><i class="fa fa-fw fa-lg fa-wrench"></i>수정</a>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="<c:url value='/NormalInfo/List.do'/>"><i class="fa fa-th-list"></i>목록</a>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-danger" href="#" onclick="isDelete()"><i class="fa fa-fw fa-lg fa-times-circle"></i>삭제</a>
            </div>
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
    
    <!-- Google analytics script-->
    <script type="text/javascript">

    </script>
    <script>
	var isDelete = function(){
		if(confirm("정말로 삭제 하시겠습니까?")){			
			//location.replace("/sdsabk/sdkjaskd/NormalInfoDelete/Delete.do?no=${dto.no}");
			//위에는 풀경로 해줘야돼
			location.replace("<c:url value='/NormalInfoDelete/Delete.do?no=${dto.no}'/>");
		}
		
	};
	</script>
  </body>
</html>