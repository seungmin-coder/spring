<%@page import="com.atg.Notice.biz.NoticeBizImpl"%>
<%@page import="com.atg.Notice.biz.NoticeBiz"%>
<%@page import="com.atg.Notice.dto.NoticeDto"%>
<%@page import="java.util.List"%>
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
<title>공지사항 검색</title>
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/Template.js"></script>
    
</head>
<body>
<%	
	String search_op = request.getParameter("search_op");
	String search = request.getParameter("search");
	
	NoticeBiz notice_biz = new NoticeBizImpl();
	List<NoticeDto> notice_list = notice_biz.search(search_op, search);
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
   <br/><br/><br/><br/><br/>
		<div id="box">
   		<form id="user_admin" action="MemberController.do" method="post" >
   			<input type="hidden" name="command" value="member_search" />
   			<table class="table table-striped" id="box_tb" >
   				<col width="50" />
   				<col width="100" />
   				<col width="50" />
   				<col width="100" />
   				<col width="200" />
   				<col width="300" />
   				<tr>
   					<th>글  번  호</th>
   					<th>제       목</th>
   					<th>작성 시간</th>
   				</tr>
   				<tr>
   				<%
   					if(notice_list.size() == 0) {
   				%>
   				<tr>
   					<td colspan="6">-----일치하는 글이 없습니다.-----</td>
   				</tr>
   				<%
   					} else {
   						for(NoticeDto dto : notice_list) {
   				%>
   					<td><%=dto.getNt_no() %></td>
   					<td><a style="color:blue;" href="NoticeController.do?command=notice_detail&nt_no=<%=dto.getNt_no() %>"><%=dto.getNt_title() %></a></td>
   					<td><%=dto.getNt_date() %></td>
   				</tr>
   				<%
   						}
   					}
   				%>
   				<tr>
   					<td colspan="6" align="right"><input class="btn btn-secondary mb-3" type="button" value="전체 목록으로" onclick="location.href='adminpage.jsp'" /></td>
   				</tr>
   			</table>
		</form>
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