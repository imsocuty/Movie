<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<h1>로그인</h1>
	<form id="login-form" action="loginAction.jsp" method="post">

		<label class="legend">아이디</label> 
		<input name="user_id" type="text">

		<label class="legend">패스워드</label> 
		<input name="password" type="password"> 
			<input type="submit" value="로그인"> 
			<input type="button" value="영화 조회" onclick="location.href='index.jsp?section=mv_list.jsp'">
	</form>
</body>
</html>
