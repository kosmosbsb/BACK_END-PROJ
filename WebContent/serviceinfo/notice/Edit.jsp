<%@page import="controller.lmy.DataRoomDTO"%>
<%@page import="controller.lmy.DataRoomDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//1]파라미터(키값) 받기
	String articleId = request.getParameter("articleId");
	//현재 페이지번호 받기
	String nowPage = request.getParameter("nowPage");
	//2]CRUD작업용 BbsDAO생성
	DataRoomDAO dao = new DataRoomDAO(application);
	//상세보기용 메소드 호출	
	DataRoomDTO dto= dao.selectOne(articleId);
	//3]자원반납
	dao.close();
%> 
<!DOCTYPE html>
<html>
<head>
    <title>Edit.jsp</title>
	<meta charset="utf-8" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/Styles/divLayout.css" type="text/css" />
	
</head>
<body>
    <div class="allWrap">
        <div class="partWrap">
            <!-- 탑메뉴 및 로고 감싸는 div 시작 -->
            <div class="header">
                <div class="logo">
                    <img src="<%=request.getContextPath() %>/Images/logo.png" alt="로고이미지" />
                </div>
                <jsp:include page="../../Top.jsp"/>
            </div>
            <!-- 탑메뉴 및 로고 감싸는 div 끝 -->
            <!--Left메뉴 및 실제 내용 감싸는 div시작-->
            <div class="section">
                <jsp:include page="../../Left.jsp"/>
                <div class="body">
                    <div class="content">
                    	<fieldset style="padding:20px 0 50px 20px">
	                    	<legend>게시글 수정</legend>
	                        <form action="EditOk.jsp" method="post">
			                  	<input type="hidden" name="articleId" value="<%=dto.getNo()%>"/>
			                  	<input type="hidden" name="nowPage" value="<%=nowPage%>"/>
			                  	<table width="75%" bgcolor="gray" cellspacing="1">                  	
			                  		<tr bgcolor="white" >
			                  			<td width="30%" align="center">제목</td>
			                  			<td >
			                  			<input type="text" value="<%=dto.getTitle() %>"  name="title" style="width:98%"/>
			                  			</td>
			                  		</tr>
			                  		<tr bgcolor="white" >
			                  			<td align="center">내용</td>
			                  			<td>
			                  			<textarea rows="10" style="width:98%" name="content"><%=dto.getContent() %></textarea>
			                  			</td>
			                  			
			                  		</tr>
			                  		<tr bgcolor="white" align="center">
			                  			<td colspan="2">
			                  			<input type="submit" value="수정"/>
			                  			</td>
			                  		</tr>                  	
			                  	</table> 
		                  	</form>
	                    </fieldset>                         
                    </div>
                </div>
            </div>
        
        </div>
    </div>
</body>
</html>
