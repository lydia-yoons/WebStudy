<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Redirect12.jsp
	
	// 이전 페이지부터(Send12.html)부터 데이터(num1, num2, ccalResult) 수신
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	String op = request.getParameter("calResult");
	
	
	// 연산 처리
	String str = "";
	if(op.equals("1"))
		str += String.format("%d", (num1+num2));
	else if(op.equals("2"))
		str += String.format("%d", (num1-num2));
	else if(op.equals("3"))
		str += String.format("%d", (num1*num2));
	else if(op.equals("4"))
		str += String.format("%.1f", (num1/(double)num2));
	
	// check~!!!
	// 결과 데이터 재전송~!!! → sendRedirect() 메소드 사용
	// ※ response 객체의 주요 메소드 중 하나인
	//    『sendRedirect(String location)』
	//    : 지정된 URL(location)로 요청을 재전송한다.
	response.sendRedirect("Receive12.jsp?num1="+num1+"&num2="+num2+"&op="+op+"&str="+str);
	/* … Receive12.jsp?num1=253&num2=21&op=2&str=232 */
		
%>

