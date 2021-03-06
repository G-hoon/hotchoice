<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 
uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" 
uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="js/fileupload.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$(":button").on("click", function(event){
		
		switch ($(this).val()) {
		  case "2": 
			document.getElementById("c3").style.display='none';
			document.getElementById("c4").style.display='none'; 
			document.getElementById("c5").style.display='none'; 
			document.getElementById("filebox1").style.display='block'; 
			document.getElementById("filebox2").style.display='block'; 
			document.getElementsByName("content1")[0].style.display='block'; 
			document.getElementsByName("content2")[0].style.display='block'; 
			document.getElementById("o").style.display='none'; 
			document.getElementById("x").style.display='none'; 
			if($("textarea[name=content1]").val() == 'o'){
				$("textarea[name=content1]").val('');
			} 
			if($("textarea[name=content2]").val() == 'x'){
				$("textarea[name=content2]").val('');
			} 
		    break;
		  case "3": 
			document.getElementById("c3").style.display='block';
			document.getElementById("c4").style.display='none'; 
			document.getElementById("c5").style.display='none'; 
			document.getElementById("filebox1").style.display='block'; 
			document.getElementById("filebox2").style.display='block'; 
			document.getElementsByName("content1")[0].style.display='block'; 
			document.getElementsByName("content2")[0].style.display='block'; 
			document.getElementById("o").style.display='none'; 
			document.getElementById("x").style.display='none'; 
			if($("textarea[name=content1]").val() == 'o'){
				$("textarea[name=content1]").val('');
			} 
			if($("textarea[name=content2]").val() == 'x'){
				$("textarea[name=content2]").val('');
			} 
			break;
		  case "4": 
			document.getElementById("c3").style.display='block';
			document.getElementById("c4").style.display='block'; 
			document.getElementById("c5").style.display='none'; 
	   		document.getElementById("filebox1").style.display='block'; 
			document.getElementById("filebox2").style.display='block'; 
			document.getElementsByName("content1")[0].style.display='block'; 
			document.getElementsByName("content2")[0].style.display='block'; 
			document.getElementById("o").style.display='none'; 
			document.getElementById("x").style.display='none'; 
			if($("textarea[name=content1]").val() == 'o'){
				$("textarea[name=content1]").val('');
			} 
			if($("textarea[name=content2]").val() == 'x'){
				$("textarea[name=content2]").val('');
			} 
			  break; 
		  case "5":
			  document.getElementById("c3").style.display='block';
			  document.getElementById("c4").style.display='block'; 
			  document.getElementById("c5").style.display='block'; 
			document.getElementById("filebox1").style.display='block'; 
			document.getElementById("filebox2").style.display='block'; 
			document.getElementsByName("content1")[0].style.display='block'; 
			document.getElementsByName("content2")[0].style.display='block'; 
			document.getElementById("o").style.display='none'; 
			document.getElementById("x").style.display='none'; 
			if($("textarea[name=content1]").val() == 'o'){
				$("textarea[name=content1]").val('');
			} 
			if($("textarea[name=content2]").val() == 'x'){
				$("textarea[name=content2]").val('');
			} 
			  break;
		  case "O/X":
		  	document.getElementById("c3").style.display='none';
			document.getElementById("c4").style.display='none'; 
			document.getElementById("c5").style.display='none'; 
			document.getElementById("filebox1").style.display='none'; 
			document.getElementById("filebox2").style.display='none'; 
			document.getElementsByName("content1")[0].style.display='none'; 
			document.getElementsByName("content2")[0].style.display='none'; 
			$("textarea[name=content1]").val('o');
			$("textarea[name=content2]").val('x');
			document.getElementById("o").style.display='block'; 
			document.getElementById("x").style.display='block'; 
		    break;
		  default: 
			  console.log($(this).val());
			  alert("시스템 에러입니다. 페이지를 새로고침 해주세요.");
		      break;
		}
	})
	

})

</script>
<link rel="stylesheet" type="text/css" href="css/fileupload.css" />
<div class="not-stuck">
<!-- 글쓰기 form 시작 -->
<div class="writestyle" style="margin-top: 60px; margin-left: 60px;">
<form action="BoardWriteServlet" method="post" enctype="multipart/form-data" id="voting">
 제목<input type="text" name="title"><br>
 작성자<span><b>${sessionScope.login.nickname}</b></span><input type="hidden" name="author" value="${sessionScope.login.nickname}"><br>
 선택 <input type="button" name="b2" value="2">  <input type="button" name="b3" value="3">  
 <input type="button" name="b4" value="4"> <input type="button" name="b5" value="5"> <input type="button" value="O/X"><br>
 내용<br><textarea rows="5" cols="60" name="content"></textarea>
 <br>
 <div style="display:block; float: left; overflow: hidden">
 <div id="c1" style="border: 1px ; float: left; width: 110px; padding:10px;">
 <table bordercolor=black id="tbl">
 <tr><th id="o" style="display: none"><img src="img/o.jpg"></th></tr>
 <tr><th><textarea rows="3" cols="12" name="content1"></textarea></th></tr>
 <tr><th id="filebox1"><div class="filebox bs3-primary preview-image"><br><input type="file" id="input_file" name="file1" class="upload-hidden" style="width: 75px;"></div></th></tr>
 </table>
 </div>
 <div id="c2" style="border: 1px ; float: left; width: 110px; padding:10px;">
 <table bordercolor=black id="tbl">
  <tr><th id="x" style="display: none"><img src="img/x.jpg"></th></tr>
 <tr><th><textarea rows="3" cols="12" name="content2"></textarea></th></tr>
 <tr><th id="filebox2"><div class="filebox bs3-primary preview-image"><br><input type="file" id="input_file" name="file2" class="upload-hidden" style="width: 75px;"></div></th></tr>
 </table>
 </div>
 <div id="c3" style="border: 1px ; float: left; width: 110px; padding:10px; display: none">
 <table bordercolor=black id="tbl">
 
 <tr><th><textarea rows="3" cols="12" name="content3"></textarea></th></tr>
 <tr><th><div class="filebox bs3-primary preview-image"><br><input type="file" id="input_file" name="file3" class="upload-hidden" style="width: 75px;"></div></th></tr>
 </table>
 </div>
 <div id="c4" style="border: 1px ; float: left; width: 110px; padding:10px; display: none">
 <table bordercolor=black id="tbl">
 <tr><th><textarea rows="3" cols="12" name="content4"></textarea></th></tr>
 <tr><th><div class="filebox bs3-primary preview-image"><br><input type="file" id="input_file" name="file4" class="upload-hidden" style="width: 75px;"></div></th></tr>
 </table>
 </div>
 <div id="c5" style="border: 1px ; float: left; width: 110px; padding:10px; display: none">
 <table bordercolor=black id="tbl">
 <tr><th><textarea rows="3" cols="12" name="content5"></textarea></th></tr>
 <tr><th><div class="filebox bs3-primary preview-image"><br><input type="file" id="input_file" name="file5" class="upload-hidden" style="width: 75px;"></div></th></tr>
 </table>
 </div>
 
 </div>
 <div style="display:block; clear:both">
 <input type="submit" value="글작성">
</div>
</form>
</div>
</div>








