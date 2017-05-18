package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.BoardDTO;
import com.entity.ListDTO;
import com.entity.MemberDTO;
import com.entity.VoteDTO;
import com.service.BoardService;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/BoardListServlet")
public class BoardListServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//HttpSession session = request.getSession();
		//MemberDTO mto = (MemberDTO)session.getAttribute("login");
		BoardService service = new BoardService();
		List<ListDTO> lto = service.List_result();
		List<VoteDTO> vto = service.voteRetrieve2();
		/*	public ListDTO(int num, String author, String title, String content, String writeday, int readcnt, String userid,
			String vcontent1, String vcontent2, String vcontent3, String vcontent4, String vcontent5, String vimage1,
			String vimage2, String vimage3, String vimage4, String vimage5, int votecount1, int votecount2,
			int votecount3, int votecount4, int votecount5) {*/ 
		
		ArrayList<ListDTO> list = new  ArrayList<>();
		for(int index=0;index<lto.size();++index){
			list.add(new ListDTO(lto.get(index).getNum(), lto.get(index).getAuthor(), lto.get(index).getTitle(), 
					lto.get(index).getContent(), lto.get(index).getWriteday(), lto.get(index).getReadcnt(), 
					lto.get(index).getUserid(), vto.get(index).getVcontent1(), vto.get(index).getVcontent2(), 
					vto.get(index).getVcontent3(), vto.get(index).getVcontent4(), vto.get(index).getVcontent5(), 
					vto.get(index).getVimage1(), vto.get(index).getVimage2(), vto.get(index).getVimage3(), 
					vto.get(index).getVimage4(), vto.get(index).getVimage5(),
					lto.get(index).getVotecount1(), lto.get(index).getVotecount2(), lto.get(index).getVotecount3(), 
					lto.get(index).getVotecount4(), lto.get(index).getVotecount5()));
		}

		
		
		request.setAttribute("boardList", list);
	//	request.setAttribute("voteRetrieve", vto);
		
	//	if(dto != null){
		
	//	BoardDTO dto =  service.boardRetrieve(num);
		
/*
	
		
		
		System.out.println("list :"+num+" / "+nickname+" / dto: "+dto);
		
		///
		
		
		
		VoteDTO vto = service.voteRetrieve(Integer.parseInt(num));
		String vote_num[] = {"1","2","3","4","5"};
		int vote_count2[] = new int[5];
		HashMap<String, String> map = new HashMap<>();
		map.put("a", num);
		map.put("c", nickname.trim());
		for(int i=0;i<vote_num.length;++i){
			map.put("b", vote_num[i]); 
			vote_count2[i] = service.Voting_result3(map);
			System.out.println("count: "+vote_num[i]+" / vote_num "+vote_count2[i]);
		}
		RecordDTO rtd = service.Voting_result2(map);
		int vote_count = service.Voting_result3(map);
		System.out.println("RTD :"+rtd+" / vto ;"+vto); // ${voteRetrive[0]}
		request.setAttribute("boardRetrieve", dto);
		request.setAttribute("voteRetrieve", vto);
		request.setAttribute("voting_result2", rtd); // a,c
		request.setAttribute("voting_result3", vote_count2); // a,b
		
		*/
		
		
		///
		RequestDispatcher dis = request.getRequestDispatcher("list.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
