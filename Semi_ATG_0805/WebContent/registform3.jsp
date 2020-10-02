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
	
<!-- registform -->
<script type="text/javascript" src="resources/js/registform.js"></script>
<link rel="stylesheet" href="resources/css/registform.css">
<link rel="stylesheet" href="resources/css/Template.css">
    
</head>
<body>
 <%
 String id = (String)request.getAttribute("id");
 String email = (String)request.getAttribute("email");
 String name = (String)request.getAttribute("name");

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
   <section class="secssion">
   	
	<h3>회원가입 form</h3>
	
	<form action="Registercontroller.do" method="post">
		<input type="hidden" name="command" value="insert"/>
		<table class="table table-sm" >
		<col width="100">
		<col width="500">
			<tr>
				<th class="text-center">이름</th>
				<td scope="col">
					<input type="text" required="required" autofocus="autofocus" width="500px" name="name">
				</td>
			</tr>
			<tr>
				<th class="text-center">성별</th>
           		 <td>
          		 		<input type="radio" name="gender" value="M" required="required"/> 남 
            			<input class="ml-4" type="radio" name="gender" value="F" required="required"/> 여 
        	    </td>
			</tr>
			<tr>
				<th class="text-center">아이디</th>
				<td>
					<input type="text" required="required" name="id"  maxlength="20">
					<input class="btn btn-custom btn-sm" type="button" value="아이디 중복 확인"  onclick="idCheck();">
				</td>
			</tr>
			<tr>
				<th class="text-center">비밀번호</th>
				<td>
					<input type="password" id="password1" required="required" min="4" maxlength="12" name="pw">
				</td>
			</tr>
			<tr>
				<th class="text-center">비밀번호 확인</th>
				<td><input type="password" id="password2" placeholder="비밀번호확인" required="required" min="4" maxlength="12"></td>
			</tr>
			<tr>
				<th class="text-center">이메일</th>
				<td>
					<input type="email"  id="email" value="<%=request.getParameter("email") %>" maxlength="50" autocomplete="off" name="email" class="" placeholder="이메일을 입력해주세요" required="required"> 
					<button class="btn btn-custom btn-sm" id="echeck" onclick="emailCheck();">이메일중복</button>
				</td>
			</tr>
			<tr >
				<th class="text-center">주소</th>
				<td>
					<input type="text" id="sample6_postcode" class="addr1" name="addr1" placeholder="우편번호" readonly="readonly">
					<input class="btn btn-custom btn-sm" type="button" onclick="sample6_execDaumPostcode()"    value="우편번호 찾기" ><br>
					<input type="text" id="sample6_address"  class="addr1" name="addr2" placeholder="주소" readonly="readonly"><br>
					<input type="text" id="sample6_detailAddress"  class="addr1" name="addr3" placeholder="상세주소" required="required">
				</td>
			</tr>
		<tr>
			<td colspan="2" align="right">
				<input class="btn btn-custom btn-sm" type="submit" id="btnSend"  value="회원가입하기" />
				<input class="btn btn-custom btn-sm" type="button" value="취소" onclick="location.href='login.jsp'"/>
			</td>
		</tr>
		</table>
	</form>

   </section>
   
   <!-- side bar -->
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