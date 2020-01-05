<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
   text-align: center;
}
</style>
</head>
<body>
<h1>영화 정보 수정</h1>
	<%
		String u_mv_no = request.getParameter("mn");
	    String mv_no;
		String mv_name;
		String mv_like;
		String mv_time;
		String mv_row;
		String mv_col;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
// 		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "scott", "tiger");
		// 		Class.forName("com.mysql.cj.jdbc.Driver");
		// 		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_movie?serverTimezone=UTC",
		// 				"root", "1234");
		String sql = "select ml.mv_no, ml.mv_name, ml.mv_like, to_char(ml.mv_date, 'YYYY-MM-DD'), ms.mv_row, ms.mv_col from mv_list ml join mv_seat ms on ml.mv_no = ms.mv_no and ml.mv_no=?";
		PreparedStatement pst = con.prepareStatement(sql);

		pst.setString(1, u_mv_no);
		ResultSet rs = pst.executeQuery();

		if (rs.next()) {
			mv_no = rs.getString(1);
			mv_name = rs.getString(2);
			mv_like = rs.getString(3);
			mv_time = rs.getString(4);
			mv_row = rs.getString(5);
			mv_col = rs.getString(6);
	%>
	<div align="center">
	<form action="updateAction.jsp" method="post" id="update" >
		
				<label class="legend">번호</label>
				<input type="text" name="mv_no" value="<%=mv_no%>"
					readonly="readonly">
			
			
				<label class="legend">영화 이름</label>
				<input type="text" name="mv_name" value="<%=mv_name%>">
			
			
				<label class="legend">영화 장르</label>
				<input type="text" name="mv_like" value="<%=mv_like%>">
			
			
				<label class="legend">상영 날짜</label>
				<input type="text" name="mv_time" value="<%=mv_time%>">
			
			
				<label class="legend">행</label>
				<input type="text" name="mv_row" value="<%=mv_row%>"
					readonly="readonly">
					
			
				<label class="legend">열</label>
				<input type="text" name="mv_col" value="<%=mv_col%>"
					readonly="readonly">
			
				<br>
				<input type="submit" value="수정"> <input
					type="button" value="삭제"
					onclick="location.href='index.jsp?section=mv_delete.jsp&mv_no=<%=mv_no%>'">
					<input type="button" value="취소"
					onclick="location.href='index.jsp?section=mv_list.jsp'">
	</form>
	<%
		}
	%>
</div>
</body>
</html>