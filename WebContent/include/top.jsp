<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 
uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" 
uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@page import="com.entity.BoardDTO"%>
<!--  <link type="text/css" rel="stylesheet" href="css/materialize2.css" />-->

<style type="text/css">


table{

}

.search{
background-color: transparent;
  border: none;
  border-bottom: 1px solid #ffdddd;
  border-radius: 0;
  outline: none;
  height: 1rem;
  width: 100%;
  font-size: 1rem;
  margin: 0 0 20px 0;
  padding: 0;
  box-shadow: none;
  box-sizing: content-box;
  transition: all 0.3s;
  height: 100%;
  font-size: 1rem;
  <!-- -->
  <!-- -->
  position: relative;
  margin-top: 1rem;
}
.search:focus{
	background-color: rgba(255, 255, 255, 0.5);
}
.blank1{
	height: 80px;
}
</style>

     <form action="BoardSearchServlet" method="get">
<table class="bordered" width="100%" bgcolor="#ef5350" height="55px" style="margin-top: auto 0; table-layout: fixed; position:fixed; z-index: 3;"> 
<tr><td style="margin-left: 5px"><font size="6" color="white"><a href="BoardListServlet" style="text-decoration:none; color: inherit;">&nbsp;&nbsp;HOT CHOICE</a></font></td>
<td width="70px"><div class="input-field col s12 m4">
<select name="searchName">
  <option value="title">제목</option> 
  <option value="author">작성자</option> 
</select></div>
</td>
<td><div class="input-field"><input type="text" class="search" name="searchValue" ></div>
</td><td align="left">&nbsp;<input  TYPE="IMAGE" src="img/search2.png" name="Submit" value="Submit" width="25px" height="25px">
</td><td align="center">
<c:if test="${sessionScope.login == null }">
<font size="6" color="white"><a href="login.html" style="text-decoration:none; color: inherit;">LOGIN</a></font>

</c:if>
<c:if test="${sessionScope.login != null }">
<font size="6" color="white"><a href="LogoutController" style="text-decoration:none; color: inherit;">LOGOUT /</a></font>&nbsp;
<font size="6" color="white"><a href="BoardWriteUIServlet" style="text-decoration:none; color: inherit;">WRITE</a></font>
</c:if>
</td></tr>
</table>
     </form>
<div class="blank1"></div>
<!-- 

<c:if test="${sessionScope.login == null }">
<a href="LoginFormController">로그인</a>
<a href="MemberFormController">회원가입</a>
<a href="BoardListServlet">게시판</a>
</c:if>
<c:if test="${sessionScope.login != null }">
 안녕하세요.${sessionScope.login.nickname}<br>
<a href="LogoutController">로그아웃</a>
<a href="MyPageController">mypage</a>
<a href="BoardListServlet">게시판</a>
</c:if>

<br>
 -->





