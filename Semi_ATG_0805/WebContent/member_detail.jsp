<%@page import="com.atg.Member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/Template.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<meta charset="UTF-8">
<title>Template</title>
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/Template.js"></script>
    
</head>
<body>
<%
	MemberDto dto = (MemberDto) request.getAttribute("dto");
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
   <br/><br/><br/><br/><br/><br/><br/>
   <section class="secssion">
		<div  class="container my-1" id="box" style="width : 80%;">
		<table class="table" id="box_tb" border="1">
			<col width = "10%" />
			<col width = "40%" />
			<tr>
				<th>회원 번호</th>
				<td><%=dto.getMb_no() %></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><%=dto.getMb_name() %></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><%=dto.getMb_gender() %></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><%=dto.getMb_id() %></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><%=dto.getMb_email() %></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><%=dto.getMb_addr() %></td>
			</tr>
			<tr>
				<th>회원등급</th>
				<td><%=dto.getMb_grade() %></td>
			</tr>
			<tr>
				<td colspan="7" align="right">
					<input class="btn btn-secondary mb-3" type="button" value="수정" onclick="location.href='member_update.jsp?mb_no=<%=dto.getMb_no() %>'" />
					<input class="btn btn-secondary mb-3" type="button" value="목록" onclick="location.href='adminpage.jsp'" />
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

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>    
</body>
</html>