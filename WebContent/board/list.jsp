<%@page import="com.entity.BoardDTO"%>
<%@page import="com.entity.VoteDTO"%>
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
<link rel="stylesheet" type="text/css" href="css/card.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
 <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
textarea
{
    resize: none;
}
.vcontent
{
	width: 7.5em;
	height: 3em;
    resize: none;
   text-align-last: center; 
}

.myImg {
    border-radius: 5px;
    cursor: pointer;
    transition: 0.3s;


}

.voteimg:hover {
	opacity: 0.7;
  -webkit-filter: invert(.8);
  filter: invert(.8);
}
.voteimg {
    border-radius: 6px;
    cursor: pointer;
    transition: 0.3s;
}

.myImg:hover {opacity: 0.7;}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.9); /* Black w/ opacity */

}

/* Modal Content (image) */
.modal-content {
    margin: auto;
    display: block;
    width: auto;
    max-width: 800px;
	max-height: calc(100vh - 155px);
}

/* Caption of Modal Image */
#caption {
    margin: auto;
    display: block;
    width: 80%;
    max-width: 700px;
    text-align: center;
    color: #ccc;
    padding: 10px 0;
    height: 150px;
}
div.voting img {
    margin: auto;
    display: block;
    padding: 10px 0;
    transition: 0.3s;
    
}
/* Add Animation */
.modal-content, .voteimg, #caption {    
    -webkit-animation-name: zoom;
    -webkit-animation-duration: 0.6s;
    animation-name: zoom;
    animation-duration: 0.6s;
}


@-webkit-keyframes zoom {
    from {-webkit-transform:scale(0)} 
    to {-webkit-transform:scale(1)}
}

@keyframes zoom {
    from {transform:scale(0)} 
    to {transform:scale(1)}
}

/* The Close Button */
.close {
    position: absolute;
    top: 15px;
    right: 35px;
    color: #f1f1f1;
    font-size: 40px;
    font-weight: bold;
    transition: 0.3s;
}

.close:hover,
.close:focus {
    color: #bbb;
    text-decoration: none;
    cursor: pointer;
}

/* 100% Image Width on Smaller Screens */
@media only screen and (max-width: 700px){
    .modal-content {
        width: 100%;
    }
}


</style>
<script>
window.onload = function() {
	var modal = document.getElementById('myModal');
	var modalImg = document.getElementById("img01");
	var captionText = document.getElementById("caption");
	
	$(".myImg").click(function(){
	    modal.style.display = "block";
	    modalImg.src = this.src;
	    captionText.innerHTML = this.alt;
	    var t = this.id;
	    $(".voting").children('img').each(function(){
			if(this.id == t){
				this.style.display = 'block';
			}else{
				this.style.display = 'none';
			}
	    })
	    
	})
	
	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];
	
	// When the user clicks on <span> (x), close the modal
	span.onclick = function() { 
	  modal.style.display = "none";
	};
}
var vote_num = '<c:out value="${voting_result2.vote_num}"/>';
function VoteImgchange(x){
	console.log(x.find('.voteimg'));
	x.find('.voteimg').each (function() {
		 if(vote_num == this.id){
			 $(this).attr("src", "img/votecomplete.jpg");
			 $(this).removeAttr("onclick");
			 $(this).unbind('mouseenter mouseleave');
		 }else if(vote_num.length == 0){
			 
		 }else if(vote_num != this.id){
			 $(this).attr("src", "img/votechange.jpg");
		 }
	})
	$(".voting").children('img').each(function(){
			if(vote_num == this.id){
			$(this).attr("src", "img/votecomplete.jpg");
			$(this).removeAttr("onclick");
			$(this).unbind('mouseenter mouseleave');
			}else if(vote_num.length == 0){
				
			}else{
				$(this).attr("src", "img/votechange.jpg");
				$(this).removeAttr("onclick");
				$(this).unbind('mouseenter mouseleave');
			//	$(this).style.display = 'block';
			}
		})
}
$(document).ready(function(){
	VoteImgchange($(this));
});
</script>
 <c:if test="${login.userid == boardRetrieve.userid || login.userid == null}">
   <script>
   $(document).ready(function(){
	    $(".voteimg").css("display", "none");
	});
   </script>
