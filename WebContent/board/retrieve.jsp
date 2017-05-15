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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charget=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/modal.css" />
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
  margin: 0 !important;
  padding: 0 !important;
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
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
function abc(x){
	
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
	abc($(this));

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
<c:if test="${login.nickname != voting_result2.nickname}">
<script>
console.log("이 아이디는 투표 안했음");
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
				/*
				(".voting").children('img').each(function(){
				if(vote_num == this.id){
				$(this).attr("src", "img/votecomplete.jpg");
				$(this).removeAttr("onclick");
				$(this).unbind('mouseenter mouseleave');
				}else{
					$(this).attr("src", "img/votechange.jpg");
					$(this).removeAttr("onclick");
					$(this).unbind('mouseenter mouseleave');
					
					
		}
	})*/
				
			},
			error:function(error){
				console.log(error);
			}
		});
    });
});
</script>
</c:if>
<!-- voting update -->


</head>
<body>

<div id="myModal" class="modal">
  <span class="close" onclick="document.getElementsByClassName('modal').style.display='none'">&times;</span>
  <img class="modal-content" id="img01">
  <div class="voting"><img src=img/voteimg.jpg class="voteimg" id="1"><img src=img/voteimg.jpg class="voteimg" id="2" style="display: none;">
  <img src=img/voteimg.jpg class="voteimg" id="3" style="display: none;"><img src=img/voteimg.jpg class="voteimg" id="4" style="display: none;">
  <img src=img/voteimg.jpg class="voteimg" id="5" style="display: none;">
  </div>
  <div id="caption"></div>
  
</div>


<form action="BoardUpdateServlet" method="post">
<input type="hidden" name="nickname" value="${boardRetrieve.author}">
<input type="hidden" name="num" value="${boardRetrieve.num}">
 글번호:${boardRetrieve.num}&nbsp;
 작성일:${boardRetrieve.writeday}&nbsp;
 조회수:${boardRetrieve.readcnt}&nbsp;<br>
 제목<input type="text" name="title" value="${boardRetrieve.title}"><br>
 작성자: <b>${boardRetrieve.author}</b><br>
 내용<br>
 <textarea rows="3" cols="30" name="content" readonly="readonly">${boardRetrieve.content}</textarea><br>
 
 <div style="display:block; float: left; overflow: hidden">
 <!-- 각각의 투표들 -->
<div id="c1" style="border: 1px ; float: left; width: 110px; padding:10px;">
<table bordercolor=black id="tbl">
<c:if test="${voteRetrieve.vimage1 eq null && voteRetrieve.vcontent1 ne null }">
<c:if test="${voteRetrieve.vcontent1 == 'o'}">
<tr height="150px"><th><img src="img/o.jpg" alt="o" width=90 height=110></th></tr>
</c:if>
<c:if test="${voteRetrieve.vcontent1 != 'o'}">
<tr height="150px"><th><textarea class="mytext" style="width: 7.5em; height: 7.5em; resize: none; text-align-last: center; padding: 0px; display:table-cell; vertical-align:middle;" readonly="readonly">${voteRetrieve.vcontent1}</textarea></th></tr>
</c:if>
</c:if>
<c:if test="${voteRetrieve.vimage1 ne null && voteRetrieve.vcontent1 eq null }">
<tr height="150px"><th>
<img class="myImg" src="/project/images/${voteRetrieve.vimage1}" alt="${voteRetrieve.vcontent1}" width=105 height=100 id="1"></th></tr>
</c:if>
<c:if test="${voteRetrieve.vimage1 ne null && voteRetrieve.vcontent1 ne null}">
<tr><th><img class="myImg" src="/project/images/${voteRetrieve.vimage1}" alt="${voteRetrieve.vcontent1}" width=105 height=100 id="1"></th></tr>
<tr><th><textarea class="vcontent"   readonly="readonly">${voteRetrieve.vcontent1}</textarea></th></tr>
</c:if>
<tr><th><img src=img/voteimg.jpg class="voteimg" id="1"></th></tr>
</table>
<div id="v1" align="center">${voting_result3[0]}</div>
</div>
<div id="c2" style="border: 1px ; float: left; width: 110px; padding:10px;">
<table bordercolor=black id="tbl">
<c:if test="${voteRetrieve.vimage2 eq null && voteRetrieve.vcontent2 ne null }">
<c:if test="${voteRetrieve.vcontent2 == 'x'}">
<tr height="150px"><th><img src="img/x.jpg" alt="o" width=90 height=110></th></tr>
</c:if>
<c:if test="${voteRetrieve.vcontent2 != 'x'}">
<tr height="150px"><th><textarea style="width: 7.5em; height: 7.5em; resize: none; text-align-last: center; padding: 0px; display:table-cell; vertical-align:middle; "  readonly="readonly">${voteRetrieve.vcontent2}</textarea></th></tr>
</c:if>
</c:if>
<c:if test="${voteRetrieve.vimage2 ne null && voteRetrieve.vcontent2 eq null }">
<tr height="150px"><th><img class="myImg" src="/project/images/${voteRetrieve.vimage2}" alt="${voteRetrieve.vcontent2}" width=105 height=100 id="1"></th></tr>
</c:if>
<c:if test="${voteRetrieve.vimage2 ne null && voteRetrieve.vcontent2 ne null}">
<tr><th><img class="myImg" src="/project/images/${voteRetrieve.vimage2}" alt="${voteRetrieve.vcontent2}" width=105 height=100 id="2"></th></tr>
<tr><th><textarea class="vcontent"   readonly="readonly">${voteRetrieve.vcontent2}</textarea></th></tr>
</c:if>
<tr><th><img src=img/voteimg.jpg class="voteimg" id="2"></th></tr>
</table>
<div id="v2" align="center">${voting_result3[1]}</div>
</div>

