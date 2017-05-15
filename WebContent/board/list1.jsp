
<%@page import="com.entity.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 
uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" 
uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css"  media="screen,projection"/ />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<%
List<BoardDTO> list = (List<BoardDTO>)request.getAttribute("boardList"); 
%>
<body>
 <div class="fixed-action-btn horizontal">
    <a class="btn-floating btn-large red" href="BoardWriteUIServlet">
      <i class="large material-icons">mode_edit</i>
    </a>
  </div>
        
<h1>게시판</h1>
<div class="col s6">
<table border="1" class="bordered">
   <tr>
    <td colspan="5">
     <form action="BoardSearchServlet" method="get">
     <select name="searchName">
       <option value="title">제목</option> 
       <option value="author">작성자</option> 
     </select>
     <input type="text" name="searchValue">
     <input type="submit" value="검색">
     </form>
    </td>
   </tr>
<!-- 검색 -->
  <tr>
    <th>글번호</th>
    <th>제목</th>
    <th>작성자</th>
    <th>작성일</th>
    <th>조회수</th>
  </tr>
<%  
 //    List<BoardDTO> list = pageDTO.getList();
    
    for(BoardDTO dto : list){
      int num= dto.getNum();
      String title = dto.getTitle();
      String author = dto.getAuthor();
      String writeday = dto.getWriteday();
      int readcnt = dto.getReadcnt();
    		  
%>
  <tr>
    <td><%= num %></td>
    <td><a href="BoardRetrieveServlet?num=<%=num %>"><%= title%></a></td>
    <td><%=author%></td>
    <td><%= writeday%></td>
    <td><%= readcnt%></td>
  </tr>
<%
    } //end for
%> 
<!--  
<c:forEach var="xxx" items="${pDTO.list}">
  <tr>
    <td>${xxx.num}</td>
    <td><a href="BoardRetrieveServlet?num=${xxx.num}">${xxx.title}</a></td>
    <td>${xxx.author}</td>
    <td>${xxx.writeday}</td>
    <td>${xxx.readcnt}</td>
  </tr>
 </c:forEach>
 -->
</table>
</div>
<a href="BoardWriteUIServlet">글쓰기화면</a>
</body>
</html>









