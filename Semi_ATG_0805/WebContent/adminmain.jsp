<%@page import="com.atg.Register.dto.RegisterDto"%>
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

<!--  -->
<script type="text/javascript" src="resources/js/Template.js"></script>
    
</head>
<body>
<%
	RegisterDto LDto = (RegisterDto)session.getAttribute("LDto");
%>
   
  <!-- 메뉴바 -->
	<nav class="navbar navbar-light navbar-nav ">
		<a class="navbar-brand navbar-nav " href="main.jsp"><h1>AT-G</h1></a>
	</nav>
	<ul class="nav justify-content-end mt-1">
		<li class="nav-item mr-3">
		<%
		if(LDto != null){ //로그인이 되어있으면
		%>
		
		<%=LDto.getMb_name() %>님
		
		<%
		}
		%>
		</li>
		<li class="nav-item"><a class="mr-3" href="">관리자페이지</a></li>
		<li class="nav-item"><a class="mr-3" href="">장바구니</a></li>
		<li class="nav-item">
		<%
		if(LDto == null){
		%>
		<a class="mr-5" href="login.jsp">로그인</a>
		<%
		}else{
		%>
		<a class="mr-5" href="RegisterController.do?command=logout">로그아웃</a>
		<%
		}
		%>		
		</li>
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
   <span class="target"></span>
   
   <section class="secssion">
   	<div id="blank">
   	</div>
   	<div id="banner_box">
		<ul>
			<li><img src="resources/img/banner1.png" onclick="location.href=''"/></li>
			<li><img src="resources/img/banner2.png" onclick="location.href=''"/></li>
			<li><img src="resources/img/banner3.png" onclick="location.href=''"/></li>
			<li><img src="resources/img/banner4.png" onclick="location.href=''"/></li>
			<li><img src="resources/img/banner5.png" onclick="location.href=''"/></li>
		</ul>
		
		<div class="banner_nav">
	  		<img src="resources/img/prev.png" class="prev"/>
	  		<img src="resources/img/next.png" class="next"/>
  		</div>
		
		<div class="indicator">
  		</div>
	</div>
   
   	<div id="ranking_box">
   		<div id="ranking_a">
   			<div class="ranking_content">
   				<ul>
					<li onclick="location.href=''"><div class="divbox">Best ProG</div><br/>Best 1<img src="resources/img/2.jpg"/></li>
					<li onclick="location.href=''"><div class="divbox">Best ProG</div><br/>Best 2<img src="resources/img/3.jpg"/></li>
					<li onclick="location.href=''"><div class="divbox">Best ProG</div><br/>Best 3<img src="resources/img/4.jpg"/></li>
				</ul>
			</div>
   		</div>
   		
   		<div id="ranking_b">
   			<div class="ranking_content">
	   			<ul>
					<li onclick="location.href=''"><div class="divbox">Best Item</div><br/>Best 1<img src="resources/img/5.jpg"/></li>
					<li onclick="location.href=''"><div class="divbox">Best Item</div><br/>Best 2<img src="resources/img/6.jpg"/></li>
					<li onclick="location.href=''"><div class="divbox">Best Item</div><br/>Best 3<img src="resources/img/2.jpg"/></li>
				</ul>
			</div>
   		</div>
   	</div>
   	
	<div id="review_box">
		<div class="review_content1">
			<img src="resources/img/re1.jpg" class="re1">
			<div class="divbox">Review Best 1</div>
		</div>
		
		<div class="review_content2">
			<img src="resources/img/re2.jpg" id="re2">
			<div class="divbox">Review Best 2</div>
		</div>
		
		<div class="review_content1">
			<img src="resources/img/re3.jpg" class="re1">
			<div class="divbox">Review Best 3</div>
		</div>
	</div>   

   </section>
   
   <div id="side">
   	<div class="sidebar" onclick=""><br/><span class="t">1:1</span></div>
   	<div class="sidebar" id="topbutton"><br/><span class="t">Top</span></div>
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