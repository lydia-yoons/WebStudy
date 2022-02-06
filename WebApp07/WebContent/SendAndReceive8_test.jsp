<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%	
	String sYear = request.getParameter("y");
	String sMonth = request.getParameter("m");
	
	Calendar cal = Calendar.getInstance();
	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH)+1;
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);
	
	int selectYear = nowYear;
	int selectMonth = nowMonth;
	
	if(sYear!=null || sMonth!=null)
	{
		selectYear = Integer.parseInt(sYear);
		selectMonth = Integer.parseInt(sMonth);
	}
	
	//달력 그리기
	int[] months = {31,28,31,30,31,30,31,31,30,31,30,31};
	
	if (selectYear%4==0 && selectYear%100!=0 || selectYear%400==0)
		months[1] = 29;
	
	//총 날 수 누적 변수
	int nalsu;
	
	//요일 항목 배열 구성
	String[] weekName= {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
	
	//현재 년도 → 입력받은년도의 이전 년도까지의 날 수 계산
	nalsu= (selectYear-1)*365 + (selectYear-1)/4 - (selectYear-1)/100 + (selectYear-1)/400;
	
	// 현재 월 → 입력받은 월의 이전 월까지의 날 수 추가
	for(int i=0; i<selectMonth-1 ; i++)
		nalsu += months[i];
	
	nalsu++;	//+1
	
	int week = nalsu%7;
	int lastDay = months[selectMonth-1];

	//달력그리기
	String calStr ="";
	
	calStr += "<table border='1'>";
	calStr += "<tr>";
	
	//달력 타이틀 그리기 (일월화수목금토)
		for(int i=0 ; i<weekName.length ; i++)
		{
			if(i==0)
				calStr += "<th style='color: red;'>" + weekName[i] + "</th>";
			else if(i==6)
				calStr += "<th style='color: blue;'>" + weekName[i] + "</th>";
			else
				calStr += "<th>" + weekName[i]+ "</th>";
					
		}
		
	// 날짜 찍기 시작
 	calStr += "<tr>";
	
	//빈 칸 공백
	for (int i=1 ; i<=week ; i++)
		calStr += "<td></td>";
		
		//날짜 td 발생
		for (int i=1; i<=lastDay ; i++)
		{
			week++;	//-- 날짜 구성이 이루어질 때 마다 요일 1씩 증가
			
			//calStr += "<td>"+ i +"<td>";
			
			if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==0)
				calStr += "<td class='nowSat'>" + i + "</td>";	//클래스 속성 지정하여 색깔 처리하도록
			else if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==1)
				calStr += "<td class='nowSun'>" + i + "</td>";
			else if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay)
				calStr += "<td class='now'>" + i + "</td>";
			else if(week%7==0)	
				calStr += "<td class='sat'>" + i + "</td>";
			else if(week%7==1)
				calStr += "<td class='sun'>" + i + "</td>";
			else
				calStr += "<td>" + i + "</td>";	
				
			if(week%7==0)	//일요일이 될 때 마다 개행 (닫고 연다)
				calStr +="</tr><tr>";
		}
		
		//빈 칸 공백 td발생
		for (int i=0; i<=week ; i++, week++)
		{
			if(week%7==0)
				break;
				
			calStr += "<td></td>";
		}
		
		if(week%7!=0)
			calStr += "</tr>";
			 
		
		calStr += "</table>";

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive08_test.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	th {border: 0px;}
	td {text-align: right; border: 0px;}
	td.nowSat {background-color: #FFFF8F; font-weight: bold; color: blue;}
	td.nowSun {background-color: #FFFF8F; font-weight: bold; color: red;}
	td.now {background-color: #FFFF8F; font-weight: bold;}
	td.sat {color: blue;}
	td.sun {color: red;}	
	table {background-color: #D4F4FA; border: 0px;}
</style>
<script type="text/javascript">
	
	function check(num)
	{
		var v=0;
		
		var vYear =  Number(document.getElementById("y").value);
		var vMonth = Number(document.getElementById("m").value);
		vMonth += num;
		
		// 월이 0일 때
		if(Number(vMonth)==0)
		{
			vYear-=1;
			vMonth = 12;
			
		}else if(Number(vMonth)==13)
		{
			vYear+=1;
			vMonth = 1;
		}
		
		document.getElementById("y").value = vYear;
		document.getElementById("m").value = vMonth;
		
		document.form.submit();
	}
	
	
</script>

</head>
<body>

<!-- 
	○ 데이터 송수신 실습 08
		- 달력을 출력하는 JSP 페이지를 구성한다
		- 년도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다
		- 단, submit 버튼 없이 이벤트 처리를 한다
		- 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구성한다
		
		◀	2019 년 5 월 ▶ 
		------------------------------
		------------------------------
		
		- 『◀』 이나 『▶』 클릭 시
		  해당 년 월의 달력을 출력해주는 형태의 페이지로 구성한다
		  
		- 사용자 최초 요청 주소는
		  『http://localhost:8090/WebApp07/SendAndReceive07.jsp』로 한다
		  
	○ SendAndReceive07.jsp
 -->

<div>
	<h1>데이터 송수신 실습07</h1>
	<hr>
</div>

<div>
	<h2>달력 출력하기</h2>
</div>

<div>
	<form name="form" action="" method="post">
		<button name="before" onclick="check(-1)">◀</button>
		<input type="text" id="y" name="y" value=<%=selectYear %> style="width: 40px;"> 년 
		<input type="text" id="m" name="m" value=<%=selectMonth %> style="width: 20px;"> 월
		<button name="after" onclick="check(1)">▶</button>	
	<br>

	<%=calStr %>
	
	</form>
</div>


</body>
</html>