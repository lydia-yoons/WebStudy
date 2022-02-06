<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립트 릿 영역
	request.setCharacterEncoding("UTF-8");

	// 이름 데이터 수신
	String name = request.getParameter("name");
	
	// 메모 데이터 수신
	String memo = request.getParameter("memo");
	memo = memo.replaceAll("\n", "<br>");
	//-- JDK 1.5 이후에서 『replaceAll()』 사용 가능.
	//   『replaceAll()』을 통해 처리한 결과물을 다시 memo 변수에 대입.
	//	 "안녕하세요\n반갑습니다\n홍길동입니다." → "안녕하세요<br>반갑습니다<br>홍길동입니다."
	
	// 이상형 데이터 수신
	//String checkGroup = request.getParameter("checkGroup");	 // (Ⅹ)
	
	// ※ 같은 name 속성의 값을 가진 데이터 여러 개를 받는(수신하는) 경우
	//    이를 배열로 처리해야 한다. → 『getParameterValues()』
	
	String[] checkGroup = request.getParameterValues("checkGroup");
	
	// ※ 배열 데이터를 수신하여 처리할 경우...
	// 	  수신된 데이터가 전혀 없는 경우는
	// 	  배열의 값이 null 이 되어버리기 때문에
	// 	  null 에 대한 확인(검사)가 반드시 필요하다.	 check~!!!
	
	String str = "";
	
	if (checkGroup != null)
	{
		for (String item : checkGroup)
		{
			str += " [" + item + "]";
		}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckBox_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP 데이터 송수신 실습04</h1>
	<hr>
	<p>CheckBox.jsp ○ → CheckBox_ok.jsp ●</p>
</div>

<div>
	<h2>수신 데이터</h2>
	
	<!-- <h3>이름 : 장진하</h3> -->
	<h3>이름 : <%=name %></h3>
	
	<h3>메모</h3>
	<!-- <p>나는<br> 오타없이<br> 점점 타이핑이 빨라지고 있다</p> -->
	<p><%=memo %></p>
	
	<!-- <h3>이상형 : [강동원][옥택연]</h3> -->
	<h3>이상형 : <%=str %></h3>
</div>


</body>
</html>