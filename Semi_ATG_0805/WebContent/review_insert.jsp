<%@ page import="com.atg.review.dto.ReviewDto" %>
<%@ page import="com.atg.review.biz.ReviewBizImpl" %>
<%@ page import="com.atg.review.biz.ReviewBiz" %>
<%@ page import="com.atg.Register.dto.RegisterDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/review_detail.css">
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript" src="resources/js/review.js"></script>  

<script type="text/javascript">

$(function () {
	
	
	$('.starRev span').click(function(){
		  $(this).parent().children('span').removeClass('on');
		  $(this).addClass('on').prevAll('span').addClass('on');
		  var star = $(this).children().val();
		  $("#starVal").prop("value",star);
		  
		  console.log($("#starVal").val());
		  
		});
	
	$('.starRev span').click(function () {
	})
	
})

</script>

</head>
<body>
<%
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
                       <li onclick="location.href='review.jsp'">리뷰</li>
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
	
	<section class="secssion">
	<h1>리뷰 작성하기</h1>
	<form action="ReviewController.do" method="post">
	<input type="hidden" name="command" value="insert"/>
		<table id="review_table">
			<tr>
				<th>제목</th>
				<td><input type="text" name="rv_title"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="mb_id" value="<%=LDto.getMb_id() %>" readonly="readonly"></td>
			</tr>
			<tr>
				<th>사진</th>
				<td>
					<input type="file" value="찾아보기.." name="rv_photo" size=40>
				</td>
			</tr>
			<tr>
				<th>별점</th>
				<td>
					<div class="starRev">
					  <span class="starR1"><input type="hidden" value="1"/></span>
					  <span class="starR2"><input type="hidden" value="2"/></span>
					  <span class="starR1"><input type="hidden" value="3"/></span>
					  <span class="starR2"><input type="hidden" value="4"/></span>
					  <span class="starR1"><input type="hidden" value="5"/></span>
					  <span class="starR2"><input type="hidden" value="6"/></span>
					  <span class="starR1"><input type="hidden" value="7"/></span>
					  <span class="starR2"><input type="hidden" value="8"/></span>
					  <span class="starR1"><input type="hidden" value="9"/></span>
					  <span class="starR2"><input type="hidden" value="10"/></span>
					</div>
					<input type="hidden" id="starVal" name="rv_rate" value="0"/>
				</td>
				
			</tr>
			
			<tr>
				<th>내용</th>
				<td><textarea cols="100" rows="20" name="rv_content" style="resize:none;"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="button" value="취소" onclick="location.href='ReviewController.do?command=review_list'">
					<input type="submit" value="입력">
				</td>
			</tr>
		</table>
	</form>
	</section>
	

</body>
</html>