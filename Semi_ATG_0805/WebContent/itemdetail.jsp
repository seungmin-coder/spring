<%@page import="com.atg.Register.dto.RegisterDto"%>
<%@page import="com.atg.Basket.dto.BasketDto"%>
<%@page import="com.atg.Register.dto.RegisterDto"%>
<%@page import="com.atg.Item.dto.ItemDto"%>
<%@page import="com.atg.Item.biz.ItemBizImpl"%>
<%@page import="com.atg.Item.biz.ItemBiz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Template</title>
    
<!-- 부트스트랩 css -->
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">
<!-- 두개는 메뉴바 css -->
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/navbar.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<!-- 두개는 순서 그대로!! 변경ㄴㄴ -->
<script type="text/javascript"
	src="resources/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
	src="resources/bootstrap/js/bootstrap.min.js"></script>

<!-- itemdetail -->
<link rel="stylesheet" href="resources/css/itemdetail.css">
<link rel="stylesheet" href="resources/css/Template.css">

</head>
<body>

<%
	ItemDto dto = (ItemDto)request.getAttribute("dto");
	BasketDto bdto = new BasketDto();
	int item_no = Integer.parseInt(request.getParameter("item_no"));
	RegisterDto LDto = (RegisterDto)session.getAttribute("LDto");
%>
   
 <!-- 메뉴바 -->
	<nav class="navbar navbar-light navbar-nav ">
		<a class="navbar-brand navbar-nav " href="main.jsp"><h1>AT-G</h1></a>
	</nav>
	<ul class="nav justify-content-end mt-1">
		<li class="nav-item"><a class="mr-3" href="">마이페이지</a></li>
		<li class="nav-item"><a class="mr-3" href="">장바구니</a></li>
		<li class="nav-item"><a class="mr-5" href="login.jsp">로그인</a></li>
	</ul>



	<div class="nav_cus sticky-top">
		<nav
			class="navbar navbar-expand-lg navbar-dark bg-dark justify-content-center dropdown sticky-top">
			<ul class="nav justify-content-center ">
				<li class="nav-item dropdown mr-5"><a
					class="nav-link text-white " id="navbarDropdown" href="">프로그램</a>
					<div class="dropdown-menu mt-2">
						<a class="dropdown-item" href="">튜토리얼</a> <a class="dropdown-item"
							href="">루틴운동</a>
					</div></li>
				<li class="nav-item dropdown mr-5"><a
					class="nav-link text-white" id="navbarDropdown" href="">외부활동</a>
					<div class="dropdown-menu mt-2"
						aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="public.jsp">공공체육시설</a>
						<a class="dropdown-item text-white" href="">-</a>
					</div></li>
				<li class="nav-item dropdown mr-5"><a
					class="nav-link text-white" id="navbarDropdown" href="">운동상품</a>
					<div class="dropdown-menu mt-2"
						aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="">운동기구찾기</a> <a
							class="dropdown-item" href="Itemcontroller.do?command=itemlist">상품판매</a>
					</div></li>
				<li class="nav-item dropdown mr-5"><a
					class="nav-link text-white" id="navbarDropdown" href="">커뮤니티</a>
					<div class="dropdown-menu mt-2"
						aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="">리뷰</a> <a class="dropdown-item"
							href="">실시간 채팅</a>
					</div></li>
				<li class="nav-item dropdown "><a class="nav-link text-white" id="navbarDropdown" href="">고객지원</a>
					<div class="dropdown-menu mt-2" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="NoticeController.do?command=notice_list">공지사항</a> 
						<a class="dropdown-item" href="">QnA</a>
					</div></li>
			</ul>
		</nav>
	</div>


   <!-- 내용 -->
   <section class="secssion">
  	<div id="blank">
   	</div>
   	<div id="banner_box">
   		<div class="list_view">
   			<img src="resources/img/dumbel.jpg"/>
   		</div>
   		<div class="list_box">
			<img class="banner_list" src="resources/img/dumbel.jpg"/>
			<img class="banner_list" src="resources/img/dumbel2.jpg"/>
			<img class="banner_list" src="resources/img/dumbel3.jpg"/>
		</div>
	</div>

	
	<form action="Basketcontroller.do" method="post">
	<input type="hidden" name="command" value="gobasket">
	<%
		if(LDto == null){ //로그인이 안되어있으면	
	%>
		<input type="hidden" name="mb_no" value="0">
	<%
		}else{  //로그인이 되어있으면,
	%>
		<input type="hidden" name="mb_no" value="<%=LDto.getMb_no()%>">
	<%
		}
			
	%>
	
		<div class="item_pay"><br/><br/>
			<input type="hidden" name="item_url" value="<%=dto.getItem_url()%>">
			<input type="hidden" name="item_no" value="<%=dto.getItem_no() %>">
			
	   		<input type="text" name="item_name" readonly="readonly" value="<%=dto.getItem_name()%>"><br/><br>
			<input type="text" name="item_price" value="<%=dto.getItem_price() %>">원<br/><br>
				<div class="item_box">
					택배
				</div><br/>
				<div class="pay_sum1">
					<select name="count" id="countA">
						<option class="cnt" value="1">1</option>
						<option class="cnt" value="2">2</option>
						<option class="cnt" value="3">3</option>
						<option class="cnt" value="4">4</option>
						<option class="cnt" value="5">5</option>
						<option class="cnt" value="6">6</option>
						<option class="cnt" value="7">7</option>
						<option class="cnt" value="8">8</option>
						<option class="cnt" value="9">9</option>
						<option class="cnt" value="10">10</option>
					</select>
					<div class="pay_text">원</div>
					<input type="text" name="price" readonly="readonly" value="<%=dto.getItem_price()%>" class="price"/>
					<div></div>
				</div><br/>
			<div class="pay_box">
				<div id="question1">문의하기</div>
				<div><input id="add" type="submit" value="장바구니 담기"></div>		
				<div id="pay1">바로구매</div>
			</div>
		</div>
	</form>
	
	<br/><br/><br/><br/><br/>
	<br/><br/><br/><br/><br/>
	<br/><br/><br/><br/><br/>
	<br/><br/><br/><br/><br/>
	<br/><br/><br/><br/><br/>
	<br/><br/><br/><br/><br/>
	
	<div class="item_detail">
		<h1>제품 상세설명</h1><br/>
		
		<div class="pay_sum2">
			<div class="minus">-</div>
			<input type="text" name="bas_count" value="1" class="count"/>
			<div class="plus">+</div>
			<div class="pay_text">원</div>
			<input type="text" name="price" value="<%=dto.getItem_price() %>" readonly="readonly" class="price"/>
			<div id="question2">문의하기</div>
			<div id="basket2">장바구니</div>
			<div id="pay2">바로구매</div>
		</div>
		
		<img src="resources/img/detail1.jpg" class=""/>
		<img src="resources/img/detail2.jpg" class=""/>
		<img src="resources/img/detail3.jpg" class=""/>
		<img src="resources/img/detail4.jpg" class=""/>
		
		
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