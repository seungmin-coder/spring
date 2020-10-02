<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@page import="com.atg.Register.dto.RegisterDto"%>

<!DOCTYPE html>
<html>
<head>
<!-- 부트스트랩 css -->
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">
<!-- 로그인 css -->
<link rel="stylesheet" href="resources/css/login.css">
<!-- 2개는 메뉴바 css -->
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/navbar.css">
<!-- 전체 css -->
<link rel="stylesheet" href="resources/css/Template.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
<!-- 부트스트랩 js (순서 그대로!! 순서 변경 ㄴㄴ) -->
<script type="text/javascript"
	src="resources/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
	src="resources/bootstrap/js/bootstrap.min.js"></script>
	
<!-- 네이버로그인 js -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<!-- 카카오 로그인 js -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	RegisterDto LDto = (RegisterDto)session.getAttribute("LDto");

	//네이버 로그인 부분(9줄)
   	String clientId = "yeowg5yY7qJbzjx08DDi";//애플리케이션 클라이언트 아이디값";
	String redirectURI = URLEncoder.encode("http://localhost:8787/Semi_ATG/naverlogincallback.jsp", "UTF-8");
	SecureRandom random = new SecureRandom();
	String state = new BigInteger(130, random).toString();
	String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	apiURL += "&client_id=" + clientId;
	apiURL += "&redirect_uri=" + redirectURI;
	apiURL += "&state=" + state;
	session.setAttribute("state", state);
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
						<a class="dropdown-item" href="public.jsp">공공체육시설</a> <a
							class="dropdown-item text-white" href="">-</a>
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
				<li class="nav-item dropdown "><a class="nav-link text-white"
					id="navbarDropdown" href="">고객지원</a>
					<div class="dropdown-menu mt-2"
						aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item"
							href="NoticeController.do?command=notice_list">공지사항</a> <a
							class="dropdown-item" href="">QnA</a>
					</div></li>
			</ul>
		</nav>
	</div>

	<!-- 내용 -->
	<div class="secssion">
		<fieldset>
			<legend class="col-form-label col-sm-4 pt-0">
				<h4>Login</h4>
			</legend>
			<form class="p-4 " action="RegisterController.do" method="post">
			<input type="hidden" name="command" value="login">
				<div class="form-group row">
					<div class="pl-3">
						<label for="exampleInputLogin1">ID</label><br> 
						<input type="text" class="form-control" id="exampleInputLogin1" placeholder="아이디를 입력해주세요." name="id" autofocus>
					</div>
				</div>
				<div class="form-group row">
					<div class="pl-3 ">
						<label for="exampleInputPassword1">Password</label><br>
						<input type="password" class="form-control" id="exampleInputPassword1" name="password">
					</div>
				</div>
				<button type="submit" class="btn btn-custom float-right mb-3">login</button>

			</form>
		</fieldset>
		<fieldset>
			<div class="snslogin inline">
				<a href="<%=apiURL%>"><img class="ml-3 mt-2" height="50" src="resources/img/네이버 아이디로 로그인_완성형_Green.PNG"/></a>
				<a id="kakao-login-btn" class="ml-3 mt-4"></a>
				<!-- 카카오 로그인 js / 위치 수정 금지!!! -->
				<script type="text/javascript" src="resources/js/login_kakao.js"></script>
			</div>

			<div class="didi pt-5 pb-2 mx-auto text-center">
				<button type="button"  class="btn btn-custom" onclick="location.href='regist.jsp'">회원가입</button>
				<button type="button" class="btn btn-custom" onclick="location.href='RegisterController.do?command=IDPWfind'">id/pw 찾기</button>
			</div>
		</fieldset>
	</div>



	<!-- sidebar -->
	 <div id="side">
   		<div class="sidebar"><span class="t">1:1</span></div>
   		<div class="sidebar"><span class="t">Top</span></div>
   	</div>




	<!-- footer -->
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