<%@page import="com.atg.Register.dto.RegisterDto"%>
<%@page import="com.atg.review_Reply.dto.ReviewReplyDto"%>
<%@ page import="com.atg.review.dto.ReviewDto" %>
<%@ page import="java.util.List" %>
<%@ page import="com.atg.review.biz.ReviewBizImpl" %>
<%@ page import="com.atg.review.biz.ReviewBiz" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/review_list.css">
<script type="text/javascript" src="resources/js/Template.js"></script>

<script type="text/javascript">

$(function () {
	$(".starList").each(function(){
		$(this).parent().children($('.starR1')).slice(0, $(this).val()).addClass('on');
		$(this).parent().children($('.starR2')).slice(0, $(this).val()).addClass('on');
	})
});

</script>
   

</head>
<body>
<%
	List<ReviewDto> list = (List<ReviewDto>)request.getAttribute("list");
	RegisterDto LDto = (RegisterDto) session.getAttribute("LDto");
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
                       <li onclick="location.href='review_list.jsp'">리뷰</li>
                       <li onclick="location.href=''">실시간채팅</li>
                   </ol>
               </li>
               <li>
               	<span class="menu_title">고객지원</span>
                   <ol class="bottom_menu">
                       <li onclick="location.href='NoticeController.do?command=notice_list'">공지사항</li>
                       <li onclick="location.href='qna_user.jsp'">Q&A</li>
                   </ol>
               </li>
           </ul>
       </nav>
   </header>
   
   <br/><br/><br/><br/><br/><br/>

	<section class="secssion">        
		<h1 id="review_title">리뷰게시판</h1>
	
		<table id="review_table">
			<col width="50px">
			<col width="200px">
			<col width="200px">	
			<col width="300px">		
			<col width="150px">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>별점</th>
				<th>사진</th>			
				<th>날짜</th>
			</tr>
			<%
				if(list.size() == 0) {
			%>
			<tr>
				<td colspan="5">-----작성된 글이 없습니다.-----</td>
			</tr>
			<%
				} else {
					for(ReviewDto dto : list) {
			%>
			<tr class="">
				<td><%=dto.getRv_no() %></td>
			<%
				if(LDto != null) {
			%>
				<td><a href="ReviewController.do?command=detail&rv_no=<%=dto.getRv_no()%>"><%=dto.getRv_title() %></a></td>	
			<%
				} else {
			%>
				<td><a href="login.jsp"><%=dto.getRv_title() %></a></td>
			<%
				}
			%>	

				<td>
					<div class="starRev">
					  <span class="starR1" id="s1"><input type="hidden" value="1"/></span>
					  <span class="starR2" id="s2"><input type="hidden" value="2"/></span>
					  <span class="starR1" id="s3"><input type="hidden" value="3"/></span>
					  <span class="starR2" id="s4"><input type="hidden" value="4"/></span>
					  <span class="starR1" id="s5"><input type="hidden" value="5"/></span>
					  <span class="starR2" id="s6"><input type="hidden" value="6"/></span>
					  <span class="starR1" id="s7"><input type="hidden" value="7"/></span>
					  <span class="starR2" id="s8"><input type="hidden" value="8"/></span>
					  <span class="starR1" id="s9"><input type="hidden" value="9"/></span>
					  <span class="starR2" id="s10"><input type="hidden" value="10"/></span>
					  <input type="hidden" class="starList" value="<%=dto.getRv_rate() %>"/>
					</div>
				</td>
				
				<td><%=dto.getRv_date() %></td>
			</tr>
			<%
					}
				}
			%>
			<tr>
				<td id="review_insert_button" colspan="5" align="right">
				<%
					if(LDto != null) {
				%>
					<button type="button" onclick="location.href='review_insert.jsp?mb_id=<%=LDto.getMb_id()%>'">글 작성</button>
				<%
					} else {
				%>
					<button type="button" onclick="location.href='login.jsp'">글 작성</button>
				<%
					}
				%>
				</td>
			</tr>
			
			
			
			
			
			<tr>
				<td id="nextprev_button" colspan="5" align="center">
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















