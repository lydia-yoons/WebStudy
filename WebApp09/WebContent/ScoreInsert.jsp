<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// ScoreInsert.jsp
	
	// 이전 페이지(Test002.jsp)로부터 데이터 수신 
	// → userName, scoreKor, scoreEng, scoreMat
	
	request.setCharacterEncoding("UTF-8");

	String uName = request.getParameter("userName");
	String uKor = request.getParameter("scoreKor");
	String uEng = request.getParameter("scoreEng");
	String uMat = request.getParameter("scoreMat");
	
	try
	{
		// 데이터베이스 연결
		Connection conn = DBConn.getConnection();
		
		// 쿼리문 준비 (insert)
		String sql = "INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)"
			+" VALUES(SCORESEQ.NEXTVAL, ?, ?, ?, ?)";
		
		// DB 액션 처리 → 작업 객체 필요
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, uName);
		pstmt.setInt(2, Integer.parseInt(uKor));
		pstmt.setInt(3, Integer.parseInt(uEng));
		pstmt.setInt(4, Integer.parseInt(uMat));
		
		//int result = pstmt.executeUpdate();
		pstmt.executeUpdate();
		
		pstmt.close();
	}
	catch(Exception e)
	{
		// 서버측 콘솔에서 확인
		System.out.println(e.toString());
	}
	finally
	{
		// 데이터베이스 연결 종료
		DBConn.close();
	}
	
	// 클라이언트가 다시 요청해야할 URL 건네주기(→ sendRedirect() 메소드 활용)	
	response.sendRedirect("ScoreList.jsp");

%>