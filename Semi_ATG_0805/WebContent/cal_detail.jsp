<%@page import="java.util.List"%>
<%@page import="com.atg.Cal.dto.CalDto"%>
<%@page import="com.atg.Member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<link rel="stylesheet" href="resources/css/Template.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<meta charset="UTF-8">
<title>Template</title>
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/Template.js"></script>
    
</head>
<body>
   
   <header id="header">
   	<span><h1 onclick="location.href='main.jsp'">AT-G</h1></span>
        <ul class="nav_icon">
             <li><img src="resources/img/user.png" onclick="location.href='calendar.jsp'"></li>
             <li><img src="resources/img/basket.png" onclick="location.href=''"></li>
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
                       <li onclick="location.href=''">공공체육시설</li>
                       <li>-</li>
                   </ol>
               </li>
               <li>
               	<span>운동상품</span>
                   <ol class="bottom_menu">
                       <li onclick="location.href=''">운동기구찾기</li>
                       <li onclick="location.href=''">상품판매</li>
                   </ol>
               </li>
               <li>
               	<span>커뮤니티</span>
                   <ol class="bottom_menu">
                       <li onclick="location.href=''">리뷰</li>
                       <li onclick="location.href=''">실시간채팅</li>
                   </ol>
               </li>
               <li>
               	<span>고객지원</span>
                   <ol class="bottom_menu">
                       <li onclick="location.href=''">공지사항</li>
                       <li onclick="location.href=''">QnA</li>
                   </ol>
               </li>
           </ul>
       </nav>
   </header>
   
   <section class="secssion">  
   <br/><br/><br/><br/><br/><br/><br/>   	
	<div class="container my-1" id="box">
		<div class="row">
		<form action="CalController.do?" method="post">
		<input type="hidden" name="command" value="cal_update" />
		<input type="hidden" name="ca_no" value="${dto.ca_no }" />
			<table class="table" id="box_tb" style="width : 70%">
				<tr>
					<th class="table-active">제목</th>
					<td><input type="text" name="ca_title" value="${dto.ca_title }" /></td>
				</tr>
				<tr>
					<th>ID</th>
					<td>${dto.mb_id }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea style="width:100%; height:300px; resize:none;" type="text" name="ca_content" rows="10" cols="70">${dto.ca_content }</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input class="btn btn-secondary mb-3" type="submit" value="수정" />
						<input class="btn btn-secondary mb-3" type="button" value="삭제" onclick="location.href='CalController.do?command=cal_delete&ca_no=${dto.ca_no }'" />
						<input class="btn btn-secondary mb-3" type="button" value="취소" onclick="location.href='CalController.do?command=calendar'" />
					</td>	
				</tr>
				</table>
			</form>
			</div>
	</div>
   </section>
   
   <div id="side">
   	<div class="sidebar"><span class="t">1:1</span></div>
   	<div class="sidebar"><span class="t" id="topbutton">Top</span></div>
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
      
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>    
</body>
</html>