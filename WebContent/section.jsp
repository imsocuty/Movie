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
	<h1>영화 메인페이지</h1>
	<%
		String id = (String) session.getAttribute("id");
		String mv_name;
		String mv_time;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
		// 		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "scott", "tiger");
		String sql = "";
		PreparedStatement pstmt;
		ResultSet rs;
		if (id != null) {
			sql = "select ml.mv_name, to_char(ml.mv_date, 'YYYY-MM-DD') from mv_list ml join tb_join tj on ml.mv_like = tj.ul and tj.user_id=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (id.equals("root")) {
	%>
	<h3><%=id%>님은 관리자 입니다.
	</h3>
	<%
		} else {
	%>
	<h3>
		<%=id%>님이 좋아하실 만한 영화 입니다.
	</h3>
	<%
		while (rs.next()) {
					mv_name = rs.getString(1);
					mv_time = rs.getString(2);
	%>
	<%=mv_name%>은/는
	<%=id%>님이 좋아하시는 장르이며,
	<br> 상영날짜는 현재
	<%=mv_time%>입니다.
	<br>
	<%
		}
			}
		}
	%>
</body>
</html>