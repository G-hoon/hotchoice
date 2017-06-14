package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.entity.BoardDTO;
import com.entity.VoteDTO;
import com.service.BoardService;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/BoardRetrieveServlet")
public class BoardRetrieveServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("boardRetrieve_ajax.jsp;charset=UTF-8");
		String num = request.getParameter("num");
		BoardService service = new BoardService();
		BoardDTO dto =  service.boardRetrieve(Integer.parseInt(num));
		VoteDTO vto = service.voteRetrieve(Integer.parseInt(num));
		PrintWriter out = response.getWriter();
		out.print(dto.getNum()+"/");
		out.print(dto.getTitle()+"/");
		out.print(dto.getAuthor()+"/");
		out.print(dto.getContent()+"/");
		out.print(vto.getVcontent1()+"/");
		out.print(vto.getVimage1()+"/");
		out.print(vto.getVcontent2()+"/");
		out.print(vto.getVimage2()+"/");
		out.print(vto.getVcontent3()+"/");
		out.print(vto.getVimage3()+"/");
		out.print(vto.getVcontent4()+"/");
		out.print(vto.getVimage4()+"/");
		out.print(vto.getVcontent5()+"/");
		out.print(vto.getVimage5());
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
