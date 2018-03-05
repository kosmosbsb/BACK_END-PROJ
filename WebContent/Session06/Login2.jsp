<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
    <title>Login.jsp</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/Styles/divLayout.css" type="text/css" />
    <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath() %>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>
</head>
<body>
	<jsp:include page="/Template/Top.jsp"></jsp:include>
   	<div class="container col-md-4 col-md-offset-4" >
      <form class="form-signin" method="post" action="LoginProcess.jsp">
        <h2 class="form-signin-heading">Please Login</h2>
        <label for="inputID" class="sr-only">ID</label>
        <input type="text" name="user" value="<%= request.getParameter("user")== null? "" :request.getParameter("user") %>" placeholder="ID" class="form-control" required autofocus/>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="pass" value="<%= request.getParameter("pass")== null? "" :request.getParameter("pass") %>" class="form-control" style="margin-top:5px" placeholder="Password" required>
        <button class="btn btn-lg btn-primary btn-block" type="submit" style="margin-top:10px">Sign in</button>
      </form>

    </div> <!-- /container -->

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
