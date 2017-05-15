//날짜 출력 for loop
$(document).ready(function() { 
            var cur_year=new Date().getFullYear();
            var obj=document.getElementById("year");         
            for (var i = 1970; i <= 2008; i++)     {                
                opt = document.createElement("option");
                opt.value = i;
                opt.text=i;
                obj.appendChild(opt);
            }
});

$(document).ready( function() { 
    var cur_year=new Date().getFullYear();
    var obj=document.getElementById("month");         
    for (var i = 1; i <= 12; i++)     {                
        opt = document.createElement("option");
        opt.value = i;
        opt.text=i;
        obj.appendChild(opt);
    }
});

$(document).ready( function() { 
    var cur_year=new Date().getFullYear();
    var obj=document.getElementById("day");         
    for (var i = 1; i <= 31; i++)     {                
        opt = document.createElement("option");
        opt.value = i;
        opt.text=i;
        obj.appendChild(opt);
    }
});

//비밀번호 길이체크
function passleng(){
	 var password = document.getElementsByName('passwd1')[0].value;
	 console.log(password.length)
	 if(password.length <6 ){
			document.getElementById("result2").innerText = "너무 짧습니다."
	 } else {
			document.getElementById("result2").innerText = "OK"
	 }
}
//비밀번호 확인체크
function passConfirm(){
	 var password1 = document.getElementsByName('passwd1')[0].value;
	 var password = document.getElementsByName('passwd')[0].value;
	 if(password == password1){
			document.getElementById("result3").innerText = "비밀번호가 일치";
			return true;
		 } else {
			document.getElementById("result3").innerText = "비밀번호 불일치";
			return false
		 }
}
//submit 하기전에 누락된 것 없는지
function formChk(){
    if(document.form[0].userid.value==''){
      alert("id를 입력하세요!!");
      document.form[0].userid.focus();
    }else if(document.form[0].passwd.value==''){
      alert("password를 입력하세요!!");    
      document.form[0].passwd.focus();
    }else{
       document.form[0].submit(); 
       return true;
    }
}


function chkFormData(){
	console.log("chk data");
	if(passConfirm){
	console.log("true");
	}else{
		console.log("false");
	}
}
//id 중복 체크

//1. Ajax 통신 전담하는 객체: XMLHttpRequest
var xmlHttp;
function getXMLHttpRequest(){
	 xmlHttp = new XMLHttpRequest();
}

function sendid(){
	 
	 var userid = document.getElementById("userid").value;
	 console.log("userid :"+userid);
	 getXMLHttpRequest();
	 //이벤트 등록(서버가 응답하는 이벤트)
	 xmlHttp.onreadystatechange=idprint;
	 //타겟
	 xmlHttp.open("get","idCheck.jsp?userid="+userid,true);
	 xmlHttp.send(null);

}//end send
function sendnickname(){
	 
	 var nickname = document.getElementById("nickname").value;
	 console.log("nickname :"+nickname);
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
	 }//end 
}//end id

function nicknameprint(){
	
	 if(xmlHttp.readyState==4 && xmlHttp.status==200){
		 var str = xmlHttp.responseText;
		document.getElementById("result4").innerText=str.trim();
	 }//end 
}//end nick


function chkValidEmail() {      
    var email = document.getElementsByName('userid')[0].value;
    console.log(email);
    var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
        if(exptext.test(email)==false){
        	document.getElementById("result1").innerText = "잘못된 이메일 형식입니다."
        }else if(email==""){
        	document.getElementById("result1").innerText = "준비중"
        }else{
        	document.getElementById("result1").innerText = "OK"
        	console.log("체크")
            sendid();
        }
}