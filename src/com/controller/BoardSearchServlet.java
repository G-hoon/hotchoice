package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.ListDTO;
import com.entity.VoteDTO;
import com.service.BoardService;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/BoardSearchServlet")
public class BoardSearchServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchName = request.getParameter("searchName");
		String searchValue = request.getParameter("searchValue");
		HashMap<String, String> map= new HashMap<>();
		map.put("searchName", searchName);
		map.put("searchValue", searchValue);
		BoardService service = new BoardService();
		List<ListDTO> lto = service.boardSearch(map);
		List<VoteDTO> vto = service.voteRetrieve2();
		
		ArrayList<ListDTO> list = new  ArrayList<>();
		for(int index=0;index<lto.size();++index){
			list.add(new ListDTO(lto.get(index).getNum(), lto.get(index).getAuthor(), lto.get(index).getTitle(), 
					lto.get(index).getContent(), lto.get(index).getWriteday(), lto.get(index).getReadcnt(), 
					lto.get(index).getUserid(), vto.get(index).getVcontent1(), vto.get(index).getVcontent2(), 
					vto.get(index).getVcontent3(), vto.get(index).getVcontent4(), vto.get(index).getVcontent5(), 
					vto.get(index).getVimage1(), vto.get(index).getVimage2(), vto.get(index).getVimage3(), 
					vto.get(index).getVimage4(), vto.get(index).getVimage5(),
					lto.get(index).getVotecount1(), lto.get(index).getVotecount2(),lto.get(index).getVotecount3(), 
					lto.get(index).getVotecount4(), lto.get(index).getVotecount5(), lto.get(index).getVote_num()));
		}
		request.setAttribute("boardList", list);
		
		RequestDispatcher dis = request.getRequestDispatcher("list.jsp");
		dis.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
