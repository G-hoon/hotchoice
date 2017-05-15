package com.controller;

import java.io.IOException;
import java.util.HashMap;
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
@WebServlet("/BoardUpdateServlet")
public class BoardUpdateServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		String target="";
		if(dto != null){
			request.setCharacterEncoding("UTF-8");
			String num = request.getParameter("num");
			String title = request.getParameter("title");
			String author = request.getParameter("author");
			String content = request.getParameter("content");
			
			HashMap<String, String> map= new HashMap<>();
			map.put("a", num);
			map.put("b", title);
			map.put("c", author);
			map.put("d", content);
			
			BoardService service = new BoardService();
			service.boardUpdate(map);
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
