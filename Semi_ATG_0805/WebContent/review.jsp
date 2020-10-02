<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<link rel="stylesheet" href="resources/css/review.css">
<meta charset="UTF-8">
<title>Template</title>
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript" src="resources/js/review.js"></script>    
    
</head>
<body>
   
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
                       <li onclick="location.href='qna_user.jsp'">QnA</li>
                   </ol>
               </li>
           </ul>
       </nav>
   </header>
   
   
   <section class="secssion">
     
   
   <section class="secssion">
   
   <div class="table">
  		<div class="table2">
  			<div class="table3">
  			<div class="img1">
  			<!--프로필 사진 위치   -->
  			<img class="" alt="" src="" width="150px" height="150px">
  			</div>
  				<div class="info">
  				<p>아이디 :<input type="text"></p> 
  				<p>작성날짜:<input type="text"></p> 
  				<p>작성시간:<input type="text"></p> 
  				</div>
  				<div class="table4">
  					<div class="table5">
  						<form action="">
  					<!-- 자기가 올린 업로드할 사진   -->
  						<div class="upload">
  						<img class="img2" alt="" src="" width="400px" height=400px" >
  						<textarea rows="24%" cols="70%" class="content">후기</textarea>
  						</div>
  						
  						<div class="reply">
  						 
  						 <p>
  						 
  						 <span>
  						 	아이디 
  						 	<input type="text" class="ID" name="">
  						 </span>
  							내용
  						 <input type="text" class="rep" >
  						 <input type="submit" value="답글완료">
  						 
  						 </p>
  						 	
  						 
  						</div>
  						</form>
  					</div>
  				</div> 
  				
  			</div>
  		
  		
  		
  		</div>
   
   </div>
   </section>
   	

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