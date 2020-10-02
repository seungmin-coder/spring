<%@page import="com.atg.Cal.dto.CalDto"%>
<%@page import="com.atg.Register.dto.RegisterDto"%>
<%@page import="java.util.List"%>
<%@page import="com.atg.util.Utils"%>
<%@page import="com.atg.Cal.biz.CalBizImpl"%>
<%@page import="com.atg.Cal.biz.CalBiz"%>
<%@page import="com.atg.Cal.dao.CalDao"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/Template.css">
<link rel="stylesheet" href="resources/css/calendar.css">
<meta charset="UTF-8">
<title>Template</title>
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/Template.js"></script>
<script type="text/javascript" src="resources/js/calendar.js"></script>
    
</head>
<body>

<%

	List<CalDto> list = (List<CalDto>) request.getAttribute("list");
	RegisterDto LDto = (RegisterDto) session.getAttribute("LDto");
	
	Calendar cal = Calendar.getInstance();

	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH) + 1;
	
	String paramYear = request.getParameter("year");
	String paramMonth = request.getParameter("month");
	
	if(paramYear != null) {
		year = Integer.parseInt(paramYear);
	} 
	
	if(paramMonth != null) {
		month = Integer.parseInt(paramMonth);
	}
	
	if(month > 12) {
		year++;
		month = 1;
	}
	
	if(month < 1) {
		year--;
		month = 12;
	}
	
	// 현재년도, 현재월, 1일 셋팅
	cal.set(year, month - 1, 1);
	
	// 1일의 요일
	int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
	
	// 마지막 일
	int lastDay = cal.getActualMaximum(cal.DAY_OF_MONTH);
	
	CalBiz biz = new CalBizImpl();
	String mb_id = LDto.getMb_id();
	String yyyyMM = year + Utils.isTwo(month+"");
	List<CalDto> clist = biz.getViewList(mb_id, yyyyMM);
	List<CalDto> calist = biz.getView(mb_id);
	
%>
   
   <header id="header">
   	<span><h1 onclick="location.href='main.jsp'">AT-G</h1></span>
        <ul class="nav_icon">
             <li><img src="resources/img/user.png" onclick="location.href=''"></li>
             <li><img src="resources/img/basket.png" onclick="location.href=''"></li>
             <li><img src="resources/img/login.png" onclick="location.href='login.jsp'"></li>
         </ul>
          
       <nav class="top_menu">          
           <ul>
               <li>
               	<span>프로그램</span>
                   <ol class="bottom_menu">
                       <li onclick="location.href='tutorial.jsp'">튜토리얼</li>
                       <li onclick="location.href='program.jsp'">루틴운동</li>
                   </ol>
               </li>
               <li>
               	<span>외부활동</span>
                   <ol class="bottom_menu">
                       <li onclick="location.href=''">공공체육시설</li>
                       <li>-</li>
                   </ol>
               </li>
               <li>
               	<span>운동상품</span>
                   <ol class="bottom_menu">
                       <li onclick="location.href=''">운동기구찾기</li>
                       <li onclick="location.href=''">상품판매</li>
                   </ol>
               </li>
               <li>
               	<span>커뮤니티</span>
                   <ol class="bottom_menu">
                       <li onclick="location.href=''">리뷰</li>
                       <li onclick="location.href=''">실시간채팅</li>
                   </ol>
               </li>
               <li>
               	<span>고객지원</span>
                   <ol class="bottom_menu">
                       <li onclick="location.href=''">공지사항</li>
                       <li onclick="location.href=''">QnA</li>
                   </ol>
               </li>
           </ul>
       </nav>
   </header>
   
   <section class="secssion">
   	<div id="box">
   		<table id="calendar">
		<caption>
			<a href="calendar.jsp?year=<%=year-1%>&month=<%=month%>">◀◀</a>
			<a href="calendar.jsp?year=<%=year%>&month=<%=month-1%>">◁</a>
			
			<span class="y"><%=year %></span>년
			<span class="m"><%=month %></span>월
			
			<a href="calendar.jsp?year=<%=year%>&month=<%=month+1%>">▷</a>
			<a href="calendar.jsp?year=<%=year+1%>&month=<%=month%>">▶▶</a>
		</caption>
		<tr>
			<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>
		</tr>
		<tr>
		<%
		// 공백
			for(int i = 0; i < dayOfWeek-1; i++) {
				out.println("<td>&nbsp</td>");
			}

			for(int i = 1; i <= lastDay; i++) {
		%>
		<td>
			<a class="countView" href="CalController.do?command=calListView&year=<%=year%>&month=<%=month%>&date=<%=i%>&mb_id=<%=LDto.getMb_id() %>" style="color:<%=Utils.fontColor(i, dayOfWeek) %>"><%=i %></a>
				
			<a href="cal_insert.jsp?year=<%=year%>&month=<%=month%>&date=<%=i%>&lastday=<%=lastDay%>">
					<img alt="일정 추가" src="resources/img/pen.png" width="10" height="10" />
			</a>
				
			<div class="clist">
				<%=Utils.getViewTitle(i, clist) %>
			</div>
		</td>
		<%
			if((dayOfWeek-1 + i) % 7 == 0) {
				out.println("<tr></tr>");
				}
			}
	
			// 뒤 쪽 공백
			for(int i = 0; i < (7-(dayOfWeek-1 + lastDay)%7)%7; i++) {
				out.println("<td>&nbsp</td>");
			}
		%>
		</tr>
		<tr>
			<td colspan="7" align="left">
				<div>
				<span id="id"><%=LDto.getMb_id() %></span>
				<table style="width:100%;">
				<caption>오늘, 내일 일정</caption>
					<tr>
						<th>일정</th>
						<th>시간</th>
					<tr>
					</tr>
					<%
						if(calist.size() == 0) {
					%>
					<tr>
						<td colspan="2">----- 일정이 없습니다. -----</td>
					</tr>
					<%
						} else {
							for(CalDto dto : calist) {
					%>
						<td><a style="color:blue;" href="CalController.do?command=cal_detail&ca_no=<%=dto.getCa_no() %>"><%=dto.getCa_title() %></a></td>
						<td><%=dto.getCa_mdate() %></td>
					</tr>
					<%
							}
						}
					%>
				</table>
				</div>
			</td>
		</tr>
		</table>
   	</div>
   </section>
   
   <div id="side">
   	<div class="sidebar"><span class="t">1:1</span></div>
   	<div class="sidebar"><span class="t" id="topbutton">Top</span></div>
   </div>
   
   <footer class="footer">
       <div class="footer_info">
           <p>
               <span>사업자번호</span> : 0000-0000-0000
           </p>
           <p>
               <span>위치</span> : 서울시 강남구 테헤란로 14번길 남도빌딩
           </p>
           <p>
               <span>연락처</span> : 000-0000-0000
           </p>
       </div>
   </footer>   
    
</body>
</html>