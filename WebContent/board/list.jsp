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
<link rel="stylesheet" type="text/css" href="css/modal.css" />
<link rel="stylesheet" type="text/css" href="css/write_button.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/js/materialize.min.js"></script> 
 <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
 
<style type="text/css">

/* */
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

ul{
   list-style:none;
    padding-left:0px;
   }
</style>
<script>

var session_login = '${sessionScope.login.nickname}';
window.onload = function() {
	var modal = document.getElementById('myModal');
	var modalImg = document.getElementById("img01");
	var captionText = document.getElementById("caption");
	$(".myImg").click(function(){
	    modal.style.display = "block";
	    modalImg.src = this.src;
	    captionText.innerHTML = this.alt;
	    var root_this = this;
	    var board_num = this.name;
	    var vote_num = $('input[value='+board_num+']').attr("id"); // 이렇게 하는 이유:
	    	//그냥 vote_num을 불러올 경우, list의 최상단 vote_num을 불러오게됨. 따라서 해당 게시판 번호(num)의 vote_num 을 불러오기위해 
	    	//두 변수를 연계함.
	    var board_author = $("input[name=nickname]#"+board_num).val();
	    //modal창 투표버튼 활성, 비활성화
	    $(".voting").children('img').each(function(){
			if(this.id == root_this.id && session_login != "" && session_login != board_author){ 
				//모달 창의 투표버튼의 id와 myImg (미리보기 이미지) id 값 비교해서 해당 값의 투표 버튼만 활성화,
				this.style.display = 'block';
				this.alt = board_num;
				var modal_vote = $(this);
				if(vote_num == this.id){ //해당 유저가 투표한 번호에 해당하는 모달창 투표버튼 이미지 투표완료로 바꾸기
					 $(this).attr("src", "img/votecomplete.jpg");
					 $(this).css('pointer-events', 'none');
				}else if(vote_num == "" ){
					$(this).attr("src", "img/voteimg.jpg");
					 $(this).css('pointer-events', 'auto');
				}else	{
					$(this).attr("src", "img/votechange.jpg");
				 	$(this).css('pointer-events', 'auto');
				}
			}else{ //나머지 투표하기 버튼 비활성화
				this.style.display = 'none';
			
			}  
	    })
	    
	})
	if(session_login == "" ){
		$(".voteimg").css("display", "none");
		   $(".fixed-action-btn").css("display", "none");
		   $("#v1, #v2, #v3, #v4, #v5").css("display", "none"); //로그인을 하지 않았을 때, 투표결과 보이지 않기.

		   console.log($(".voteimg").css("display"));
		   $('.submenu').click(function (event){
			   alert('로그인이 필요합니다.');
				event.preventDefault();   
		   })
	}

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
</script>
<!-- 로그인: 투표화면 보여주기, 글쓰기 버튼 보여주기 -->

<script>
$(document).ready(function(){
		VoteImgchange($(this));
	   $('.dropdown-button').dropdown({
		      belowOrigin: true
	    });
	
	   $("input[name=nickname]").each(function(){ //로그인 유저가 해당 글의 글쓴이가 아닌 다른 유저일 때, 투표이미지/투표결과 감춤
			if(session_login == $(this).val()){
				$('img[alt='+this.id+']'+'.voteimg').css("display", "none"); //투표이미지 감춤, this.id는 해당 list의 num값
			}
			if(session_login != $(this).val() && $(this).attr("class") == ""){ 
				//해당 글의 글쓴이랑 로그인유저랑 다를때 투표결과 감춤, 해당 글에 투표하지 않았다면 투표결과 감춤. 투표하면 바로 결과 표시(ajax)
				$("#v1."+this.id).css("display", "none");
				$("#v2."+this.id).css("display", "none");
				$("#v3."+this.id).css("display", "none");
				$("#v4."+this.id).css("display", "none");
				$("#v5."+this.id).css("display", "none");
			}
		})
});
</script>
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
	

					var vote_num = responseData.split("/");
					//t.alt = 투표하기 버튼의 alt값(해당 card의 num값)
					$('input[name=num]').attr("id",vote_num[0]);
					 $('#v1.'+t.alt).text(vote_num[1]);
					 $('#v2.'+t.alt).text(vote_num[2]);
					 $('#v3.'+t.alt).text(vote_num[3]);
					 $('#v4.'+t.alt).text(vote_num[4]);
					 $('#v5.'+t.alt).text(vote_num[5]);
					$("#v1."+t.alt).css("display", "block");
					$("#v2."+t.alt).css("display", "block");
					$("#v3."+t.alt).css("display", "block");
					$("#v4."+t.alt).css("display", "block");
					$("#v5."+t.alt).css("display", "block");

						
					$('.voteimg[alt='+t.alt+']').each (function() {
						if(vote_num[0] == this.id){
							$(this).attr("src", "img/votecomplete.jpg");
							$(t).attr("src", "img/votecomplete.jpg");
							$(t).css('pointer-events', 'none');
						 }else {
							 $(this).attr("src", "img/votechange.jpg");
							 $(this).css('pointer-events', 'auto'); 
						 }
					})
					$('.voteimg[name=modal]').each(function(){
						if(vote_num[0] == this.id){
							$(this).attr("src", "img/votecomplete.jpg");
							$(t).attr("src", "img/votecomplete.jpg");
							$(t).css('pointer-events', 'none');
						 }else {
							 $(this).attr("src", "img/votechange.jpg");
							 $(this).css('pointer-events', 'auto'); 
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
<!-- 컨텐츠 부분(고정되지 않음) -->
<div class="not-stuck">
<!-- 글쓰기 버튼 -->
<div class="fixed-action-btn horizontal">
  <a class="btn-floating btn-large red" href="BoardWriteUIServlet">
    <i class="large material-icons">mode_edit</i>
  </a>
</div>

<!-- 카드 리스트 -->
<c:forEach var="xxx" items="${boardList}" varStatus="status">
<input type="hidden" name="nickname" value="${xxx.author}" id="${xxx.num}" class="${xxx.vote_num}">
<input type="hidden" name="num" value="${xxx.num}" id="${xxx.vote_num}">
<div class="container memo" style="width: 70%">
  <div class="card">
    <div class="info">
      <a class="username">${xxx.author}</a> &nbsp;&nbsp;&nbsp;${xxx.num}<br><font size="2px">${xxx.writeday}</font>
      <input type="hidden" class="vote_num" name="vote_num" value="${xxx.vote_num}">
	
	<div class="option-button">
        <a class='dropdown-button' id='dropdown-button-${xxx.num}' data-activates='dropdown-${xxx.num}'><i class="material-icons icon-button">more_vert</i></a>
        <ul id='dropdown-${xxx.num}' class='dropdown-content'>
        <c:if test="${xxx.author == login.nickname}">
          <li><a class="edit">Edit</a></li>
          <li><a class="remove">Remove</a></li>
      	</c:if>
      	 <c:if test="${xxx.author != login.nickname}">
      	  <li><a class="remove">신고하기</a></li>
      	 </c:if>
        </ul>
      </div>

    </div><!-- end option button -->
    <div class="card-content" style="overflow: hidden;">
    <table>
    <tr><td colspan="5"><b>${xxx.title}</b></td></tr>
    <tr><td colspan="5">${xxx.content}<br></td></tr>
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
<!-- 카드 리스트 끝 -->
</div>
<!-- 컨텐츠 부분 끝 -->
</body>
</html>