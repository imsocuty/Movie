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
		String mv_no = request.getParameter("mv_no");
		String mv_name = request.getParameter("mv_name");
		String mv_like = request.getParameter("mv_like");
		String mv_time = request.getParameter("mv_time");
		String mv_row = request.getParameter("mv_row");
		String mv_col = request.getParameter("mv_col");

		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
// 		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "scott", "tiger");
		// 		Class.forName("com.mysql.cj.jdbc.Driver");
		// 		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_movie?serverTimezone=UTC",
		// 				"root", "1234");
		String sql = "update mv_list set mv_name = ?, mv_like=? ,mv_time= ? where mv_no=?";
		String sql2 = "update mv_seat set mv_row = ?, mv_col=? where mv_no=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, mv_name);
		pstmt.setString(2, mv_like);
		pstmt.setString(3, mv_time);
		pstmt.setString(4, mv_no);
		PreparedStatement pstmt2 = con.prepareStatement(sql2);
		pstmt.setString(1, mv_row);
		pstmt.setString(2, mv_col);
		pstmt.setString(3, mv_no);
		pstmt2.executeUpdate();

		response.sendRedirect("index.jsp?section=mv_list.jsp");
	%>
</body>
</html>