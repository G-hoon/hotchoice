<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" 
uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 
uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" 
uri="http://java.sun.com/jsp/jstl/functions" %>    
<script type="text/javascript" src="js/check.js?v=2"></script>
<style>
div.tab, div.myinfo {
	width: 480px;
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
div.tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
    font-size: 17px;
}

/* Change background color of buttons on hover */
div.tab button:hover {
    background-color: #ddd;
}

/* Create an active/current tablink class */
div.tab button.active {
    background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
    display: none;
    padding: 6px 12px;
    -webkit-animation: fadeEffect 1s;
    animation: fadeEffect 1s;
}

/* Fade in tabs */
@-webkit-keyframes fadeEffect {
    from {opacity: 0;}
    to {opacity: 1;}
}

@keyframes fadeEffect {
    from {opacity: 0;}
    to {opacity: 1;}
}
td{
	padding: 7px;
}
</style>
<script>

var db_dates = '${myPage.dates}';
var gender = '${myPage.gender}';
var nickname = '${myPage.nickname}';
var passwd = '${myPage.passwd}';
var dates=db_dates.substring(0,4)+"년 "+db_dates.substring(4,6)+"월 "+db_dates.substring(6,8)+"일 ";
function reset_info(){
	$('#birth').val(dates);
	$('input[name=passwd]').val(passwd);
	$('input[name=passwd1]').val(passwd);
	$('input[name=nickname]').val(nickname);
}
function success(){
	alert('수정이 완료되었습니다.');
}
$(document).ready(function() {
	reset_info();
	if(gender == "m"){
		$('input:radio[name=gender]:input[id=m]').attr("checked", true);
	}else{
		$('input:radio[name=gender]:input[id=w]').attr("checked", true);
	}
	$('span').css('font-size', '13px');
	console.log($('span').css('font-size'));
})

function openMenu(evt, menuName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(menuName).style.display = "block";
    evt.currentTarget.className += " active";
    if(menuName == 'mylist'){
    	$(location).attr('href',"http://localhost:8090/project/BoardSearchServlet?searchName=author&searchValue="+nickname);

    }
}

</script>
<div class="not-stuck">
<div class="tab">
  <button class="tablinks" onclick="openMenu(event, 'memberinfo')">개인정보 변경하기</button>
  <button class="tablinks" onclick="openMenu(event, 'mylist')">내가 쓴 글 보기</button>
  <button class="tablinks" onclick="openMenu(event, 'cash')">마일리지 충전</button>
</div>
<div id="memberinfo" class="tabcontent">
  <h3>개인정보 변경하기</h3>
  <p>현재 개인정보 변경은 비밀번호와 닉네임만 가능합니다.</p>
  <form action="MemberUpdateController" method="get">
  <div class="myinfo" style="width: 480px; background-color: white; background: rgba(255, 255, 255, 0.5); font-size: 17px;">
  <table width="100%">
	<tr><td align="center" width="30%">아이디</td><td><input type="text" readonly="readonly" style="background-color :#d1d1d1;" value="${myPage.userid}"></td></tr>  
	<tr><td align="center" width="30%">비밀번호</td><td><input type="password"  name="passwd1" value="${myPage.passwd}" onkeyup="passleng()" /></td><td width="33%"><span id="result2"></span></td></tr>  
	<tr><td align="center" width="30%">비밀번호 확인</td><td><input type="password" name="passwd" value="${myPage.passwd}" onkeyup="passConfirm()" /></td><td width="33%"><span id="result3"></span></td></tr>  
	<tr><td align="center" width="30%">닉네임</td><td><input type="text"  name="nickname" value="${myPage.nickname}" onkeyup="sendnickname()" /><input type="hidden" name="dates"  value="${myPage.dates}"> </td><td width="33%"><span id="result4"></span></td></tr>
	<tr><td align="center" width="30%">생년월일</td><td><input type="text" id="birth" readonly="readonly" style="background-color :#d1d1d1;"></td></tr>    
	
	<tr><td align="center" width="30%">성별</td><td>남<input type="radio" name="gender" id="m" disabled>&nbsp;&nbsp;
	여<input type="radio"  name="gender" id="w" disabled></td></tr>  
	<tr><td align="center" colspan="2">  <input type="submit" value="회원가입" onclick="success()">&nbsp;&nbsp;
    <input type="button" value="취소" onclick="reset_info()"> </td></tr>
  </table>

  </div>
  </form>
</div>

<div id="mylist" class="tabcontent">
  <h3>내가 쓴 글 보기</h3>
 현재 새 창으로 표시 됩니다.
</div>

<div id="cash" class="tabcontent">
  <h3>준비중입니다.</h3>
  <p>서비스를 준비중입니다.<br>
  조금만 기다려 주세요.
 </p>
</div>


</div>