<c:if test = "${voteRetrieve.vcontent3 ne null || voteRetrieve.vimage3 ne null}">
<div id="c3" style="border: 1px ; float: left; width: 110px; padding:10px;">
<table bordercolor=black id="tbl" height="200px">
<c:if test="${voteRetrieve.vimage3 eq null && voteRetrieve.vcontent3 ne null }">
<tr height="150px"><th><textarea style="width: 7.5em; height: 7.5em; resize: none; text-align-last: center; padding: 0px; vertical-align:middle;" readonly="readonly">${voteRetrieve.vcontent3}</textarea></th></tr>
</c:if>
<c:if test="${voteRetrieve.vimage3 ne null && voteRetrieve.vcontent3 eq null }">
<tr height="150px"><th><img class="myImg" src="/project/images/${voteRetrieve.vimage3}" alt="${voteRetrieve.vcontent3}" width=105 height=100 id="1"></th></tr>
</c:if>
<c:if test="${voteRetrieve.vimage3 ne null && voteRetrieve.vcontent3 ne null}">
<tr><th><img src="/project/images/${voteRetrieve.vimage3}" class="myImg" alt="${voteRetrieve.vcontent3}" width=105 height=100 id="3"></th></tr>
<tr><th><textarea class="vcontent"   readonly="readonly">${voteRetrieve.vcontent3}</textarea></th></tr>
</c:if>
<tr><th><img src=img/voteimg.jpg class="voteimg" id="3"></th></tr>
</table>
<div id="v3" align="center">${voting_result3[2]}</div>
</div>
</c:if>

<c:if test ="${voteRetrieve.vcontent4 ne null || voteRetrieve.vimage4 ne null}">
<div id="c4" style="border: 1px ; float: left; width: 110px; padding:10px;">
<table bordercolor=black id="tbl" height="200px">
<c:if test="${voteRetrieve.vimage4 eq null && voteRetrieve.vcontent4 ne null }">
<tr height="150px"><th><textarea style="width: 7.5em; height: 7.5em; resize: none; text-align-last: center; padding: 0px; vertical-align:middle;" readonly="readonly">${voteRetrieve.vcontent4}</textarea></th></tr>
</c:if>
<c:if test="${voteRetrieve.vimage4 ne null && voteRetrieve.vcontent4 eq null }">
<tr height="150px"><th><img class="myImg" src="/project/images/${voteRetrieve.vimage4}" alt="${voteRetrieve.vcontent4}" width=105 height=100 id="1"></th></tr>
</c:if>
<c:if test="${voteRetrieve.vimage4 ne null && voteRetrieve.vcontent4 ne null}">
<tr><th><img src="/project/images/${voteRetrieve.vimage4}" class="myImg" alt="${voteRetrieve.vcontent4}" width=105 height=100 id="4"></th></tr>
<tr><th><textarea class="vcontent"   readonly="readonly">${voteRetrieve.vcontent4}</textarea></th></tr>
</c:if>
<tr><th><img src=img/voteimg.jpg class="voteimg" id="4"></th></tr>
</table>
<div id="v4" align="center">${voting_result3[3]}</div>
</div>
</c:if>

<c:if test = "${voteRetrieve.vcontent5 ne null || voteRetrieve.vimage5 ne null}">
<div id="c5" style="border: 1px ; float: left; width: 110px; padding:10px;">
<table bordercolor=black id="tbl" height="200px">
<c:if test="${voteRetrieve.vimage5 eq null && voteRetrieve.vcontent5 ne null }">
<tr height="150px"><th><textarea style="width: 7.5em; height: 7.5em; resize: none; text-align-last: center; padding: 0px; vertical-align:middle;" readonly="readonly">${voteRetrieve.vcontent5}</textarea></th></tr>
</c:if>
<c:if test="${voteRetrieve.vimage5 ne null && voteRetrieve.vcontent5 eq null }">
<tr height="150px"><th><img class="myImg" src="/project/images/${voteRetrieve.vimage5}" alt="${voteRetrieve.vcontent5}" width=105 height=100 id="1"></th></tr>
</c:if>
<c:if test="${voteRetrieve.vimage5 ne null && voteRetrieve.vcontent5 ne null}">
<tr><th><img src="/project/images/${voteRetrieve.vimage5}" class="myImg" alt="${voteRetrieve.vcontent5}" width=105 height=100 id="5"></th></tr>
<tr><th><textarea class="vcontent"   readonly="readonly">${voteRetrieve.vcontent5}</textarea></th></tr>
</c:if>
<tr><th><img src=img/voteimg.jpg class="voteimg" id="5"></th></tr>
</table>
<div id="v5" align="center">${voting_result3[4]}</div>
</div>
</c:if>
</div>

<br>
<div style="display:block; clear:both">
 <c:if test="${login.userid != boardRetrieve.userid }">
   투표를 하시면 결과를 볼 수 있습니다.
</c:if>
 <c:if test="${login.userid == boardRetrieve.userid }">
   결과보기
</c:if>
 <c:if test="${login.userid == boardRetrieve.userid }">
   <input type="button"  name="버튼" value="수정하기" onclick="location.href=BoardUpdateServlet">
   <a href="BoardDeleteServlet?num=${boardRetrieve.num}">삭제</a>
</c:if>
</div>
</form>

 <a href="BoardListServlet">목록보기</a>
</body>
</html>



