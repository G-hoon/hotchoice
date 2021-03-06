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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.js"></script> 
 <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
 <link rel="stylesheet" type="text/css" href="css/navbar.css" />
<style type="text/css">
html {
font-family: GillSans, Calibri, Trebuchet, sans-serif;
position: relative;
  overflow-x: hidden;
  -webkit-transition: all .2s ease;
  -moz-transition: all .2s ease;
  -ms-transition: all .2s ease;
  -o-transition: all .2s ease;
  transition: all .2s ease;
}
body {
 
  background-color: #ECEFF1;
  margin: 0 !important;
  padding: 0 !important;
}

.stuck {
	margin-top: 0px;
    position: fixed;
    top: 60px;
    left: 0px;
    bottom: 10px;
    width: 280px;
    overflow-y: auto;
    background-color: #eee;
}
.not-stuck {
    margin-left: 300px;
}

.xnav {
  position:relative;
  background: #232128;
  width: 100%;
  left: 0%;
  bottom: 0%;
  top: 0%;
  zoom: 1;
  -webkit-transition: all .2s ease;
  -moz-transition: all .2s ease;
  -ms-transition: all .2s ease;
  -o-transition: all .2s ease;
  transition: all .2s ease;
}


.xnav-wrapper {
  -webkit-overflow-scrolling: touch;
  height: 100%;
}

.xnav ul {
  margin: 0px;
  padding: 0px;
}

.xnav ul ul {
  padding-left: 30px;
  font-size: 5px;
}

.sf-menu li {
  float: none;
  margin: 0px!important;
  background: #232128!important;
}

.sf-menu a,
.sf-menu .first a {
  background-image: none!important;
  color: white!important;
  padding: 15px;
  margin-left: 0px;
  margin-right: 0px;
  display: block;
  border-bottom: 1px solid #3f3b49;
  -webkit-transition: all .2s linear;
  -moz-transition: all .2s linear;
  -ms-transition: all .2s linear;
  -o-transition: all .2s linear;
  transition: all .2s linear;
  text-decoration: none;
}

.sf-menu a:hover {
  background-color: #3f3b49!important;
  padding-left: 20px;
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

img.picture {
  max-width:130px;
  max-height:95px;
  width: auto;
  height: auto;
}

ul{
   list-style:none;
    padding-left:0px;
   }
a {
    color: #0060B6;
    text-decoration: none;
}


a:hover 
{
     color:#e5e5e5; 
     text-decoration:none; 
     cursor:pointer;  
}

textarea{
	resize: none;
}
</style>
<script type="text/javascript">

</script>
<form action="BoardSearchServlet" method="get">
<!-- 
<table width="100%" bgcolor="#ef5350" height="55px" style="margin-top: auto 0; table-layout: fixed; position:fixed; z-index: 3;"> 
<tr><td style="margin-left: 5px"><font size="6" color="white"><a href="BoardListServlet" style="text-decoration:none; color: inherit;">&nbsp;&nbsp;HOT CHOICE</a></font></td>
<td width="70px" ><div class="input-field col s12 m4">
<select name="searchName">
  <option value="title">제목</option> 
  <option value="author">작성자</option> 
</select></div>
</td>
<td>
<div class="input-field"><input type="text" class="search" name="searchValue" ></div>
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

 -->
 <div class="navbar-fixed">
<nav style="width: 100%;">
    <div class="nav-wrapper red lighten-1">
    
        <a href="BoardListServlet" class="brand-logo left" style="margin-left: 15px;">HOT CHOICE</a>


<ul><li>
<div style="margin-left: 250px; height: 100%;"> <select name="searchName" class="browser-default">
  <option value="title">제목</option> 
  <option value="author">작성자</option> 
</select> </div></li></ul>
        	<ul class="hide-on-med-and-down"><li>
        <div class="input-field" style="width: 400px; margin-left: 0px;">
          <input id="search" type="search" required style="opacity: 0.5;" name="searchValue" >
          <label class="label-icon" for="search"><i class="material-icons">search</i></label>
        </div>
        </li></ul>
            <ul class="right hide-on-med-and-down">
     
                <c:if test="${sessionScope.login == null }">
               <li><a href="login.html"><i class="material-icons left">settings_power</i>LOGIN</a></li>
              
                </c:if>
                <c:if test="${sessionScope.login != null }">
                <li> <a href="BoardWriteUIServlet"><i class="material-icons left">mode_edit</i>WRITE</a></li>
               <li><a href="LogoutController"><i class="material-icons left">lock_open</i>LOGOUT</a> </li>
               
                </c:if>
               
                <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
            </ul>
    </div>
    </nav>
    </div>
     </form>
<div class="blank1"></div>
<div class="stuck">
<c:if test="${sessionScope.login != null }">
<table class="menu" bgcolor="#232128" border="0" width="100%" style="margin-left: 0px; padding-left: 0px; border-collapse:collapse;">
<tr height="50px" bgcolor="#424242"><td></td></tr>
<tr><th bgcolor="#424242"><img src="img/profile.png" class="picture"></th></tr>
<tr height="70px" bgcolor="#424242"><th><font color=white size="3px">${sessionScope.login.nickname}님<br>환영합니다!</font></th></tr>
</table>
<table bgcolor="#424242" border="0" width="100%" style="margin-left: 0px; padding-left: 0px;">
<tr><td align="center"><font color="white">팔로우: 0, 팔로워: 0</font></td></tr>
</table>
</c:if>
<c:if test="${sessionScope.login == null }">
<table class="menu" bgcolor="#232128" border="0" width="100%" style="margin-left: 0px; padding-left: 0px; border-collapse:collapse;">
<tr height="30px" bgcolor="#424242"><td></td></tr>
<tr><th bgcolor="#424242"><img src="img/profile.png" width="40%" height="50%"></th></tr>
<tr height="70px" bgcolor="#424242"><th><font color=white size="3px">로그인이 필요합니다.</font></th></tr>
</table>
</c:if>

<div class="xnav">
  <div class="xnav-wrapper">
    <ul class="sf-menu">

      <li><a href="MyPageController" class="submenu" id="abc">MyPage</a></li>
      <li><a href="#" class="submenu">favorites</a></li>
      <li><a href="#" class="submenu">follows</a></li>
      <li><a href="#" class="submenu">followers</a></li>
      <li><a href="#" class="submenu">Today's HOT CHOICE</a></li>
      <c:if test="${sessionScope.login.state == 2}">
     <li><a href="#" class="submenu">ADMIN</a></li>
     </c:if>
      </ul>
      </div>
</div>

</div>



