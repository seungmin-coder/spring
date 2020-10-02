package com.atg.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.SendResult;

import com.atg.Basket.biz.BasketBiz;
import com.atg.Basket.biz.BasketBizImpl;
import com.atg.Basket.dto.BasketDto;
import com.atg.Register.dto.RegisterDto;

@WebServlet("/Basketcontroller")
public class Basketcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Basketcontroller() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		BasketBiz biz = new BasketBizImpl();

		String command = request.getParameter("command");

		if (command.equals("gobasket")) {
			
			int mb_no = Integer.parseInt(request.getParameter("mb_no"));
			
			//유효성검사
			if (mb_no == 0) { //로그인안되어 있으면
				dispatch(request, response, "login.jsp");
				
			}else {  //로그인이 되어있으면, 바로 insert
				
				int item_no = Integer.parseInt(request.getParameter("item_no"));
				int bas_count = Integer.parseInt(request.getParameter("count"));
				
				System.out.println(mb_no);
				System.out.println(item_no);
				System.out.println(bas_count);
				
				BasketDto dto = new BasketDto(0, mb_no, item_no, bas_count);
				int res = biz.insert(dto);
				System.out.println("d");
				if(res > 0) {
					//들어갔으면 장바구니 페이지로 보내기
					//jsResponse("DB에 들어감!", "Basketcontroller.do?command=list&mb_no="+mb_no, response); //한번만 들어가고 페이지 안넘어감
					//response.sendRedirect("Basketcontroller.do?command=list");  //한번만 들어가고 페이지 안넘어감
					dispatch(request, response, "Basketcontroller.do?command=list"); //여러번들어가고 페이지 넘어감
					
				}else {
					dispatch(request, response, "itemdetail.jsp");
				}
			}
		}else if(command.equals("list")) {
				int mb_no = Integer.parseInt(request.getParameter("mb_no"));
				System.out.println(mb_no);
				
				//String item_url = request.getParameter("item_url");
				//String item_name = request.getParameter("item_name");
				//int count = Integer.parseInt(request.getParameter("count"));
				//int price = Integer.parseInt(request.getParameter("price"));
				
				List<BasketDto> list = biz.selectList(mb_no);
				request.setAttribute("list", list);
				
				dispatch(request, response, "basket.jsp");
			
			
		}else if(command.equals("muldel")) {
			int mb_no = Integer.parseInt(request.getParameter("mb_no"));
			//int item_no = Integer.parseInt(request.getParameter("item_no"));
			//int bas_count = Integer.parseInt(request.getParameter("count"));

			String[] seq = request.getParameterValues("chk");

			if (seq == null || seq.length == 0) { //하나도 선택안했을때,

				dispatch(request, response, "Basketcontroller.do?command=list&mb_no="+mb_no);
				
			} else {
				int res = biz.multiDelete(seq);
				if (res > 0) { //값이 하나 들어가면, 
					
					dispatch(request, response, "Basketcontroller.do?command=list&mb_no="+mb_no);
					
				} else {
					
					dispatch(request, response, "Basketcontroller.do?command=list&mb_no="+mb_no);
					
				}
			}
		}
		

	}

	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String res = "<script> alert('" + msg + "'); location.href='" + url + "'; </script>";
		out.print(res);
	}

	private void dispatch(HttpServletRequest request, HttpServletResponse response, String url)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

}
