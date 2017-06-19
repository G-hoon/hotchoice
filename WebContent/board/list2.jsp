
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

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 

<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/js/materialize.min.js"></script> 
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/materialize.css"  media="screen,projection" />

<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css"  media="screen,projection"/>

<!-- 
<link rel="stylesheet" type="text/css" href="../css/card.css" /> -->
<script type="text/javascript">
$(document).ready(function() {
	console.log("1");
	
	   $('.dropdown-button').dropdown({
	      belowOrigin: true
	    });

        //or by click on trigger
          $('.modal-trigger').leanModal();
	      console.log($('.card').css('z-index'));
	      console.log($('.dropdown-button').css('z-index'));

	      console.log($('.dropdown-content').css('z-index'));
	})
</script>
<style>
body {
 
  background-color: #ECEFF1;
  margin: 0 !important;
  padding: 0 !important;
}
.memo .info {
  font-size: 18px;
  padding: 20px 20px 0px 20px;
  color: #90A4AE;
}

.memo .info .username {
  color: #263238;
  font-weight: bold;
  cursor: pointer;
}

.memo .card-content {
  word-wrap: break-word;
}

.memo .option-button {
    position: absolute;
    right: 20px;
    top: 20px;
}

.icon-button {
  color: #9e9e9e;
  cursor: pointer;
}

.icon-button:hover {
  color: #C5C5C5;
}

.icon-button:hover {
  color: #C5C5C5;
}

.icon-button:active {
  color: #ff9800;
}

.memo .card-content {
  font-size: 18px;
}

.memo .footer {
  border-top: 1px solid #ECECEC;
  height: 45px;
}

.star {
  position: relative;
  left: 15px;
  top: 11px;
}

.star-count {
  position: relative;
  left: 20px;
  top: 4px;
  font-size: 13px;
  font-weight: bold;
  color: #777;
}
.wrapper {
    margin-top: 20px;
}
.write .materialize-textarea {
    padding: 0px;
    padding-bottom: 36px;
    margin-bottom: 0px;
    font-size: 18px;
}

.write .card-content {
    padding-bottom: 10px;
}

.write .card-action {
    text-align: right;
}

</style>
<body>
        <a class="waves-effect waves-light btn modal-trigger" href="#modal1">Click to open modal</a>
        <div id="modal1" class="modal" >
          <div class="modal-content">
            <h4>Modal Header</h4>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>
          </div>
          <div class="modal-footer">
            <a href="#!" class="modal-action modal-close waves-effect waves-red btn-flat ">Disagree</a>
            <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">Agree</a>
          </div>
        </div>
  <div class="fixed-action-btn horizontal">
    <a class="btn-floating btn-large red">
      <i class="large material-icons">mode_edit</i>
    </a>
  </div>
<div>Header</div>
<nav>
    <div class="nav-wrapper red lighten-1 ">
        <a class="brand-logo center">HOT CHOICE</a>

        <ul>
            <li><a><i class="material-icons">search</i></a></li>
        </ul>


            <ul id="nav-mobile" class="right hide-on-med-and-down">
                <li>
                    <a><i class="material-icons">vpn_key</i></a>
                </li>
                <li>
                    <a><i class="material-icons">lock_open</i></a>
                </li>
            </ul>

    </div>
</nav>

<div class="container memo">
  <div class="card">
    <div class="info">
      <a class="username">Writer</a> wrote a log · 1 seconds ago · Edited 1 second ago
      <div class="option-button">

        <a class='dropdown-button' id='dropdown-button-id' data-activates='dropdown-id'><i class="material-icons icon-button">more_vert</i></a>
        <ul id='dropdown-id' class='dropdown-content'>
          <li><a>Edit</a></li>
          <li><a>Remove</a></li>
        </ul>
      </div>
    </div>
    <div class="card-content">
      Contents
    </div>
    <div class="footer">
      <i class="material-icons log-footer-icon star icon-button">star</i><span class="star-count">0</span>
    </div>
  </div>
</div>
 <div class="container write">
<div class="card">
    <div class="card-content">
        <textarea class="materialize-textarea" placeholder="Write down your memo"></textarea>
    </div>
    <div class="card-action">
        <a>POST</a>
    </div>
</div>
</div>
</body>
</html>









