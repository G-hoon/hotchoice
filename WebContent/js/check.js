var password;
var password_confirm;
var userid;
var nickname;
var debug_id = false;
var debug_nickname = false;
var debug_passleng = false;
var debug_passconfirm = false;
//비밀번호 길이체크
function passleng(){
	password = $("input[name=passwd]").val();
	
	 if(password.length <6 ){
			document.getElementById("result2").innerText = "너무 짧습니다."
			debug_passleng=false;
			return false;
	 } else {
			document.getElementById("result2").innerText = "OK"
			debug_passleng=true;
			return true;
	 }
}
//비밀번호 확인체크
function passConfirm(){
	password_confirm = $("input[name=passwdconfirm]").val();
	 if(password_confirm == password){
			document.getElementById("result3").innerText = "비밀번호가 일치";
			debug_passconfirm = true;
			return true;
		 } else {
			document.getElementById("result3").innerText = "비밀번호 불일치";
			debug_passconfirm = false;
			return false
		 }
}
//submit 하기전에 누락된 것 없는지
function formChk(register){
	console.log("idprint : "+debug_id+" / pass :"+debug_passconfirm+" / nickname: "+debug_nickname);
    if(userid==null){
      alert("ID(email)를 입력하세요!!");
      document.getElementsByName('userid')[0].focus();
      return false;
    }else if(debug_id == false){
	  alert("중복된 아이디 입니다.");   
	  document.getElementsByName('userid')[0].focus();
      return false;
    }else if(password == null){
      alert("비밀번호를 입력하세요!!");   
      return false;
      document.getElementsByName('passwd')[0].focus();
    }else if(debug_passleng == false){
    	 alert("비밀번호가 너무 짧습니다.");   
         return false;
         document.getElementsByName('passwd')[0].focus();
    }else if(password_confirm ==  null ){
    	alert("비밀번호 확인을 입력하세요!!");
    	return false;
    	document.getElementsByName('passwdconfirm')[0].focus();
    }else if(debug_passconfirm==false){
    	 alert("입력한 비밀번호가 일치하지 않습니다.");   
    	 document.getElementsByName('passwdconfirm')[0].focus();
    }else if(nickname.length < 2){
    	alert("닉네임을 입력하세요!!");    
    	return false;
    	document.getElementsByName('nickname')[0].focus();
    }else if(debug_nickname==false){
    	alert("닉네임이 중복되었습니다.");    
    	return false;
    	document.getElementsByName('nickname')[0].focus();
    }else{
    	alert("회원가입이 완료되었습니다.");
    	register.action = "MemberAddController";
    	register.onsubmit ="return true";
    	return true;
    }
}


//id 중복 체크

//1. Ajax 통신 전담하는 객체: XMLHttpRequest
var xmlHttp;
function getXMLHttpRequest(){
	 xmlHttp = new XMLHttpRequest();
}

function sendid(){
	 getXMLHttpRequest();
	 //이벤트 등록(서버가 응답하는 이벤트)
	 xmlHttp.onreadystatechange=idprint;
	 //타겟
	 xmlHttp.open("get","idCheck.jsp?userid="+userid,true);
	 xmlHttp.send(null);
}//end send

function sendnickname(){
	nickname = $('input[name=nickname]').val();
	 getXMLHttpRequest();
	 //이벤트 등록(서버가 응답하는 이벤트)
	 xmlHttp.onreadystatechange=nicknameprint;
	 //타겟
	 xmlHttp.open("get","nicknameCheck.jsp?nickname="+nickname,true);
	 xmlHttp.send(null);
}
function idprint(){
	 if(xmlHttp.readyState==4 && xmlHttp.status==200){
		 var str = xmlHttp.responseText;
		document.getElementById("result1").innerText=str.trim();
		if(str.trim()=="아이디 사용 가능"){
			debug_id = true;
			return true;
		}else{
			debug_id= false;
			return false;
		}
	 }//end 
}//end id

function nicknameprint(){
	 if(xmlHttp.readyState==4 && xmlHttp.status==200){
		 var str = xmlHttp.responseText;
		document.getElementById("result4").innerText=str.trim();
		if(str.trim()=="닉네임 사용 가능"){
			debug_nickname = true;
			return true;
		}else{
			debug_nickname = false;
			return false;
		}
	 }//end 
	 
}//end nick


function chkValidEmail() {      
    var email = document.getElementsByName('userid')[0].value;
    userid = email;
    var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
        if(exptext.test(email)==false){
        	document.getElementById("result1").innerText = "잘못된 이메일 형식입니다.";
        }else if(email==""){
        	document.getElementById("result1").innerText = "준비중";
        }else{
        	document.getElementById("result1").innerText = "OK";
        	console.log("ok");
            sendid();
        }
}