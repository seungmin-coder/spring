<%@page import="java.util.List"%>
<%@page import="com.atg.Member.biz.MemberBizImpl"%>
<%@page import="com.atg.Member.biz.MemberBiz"%>
<%@page import="com.atg.Member.dto.MemberDto"%>
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
<title>회원 검색</title>
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/Template.js"></script>
    
</head>
<body>
<%	
	String search_op = request.getParameter("search_op");
	String search = request.getParameter("search");
	
	MemberBiz member_biz = new MemberBizImpl();
	List<MemberDto> member_list = member_biz.search(search_op, search);
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
   
   <br/><br/><br/><br/><br/>
   <section class="secssion">
   
		<div id="box">
   		<form id="user_admin" action="MemberController.do" method="post" >
   			<input type="hidden" name="command" value="member_search" />
   			<table class="table" id="box_tb" border="1">
   				<col width="100" />
   				<col width="100" />
   				<col width="50" />
   				<col width="100" />
   				<col width="200" />
   				<col width="300" />
   				<tr>
   					<th>회원 번호</th>
   					<th>이       름</th>
   					<th>성       별</th>
   					<th>아  이  디</th>
   					<th>이  메  일</th>
   					<th>주       소</th>
   				</tr>
   				<tr>
   				<%
   					if(member_list.size() == 0) {
   				%>
   				<tr>
   					<td colspan="6">-----일치하는 회원이 없습니다.-----</td>
   				</tr>
   				<%
   					} else {
   						for(MemberDto dto : member_list) {
   				%>
   					<td><a style="color:blue;" href="MemberController.do?command=member_detail&mb_no=<%=dto.getMb_no() %>"><%=dto.getMb_no() %></a></td>
   					<td><%=dto.getMb_name() %></td>
   					<td><%=dto.getMb_gender() %></td>
   					<td><%=dto.getMb_id() %></td>
   					<td><%=dto.getMb_email() %></td>
   					<td><%=dto.getMb_addr() %></td>
   				</tr>
   				<%
   						}
   					}
   				%>
   				<tr>
   					<td colspan="6" align="right"><input class="btn btn-secondary mb-3" type="button" value="회원 목록으로" onclick="location.href='adminpage.jsp'" /></td>
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