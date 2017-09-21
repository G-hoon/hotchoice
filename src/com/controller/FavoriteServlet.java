package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.FavoriteDTO;
import com.entity.MemberDTO;
import com.entity.VoteDTO;
import com.service.BoardService;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/FavoriteServlet")
public class FavoriteServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("favorite_ajax.jsp;charset=UTF-8");
		 HttpSession session = request.getSession();
		 MemberDTO dto =(MemberDTO)session.getAttribute("login");
		String num = request.getParameter("num");
		String nickname = dto.getNickname();
		FavoriteDTO fto = new FavoriteDTO(Integer.parseInt(num), nickname);
		BoardService service = new BoardService();
		service.Favorite_write(fto);
		int fto_count = service.Favorite_result(Integer.parseInt(num));
		System.out.println("count : "+fto_count);
		PrintWriter out = response.getWriter();
		out.print(fto_count);

		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
