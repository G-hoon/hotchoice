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

import com.entity.MemberDTO;
import com.exception.CommonException;
import com.service.BoardService;
import com.service.MemberService;

/**
 * Servlet implementation class HomeController
 */
@WebServlet("/MemberUpdateController")
public class MemberUpdateController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");//나중에 필터로
		 HttpSession session = request.getSession();
		 MemberDTO mto = (MemberDTO)session.getAttribute("login");
		String passwd = request.getParameter("passwd");
		String nickname = request.getParameter("nickname");
		MemberDTO dto = new MemberDTO(mto.getUserid(), passwd, nickname, mto.getDates(), mto.getGender());
        MemberService service = new MemberService();
        HashMap<String, String> map= new HashMap<>();
		map.put("passwd", passwd);
		map.put("nickname", nickname);
		map.put("userid", mto.getUserid());
		
        String target = "";
        try {
			service.upadteMember(map);
			target = "Home"; //HomeController
		} catch (CommonException e) {
			target = "error.jsp";
			request.setAttribute("message", e.getMessage());
			request.setAttribute("link", "MemberFormController");
		}

        RequestDispatcher dis = request.getRequestDispatcher(target);
        dis.forward(request, response);
        
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
