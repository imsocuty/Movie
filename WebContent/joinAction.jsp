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

		String user_id = request.getParameter("user_id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String gender = request.getParameter("gen");
		String email = request.getParameter("email");
		String ul = request.getParameter("ul");
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
// 		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "scott", "tiger");
		// 		Class.forName("com.mysql.cj.jdbc.Driver");
		// 		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_movie?serverTimezone=UTC", "root",
		// 				"1234");
		String sql = "insert into tb_join(user_id, password, name, gender,email,ul) values(?,?,?,?,?,?)";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1, user_id);
		pst.setString(2, password);
		pst.setString(3, name);
		pst.setString(4, gender);
		pst.setString(5, email);
		pst.setString(6, ul);
		pst.executeUpdate();
		response.sendRedirect("index.jsp");
	%>
</body>
</html>