<%@ page contentType="text/html; charset=UTF-8"%>
<%

	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	String calResult = request.getParameter("calResult");
		
	String result="";	
	if(calResult.equals("1"))			//더하기
		result = String.format("%d + %d = %d", num1, num2, num1+num2);
	else if(calResult.equals("2"))		//빼기
		result = String.format("%d - %d = %d", num1, num2, num1-num2);
	else if(calResult.equals("3"))		//곱하기
		result = String.format("%d * %d = %d", num1, num2, num1*num2);
	else if(calResult.equals("4"))		//나누기
		result = String.format("%d / %d = %.1f", num1, num2, (num1/(double)num2));
	
	request.setAttribute("resultStr", result);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forward11.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 11</h1>
	<hr>
</div>


<jsp:forward page="Receive11.jsp"></jsp:forward>



</body>
</html>