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
import javax.servlet.http.HttpSession;

import com.entity.BoardDTO;
import com.entity.ListDTO;
import com.entity.MemberDTO;
import com.entity.RecordDTO;
import com.entity.VoteDTO;
import com.service.BoardService;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/BoardListServlet")
public class BoardListServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
		 MemberDTO dto =(MemberDTO)session.getAttribute("login");
		BoardService service = new BoardService();
		List<ListDTO> lto = service.List_result();
		List<VoteDTO> vto = service.voteRetrieve2();
		ArrayList<ListDTO> list = new  ArrayList<>();
		ArrayList<ListDTO> list2 = new  ArrayList<>();
		if(dto == null){
			for(int index=0;index<lto.size();++index){
				list.add(new ListDTO(lto.get(index).getNum(), lto.get(index).getAuthor(), lto.get(index).getTitle(), 
						lto.get(index).getContent(), lto.get(index).getWriteday(), lto.get(index).getReadcnt(), 
						lto.get(index).getUserid(), vto.get(index).getVcontent1(), vto.get(index).getVcontent2(), 
						vto.get(index).getVcontent3(), vto.get(index).getVcontent4(), vto.get(index).getVcontent5(), 
						vto.get(index).getVimage1(), vto.get(index).getVimage2(), vto.get(index).getVimage3(), 
						vto.get(index).getVimage4(), vto.get(index).getVimage5(),
						null,null,null,null,null, null));
			}
			request.setAttribute("boardList", list);
		} else if(dto != null){
			List<ListDTO> lto2 = service.List_result2(dto.getNickname());
			for(int index=0;index<lto2.size();++index){
			list2.add(new ListDTO(lto2.get(index).getNum(), lto2.get(index).getAuthor(), lto2.get(index).getTitle(), 
						lto2.get(index).getContent(), lto2.get(index).getWriteday(), lto2.get(index).getReadcnt(), 
						lto2.get(index).getUserid(), vto.get(index).getVcontent1(), vto.get(index).getVcontent2(), 
						vto.get(index).getVcontent3(), vto.get(index).getVcontent4(), vto.get(index).getVcontent5(), 
						vto.get(index).getVimage1(), vto.get(index).getVimage2(), vto.get(index).getVimage3(), 
						vto.get(index).getVimage4(), vto.get(index).getVimage5(),
						lto2.get(index).getVotecount1(), lto2.get(index).getVotecount2(),lto2.get(index).getVotecount3(), 
						lto2.get(index).getVotecount4(), lto2.get(index).getVotecount5(), lto2.get(index).getVote_num()));

				
			}
			request.setAttribute("boardList", list2);
		}

		RequestDispatcher dis = request.getRequestDispatcher("list.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
