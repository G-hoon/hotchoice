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
@WebServlet("/MemberRemoveController")
public class MemberRemoveController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
	
		String userid = request.getParameter(dto.getUserid());
		System.out.println("userid : "+dto.getUserid()+" / dto: "+dto);
		MemberService service = new MemberService();
		try {
			service.RemoveMember(dto.getUserid());
			 session.invalidate();
		} catch (CommonException e) {
			e.printStackTrace();
		}
		RequestDispatcher dis = request.getRequestDispatcher("BoardListServlet");
        dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