</c:if>
<!-- 이 유저가 투표를 안했다면, 투표하게끔 -->
<script>
$(document).ready(function() {
	
    $('.voteimg').click(function (event)
    {

    	var t = this;
    	var url_link;
    	if(event.target.getAttribute("src") == "img/voteimg.jpg"){
    		url_link = "Voting";
    	}else if(event.target.getAttribute("src") == "img/votechange.jpg"){
    		url_link = "VotingUpdate";
    	}

    	$.ajax({
			type:"get",
			url:url_link,
		//	dataType:"json",
			data:{
				v1: this.id,
				num: $("input[name=num]").val(),
				nickname: $("input[name=nickname]").val()
			},
			success: function(responseData, status, xhr){
//				console.log("success", responseData, status);
				var vote_num = responseData.split("/");
				 $('#v1').text(vote_num[1]);
				 $('#v2').text(vote_num[2]);
				 $('#v3').text(vote_num[3]);
				 $('#v4').text(vote_num[4]);
				 $('#v5').text(vote_num[5]);
				$('.voteimg').each (function() {
				if(vote_num[0] == this.id){
					$(this).attr("src", "img/votecomplete.jpg");
					$(t).attr("src", "img/votecomplete.jpg");
					$(t).removeAttr("onclick");
					$(t).unbind('mouseenter mouseleave click');
				 }else {
					 $(this).attr("src", "img/votechange.jpg");
					 $(this).bind('mouseenter mouseleave click');
					 $(this).attr("onclick");
				 }
				})
			},
			error:function(error){
				console.log(error);
			}
		});
    });
});
</script>
</head>
<body>
<!--  z-index: 3; position: absolute; -->
<div id="myModal" class="modal" style="z-index: 999;">
  <span class="close" onclick="document.getElementsByClassName('modal').style.display='none'" style="z-index: 999">&times;</span>
  <img class="modal-content" id="img01" >
  <div class="voting"><img src=img/voteimg.jpg class="voteimg" id="1"><img src=img/voteimg.jpg class="voteimg" id="2" style="display: none;">
  <img src=img/voteimg.jpg class="voteimg" id="3" style="display: none;"><img src=img/voteimg.jpg class="voteimg" id="4" style="display: none;">
  <img src=img/voteimg.jpg class="voteimg" id="5" style="display: none;">
  </div>
  <div id="caption"></div>
</div>


<div class="stuck">
<table class="menu" bgcolor="#232128" border="0" width="100%" style="margin-left: 0px; padding-left: 0px; border-collapse:collapse;">
<tr height="30px" bgcolor="#424242"><td></td></tr>
<tr><th bgcolor="#424242"><img src="img/profile.png" width="40%" height="50%"></th></tr>
<tr height="70px" bgcolor="#424242"><th><font color=white size="3px">${sessionScope.login.userid}님<br>환영합니다!</font></th></tr>
</table>
<table bgcolor="#424242" border="0" width="100%" style="margin-left: 0px; padding-left: 0px;">
<tr><td align="center"><font color="white">팔로우: 0, 팔로워: 0</font></td></tr>
</table>

<div class="xnav">
  <div class="xnav-wrapper">
    <ul class="sf-menu">
      <li><a href="#">MyPage</a></li>
      <li><a href="#">favorites</a></li>
      <li><a href="#">follows</a></li>
      <li><a href="#">followers</a></li>
      <li><a href="#">Today's HOT CHOICE</a></li></ul>
      </div>
      </div>
</div>
<div class="not-stuck">
  <!-- 
  <tr>
    <td>${xxx.num}</td>
    <td><a href="BoardRetrieveServlet?num=${xxx.num}">${xxx.title}</a></td>
    <td>${xxx.author}</td>
    <td>${xxx.writeday}</td>
    <td>${xxx.readcnt}</td>
  </tr> -->
