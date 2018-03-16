<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="controller.lmy.DataRoomDAO"%>
<%@page import="controller.lmy.DataRoomDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//현재 페이지 번호 받기 
	// String nowPage = request.getParameter("nowPage");

	//리스트 보여주기
	DataRoomDAO dao = new DataRoomDAO(application);
	List<DataRoomDTO> list =dao.selectList();
	
%>


<!DOCTYPE html>
<html lang="en">
  <head>
   	
   	<meta charset="utf-8">
	
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css'/>">
    
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  
    
    <title>공지사항 관리</title>
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
          <h1><i class="fa fa-dashboard"></i>공지사항 관리</h1>
      
        </div>
      
      </div>
      
      <div class="row">
         <div class="col-md-12" >
          <div class="tile">
            <div class="tile-body">
              <table class="table table-hover table-bordered" id="sampleTable">
                <thead>
                  <tr>
                    <th style="width: 7%" class="text-center">번호</th>
                    <th style="width: 10%"  class="text-center">카테고리</th>
             		<th style="width:15%" class="text-center">타이틀</th>    
                    <th style="width: 28%"  class="text-center">내용</th>
                    <th style="width: 10%"  class="text-center">등록일</th>
                     <th style="width: 10%"  class="text-center">공지대상</th>
                   <th style="width: 10%"  class="text-center">작성자</th>
                    <th style="width: 10%" class="text-center">게시물 관리</th>
                     
                  </tr>
                </thead>
                	<tbody>	
                		
                		<% if(list.isEmpty()){ %>
                             <tr bgcolor="white" align="center">
                              <td colspan="8">등록된 글이 없어요</td>
                             </tr>
                           
                          <% }else{ 
                        	  	int loop=0;
                          		for(DataRoomDTO record:list){
                          %>  
                             <tr>
                               <td class="text-center"><%=record.getNotice_no() %></td>
                               <td class="text-center"><%=record.getCategory() %></td>
                               <td class="text-center"> <%=record.getTitle() %></td>
                        	   <td> <%=record.getContent() %></td>
                               <td class="text-center"><%=record.getRegidate() %></td>
                               <td class="text-center"><%=record.getNormal_or_host() %></td>
                               <td class="text-center"><%=record.getId() %></td>
                             
                              <td>
			                  	<a href="Edit.jsp?articleId=<%=record.getNotice_no()%>">수정</a>|<a href = "Delete.jsp?articleId=<%=record.getNotice_no()%>">삭제</a>
			                 </td>		
			          
			           	</tr>    
                                                       
                        <%		
                        		loop++;
                          		
                          		}//for
                         
                          }//else %>
                </tbody>
                       
                       
              </table>
			     <a href="Write.jsp">추가</a>
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
    <script type="text/javascript">$('#sampleTable').DataTable();</script>
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