
<%@page import="com.atg.Notice.dto.NoticeDto"%>
<%@page import="java.util.List"%>
<%@page import="com.atg.Notice.biz.NoticeBizImpl"%>
<%@page import="com.atg.Notice.biz.NoticeBiz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/qna.css">
<link rel="stylesheet" href="resources/css/Template.css">
<script type="text/javascript" src="resources/css/Template.js"></script>
</head>
<body>
<%
	List<NoticeDto> notice_list = (List<NoticeDto>)request.getAttribute("list");
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
               	<span class="menu_title">프로그램</span>
                   <ol class="bottom_menu">
                       <li onclick="location.href='tutorial.jsp'">튜토리얼</li>
                       <li onclick="location.href='program.jsp'">루틴운동</li>
                   </ol>
               </li>
               <li>
               	<span class="menu_title">외부활동</span>
                   <ol class="bottom_menu">
                       <li onclick="location.href='public.jsp'">공공체육시설</li>
                       <li>-</li>
                   </ol>
               </li>
               <li>
               	<span class="menu_title">운동상품</span>
                   <ol class="bottom_menu">
                       <li onclick="location.href='itemsearch.jsp'">운동기구찾기</li>
                       <li onclick="location.href='item.jsp'">상품판매</li>
                   </ol>
               </li>
               <li>
               	<span class="menu_title">커뮤니티</span>
                   <ol class="bottom_menu">
                       <li onclick="location.href='review.jsp'">리뷰</li>
                       <li onclick="location.href=''">실시간채팅</li>
                   </ol>
               </li>
               <li>
               	<span class="menu_title">고객지원</span>
                   <ol class="bottom_menu">
                       <li onclick="location.href='NoticeController.do?command=notice_list'">공지사항</li>
                       <li onclick="location.href='qna_user.jsp'">QnA</li>
                   </ol>
               </li>
           </ul>
       </nav>
   </header>

	<section class="secssion">        
		<h1 id="qnalist_title">공지사항</h1>
	
		<table class="qnalist_table">
			<col width="10%">
			<col width="60%">			
			<col width="30%">
			<tr>
				<th>번호</th>
				<th>제목</th>				
				<th>날짜</th>
			</tr>
			<%
				if(notice_list.size() == 0) {
			%>
			<tr>
				<td colspan="3">-----작성된 글이 없습니다.-----</td>
			</tr>
			<%
				} else {
					for(NoticeDto dto : notice_list) {
			%>
			<tr class="qna_answer">
				<td><%=dto.getNt_no() %></td>
				<td><a href="NoticeController.do?command=notice_user_detail&nt_no=<%=dto.getNt_no() %>"><%=dto.getNt_title() %></a></td>				
				<td><%=dto.getNt_date() %></td>
			</tr>
			<%
					}
				}
			%>
			<tr>
				<td id="qna_insert_button" colspan="3" align="right">
					<button type="submit" name="search" value="">
						<img src="resources/img/search.PNG">
					</button>
					<input type="text" placeholder="검색어를 입력해주세요">
				
				<td>
			</tr>
			
			<tr>
				<td id="qna_insert_button" colspan="3" align="center">
					<span><&nbsp</span>
					<span>1&nbsp</span> 
					<span>2&nbsp</span>
					<span>3&nbsp</span>
					<span>4&nbsp</span>
					<span>5&nbsp</span>
					<span>></span>
				</td>
			</tr>
		</table>
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