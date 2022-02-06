<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberScoreDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberInsert.jsp
	//-- 데이터 입력 액션 처리 페이지
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	String userTel =  request.getParameter("userTel");
	
	MemberScoreDTO dao = null;
	
	try
	{
		dao = new MemberScoreDTO();
		
		// DTO 객체 생성
		// MemberDTO 구성
		MemberDTO member = new MemberDTO();	
		member.setName(userName);
		member.setTel(userTel);
		
		// dao의 add() 메소드 호출 → insert 쿼리문 수행
		dao.add(member);
		
		// insert 액션의 정상 처리여부 확인 후 추가 코드 구성 가능~~!!!
		
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
	dao.close();
		}
		catch(Exception e)
		{
	System.out.println(e.toString());
		}
		
	}	
	
	// URL 주소가 기록되어있는 쪽지를 사용자에게 전달
	// (여기를 찾아가렴~~~ 원래 페이지..)
	response.sendRedirect("MemberList.jsp");
%>

