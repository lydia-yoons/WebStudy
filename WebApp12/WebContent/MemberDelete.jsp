<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//MemberDelete.jsp
	
	//request.setCharacterEncoding("UTF-8");

	String sid = request.getParameter("sid");
	
	MemberDAO dao = new MemberDAO();
	
	String strAddr = "";
	
	try
	{
		dao.connection();
			
		//dao.remove(sid);		//-- 이렇게 바로 삭제하는게 아니고
		
		int checkCount = dao.refCount(sid);
		//-- TBL_MEMBER 테이블의 제거하고자 하는 데이터의
		//   SID 를 참조하는 TBL_MEMBERSCORE 테이블 내의 데이터 갯수 확인
		
		if(checkCount==0)		//-- 제거 가능
		{
			dao.remove(sid);
			strAddr = "MemberSelect.jsp";
		}
		else					//-- 제거 불가
		{
			//dao.remove(sid);
			//-- TBL_MEMBERSCORE 테이블 데이터가
			//	 TBL_MEMBER 테이블의 SID를 참조하고 있는 경우로
			//	 삭제가 부가능 한 상황
			//-- 제거하지 못하는 사유를 안내하는 페이지로 이동
			//   + 리스트로 돌아가기 버튼
			
			strAddr = "Notice.jsp";
		}
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			// 데이터베이스 연결 종료
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	response.sendRedirect(strAddr);
%>
