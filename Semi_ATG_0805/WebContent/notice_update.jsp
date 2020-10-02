<%@page import="com.atg.Notice.dto.NoticeDto"%>
<%@page import="com.atg.Notice.biz.NoticeBizImpl"%>
<%@page import="com.atg.Notice.biz.NoticeBiz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    

<!DOCTYPE html>
<html>
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
<%
	int nt_no = Integer.parseInt(request.getParameter("nt_no"));
	NoticeBiz biz = new NoticeBizImpl();
	NoticeDto dto = biz.selectOne(nt_no);
%>
   
   <header id="header">
   	<span><h1 onclick="location.href='main.jsp'">AT-G</h1></span>
        <ul class="nav_icon">
             <li><img src="resources/img/user.png" onclick="location.href=''"></li>
             <li><img src="resources/img/basket.png" onclick="location.href=''"></li>
             <li><img src="resources/img/login.png" onclick="location.href=''"></li>
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
   	<div class="box">
   	<br/><br/><br/><br/><br/>
		<h1>공지글 수정</h1>
   		<form action="notice.do" method="post">
   			<input type="hidden" name="command" value="notice_update" />
   			<input type="hidden" name="nt_no" value="<%=dto.getNt_no() %>" />
   			<table class="table" id="box_tb">
   				<tr>
   					<th>제목</th>
   					<td><input class="form-control mt-4 mb-2" id="title" type="text" name="nt_title" value="<%=dto.getNt_title() %>" /></td>
   				</tr>
   				<tr>
   					<th>작성자</th>
   					<td>관리자</td>
   				</tr>
   				<tr>
   					<th>내용</th>
   					<td class="form-group">
   						<textarea class="form-control" style="height:300px; resize:none;" id="content" name="nt_content"><%=dto.getNt_content() %></textarea>
   					</td>
   				</tr>
   				<tr>
   					<td colspan="2" align="right">
   						<input class="btn btn-secondary mb-3" type="submit" value="수정">
   						<input class="btn btn-secondary mb-3" type="button" value="취소" onclick="location.href='adminpage.jsp'" />
   					</td>
   				</tr>
   			</table>
   		</form>
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

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>     
</body>
</html>