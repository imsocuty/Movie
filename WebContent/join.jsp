<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript">
	function check() {
		var form = document.getElementById("join");
		if (!join.id.value) {
			alert("아이디를 공백 없이 입력하세요");
			form.id.focus();
			return;
		}
		if (!form.pw.value) {
			alert("비밀번호를 공백없이 입력하세요");
			form.pw.focus();
			return;
		}
		if (!form.name.value) {
			alert("이름을 공백없이 입력하세요");
			form.name.focus();
			return;
		}
		if (!form.gender.value) {
			alert("성별을 체크해주세요");
			form.gender.focus();
			return;
		}
		if (!form.em.value) {
			alert("이메일 형식에 맞게 입력해주세요");
			form.em.focus();
			return;
		}
		if (!form.ul.value) {
			alert("좋아하는 장르는 골라주세요");
			form.em.focus();
			return;
		}
		form.submit();

	}
</script>

</head>

<body>
	<h2>회원가입</h2>

	<form action="joinAction.jsp" id="join" name="join" method="post">

		<label class="legend">아이디</label> <input type="text" name="user_id"
			id="id"> <label class="legend">비번</label> <input type="password"
			name="password" id="pw"> <label class="legend">이름</label> <input
			type="text" name="name" id="name"> 
			<label>성별 
			<select name="gen" id="gender">
			   <option>남자</option>
			   <option>여자</option>
			</select>
		</label> 
		<label class="legend">메일</label> 
		<input type="email" name="email" id="em"> 
		<label class="legend">장르</label>
		<select id="ul" name="ul">
		     <option>공포</option>
		     <option>액션</option>
		     <option>멜로</option>
		     <option>유머</option>
		</select><br>
		<input type="button" value="회원가입" onclick="check()">
		<input type="button" value="로그인" onclick="location.href='index.jsp?section=login.jsp'">

	</form>
</body>
</html>