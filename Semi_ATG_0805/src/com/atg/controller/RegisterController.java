package com.atg.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.atg.Register.biz.RegisterBiz;
import com.atg.Register.biz.RegisterBizImpl;
import com.atg.Register.dto.RegisterDto;
import com.atg.util.SendEmailUtills;

@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterController() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		// 캐시 삭제
		response.setHeader("cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);

	
		
		
		String command = request.getParameter("command");

		System.out.println("<" + command + ">");
		HttpSession session = request.getSession();

		// 비즈 객체 생성
		RegisterBiz biz = new RegisterBizImpl();

		// 회원가입 창
		if (command.equals("insert")) {
			
			System.out.println("insert");
			String mb_name = request.getParameter("name");
			String mb_gender = request.getParameter("gender");
			String mb_id = request.getParameter("id");
			String mb_pw = request.getParameter("pw");
			String mb_email = request.getParameter("email");
			String mb_addr1 = request.getParameter("addr1");
			String mb_addr2 = request.getParameter("addr2");
			String mb_addr3 = request.getParameter("addr3");

			String mb_addr=mb_addr1+"/"+mb_addr2+"/"+mb_addr3;

			RegisterDto dto = new RegisterDto(0, mb_id, mb_pw, mb_name, mb_gender, mb_email, mb_addr);
			System.out.println("dto----controller----------" + dto);

			int res = biz.insert(dto);
			System.out.println(res);
			if (res > 0) {
				jsResponse("회원가입 성공", "login.jsp", response);
			} else {
				jsResponse("회원가입 실패", "registform.jsp", response);

			}



			// id 중복체크----------------------------------------------------------------------
		} else if (command.equals("idcheck")) {
			// 1.
			String id = request.getParameter("id");
			// 2.
			System.out.println(id + "String id");
			int result = biz.idCheck(id);
			System.out.println(result);
			// System.out.println(dto+"CONtroller부분");
			// boolean idnotused = true; // 아이디 사용 안되고 있다
			// System.out.println(idnotused);
			// if(dto.getMb_id()!= null){
			// idnotused= false;
			// }
			// 3.
			// 4.
			response.sendRedirect("idcheck.jsp?idnotused=" + result);






			// email 중복체크 ----------------------------------------------------------------------
		} else if (command.equals("emailCheck")) {
			String mb_email = request.getParameter("email");

			System.out.println(mb_email + "-------------------email-------------------");
			// 2.
			int emailresult = biz.emailCheck(mb_email);
			System.out.println(emailresult);
			// System.out.println(dto+"CONtroller부분");
			// boolean idnotused = true; // 아이디 사용 안되고 있다
			// System.out.println(idnotused);
			// if(dto.getMb_id()!= null){
			// idnotused= false;
			// }
			// 3.
			// 4.
			response.sendRedirect("emailcheck.jsp?emailnotused=" + emailresult);





			//login -------------------------------------------------------------------------
		} else if (command.equals("login")) {
			String mb_id = request.getParameter("id");
			String mb_pw = request.getParameter("password");

			Map<String, String> map = new HashMap<String, String>();
			map.put("mb_id", mb_id);
			map.put("mb_pw", mb_pw);

			System.out.println(map + "------map------");

			RegisterDto dto = biz.login(map);
			// biz login에 값을 넣어 다시 dto에 저장
			System.out.println(dto + "dto 값 저장 확인");
			
			if (dto != null) {
				session.setAttribute("LDto", dto);
				System.out.println(dto);
				session.setMaxInactiveInterval(1 * 60);// 1분동안 이벤트가 없다면 자동으로 로그아웃(자동으로세션삭제)
				// admin일 경우 관리자 페이지
				// 아니면
				
				System.out.println(dto.getMb_grade());
				
				if (dto.getMb_grade().equals("admin")) {
					jsResponse("관리자 로그인 성공", "main.jsp", response);
				} else {
					jsResponse("회원로그인 성공", "main.jsp", response);
				}
			} else {
				jsResponse("아이디와 패스워드를 다시 입력해주세요", "login.jsp", response);
			}



			// 로그아웃창----------------------------------------------------------------------
		} else if (command.equals("logout")) {
			session.removeAttribute("LDto");
			session.invalidate();
			response.sendRedirect("login.jsp");






			// 아이디 비밀번호찾기 창----------------------------------------------------------------------
		} else if (command.equals("IDPWfind")) {
			response.sendRedirect("IDPWfind.jsp");


			//--------------아이디 찾기  이름 이메일 --------------------
		}else if (command.equals("IDsearch")){
			
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String emailAdress = request.getParameter("emailAdress");
			
			System.out.println(name+"---2222--"+email+"=--2222----"+emailAdress);
			
			StringBuffer sb = new StringBuffer(email)
					.append("@").append(emailAdress);
			String emailFullName = sb.toString();

			Map <String,String> param = new HashMap <String,String>();

			param.put("mb_name", name);
			param.put("mb_email", emailFullName);
			
			RegisterDto dto = biz.IDfind(param);

			System.out.println("아이디찾기 ajax==333333333====>"+dto);
				
			JSONObject obj = new JSONObject();
			
			if (dto == null) {
				obj.put("result","0");
				System.out.println(obj+"----if구문");
			} else {
				obj.put("mbName",dto.getMb_name());
				obj.put("mbId",dto.getMb_id());
				obj.put("result","1");
				System.out.println(obj+"<--4444--else");
			}

			PrintWriter pw = response.getWriter();
			pw.println(obj.toJSONString());





			//-----------------비밀번호 찾기 이름 이메일 아이디 ------------------------

		}else if(command.equals("PWsearch")) {
			String id = request.getParameter("PWid");
			String name = request.getParameter("PWname");
			String email = request.getParameter("PWemail");
			String	emailAdress = request.getParameter("pwemailAdress");
			
			System.out.println(id+"넌또 뭐냐 ? ");
			System.out.println(emailAdress+"값이 안들어오냐?");
			
			
			System.out.println(id+"/"+name+"/"+email+"/"+emailAdress);

			  StringBuffer sb= new StringBuffer(email).append("@").append(emailAdress);
			  String emailFullName = sb.toString();
			
			
			Map<String, String> param = new HashMap <String, String>();

			param.put("mb_id",id);
			param.put("mb_name",name);
			param.put("mb_email",emailFullName);
			
			System.out.println("paramvalue====="+param);
			RegisterDto dto = biz.PWfind(param);
			System.out.println("비밀번호 찾기 ajax======>"+dto);
			JSONObject obj = new JSONObject();
			
			if (dto == null) {
				obj.put("result","0");
				System.out.println("obj 'if구문'--->"+dto);
			} else {
				//{"result":"1","mbId":"dhtmdals66","mbName":"오승민"}<----else
				//해당하는 값이 있을경우 그 값을 mbName에 이름 값을 저장 
				//아이디 값을 갖고옴 1을 리턴 <---데이터가 있는것을 표시 없으면 0 
				obj.put("mbname",dto.getMb_name());
				obj.put("mbpw",dto.getMb_pw());
				obj.put("result","1");
				
				System.out.println("obj-----eles-->"+obj);
			}
			PrintWriter pw = response.getWriter();
			pw.println(obj.toJSONString());



			
			
			
			
			
			
		}else if(command.equals("confirm")) {
			response.sendRedirect("confirm.jsp");
			
			
		}else if (command.equals("sendEmail")) {
			
			SendEmailUtills se = new SendEmailUtills();
			se.service(request, response);
			
			
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
