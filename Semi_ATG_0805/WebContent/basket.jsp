<%@page import="com.atg.Register.dto.RegisterDto"%>
<%@page import="com.atg.Basket.dto.BasketDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<head>
<link rel="stylesheet" href="resources/css/basket.css">
<link rel="stylesheet" href="resources/css/Template.css">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/bootstrap/js/bootstrap.js"></script>
<meta charset="UTF-8">
<title>Template</title>
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/basket.js"></script>
    
</head>
<body>
<%
	RegisterDto LDto = (RegisterDto)session.getAttribute("LDto");
	List<BasketDto> list = (List<BasketDto>)request.getAttribute("list");
%>
   
  
   <header id="header">
   	<span><h1 onclick="location.href='main.jsp'">AT-G</h1></span>
        <ul class="nav_icon">
             <li><img src="resources/img/user.png" onclick="location.href='mypage.jsp'"></li>
             <li><img src="resources/img/basket.png" onclick="location.href='basket.jsp'"></li>
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
                       <li onclick="location.href='public.jsp'">공공체육시설</li>
                       <li>-</li>
                   </ol>
               </li>
               <li>
               	<span>운동상품</span>
                   <ol class="bottom_menu">
                       <li onclick="location.href='itemsearch.jsp'">운동기구찾기</li>
                       <li onclick="location.href='Itemcontroller.do?command=itemlist'">상품판매</li>
                   </ol>
               </li>
               <li>
               	<span>커뮤니티</span>
                   <ol class="bottom_menu">
                       <li onclick="location.href='review.jsp'">리뷰</li>
                       <li onclick="location.href='chat.jsp'">실시간채팅</li>
                   </ol>
               </li>
               <li>
               	<span>고객지원</span>
                   <ol class="bottom_menu">
                       <li onclick="location.href='notice_user.jsp'">공지사항</li>
                       <li onclick="location.href='qna_user.jsp'">QnA</li>
                   </ol>
               </li>
           </ul>
       </nav>
   </header>
   
   <section class="secssion">
   	
	 <h3 class="title">Shopping bag</h3>
	    
	    <div class="sec01">
	        
	        <div class="left">
				<form action="Basketcontroller.do" method="post">
					<input type="hidden" name="command" value="muldel">
					<input type="hidden" name="mb_no" value="<%=LDto.getMb_no()%>">
					<table class="table table-hover">
						<col width="50">
						<col width="200">
						<col width="300">
						<col width="200">
						<col width="100">
						<thead>
							<tr>
								<th scope="col" class="text-center"><input type="checkbox" name="all" onclick="allChk(this.checked);"></th>
								<th scope="col" class="text-center">물품 사진</th>
								<th scope="col" class="text-center">물품 이름</th>
								<th scope="col" class="text-center">수량</th>
								<th scope="col" class="text-center">가격</th>
							</tr>
						</thead>
						<tbody>
							<%
								if (list.size() == 0) {
							%>
							<tr>
								<td colspan="4">-------------장바구니에 담긴 상품이 없습니다-----------</td>
							</tr>
							<%
								} else {
								for (BasketDto dto : list) {
							%>
							<tr>
								<td scope="col" class="text-center pt-4 pb-1">
									<input type="checkbox" name="chk" value="<%=dto.getBas_no()%>">
								</td>
								<td scope="col" class="text-center ">
									<img alt="d" name="item_url" src="<%=dto.getItemDto().getItem_url()%>" width="40px" height="40px">
								</td>
								<td scope="col" class="text-center pt-4 pb-1"><%=dto.getItemDto().getItem_name()%></td>
								<td scope="col" class="text-center pt-4 pb-1"><%=dto.getBas_count()%></td>
								<td scope="col" class="text-center pt-4 pb-1"><%=dto.getItemDto().getItem_price() * dto.getBas_count()%></td>
							</tr>
							<%
								}
							}
							%>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="5" align="right">
									<input class="btn btn-custom btn-sm" type="button" value="결제하기">
									<input class="btn btn-custom btn-sm" type="submit" value="삭제하기"></td>
							</tr>
						</tfoot>
					</table>
				</form>

			</div>
	
	       	<div class="right">
				<table>
				
					<col width="100px">
					<col width="20px">
					<col width="100px">
					
					<tbody>
						<tr>
							<th>상품수</th>
							<td class="dot">:</td>
							<td></td>
						</tr>
						<tr>
							<th>상품금액</th>
							<td class="dot">:</td>
							<td></td>
						</tr>
						<tr>
							<th>할인금액</th>
							<td class="dot">:</td>
							<td></td>
						</tr>
						<tr>
							<th>배송비</th>
							<td class="dot">:</td>
							<td></td>
						</tr>
						<tr>
							<th id="last_cost">총 금액</th>
							<td class="dot">:</td>
							<td></td>
						</tr>
					</tbody>
				</table>
	        </div>
	                  
	        
	    </div>
	
   </section>
   
   <div id="side">
   	<div class="sidebar"><span class="t">1:1</span></div>
   	<div class="sidebar"><span class="t">Top</span></div>
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