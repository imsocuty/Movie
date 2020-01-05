<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = (String) session.getAttribute("id");
	    String mn = request.getParameter("mn");
		if (id != null) {
			if (id.equals("root")) {
	%>
	<script>
		location.href = "index.jsp?section=update.jsp&mn=<%=mn %>";
	</script>
	<%
		} else {
	%>
	<script>
	    alert("관리자 권한이 아닙니다.")
	    location.href = "index.jsp?section=mv_list.jsp"
	</script>
	<%
		}
		} else {
	%>
	<script>
		alert("로그인을 한 후 들와주세요");
		location.href = "index.jsp?section=login.jsp";
	</script>
	<%
		}
	%>
</body>
</html>