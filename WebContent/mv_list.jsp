<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a {
	text-decoration: none;
	font-weight: bold;
	color: rgba(0, 0, 0, 0.5);
}

th {
	border-left: none;
	border-top: none;
	border-bottom: none;
}

td {
	border-left: none;
	border-bottom: none;
}

.none {
	border-right: none;
}
</style>
</head>
<body>
	<div align="center">
		<h1>영화 목록</h1>
		<table border="1" style="text-align: center;" class="tbl-header">
			<tr>
				<th>번호(관리자만이 수정/삭제 가능)</th>
				<th>영화</th>
				<th>장르</th>
				<th>상영날짜</th>
				<th>행</th>
				<th class="none">열</th>
			</tr>
			<%
				String mv_no;
				String mv_name;
				String mv_like;
				String mv_date;
				String mv_row;
				String mv_col;
				Class.forName("oracle.jdbc.driver.OracleDriver");
		 		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
// 				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "scott", "tiger");
				// 				Class.forName("com.mysql.cj.jdbc.Driver");
				// 				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_movie?serverTimezone=UTC",
				// 						"root", "1234");
				String sql = "select ml.mv_no, ml.mv_name, ml.mv_like, to_char(ml.mv_date, 'YYYY-MM-DD'), ms.mv_row, ms.mv_col from mv_list ml join mv_seat ms on ml.mv_no = ms.mv_no";
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(sql);

				while (rs.next()) {
					mv_no = rs.getString(1);
					mv_name = rs.getString(2);
					mv_like = rs.getString(3);
					mv_date = rs.getString(4);
					mv_row = rs.getString(5);
					mv_col = rs.getString(6);
			%>
			<tr>
				<td><a href="index.jsp?section=userCheck.jsp&mn=<%=mv_no%>"><%=mv_no%></a></td>
				<td><%=mv_name%></td>
				<td><%=mv_like%></td>
				<td><%=mv_date%></td>
				<td><%=mv_row%></td>
				<td class="none"><%=mv_col%></td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
</body>
</html>