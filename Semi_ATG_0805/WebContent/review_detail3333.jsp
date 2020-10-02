<%@page import="com.atg.Register.dto.RegisterDto"%>
<%@ page import="com.atg.review.dto.ReviewDto" %>
<%@ page import="com.atg.review.biz.ReviewBizImpl" %>
<%@ page import="com.atg.review.biz.ReviewBiz" %>
<%@ page import="com.atg.review_Reply.dto.ReviewReplyDto" %>
<%@page import="java.util.List"%>
<%@ page import="com.atg.review_Reply.dto.ReviewReplyDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/review_detail.css">
<script type="text/javascript" src="resources/js/review_reply_detail.js"></script>  
<script type="text/javascript" src="resources/css/Template.js"></script>


<script type="text/javascript">

	$(function () {
		var rv_id = $('#rv_id').text();
		var lg_id = $('#lg_id').val();
		
		console.log(rv_id);
		console.log(lg_id);
		
		if (rv_id != lg_id) {
			$('#delbtn').hide();
		} else {
			$('#delbtn').show();
		}
		
	})
	

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
	ReviewDto dto = (ReviewDto) request.getAttribute("dto"); //  리뷰 dto 
	int rv_no = Integer.parseInt(request.getParameter("rv_no")); // 리뷰글 번호 
	RegisterDto LDto = (RegisterDto) session.getAttribute("LDto"); //회원정로그인 dto
	
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

	<br/><br/>

	<section class="secssion">      
	  <div id="reviewbox">
		<table id="review_table">
			<tr>
				<th>글 번호</th>
				<td><%=dto.getRv_no() %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><%=dto.getRv_title() %></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td id="rv_id"><%=dto.getMb_id() %></td>
				<input type="hidden" id="lg_id" value="<%=LDto.getMb_id() %>">
			</tr>
			<tr>
				<th>사진</th>
				<td><input type="file"></td>
			</tr>
			<tr>
				<th>날짜</th>
				<td><%=dto.getRv_date() %></td>
			</tr>
			<tr>
				<th>별점</th>
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
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea cols="100" rows="20" name="rv_content" style="resize:none;"><%=dto.getRv_content() %></textarea>
				</td>
			</tr>

			<tr>
				<td colspan="7" align="right">
					<input type="button" value="목록" onclick="location.href='ReviewController.do?command=review_list'" />
					<input type="button" value="수정" onclick="location.href='ReviewController.do?command=review_update'" />
					<input type="button" value="삭제" id="delbtn" onclick="location.href='ReviewController.do?command=delete&rv_no=<%=dto.getRv_no() %>&mb_id=<%=LDto.getMb_id() %>'" />
				</td>
			</tr>
		</table>
		
		
		<!--000000000000000000000000000000000000000000000000000000000000000000000000  -->
			
			<!--                             리뷰댓글부분                                              -->
			
			<!--000000000000000000000000000000000000000000000000000000000000000000000000  -->
		
		
		
		
		<%
			List<ReviewReplyDto> Rlist  = (List<ReviewReplyDto>)request.getAttribute("Rlist");
			/* RegisterDto LDto = (RegisterDto) session.getAttribute("LDto");/ //아이디 값 
			int rv_no = Integer.parseInt(request.getParameter("rv_no")); */// 리뷰글 번호 
			
		%>
		
		
	<div id="Replybox">
		<table class="qnalist_table" >
							<col width="10%">
							<col width="50%">
							<col width="10%">
							<col width="10%">
							<tr>
								<td>
								<table>
								<tr>
									<td>
										<button class="writebutton" onclick="$('.css_test').toggle()">글작성</button>
										
										<span>
										<form action="ReviewReplyController.do" method="post" class="css_test">
												<input type="hidden"  name="command" value="ReviewReplyinsert">
												<input type="hidden" name="Rv_no" value="<%=dto.getRv_no()%>">
												<input type="hidden" name="Rv_rate" value="<%=dto.getRv_rate()%>">
										</span>
													<span><input type="hidden" readonly="readonly" name="id" value="<%=LDto.getMb_id()%>"></span><span><textarea rows="2" cols="40" name="content"></textarea></span>
												<input type="submit" value="작성">
									</form>
									</td>
								</tr>
								</table>
								</td>
							</tr>
							
							
	<%					
	
				if(Rlist.size() == 0){
					
	%>
			
							<tr>
								<td colspan="5">-------작성된 댓글이 없습니다.-------</td>
							</tr>
							
	<%
	}else{
		
		for(ReviewReplyDto Rdto: Rlist){
	%>
							<tr class="RR_box">
								<td><%=Rdto.getMb_Id()%></td>
								<td>
									<form action="ReviewReplyController.do" method="post">
										<input type="hidden" name="command" value="RRupdate">
										<input type="hidden" name="rr_no" value="<%=Rdto.getRr_no()%>">
										<input type="hidden" name="mb_id" value="<%=Rdto.getMb_Id() %>">
										<textarea rows="2" cols="60" style="resize: none;" class="RR_box_content" class="RR_box_content"  name="rr_content" readonly="readonly"><%=Rdto.getRr_content() %></textarea> 
										<input type="submit" id="RR_box_button" class="RR_box_update" value="작성완료" >
									</form>
			<% 
								for(int i = 0; i<Rdto.getRr_groupseq(); i++ ){
											Rdto.getRr_tab();
								}
			%>						
									<div class="RR_box_answer">
										<form action="ReviewReplyController.do" method="post">
											<input type="hidden" name="command" value="RR_Answer">
											<input type="hidden" name="parentRr_no" value="<%=Rdto.getRr_no()%>">
											<input type="hidden" name="mb_id" value="<%=LDto.getMb_id()%>">
											<textarea rows="1" cols="60" style="resize: none;" class=""   name="AnswerContent" value="RE:"></textarea>
											<input type="submit" id="" name="" value="답글완료">
										</form>
									</div>
									
								</td>
								
								<td><%=Rdto.getRr_date() %></td>
								<td>
									<!-- 사이드 에 버튼  -->  
									<button class="" onclick="$('.RR_box_answer').slideToggle()">답변</button>
									
									<!-- <button class="Updatefirst" onclick="$('.RR_box_update').toggle()">수정</button> -->
									<button class="Updatefirst" onclick="">수정</button>
									<form action="ReviewReplyController.do" method="post">
										<input type="hidden" name="command" value="ReviewReplydelete">
										<input type="hidden" name="rr_no" value="<%=Rdto.getRr_no() %>">
										<input type="submit" value="삭제">
									</form>
								</td>
							</tr>
							
	<%
				}
	
	}
	%>
						</table>
					</div>



<!-- <form action="" class="RR_deletebox">
									<input type="hidden" name="command" value="ReviewReplydelete">
									<input type="hidden" name="deleteRv_no" value="">
									<input type="submit" value="삭제">
								</form> -->
					



<%-- 
	
					<!--  -->
						<div class="">
							<form action="ReviewReplyController.do?command=">
								<input type="hidden" value="">
								 
								<input type="submit">
							</form>
						</div>

							 --%>
		
	
	
			<!--밑에글 삭제 부분   -->
		
				<!-- 			<div id="RR_deletebox">
								<form action="ReviewReplyController.do" method="post">
									<input type="hidden" name="command" value="ReviewReplydelete">
									<input type="hidden" name="deleteRv_no" value="">
									<input type="submit">
								</form>
							</div> 
							 -->
	
	
	
	
	
	
	
	
	
	
	
	
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















