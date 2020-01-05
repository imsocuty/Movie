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

		String dt_mv_no = request.getParameter("mv_no");

		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
// 		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "scott", "tiger");
		// 		Class.forName("com.mysql.cj.jdbc.Driver");
		// 		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_movie?serverTimezone=UTC",
		// 				"root", "1234");
		String sql = "delete from mv_list where mv_no = ?";
		String sql2 = "delete from mv_seat where mv_no = ?";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1, dt_mv_no);
		PreparedStatement pst2 = con.prepareStatement(sql2);
		pst2.setString(1, dt_mv_no);
		
		pst.executeUpdate();
		pst2.executeUpdate();
	%>
	<script>
		alert("삭제 처리 되었습니다.");
		location.href = "index.jsp?section=mv_list.jsp";
	</script>
</body>
</html>