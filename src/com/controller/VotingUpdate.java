package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.MemberDTO;
import com.entity.RecordDTO;
import com.service.BoardService;

/**
 * Servlet implementation class Voting
 */
@WebServlet("/VotingUpdate")
public class VotingUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		//System.out.println("Dto :"+dto);
		String target = "";
		if(dto != null){
		String nickname = dto.getNickname();
		String vote_num = request.getParameter("v1");
		String num = request.getParameter("num");
		System.out.println(nickname+" / "+vote_num+ " / "+num);
		HashMap<String, String> map = new HashMap<>();
		BoardService service = new BoardService();
		
		String vote_num1[] = {"1","2","3","4","5"};
		int vote_count2[] = new int[5];
		/*   <update id="Voting_Update" parameterType="hashmap">
	    update vote_record
	    set vote_num=#{b} where num = #{a}
	 </update>

	*/		
		map.put("a", num);
		map.put("b", vote_num);
		map.put("c", nickname.trim());
		service.Voting_Update(map);
		
	
		RecordDTO rtd1 = service.Voting_result2(map);
		for(int i=0;i<vote_num1.length;++i){
			map.put("b", vote_num1[i]); 
			vote_count2[i] = service.Voting_result3(map);
		//	System.out.println("count: "+vote_num1[i]+" / vote_num "+vote_count2[i]);
		}
		
		response.setContentType("abc.jsp;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(rtd1.getVote_num()+"/");
		out.print(vote_count2[0]+"/");
		out.print(vote_count2[1]+"/");
		out.print(vote_count2[2]+"/");
		out.print(vote_count2[3]+"/");
		out.print(vote_count2[4]);
		

		}


	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
