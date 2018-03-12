<%@page import="model.admin.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");

	// 사용자 입력값 받기]
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String pwd2 = request.getParameter("pwd2");
	String admin_name = request.getParameter("admin_name");
	String admin_level = request.getParameter("admin_level");
	AdminDAO dao = new AdminDAO(application);
	
	if(!pwd.equals(pwd2)){
		%>
		<script>
			alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
			history.back();
		</script>
		<%
	}
	else{
		int createResult = dao.createAdmin(id, pwd, admin_name, admin_level);
		if(createResult==2){//회원가입 성공
			%>
			<script>
				alert("정상적으로 등록했습니다.");
			</script>
			<%
			request.getRequestDispatcher("/ADMIN/List.do").forward(request, response);
		}
		else if(createResult==1){//아이디 중복
		%>
		<script>
			alert("입력하신 아이디는 이미 사용중입니다.");
			history.back();
		</script>
		<%}
		else if(createResult==4){//필수 입력항목 널체킹
		%>
		<script>
			alert("필수 입력항목을 모두 입력해주세요!");
			history.back();
		</script>
		<%}
		else{//에러
		%>
		<script>
			alert("회원가입 실패! 관리자에게 문의하세요. ekhweeee@naver.com");
			history.back();
		</script>
		<%}
	}
	dao.close();
	
%>