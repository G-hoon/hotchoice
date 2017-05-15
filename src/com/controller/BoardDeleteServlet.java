package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.BoardDTO;
import com.entity.MemberDTO;
import com.service.BoardService;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/BoardDeleteServlet")
public class BoardDeleteServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		String target="";
		if(dto != null){
			String num = request.getParameter("num");
			
			BoardService service = new BoardService();
			service.boardDelete(Integer.parseInt(num));
			target="BoardListServlet";
		}else{
			target="LoginFormController";
			request.setAttribute("loginFail", "로그인 후 시도하세요");
		}
		RequestDispatcher dis = request.getRequestDispatcher(target);
        dis.forward(request, response);
     
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
