package com.controller;

import java.io.IOException;
import java.util.HashMap;

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
@WebServlet("/LogoutController")
public class LogoutController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 HttpSession session = request.getSession();
		 // 로그인 하지 않고 LogoutController 요청 가능
		 MemberDTO dto =  (MemberDTO)session.getAttribute("login");
		 String target = "Home";
		 if(dto == null){ //로그인 안됨
			// target="LoginFormController";
			 request.setAttribute("loginFail", "로그인 후 시도하세요");
		 }else{  // 로그인 됨.
			 session.invalidate();
			// target="Home";
		 }
		 
		 
		  RequestDispatcher dis = request.getRequestDispatcher(target);
	        dis.forward(request, response);
	        
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
