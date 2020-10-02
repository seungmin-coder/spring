<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>

<meta charset="UTF-8">
<title>Template</title>
<link rel="stylesheet" href="resources/css/program.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/program.js"></script>    
    
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
   	<div id="window1" class="wheelView">
   		<div class="wheelBox">
  	 		<div class="movie_box">
  	 			<iframe class="movie_style" src="https://www.youtube.com/embed/rRzxEiBLQCA"></iframe>
  	 		</div>
 		  	<div class="text_box">#1</div>
 		</div>
   	</div>
   	
   	<div id="window2" class="wheelView">
   		<div class="wheelBox">
   			<div class="movie_box">
  	 			<iframe class="movie_style" src="https://www.youtube.com/embed/rRzxEiBLQCA"></iframe>
  	 		</div>
 	  		<div class="text_box">#2</div>
 	  	</div>
   	</div>
   	
   	<div id="window3" class="wheelView">
   		<div class="wheelBox">
   			<div class="movie_box">
  	 			<iframe class="movie_style" src="https://www.youtube.com/embed/rRzxEiBLQCA"></iframe>
  	 		</div>
 	  		<div class="text_box">#3</div>
 	  	</div>
   	</div>
   	
   	<div id="window4" class="wheelView">
   		<div class="wheelBox">d
   			<div class="movie_box">
  	 			<iframe class="movie_style" src="https://www.youtube.com/embed/rRzxEiBLQCA"></iframe>
  	 		</div>
 	  		<div class="text_box">#4</div>
 	  	</div>
   	</div>

   </section>
   
   <div id="side">
   	<div class="sidebar"><span class="t">1:1</span></div>
   	<div class="sidebar" id="topbutton"><span class="t">Top</span></div>
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