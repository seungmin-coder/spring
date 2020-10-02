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



<!--다음 api 주소 같이 있어야 사용가능   -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">



function sample6_execDaumPostcode() {
   new daum.Postcode({
       oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 각 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var addr = ''; // 주소 변수
           var extraAddr = ''; // 참고항목 변수

           //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
           if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
               addr = data.roadAddress;
           } else { // 사용자가 지번 주소를 선택했을 경우(J)
               addr = data.jibunAddress;
           }

           // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
           if(data.userSelectedType === 'R'){
               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                   extraAddr += data.bname;
               }
               // 건물명이 있고, 공동주택일 경우 추가한다.
               if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
               }
               // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
               if(extraAddr !== ''){
                   extraAddr = ' (' + extraAddr + ')';
               }
               // 조합된 참고항목을 해당 필드에 넣는다.
              
           }
           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           document.getElementById('sample6_postcode').value = data.zonecode;
           document.getElementById("sample6_address").value = addr;
           // 커서를 상세주소 필드로 이동한다.
           document.getElementById("sample6_detailAddress").focus();
       }
   }).open();
}
	


</script>	


    
    
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
   
   <section class="secssion">
	
	<h3>회원가입 form</h3>
	<form action="RegisterController.do" id="target" name="form"   method="post" class="" >
		<input type="hidden" name="command" value="insert"/>
		<table class="table table-sm">
		<col width="100">
		<col width="500">
			<tr>
				<th class="text-center">이름</th>
				<td scope="col">
				<input type="text" id="name" name="name" required="required" autofocus="autofocus" width="500px" min="2" name="name" maxlength="10" placeholder="이름입력">
				</td>
			</tr>
			<tr>
				<th class="text-center">성별</th>
           		 <td>
          		 	<input type="radio" name="gender" value="M" required="required" > 남
            		<input class="ml-4" type="radio" name="gender" value="F" required="required" > 여
        	    </td>
			</tr>
			<tr>
				<th class="text-center">아이디</th>
				<td>
					<input type="text" id="ID" required="required" name="id"  min="2"  autocomplete="off" maxlength="12" title="아이디는 4~12자의 대소문자와 숫자로만 입력 가능합니다" placeholder="아이디를 입력해주세요">
					<input class="btn btn-custom btn-sm" type="button" value="아이디 중복 확인" placeholder="아이디를 입력" onclick="idCheck();">
				</td>
			</tr>
			<tr>
				<th class="text-center">비밀번호</th>
				<td>
					<input type="password" id="password1"  placeholder="비밀번호입력"  min="4" maxlength="12" name="pw" required="required">
				</td>
			</tr>
			<tr>
				<th class="text-center">비밀번호확인</th>
				<td><input type="password" id="password2"  placeholder="비밀번호확인"  min="4" maxlength="12" required="required" onkeyup="fn_compare_pwd();">
										<span id="s_result">비밀번호가 일치하지 않습니다.</span>				
				</td>
			</tr>
			<%!

	int random = 0;

	public int getRandom() {
	
		random = (int)Math.floor((Math.random()*(99999-10000+1)))+10000;
		return random;
	}
%>	
		
			
			
			<tr>
				<th class="text-center">이메일</th>
					<td>
					<input type="email"  id="email"    maxlength="50" autocomplete="off" name="email" class="" placeholder="이메일을 입력해주세요" required="required"> 
					<button class="btn btn-custom btn-sm" id="echeck" onclick="emailCheck();">이메일중복</button><button id="checkEmail" value="" onclick="emailconfirm('<%=getRandom()%>')">인증번호전송</button>
					</td>
					
			</tr>
			<tr>
				<th class="text-class">이메일인증</th>	
				<td>
					<input type="text" id="confirm" name="" required="required" placeholder="인증번호입력 ">
					<input type="button" onclick="checkNum('<%= random %>')" value="인증확인" />
				</td>
			</tr>	
			
		
			
			<tr>
				<th class="text-center">주소</th>
				<td>
				<input type="text" id="sample6_postcode" class="addr1" name="addr1" placeholder="우편번호" readonly="readonly">
				<input class="btn btn-custom btn-sm" type="button" onclick="sample6_execDaumPostcode();"   id="daumaddr" value="우편번호 찾기" >
				<br>
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