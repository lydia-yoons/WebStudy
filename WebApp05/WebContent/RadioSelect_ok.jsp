<%@ page contentType="text/html; charset=UTF-8"%>
<%

	// 스크립트 릿 영역 → 이전 페이지로(RadioSelect.jsp)부터 전송된 데이터 수신
	
	request.setCharacterEncoding("UTF-8");			// check~~!!

	String name = request.getParameter("name"); 	//-- 텍스트박스... 단일값 수신
	String gender = request.getParameter("gender"); //-- 라디오 버튼... 단일값 수신
	String major = request.getParameter("major"); 	//-- 선택상자... 단일값 수신  
	String[] hobby = request.getParameterValues("hobby"); 
	//-- 다중 선택이 가능한 선택상자일 경우... 『getParameterValues()』로 수신 → 배열 반환
	
	String genderStr = "";
	if(gender.equals("M"))
		genderStr = "남자";
	else if(gender.equals("F"))
		genderStr = "여자";
	else
		genderStr = "확인불가";
	
	String hobbyStr = "";
	if(hobby!= null)
	{
		for(String item :hobby)
		{
			hobbyStr += " [" + item + "]";
		}
	}
		
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RadioSelect_ok.jsp</title>
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습03</h1>
	<hr>
	<p>RadioSelect.jsp ○ → RadioSelect_ok.jsp ●</p>
</div>

<div>
	<h2>radio, select 데이터 수신</h2>
	
	<div>
		<h3>수신한 데이터</h3>
		
		<!-- <p>이름 : 이윤서</p> -->
		<p>이름 : <%=name %></p>
		 
		<!-- <p>성별 : F(여자)</p> -->
		<p>성별 : <%=gender %>(<%=genderStr %>)</p>
		
		<!-- <p>전공 : 국문학</p>  -->
		<p>전공 : <%=major %></p> 
		
		<!-- <p>취미 : [영화감상] [음악감상]</p> -->
		<p>취미 :<%=hobbyStr %></p>
	</div>

</div>


</body>
</html>