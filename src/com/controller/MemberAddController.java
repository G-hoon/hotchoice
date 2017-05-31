package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.MemberDTO;
import com.exception.CommonException;
import com.service.MemberService;

/**
 * Servlet implementation class HomeController
 */
@WebServlet("/MemberAddController")
public class MemberAddController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");//나중에 필터로
		String userid = request.getParameter("userid");
		String passwd = request.getParameter("passwd");
		String nickname = request.getParameter("nickname");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String gender = request.getParameter("gender");
		String picture = request.getParameter("picture");
		String month_zero = "0";
		String day_zero="0";
		if(Integer.parseInt(month) > 9){
			month_zero = null;
		}
		if(Integer.parseInt(day) > 9){
			day_zero = null;
		}
		String dates = year+month_zero+month+day_zero+day;
		System.out.println("dates: "+dates);
		MemberDTO dto = new MemberDTO(userid, passwd, nickname.trim(), dates, gender, picture);
        MemberService service = new MemberService();
        String target = "";
        try {
			service.addMember(dto);
			target = "Home"; //HomeController
			request.setAttribute("success", "회원가입 성공");
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
