package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.MemberDTO;
import com.exception.CommonException;
import com.service.MemberService;

/**
 * Servlet implementation class HomeController
 */
@WebServlet("/MyPageController")
public class MyPageController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 HttpSession session = request.getSession();
		 MemberDTO dto =  (MemberDTO)session.getAttribute("login");
		 // 여기서 원래 ==> 로그인하지 않고 직접  MyPage 요청처리
		 String userid = dto.getUserid();
		 
		 MemberService service = new MemberService();
		 String target = "";
		 try {
			MemberDTO myPage = service.myPage(userid);
			request.setAttribute("myPage", myPage);
			target = "myPage.jsp";
		} catch (CommonException e) {
			target = "error.jsp";
			request.setAttribute("message", e.getMessage());
			request.setAttribute("link", "Home");
		}
		
		
		  RequestDispatcher dis = request.getRequestDispatcher(target);
	        dis.forward(request, response);
	        
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
