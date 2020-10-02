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

<!-- IDPWfind -->
<script type="text/javascript" src="resources/js/IDPWfind.js"/></script>
<link rel="stylesheet" href="resources/css/IDPWfind.css">
<link rel="stylesheet" href="resources/css/Template.css">

</head>
<body>


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
	
	<%!

	int random = 0;

	public int getRandom() {
	
		random = (int)Math.floor((Math.random()*(99999-10000+1)))+10000;
		return random;
	}
%>
						
						
				<input type="button"  onclick="warnning();">
				
	<!-- 내용 -->
	<div class="secssion">
		<div id="loginer">
		<!--아이디 찾기 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
				<fieldset id="ids">
				<div id="title"><h1>아이디찾기</h1></div>
				<br>
					 <input type="text" id="name" name="name" placeholder="이름"size="20" required="required" >
					<br><br>
					
          				<input type="text" id="email" name="email" autocomplete="off" placeholder="이메일" >@<select name="emadress" id="emadress"><option value="naver.com">naver.com</option><option value="nate.com">nate.com</option>
              			 <option value="hanmail.com">hanmail.com</option><option value="gmail.com">gmail.com</option></select>
              			 <button id="checkEmail" value="" onclick="emailCheck('<%=getRandom()%>');">인증번호전송</button>
						<br>
						<br> <!-- emailCheck값에  getRandom 매개변수로 넣어서 전송  -->
						<input type="text" id="confirm" name="" placeholder="인증번호입력 ">
						<input type="button" onclick="checkNum('<%= random %>')" value="인증확인" />
						<br>
						<br>
					 <input type="hidden" value="아이디찾기" id="idsearch"  onclick="idfind();"/><span id="result"></span>
						<button id="move" onclick="location.href='login.jsp'">로그인하러가기</button>
				</fieldset>
		</div>
		
		<br><br>
		<br><br>
		
		<!-- 이 부분은 깃헙 테스트 부분입니다 지워도 상관없습니다  -->
		<!-- ~~~~~~~~~~~~~~~~~~~~~~~~비밀번호 찾기 ~~~~~~~~~~~~~~~~~~~~~~~~~~  -->

			<fieldset id="pws">
			<div id="title"><h3>비밀번호찾기</h3></div>
			<br>
			<input type="text" id="PWid" name="pwid" placeholder="아이디 " required="required">
				 <br><br>
				
			<input type="text" id="PWname" name="pwname" placeholder="이름" required="required"> 
				<br><br>
              
              <input type="text" name="pwemailAdress" id="PWemail" autocomplete="off" placeholder="이메일">@<select name="pwemadress" id="PWemadress"><option value="naver.com">naver.com</option><option value="nate.com">nate.com</option>
                <option value="hanmail.com">hanmail.com</option><option value="gmail.com">gmail.com</option></select>
                <button id="PWcheckEmail" value="" class="btn btn-custom" onclick="PWemailCheck('<%=getRandom()%>');">인증번호전송</button>
                
                <br>
                <br>
                <input type="text" id="pwconfirm" name="" placeholder="인증번호입력 ">
				<input type="button" class="btn btn-custom" onclick="PWcheckNum('<%= random %>')" value="인증확인"/>
				<br><br>
				<input type="hidden" value="sadasda">
				<input type="hidden" id="pwsearch" value="비밀번호찾기"  onclick="pwfind();"/><span id="pwresult"></span>
				<button id="move" class="btn btn-custom" onclick="location.href='login.jsp'">로그인하러가기</button>
			</fieldset>	

	</div>


	<div id="side">
		<div class="sidebar">
			<span class="t">1:1</span>
		</div>
		<div class="sidebar">
			<span class="t">Top</span>
		</div>
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