<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVCBegin.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/main.css" />
</head>
<body>

<div>
	<h1>MVC실습</h1>
	<hr />
</div>

<div>
	<!-- 컨트롤럴로부터 수신한 내용 -->
	<h2>${message }</h2>
</div>


</body>
</html>