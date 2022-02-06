<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지로(Send09.jsp) 부터 데이터(gugudan) 수신
	
	String gugudanStr = request.getParameter("gugudan");
	int gugudan = 0;	
	String result = "";	
	
	try
	{
		gugudan = Integer.parseInt(gugudanStr);
		
		for(int i=1 ; i<=9 ; i++)
		{
			result += String.format("%d * %d = %d<br>", gugudan, i, (i*gugudan));
		}
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive09.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h3>수신된 데이터 : <%=gugudanStr %></h3>

</div>
<%=result %>

</body>
</html>