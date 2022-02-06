<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지로(Send10_re.jsp)부터 넘어온 데이터(userName) 수신
	
	request.setCharacterEncoding("UTF-8");
	String userName = request.getParameter("userName");
	
	
	
	request.setAttribute("message", "반갑습니다.");
	//--request 객체의 key(message)의 값 안에
	//  "반갑습니다."를 value로 넣는 작업 수행 
	
	// ※ 리다이렉트
	response.sendRedirect("Receive10.jsp");
	// 다시 재요청하라고 응답 → 여기로 가보세요... (쪽지내용 : Receive10.jsp를 요청하세요...)
	/* 리다이렉트 하는 순간 기존의 객체들 싹 다 파기. Receive10.jsp 새로운 요청 */
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send10_re.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>


<div>
	<h1>데이터 송수신 실습 10</h1>
	<hr>
</div>

<div>
	<h2>리다이렉트</h2>
</div>

<div>
	<p>이름 : <%=userName %></p>
</div>

</body>
</html>