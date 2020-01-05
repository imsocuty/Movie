<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li><a href="index.jsp">메인</a></li>
		<%
			String id = (String) session.getAttribute("id");

			if (id != null) {
		%>
		<li><a href="index.jsp?section=logout.jsp">로그아웃</a> <%
 	if (id.equals("root")) {
 %>
		<li><a><%=id%>관리자</a></li>
		<%
			} else {
		%>
		<li><a><%=id%>사용자</a></li>
		<%
			}
		%>
		<li><a href="index.jsp?section=mv_list.jsp">영화</a></li>
		<li><a href="javascript:window.close();">종료</a></li>
		<%
			} else {
		%>
		<li><a href="index.jsp?section=login.jsp">로그인</a></li>
		<li><a href="index.jsp?section=join.jsp">회원가입</a></li>
		<li><a href="index.jsp?section=mv_list.jsp">영화</a></li>
		<li><a href="javascript:window.close();">종료</a></li>
		<%
			}
		%>

	</ul>
</body>
