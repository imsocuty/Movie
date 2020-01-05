<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");

		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
// 		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "scott", "tiger");
// 		Class.forName("com.mysql.cj.jdbc.Driver");
// 		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_movie?serverTimezone=UTC", "root",
// 				"1234");

		String id = request.getParameter("user_id");
		String pw = request.getParameter("password");

		String sql = "select * from tb_join where user_id=? AND password=?";
		PreparedStatement pst = con.prepareStatement(sql);

		pst.setString(1, id);
		pst.setString(2, pw);
		ResultSet rs = pst.executeQuery();

		boolean login = false;

		while (rs.next()) {
			login = true;
		}
		if (login) {
			session.setAttribute("id", id); 

			response.sendRedirect("index.jsp");
		} else {
	%>
	<script type="text/javascript">
		alert("로그인은 실패");
		location.href="index.jsp?section=login.jsp";
	</script>
	<%
		}
	%>
</body>
</html>