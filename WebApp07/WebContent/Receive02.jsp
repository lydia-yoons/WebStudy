<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Send02.html 페이지로부터 데이터 수신
	
	request.setCharacterEncoding("UTF-8");
	
	String userName = request.getParameter("userName");
	String korStr = request.getParameter("kor");
	String engStr = request.getParameter("eng");
	String matStr = request.getParameter("mat");
	
	int kor, eng, mat;
	kor=eng=mat=0;
	
	int tot=0;
	double avg=0.0;
	
	try
	{
		kor = Integer.parseInt(korStr);
		eng = Integer.parseInt(engStr);
		mat = Integer.parseInt(matStr);
		
		tot = kor + eng + mat;
		avg = tot/3.0; 
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
<title>Receive02.jsp</title>

<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">
	span {color: blue; font-weight: bold; font-size: 15pt;}
</style>
</head>
<body>

<div>
	<h1>데이터 송수신 실습 02</h1>
	<hr>
</div>

<div>
	<span><%=userName %></span> 님, 성적처리가 완료되었습니다.<br>
    회원님의 점수는 국어:<span><%=kor %>점</span>, 
    영어:<span><%=eng %>점</span>, 수학:<span><%=mat %>점</span> 입니다.<br>
    총점은 <span><%=tot %></span>점, 
    평균은 <span><%=String.format("%.1f", avg)%>점</span> 입니다.<br>

</div>

</body>
</html>