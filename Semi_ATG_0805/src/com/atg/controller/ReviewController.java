package com.atg.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.atg.review.biz.ReviewBiz;
import com.atg.review.biz.ReviewBizImpl;
import com.atg.review.dto.ReviewDto;
import com.atg.review_Reply.biz.ReviewReplyBiz;
import com.atg.review_Reply.biz.ReviewReplyBizImpl;
import com.atg.review_Reply.dto.ReviewReplyDto;

@WebServlet("/review.do")
public class ReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReviewController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();
		String command = request.getParameter("command");
		
		ReviewReplyBiz Replybiz = new ReviewReplyBizImpl();
		
		// 댓글부분
		ReviewBiz biz = new ReviewBizImpl();
		ReviewReplyBizImpl Rbiz= new ReviewReplyBizImpl();
		// 리뷰 부분
		if (command.equals("detail")) {
			
			 int rv_no = Integer.parseInt(request.getParameter("rv_no"));
			  System.out.println(rv_no);
			 ReviewDto dto = biz.selectOne(rv_no);
			 
			 request.setAttribute("dto", dto);
			 System.out.println("selectOne==>"+dto);
			 
			
				 
			// 리뷰는 디테일 댓글은 리스트로 뿌리기
			List<ReviewReplyDto> Rlist = Replybiz.seleList(rv_no);
			System.out.println("컨트롤러=====>" + Rlist);
			
			request.setAttribute("Rlist", Rlist);
			System.out.println("Rlist==>" + Rlist);
			
			
			
			// =======================================================

			RequestDispatcher dispatch = request.getRequestDispatcher("review_detail.jsp");
			dispatch.forward(request, response);

		} else if (command.equals("insert")) {
			String rv_title = request.getParameter("rv_title");
			String mb_id = request.getParameter("mb_id");
			int rv_rate = Integer.parseInt(request.getParameter("rv_rate"));
			String rv_content = request.getParameter("rv_content");

			System.out.println(rv_rate);

			int res = biz.insert(new ReviewDto(0, rv_title, rv_content, null,  rv_rate, mb_id));

			if (res > 0) {
				response.sendRedirect("ReviewController.do?command=review_list");
			} else {
				response.sendRedirect("review_insert.jsp");
			}

		} else if (command.equals("update")) {
			int rv_no = Integer.parseInt(request.getParameter("rv_no"));
			ReviewDto dto = biz.selectOne(rv_no);
			request.setAttribute("dto", dto);
			int res = biz.update(new ReviewDto());

			RequestDispatcher dispatch = request.getRequestDispatcher("review_update.jsp");
			dispatch.forward(request, response);

		} else if (command.contentEquals("review_update")) {
			int rv_no = Integer.parseInt(request.getParameter("rv_no"));
			String rv_title = request.getParameter("rv_title");
			String rv_content = request.getParameter("rv_content");
			String mb_id = request.getParameter("mb_id");

			int res = biz.update(new ReviewDto(rv_no, rv_title, rv_content,  null, 0, mb_id));

			if (res > 0) {
				response.sendRedirect("ReviewController.do?command=review_list");
			}

		} else if (command.equals("delete")) {

			int rv_no = Integer.parseInt(request.getParameter("rv_no"));
			String mb_id = request.getParameter("mb_id");

			int res = biz.delete(rv_no, mb_id);

			if (res > 0) {
				response.sendRedirect("ReviewController.do?command=review_list");
			}

		} else if (command.equals("review_list")) {

			List<ReviewDto> list = biz.selectList();

			request.setAttribute("list", list);

			RequestDispatcher dispatch = request.getRequestDispatcher("review_list.jsp");
			dispatch.forward(request, response);
		}

	}

}
