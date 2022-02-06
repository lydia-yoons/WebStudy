<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String result = "";
	result += "<ul>";
	for(int i=1 ; i<=9 ; i++)
	{
		/* result += String.format("<li><a href='Receive09.jsp?gugudan=%d'>%d단</a></li>", i, i); */
		/* result += String.format("<li><a href='Receive09.jsp?gugudan=%2$d'>%1$d단</a></li>", 10, 20); */
		result += String.format("<li><a href='Receive09.jsp?gugudan=%1$d'>%1$d단</a></li>", i); 
		/* 1$는 순번을 뜻함  */
	}
	result += "</ul>";
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send09.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	a {text-decoration: none;}
</style>
</head>
<body>

<div>
	<h1>데이터 송수신 실습 09</h1>
	<hr>
</div>

<!--  
	○ 데이터 송수신 실습 09
	   - a 태그(링크 태그)에 대한 반복문 처리를 하는 JSP 페이지를 구성한다
	   - 구구단 리스트를 동적으로 구성하여
		 선택에 따른 결과 페이지를 출력해주는 형태의 페이지로 구현한다
	   - submit 버튼 없이 이벤트 처리를 할 수 있도록 한다
	   
	   구구단 선택
	   
	   1단
	   2단
	   3단
	    :
	   8단
	   9단
	   
	   - 해당 단을 클릭했을 때
	   	 구구단을 출력해주는 형태의 페이지로 구현한다.
	   	 
	   - 사용자 최초 요청 주소는
	     http://localhost:8090/WebApp07/Send09.jsp
	     
	○ Send09.jsp
	   Receive09.jsp
 -->
 
 <div>
	<h2>구구단 출력하기</h2>
</div>

<div>
	<p>구구단 선택</p>
	<!-- 
	1단<br>
	2단<br>
	3단<br>
	4단<br>
	5단<br>
	6단<br>
	7단<br>
	8단<br>
	9단<br> -->
	
	<%=result %>
</div>
 

</body>
</html>