<%@page import="com.atg.Register.dto.RegisterDto"%>
<%@page import="com.atg.Cal.dto.CalDto"%>
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
<head>
<link rel="stylesheet" href="resources/css/Template.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<meta charset="UTF-8">
<title>Template</title>
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/Template.js"></script>
<script type="text/javascript" src="resources/js/calendar.js"></script>
    
</head>
<body>

<%
	CalDto dto = new CalDto();
	
	int year = Integer.parseInt(request.getParameter("year"));
	int month = Integer.parseInt(request.getParameter("month"));
	int date = Integer.parseInt(request.getParameter("date"));
	int lastDay = Integer.parseInt(request.getParameter("lastday"));

	Calendar cal = Calendar.getInstance();
	int hour = cal.get(Calendar.HOUR_OF_DAY);
	int min = cal.get(Calendar.MINUTE);
	
	RegisterDto LDto = (RegisterDto) session.getAttribute("LDto");
%>
   
   <header id="header">
   	<span><h1 onclick="location.href='main.jsp'">AT-G</h1></span>
        <ul class="nav_icon">
             <li><img src="resources/img/user.png" onclick="location.href=''"></li>
             <li><img src="resources/img/basket.png" onclick="location.href=''"></li>
             <li><img src="resources/img/login.png" onclick="location.href=''"></li>
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
   <br/><br/><br/><br/><br/><br/><br/>
   	<div id="box">
   		<form action="CalController.do" method="post">
		<input type="hidden" name="command" value="cal_insert" />
		
		<table class="table" id="box_tb">
			<tr>
				<th>ID</th>
				<td><input class="form-control mt-4 mb-2" type="text" name="mb_id" value="<%=LDto.getMb_id() %>" readonly="readonly" /></td>
			</tr>
			<tr>
				<th>일정</th>
				<td>
					<select name="year">
<%
					for(int i = year-5; i <= year+5; i++) {
%>						
						<option value="<%=i%>" <%=(year == i)?"selected":"" %>><%=i %></option>
<%
					}
%>
					</select>년
					
					<select name="month">
<%
					for(int i = 1; i < 13; i++) {
%>						
						<option value="<%=i %>" <%=(month == i)?"selected":"" %>><%=i %></option>
<%
					}
%>
					</select>월
					
					<select name="date">
<%
					for(int i = 1; i <= lastDay; i++) {
%>
						<option value="<%=i%>" <%=(date == i)?"selected":"" %>><%=i %></option> 
<%
					}
%>					
					</select>일
					
					<select name="hour">
<%
					for(int i = 0; i < 24; i++) {
%>
						<option value="<%=i%>" <%=(hour == i)?"selected":"" %>><%=i %></option>
<%
					}
%>					
					</select>시
					
					<select name="min">
<%
					for(int i = 0; i < 60; i++) {
%>					
						<option value="<%=i%>" <%=(min == i)?"selected":"" %>><%=i %></option>
<%
					}
%>					
					</select>분
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input class="form-control mt-4 mb-2" type="text" name="ca_title" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td class="form-group"><textarea class="form-control" style="height:300px; resize:none;" name="ca_content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input class="btn btn-secondary mb-3" type="submit" value="일정작성" />
					<input class="btn btn-secondary mb-3" type="button" value="돌아가기" onclick="" />
				</td>
			</tr>
		</table>
	</form>
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

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>     
</body>
</html>