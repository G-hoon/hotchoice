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
    top: 50px;
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
.blank1{
	height: 90px;
}
img.picture {
  max-width:130px;
  max-height:95px;
  width: auto;
  height: auto;
}
nav.nav-extended .nav-wrapper {
  min-height: 56px;
  height: auto;
}
nav .nav-wrapper {
  position: relative;
  height: 100%;
}
 nav.nav-extended .nav-wrapper {
    min-height: 64px;
  }
  nav, nav .nav-wrapper i, nav a.button-collapse, nav a.button-collapse i {
    height: 64px;
    line-height: 64px;
  }
  .material-icons {
  text-rendering: optimizeLegibility;
  -webkit-font-feature-settings: 'liga';
     -moz-font-feature-settings: 'liga';
          font-feature-settings: 'liga';
}
nav i,
nav [class^="mdi-"], nav [class*="mdi-"],
nav i.material-icons {
  display: block;
  font-size: 24px;
  height: 56px;
  line-height: 56px;
}
nav .brand-logo {
  position: absolute;
  color: #fff;
  display: inline-block;
  font-size: 2.1rem;
  padding: 0;
  white-space: nowrap;
}

nav .brand-logo.center {
  left: 50%;
  -webkit-transform: translateX(-50%);
          transform: translateX(-50%);
}

@media only screen and (max-width: 992px) {
  nav .brand-logo {
    left: 50%;
    -webkit-transform: translateX(-50%);
            transform: translateX(-50%);
  }
  nav .brand-logo.left, nav .brand-logo.right {
    padding: 0;
    -webkit-transform: none;
            transform: none;
  }
  nav .brand-logo.left {
    left: 0.5rem;
  }
  nav .brand-logo.right {
    right: 0.5rem;
    left: auto;
  }
}

nav .brand-logo.right {
  right: 0.5rem;
  padding: 0;
}

nav .brand-logo i,
nav .brand-logo [class^="mdi-"], nav .brand-logo [class*="mdi-"],
nav .brand-logo i.material-icons {
  float: left;
  margin-right: 15px;
}

nav .nav-title {
  display: inline-block;
  font-size: 32px;
  padding: 28px 0;
}

nav ul {
  margin: 0;
}

nav ul li {
  transition: background-color .3s;
  float: left;
  padding: 0;
}

nav ul li.active {
  background-color: rgba(0, 0, 0, 0.1);
}

nav ul a {
  transition: background-color .3s;
  font-size: 1rem;
  color: #fff;
  display: block;
  padding: 0 15px;
  cursor: pointer;
}

nav ul a.btn, nav ul a.btn-large, nav ul a.btn-large, nav ul a.btn-flat, nav ul a.btn-floating {
  margin-top: -2px;
  margin-left: 15px;
  margin-right: 15px;
}

nav ul a.btn > .material-icons, nav ul a.btn-large > .material-icons, nav ul a.btn-large > .material-icons, nav ul a.btn-flat > .material-icons, nav ul a.btn-floating > .material-icons {
  height: inherit;
  line-height: inherit;
}

nav ul a:hover {
  background-color: rgba(0, 0, 0, 0.1);
}

nav ul.left {
  float: left;
}

nav form {
  height: 100%;
}

nav .input-field {
  margin: 0;
  height: 100%;
}

nav .input-field input {
  height: 100%;
  font-size: 1.2rem;
  border: none;
  padding-left: 2rem;
}

nav .input-field input:focus, nav .input-field input[type=text]:valid, nav .input-field input[type=password]:valid, nav .input-field input[type=email]:valid, nav .input-field input[type=url]:valid, nav .input-field input[type=date]:valid {
  border: none;
  box-shadow: none;
}

nav .input-field label {
  top: 0;
  left: 0;
}

nav .input-field label i {
  color: rgba(255, 255, 255, 0.7);
  transition: color .3s;
}

nav .input-field label.active i {
  color: #fff;
}

.navbar-fixed {
  position: relative;
  height: 56px;
  z-index: 997;
}

.navbar-fixed nav {
  position: fixed;
}

@media only screen and (min-width: 601px) {
  nav.nav-extended .nav-wrapper {
    min-height: 64px;
  }
  nav, nav .nav-wrapper i, nav a.button-collapse, nav a.button-collapse i {
    height: 64px;
    line-height: 64px;
  }
  .navbar-fixed {
    height: 64px;
  }
}
.material-icons {
  color: white;
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
    <div class="nav-wrapper red lighten-1 ">
        <a class="brand-logo center">HOT CHOICE</a>

        <ul>
            <li><a><i class="material-icons">search</i></a></li>
        </ul>

        <div class="right">
            <ul>
                <li>
                    <a><i class="material-icons">vpn_key</i></a>
                </li>
                <li>
                    <a><i class="material-icons">lock_open</i></a>
                </li>
            </ul>
        </div>
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



