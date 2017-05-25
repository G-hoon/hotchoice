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
 <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/js/materialize.min.js"></script> 
<style type="text/css">



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

</style>
<script>
var session_login = '${sessionScope.login}';
window.onload = function() {
	var modal = document.getElementById('myModal');
	var modalImg = document.getElementById("img01");
	var captionText = document.getElementById("caption");
	console.log($("input[value=223]").attr("id"));
	
	
	$(".myImg").click(function(){
	    modal.style.display = "block";
	    modalImg.src = this.src;
	    captionText.innerHTML = this.alt;
	    var root_this = this;
	    var board_num = this.name;
	    var vote_num = $('input[value='+board_num+']').attr("id");
	 //   console.log("vnum: "+vote_num+" / "+board_num)
	    //modal창 투표버튼 활성, 비활성화
	    $(".voting").children('img').each(function(){
			if(this.id == root_this.id && session_login != ""){
				this.style.display = 'block';
				this.alt = board_num;
				console.log("vote_num : "+vote_num);
				if(vote_num == this.id){
					 $(this).attr("src", "img/votecomplete.jpg");
					 $(this).css('pointer-events', 'none');
				}else if(vote_num == "" ){
					console.log("root_this.name>0 : "+root_this.name);
					
				}else	{
					$(this).attr("src", "img/votechange.jpg");
					 $(this).css('pointer-events', 'auto');
				}
			}else{
				this.style.display = 'none';
			}
	    })
	    
	})
	$('.submenu').click(function (event){
		if(session_login == ""){
			alert('로그인이 필요합니다.');
			event.preventDefault();   
		}
	})
	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];
	
	// When the user clicks on <span> (x), close the modal
	span.onclick = function() { 
	  modal.style.display = "none";
	};
}
//