<c:forEach var="xxx" items="${boardList}">
<input type="hidden" name="nickname" value="${xxx.author}">
<input type="hidden" name="num" value="${xxx.num}">
<div class="container memo" style="width: 80%">
  <div class="card">
    <div class="info">
      <a class="username">${xxx.title}</a>${xxx.num} &nbsp;&nbsp;&nbsp;${xxx.writeday}
      <div class="option-button">
        <a class='dropdown-button' id='dropdown-button-id' data-activates='dropdown-id'><i class="material-icons icon-button">more_vert</i></a>
        <ul id='dropdown-id' class='dropdown-content'>
          <li><a>Edit</a></li>
          <li><a>Remove</a></li>
        </ul>
      </div>
    </div>
    <div class="card-content" style="overflow: hidden;">
    <table>
    <tr><td colspan="5"><a href="BoardRetrieveServlet?num=${xxx.num}"  style="text-decoration:none; color: inherit;">${xxx.content}</a><br></td></tr>
    </table>
  
    <div id="c1" style="border: 1px; float:left; width: 110px; padding:10px;">
         <table bordercolor=black id="tbl">
<c:if test="${xxx.vimage1 eq null && xxx.vcontent1 ne null }">
<c:if test="${xxx.vcontent1 == 'o'}">
<tr height="150px"><th><img src="img/o.jpg" alt="o" width=90 height=110></th></tr>
</c:if>
<c:if test="${xxx.vcontent1 != 'o'}">
<tr height="150px"><th><textarea class="mytext" style="width: 7.5em; height: 7.5em; resize: none; text-align-last: center; padding: 0px; display:table-cell; vertical-align:middle;" readonly="readonly">${xxx.vcontent1}</textarea></th></tr>
</c:if>
</c:if>
<c:if test="${xxx.vimage1 ne null && xxx.vcontent1 eq null }">
<tr height="150px"><th>
<img class="myImg" src="/project/images/${xxx.vimage1}" alt="${xxx.vcontent1}" width=105 height=100 id="1"></th></tr>
</c:if>
<c:if test="${xxx.vimage1 ne null && xxx.vcontent1 ne null}">
<tr><th><img class="myImg" src="/project/images/${xxx.vimage1}" alt="${xxx.vcontent1}" width=105 height=100 id="1"></th></tr>
<tr><th><textarea class="vcontent"   readonly="readonly">${xxx.vcontent1}</textarea></th></tr>
</c:if>
<tr><th><img src=img/voteimg.jpg class="voteimg" id="1"></th></tr>
</table>
<div id="v1" align="center">${xxx.votecount1}</div>
</div>
    
    
<div id="c2" style="border: 1px ; float:left; width: 110px; padding:10px;">
<table bordercolor=black id="tbl">
<c:if test="${xxx.vimage2 eq null && xxx.vcontent2 ne null }">
<c:if test="${xxx.vcontent2 == 'x'}">
<tr height="150px"><th><img src="img/x.jpg" alt="o" width=90 height=110></th></tr>
</c:if>
<c:if test="${xxx.vcontent2 != 'x'}">
<tr height="150px"><th><textarea style="width: 7.5em; height: 7.5em; resize: none; text-align-last: center; padding: 0px; display:table-cell; vertical-align:middle; "  readonly="readonly">${xxx.vcontent2}</textarea></th></tr>
</c:if>
</c:if>
<c:if test="${xxx.vimage2 ne null && xxx.vcontent2 eq null }">
<tr height="150px"><th><img class="myImg" src="/project/images/${xxx.vimage2}" alt="${xxx.vcontent2}" width=105 height=100 id="1"></th></tr>
</c:if>
<c:if test="${xxx.vimage2 ne null && xxx.vcontent2 ne null}">
<tr><th><img class="myImg" src="/project/images/${xxx.vimage2}" alt="${xxx.vcontent2}" width=105 height=100 id="2"></th></tr>
<tr><th><textarea class="vcontent"   readonly="readonly">${xxx.vcontent2}</textarea></th></tr>
</c:if>
<tr><th><img src=img/voteimg.jpg class="voteimg" id="2"></th></tr>
</table>
<div id="v2" align="center">${xxx.votecount2}</div>
</div>

