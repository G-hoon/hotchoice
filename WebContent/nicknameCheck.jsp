<%@page import="com.dao.MySqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%
 System.out.println("nicknameCheck");
  String nickname = request.getParameter("nickname");
  SqlSession sess = MySqlSessionFactory.openSession();
   int result = 0;
  try{
	 result = 
     sess.selectOne("com.acorn.MemberMapper.nicknameCheck",nickname); 
  }catch(Exception e){
	  e.printStackTrace();
  }finally{
	  sess.close();
  }
  System.out.println("result:" + result);
   if(result == 0 ){
	   out.print("닉네임 사용 가능");
   }else{
	   out.print("닉네임 중복 사용불가");
   }
%>