function VoteImgchange(x){

	x.find('.voteimg').each (function() {
		 if(this.name == this.id){
			 $(this).attr("src", "img/votecomplete.jpg");
			 $(this).css('pointer-events', 'none');
		 }else if(this.name.length == 0){
			 
		 }else if(this.name != this.id){
			 $(this).attr("src", "img/votechange.jpg");
			 $(this).css('pointer-events', 'auto');
		 }
	})

}
$(document).ready(function(){
	VoteImgchange($(this));

	 $('.dropdown-button').dropdown({
	      belowOrigin: true
	    });
	 
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
		console.log("num : "+ this.id);
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
				num: this.alt,
				nickname: $("input[name=nickname]").val()
			},
			success: function(responseData, status, xhr){
	//			console.log("success", responseData, status);
	
	//t.alt = 투표하기 버튼의 alt값(해당 card의 num값)
					var vote_num = responseData.split("/");
					$('input[name=num]').val(vote_num[0]);
					 $('#v1.'+t.alt).text(vote_num[1]);
					 $('#v2.'+t.alt).text(vote_num[2]);
					 $('#v3.'+t.alt).text(vote_num[3]);
					 $('#v4.'+t.alt).text(vote_num[4]);
					 $('#v5.'+t.alt).text(vote_num[5]);

					
					$('.voteimg[alt='+t.alt+']').each (function() {
						if(vote_num[0] == this.id){
							$(this).attr("src", "img/votecomplete.jpg");
							$(t).attr("src", "img/votecomplete.jpg");
							$(t).css('pointer-events', 'none');
				//			console.log("abctrue : "+this.id+" / "+$(this).css('pointer-events'));
						 }else {
							 $(this).attr("src", "img/votechange.jpg");
							 $(this).css('pointer-events', 'auto'); 
					//		 console.log("this : "+this.id+" / "+$(this).css('pointer-events'));
						 }
					})
					$('.voteimg[name=modal]').each(function(){
						if(vote_num[0] == this.id){
							$(this).attr("src", "img/votecomplete.jpg");
							$(t).attr("src", "img/votecomplete.jpg");
							$(t).css('pointer-events', 'none');
					//		console.log("modal: "+this.name+" / "+$(this).attr("src"));
						 }else {
							 $(this).attr("src", "img/votechange.jpg");
							 $(this).css('pointer-events', 'auto'); 
					//		 console.log("modal else: "+this.id);
					//		 console.log("this : "+this.id+" / "+$(this).css('pointer-events'));
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
  <div class="voting"><img src=img/voteimg.jpg class="voteimg" name="modal" id="1"><img src=img/voteimg.jpg class="voteimg" name="modal" id="2" style="display: none;">
  <img src=img/voteimg.jpg class="voteimg" name="modal" id="3" style="display: none;"><img src=img/voteimg.jpg class="voteimg" name="modal" id="4" style="display: none;">
  <img src=img/voteimg.jpg class="voteimg" name="modal" id="5" style="display: none;">
  </div>
  <div id="caption"></div>
</div>

<div class="not-stuck">

<c:forEach var="xxx" items="${boardList}" varStatus="status">
<input type="hidden" name="nickname" value="${xxx.author}">
<input type="hidden" name="num" value="${xxx.num}" id="${xxx.vote_num}">
<div class="container memo" style="width: 80%">
  <div class="card">
    <div class="info">
      <a class="username">${xxx.title}</a> &nbsp;&nbsp;&nbsp;${xxx.writeday} <input type="hidden" class="vote_num" name="vote_num" value="${xxx.vote_num}">
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
<img class="myImg" src="/project/images/${xxx.vimage1}" alt="${xxx.vcontent1}" width=105 height=100 name="${xxx.num}"  id="1"></th></tr>
</c:if>
<c:if test="${xxx.vimage1 ne null && xxx.vcontent1 ne null}">
<tr><th><img class="myImg" src="/project/images/${xxx.vimage1}" alt="${xxx.vcontent1}" width=105 height=100 name="${xxx.num}" id="1"></th></tr>
<tr><th><textarea class="vcontent"   readonly="readonly">${xxx.vcontent1}</textarea></th></tr>
</c:if>
<tr><th><img src=img/voteimg.jpg class="voteimg" name="${xxx.vote_num}" id="1" alt="${xxx.num}"></th></tr>
</table>
<div class="${xxx.num}" id="v1" align="center">${xxx.votecount1}</div>
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
<tr height="150px"><th><img class="myImg" src="/project/images/${xxx.vimage2}" alt="${xxx.vcontent2}" width=105 height=100 name="${xxx.num}"  id="2"></th></tr>
</c:if>
<c:if test="${xxx.vimage2 ne null && xxx.vcontent2 ne null}">
<tr><th><img class="myImg" src="/project/images/${xxx.vimage2}" alt="${xxx.vcontent2}" width=105 height=100 name="${xxx.num}" id="2"></th></tr>
<tr><th><textarea class="vcontent"   readonly="readonly">${xxx.vcontent2}</textarea></th></tr>
</c:if>
<tr><th><img src=img/voteimg.jpg class="voteimg" name="${xxx.vote_num}" id="2" alt="${xxx.num}"></th></tr>
</table>
<div class="${xxx.num}" id="v2" align="center">${xxx.votecount2}</div>
</div>

<c:if test = "${xxx.vcontent3 ne null || xxx.vimage3 ne null}">
<div id="c3" style="border: 1px ; float: left; width: 110px; padding:10px;">
<table bordercolor=black id="tbl">
<c:if test="${xxx.vimage3 eq null && xxx.vcontent3 ne null }">
<tr height="150px"><th><textarea style="width: 7.5em; height: 7.5em; resize: none; text-align-last: center; padding: 0px; vertical-align:middle;" readonly="readonly">${xxx.vcontent3}</textarea></th></tr>
</c:if>
<c:if test="${xxx.vimage3 ne null && xxx.vcontent3 eq null }">
<tr height="150px"><th><img class="myImg" src="/project/images/${xxx.vimage3}" alt="${xxx.vcontent3}" width=105 height=100 name="${xxx.num}"  id="3"></th></tr>
</c:if>
<c:if test="${xxx.vimage3 ne null && xxx.vcontent3 ne null}">
<tr><th><img src="/project/images/${xxx.vimage3}" class="myImg" alt="${xxx.vcontent3}" width=105 height=100 name="${xxx.num}"  id="3"></th></tr>
<tr><th><textarea class="vcontent"   readonly="readonly">${xxx.vcontent3}</textarea></th></tr>
</c:if>
<tr><th><img src=img/voteimg.jpg class="voteimg" name="${xxx.vote_num}" id="3" alt="${xxx.num}"></th></tr>
</table>
<div class="${xxx.num}" id="v3" align="center">${xxx.votecount3}</div>
</div>
</c:if>

<c:if test ="${xxx.vcontent4 ne null || xxx.vimage4 ne null}">
<div id="c4" style="border: 1px ; float: left; width: 110px; padding:10px;">
<table bordercolor=black id="tbl">
<c:if test="${xxx.vimage4 eq null && xxx.vcontent4 ne null }">
<tr height="150px"><th><textarea style="width: 7.5em; height: 7.5em; resize: none; text-align-last: center; padding: 0px; vertical-align:middle;" readonly="readonly">${xxx.vcontent4}</textarea></th></tr>
</c:if>
<c:if test="${xxx.vimage4 ne null && xxx.vcontent4 eq null }">
<tr height="150px"><th><img class="myImg" src="/project/images/${xxx.vimage4}" alt="${xxx.vcontent4}" width=105 height=100 name="${xxx.num}" id="4"></th></tr>
</c:if>
<c:if test="${xxx.vimage4 ne null && xxx.vcontent4 ne null}">
<tr><th><img src="/project/images/${xxx.vimage4}" class="myImg" alt="${xxx.vcontent4}" width=105 height=100 name="${xxx.num}" id="4"></th></tr>
<tr><th><textarea class="vcontent"   readonly="readonly">${xxx.vcontent4}</textarea></th></tr>
</c:if>
<tr><th><img src=img/voteimg.jpg class="voteimg" name="${xxx.vote_num}" id="4" alt="${xxx.num}"></th></tr>
</table>
<div class="${xxx.num}" id="v4" align="center">${xxx.votecount4}</div>
</div>
</c:if>

<c:if test = "${xxx.vcontent5 ne null || xxx.vimage5 ne null}">
<div id="c5" style="border: 1px ; float: left; width: 110px; padding:10px;">
<table bordercolor=black id="tbl">
<c:if test="${xxx.vimage5 eq null && xxx.vcontent5 ne null }">
<tr height="150px"><th><textarea style="width: 7.5em; height: 7.5em; resize: none; text-align-last: center; padding: 0px; vertical-align:middle;" readonly="readonly">${xxx.vcontent5}</textarea></th></tr>
</c:if>
<c:if test="${xxx.vimage5 ne null && xxx.vcontent5 eq null }">
<tr height="150px"><th><img class="myImg" src="/project/images/${xxx.vimage5}" alt="${xxx.vcontent5}" width=105 height=100 name="${xxx.num}" id="5"></th></tr>
</c:if>
<c:if test="${xxx.vimage5 ne null && xxx.vcontent5 ne null}">
<tr><th><img src="/project/images/${xxx.vimage5}" class="myImg" alt="${xxx.vcontent5}" width=105 height=100 name="${xxx.num}" id="5"></th></tr>
<tr><th><textarea class="vcontent"   readonly="readonly">${xxx.vcontent5}</textarea></th></tr>
</c:if>
<tr><th><img src=img/voteimg.jpg class="voteimg" name="${xxx.vote_num}" id="5" alt="${xxx.num}"></th></tr>
</table>
<div class="${xxx.num}" id="v5" align="center">${xxx.votecount5}</div>
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