<%@page import="com.atg.Register.dto.RegisterDto"%>
<%@ page import="com.atg.review.dto.ReviewDto" %>
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
<link rel="stylesheet" href="resources/css/review_update.css">
<script type="text/javascript" src="resources/js/review.js"></script>

</head>
<body>

<%
	int rv_no = Integer.parseInt(request.getParameter("rv_no"));
	ReviewBiz biz = new ReviewBizImpl();
	ReviewDto dto = biz.selectOne(rv_no);
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
                       <li onclick="location.href='ReviewController.do?command=review_list'">리뷰</li>
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
	  <div class="reviewbox">
		<h1>리뷰 수정</h1>
		<br/>
   		<form action="review.do" method="post">
   			<input type="hidden" name="command" value="review_update" />
   			<input type="hidden" name="rv_no" value="<%=dto.getRv_no() %>" />
   			<table id="review_box">
	   			<tr>
					<th>작성자</th>
					<td><input type="text" name="mb_id" value="<%=LDto.getMb_id() %>" readonly="readonly"></td>
				</tr>
   				<tr>
   					<th>제목</th>
   					<td><input id="title" type="text" name="rv_title" value="<%=dto.getRv_title() %>" /></td>
   				</tr>
   				<tr>
   					<th>내용</th>
   					<td>
   						<textarea cols="100" rows="20" id="content" name="rv_content" style="resize:none"><%=dto.getRv_content() %></textarea>
   					</td>
   				</tr>
   				<tr>
   					<td colspan="2" align="right">
   						<input type="button" value="취소" onclick="location.href='ReviewController.do?command=detail&rv_no=<%=dto.getRv_no() %>'" />
   						<input type="submit" value="수정">
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

</body>
</html>















