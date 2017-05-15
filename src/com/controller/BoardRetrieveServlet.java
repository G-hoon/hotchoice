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

import com.entity.BoardDTO;
import com.entity.MemberDTO;
import com.entity.RecordDTO;
import com.entity.VoteDTO;
import com.service.BoardService;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/BoardRetrieveServlet")
public class BoardRetrieveServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDTO mto = (MemberDTO)session.getAttribute("login");
		String num = request.getParameter("num");
		String nickname = mto.getNickname();
		System.out.println(num+" / "+nickname);
		BoardService service = new  BoardService();
		BoardDTO dto =  service.boardRetrieve(Integer.parseInt(num));
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
		//

	/*	ArrayList<Integer> vto = new ArrayList<>();
		vto.add(dto.getNum());
		service.searchMulti(vto);*/

		RequestDispatcher dis = request.getRequestDispatcher("retrieve.jsp");
		dis.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
