<%@ page contentType="text/html; charset=UTF-8"%>
<%
 	// 스크립트 릿 영역 → 이전 페이지(Gugudan.jsp)로 부터 데이터 수신
 	
 	// 데이터 수신
	String danStr = request.getParameter("dan");
	
	int n = 0;
	
	try{
		n = Integer.parseInt(danStr);		
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
<title>Gududan_ok.jsp</title>

<link rel="stylesheet" type="text/css" href="css/main.css">

</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습02</h1>
	<hr>
	<p>Gududan.jsp ○ → Gugudan_ok.jsp ●</p>
</div>

<div>
	<h2><%=danStr %>단 출력</h2>
</div>


<%-- 
<%

	for(int i=1; i<=9; i++)
	{
		out.print(n + " * " + i + " = " + (n*i) + "<br>");		
	}
%>
--%>


<%	for(int i=1; i<=9; i++)
	{
%>
		  <%=n %> * <%=i %> = <%=(n*i) %><br>	 
<%
	}
%> 



</body>
</html>