<%@page import="com.atg.Register.dto.RegisterDto"%>
<%@page import="com.atg.Item.dto.ItemDto"%>
<%@page import="java.util.List"%>
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

<!-- item -->
<link rel="stylesheet" href="resources/css/item.css">
<link rel="stylesheet" href="resources/css/Template.css">
<script type="text/javascript" src="resources/js/item.js"></script>
    
</head>
<body>
<% 
	List<ItemDto> list = (List<ItemDto>)request.getAttribute("list");
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

	<div class="list_one">
		<div class="text_list">
			<span class="text_title">덤벨&바벨</span>
			<div class="text_box"><h4>웨이트</h4></div>
		</div>
		<div class="item_box">
		
<%
		for(ItemDto dto : list) {
%>		
			<div class="item_list" class="card" style="width: 16rem;" >
				<img class="card-img-top" src="<%=dto.getItem_url()%>" onclick="location.href='Itemcontroller.do?command=itemdetail&item_no=<%=dto.getItem_no()%>'">
				<div class="card-body bg-white border-top">
					<h5 class="card-subtitle"><%=dto.getItem_name() %></h5>
				</div>
			</div>
			
<%
		}
%>			
	
	
	</div>
		
		<div>
			<input type="button" class="btn btn-custom" id="plus_list" value="+ 더 보기">
		</div>
	</div>
	
	<div class="list_two">
		<div class="text_list">
			<span class="text_title">매트</span>
			<div class="text_box2"><h4>스트레칭</h4></div>
		</div>
		
		<div class="item_box">
			<div class="item_list2">1</div>
			<div class="item_list2">2</div>
			<div class="item_list2">3</div>
			<div class="item_list2">4</div>
			
			<div class="item_list2">1</div>
			<div class="item_list2">2</div>
			<div class="item_list2">3</div>
			<div class="item_list2">4</div>
			
			<div class="item_list2">1</div>
			<div class="item_list2">2</div>
			<div class="item_list2">3</div>
			<div class="item_list2">4</div>
			
			<div class="item_list2">1</div>
			<div class="item_list2">2</div>
			<div class="item_list2">3</div>
			<div class="item_list2">4</div>
		</div>
		
		
		<div>
			<div id="plus_list2">+ 더 보기</div>
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