<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 
uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" 
uri="http://java.sun.com/jsp/jstl/functions" %>
<style type="text/css">
textarea
{
    resize: none;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
<script type="text/javascript">


$(document).ready(function(){
	$(":button").on("click", function(event){
		
		switch ($(this).val()) {
		  case "2": 
			console.log($(this).val());
			document.getElementById("c3").style.display='none';
			document.getElementById("c4").style.display='none'; 
			document.getElementById("c5").style.display='none'; 
		    break;
		  case "3": 
			document.getElementById("c3").style.display='block';
			document.getElementById("c4").style.display='none'; 
			document.getElementById("c5").style.display='none'; 
			break;
		  case "4": 
			  document.getElementById("c3").style.display='block';
			  document.getElementById("c4").style.display='block'; 
			  document.getElementById("c5").style.display='none'; 
			  break; 
		  case "5":
			  document.getElementById("c3").style.display='block';
			  document.getElementById("c4").style.display='block'; 
			  document.getElementById("c5").style.display='block'; 
			  break;
		  default: 
			  console.log($(tdis).val());
			  alert("시스템 에러입니다. 페이지를 새로고침 해주세요.");
		      break;
		}
	})
})
function add(){
	
	console.log();
	
	
}

</script>
<form action="BoardWriteServlet" metdod="post">
 제목<input type="text" name="title"><br>
 작성자<span><b>${sessionScope.login.nickname}</b></span><input type="hidden" name="autdor" value="${sessionScope.login.nickname}"><br>
 선택 <input type="button" name="b2" value="2" onclick="add()">  <input type="button" name="b3" value="3" onclick="add()">  
 <input type="button" name="b4" value="4" onclick="add()"> <input type="button" name="b5" value="5" onclick="add()"> <br>
 내용<br><textarea rows="3" cols="30" name="content"></textarea>
 <br>
 <div id="c1" style="border: 1px ; float: left; widtd: 10%; padding:1px;">
 <table bordercolor=black id="tbl">
 <tr><td><textarea rows="3" cols="12" name="content"></textarea></td></tr>
 <tr><td><div class="filebox bs3-primary preview-image"><br><input type="file"></div></td></tr>
 </table>
 </div>
 <div id="c2" style="border: 1px ; float: left; widtd: 10%; padding:1px;">
 <table bordercolor=black id="tbl">
 <tr><td><textarea rows="3" cols="12" name="content"></textarea></td></tr>
 <tr><td><div class="filebox bs3-primary preview-image"><br><input type="file" ></div></td></tr>
 </table>
 </div>
 <div id="c3" style="border: 1px ; float: left; widtd: 10%; padding:1px; display: none">
 <table bordercolor=black id="tbl">
 <tr><td><textarea rows="3" cols="12" name="content"></textarea></td></tr>
 <tr><td><div class="filebox bs3-primary preview-image"><br><input type="file" ></div></td></tr>
 </table>
 </div>
 <div id="c4" style="border: 1px ; float: left; widtd: 10%; padding:1px; display: none">
 <table bordercolor=black id="tbl">
 <tr><td><textarea rows="3" cols="12" name="content"></textarea></td></tr>
 <tr><td><div class="filebox bs3-primary preview-image"><br><input type="file" ></div></td></tr>
 </table>
 </div>
 <div id="c5" style="border: 1px ; float: left; widtd: 10%; padding:1px; display: none">
 <table bordercolor=black id="tbl">
 <tr><td><textarea rows="3" cols="12" name="content"></textarea></td></tr>
 <tr><td><div class="filebox bs3-primary preview-image"><br><input type="file"></div></td></tr>
 </table>
 </div>

 <input type="submit" value="글작성">

</form>