<c:if test = "${xxx.vcontent3 ne null || xxx.vimage3 ne null}">
<div id="c3" style="border: 1px ; float: left; width: 110px; padding:10px;">
<table bordercolor=black id="tbl">
<c:if test="${xxx.vimage3 eq null && xxx.vcontent3 ne null }">
<tr height="150px"><th><textarea style="width: 7.5em; height: 7.5em; resize: none; text-align-last: center; padding: 0px; vertical-align:middle;" readonly="readonly">${xxx.vcontent3}</textarea></th></tr>
</c:if>
<c:if test="${xxx.vimage3 ne null && xxx.vcontent3 eq null }">
<tr height="150px"><th><img class="myImg" src="/project/images/${xxx.vimage3}" alt="${xxx.vcontent3}" width=105 height=100 id="1"></th></tr>
</c:if>
<c:if test="${xxx.vimage3 ne null && xxx.vcontent3 ne null}">
<tr><th><img src="/project/images/${xxx.vimage3}" class="myImg" alt="${xxx.vcontent3}" width=105 height=100 id="3"></th></tr>
<tr><th><textarea class="vcontent"   readonly="readonly">${xxx.vcontent3}</textarea></th></tr>
</c:if>
<tr><th><img src=img/voteimg.jpg class="voteimg" id="3"></th></tr>
</table>
<div id="v3" align="center">${xxx.votecount3}</div>
</div>
</c:if>

<c:if test ="${xxx.vcontent4 ne null || xxx.vimage4 ne null}">
<div id="c4" style="border: 1px ; float: left; width: 110px; padding:10px;">
<table bordercolor=black id="tbl">
<c:if test="${xxx.vimage4 eq null && xxx.vcontent4 ne null }">
<tr height="150px"><th><textarea style="width: 7.5em; height: 7.5em; resize: none; text-align-last: center; padding: 0px; vertical-align:middle;" readonly="readonly">${xxx.vcontent4}</textarea></th></tr>
</c:if>
<c:if test="${xxx.vimage4 ne null && xxx.vcontent4 eq null }">
<tr height="150px"><th><img class="myImg" src="/project/images/${xxx.vimage4}" alt="${xxx.vcontent4}" width=105 height=100 id="1"></th></tr>
</c:if>
<c:if test="${xxx.vimage4 ne null && xxx.vcontent4 ne null}">
<tr><th><img src="/project/images/${xxx.vimage4}" class="myImg" alt="${xxx.vcontent4}" width=105 height=100 id="4"></th></tr>
<tr><th><textarea class="vcontent"   readonly="readonly">${xxx.vcontent4}</textarea></th></tr>
</c:if>
<tr><th><img src=img/voteimg.jpg class="voteimg" id="4"></th></tr>
</table>
<div id="v4" align="center">${xxx.votecount4}</div>
</div>
</c:if>

<c:if test = "${xxx.vcontent5 ne null || xxx.vimage5 ne null}">
<div id="c5" style="border: 1px ; float: left; width: 110px; padding:10px;">
<table bordercolor=black id="tbl">
<c:if test="${xxx.vimage5 eq null && xxx.vcontent5 ne null }">
<tr height="150px"><th><textarea style="width: 7.5em; height: 7.5em; resize: none; text-align-last: center; padding: 0px; vertical-align:middle;" readonly="readonly">${xxx.vcontent5}</textarea></th></tr>
</c:if>
<c:if test="${xxx.vimage5 ne null && xxx.vcontent5 eq null }">
<tr height="150px"><th><img class="myImg" src="/project/images/${xxx.vimage5}" alt="${xxx.vcontent5}" width=105 height=100 id="1"></th></tr>
</c:if>
<c:if test="${xxx.vimage5 ne null && xxx.vcontent5 ne null}">
<tr><th><img src="/project/images/${xxx.vimage5}" class="myImg" alt="${xxx.vcontent5}" width=105 height=100 id="5"></th></tr>
<tr><th><textarea class="vcontent"   readonly="readonly">${xxx.vcontent5}</textarea></th></tr>
</c:if>
<tr><th><img src=img/voteimg.jpg class="voteimg" id="5"></th></tr>
</table>
<div id="v5" align="center">${xxx.votecount5}</div>
</div>
</c:if>

    </div>
    <div class="footer">
      <i class="material-icons log-footer-icon star icon-button">star</i><span class="star-count">0</span>
    </div>
  </div>
</div>
</c:forEach>
</div>

</body>
</html>