//날짜 출력 for loop
$(document).ready(function(){
	 var obj_year=document.getElementById("year");         
	    for (var i = 1970; i <= 2008; i++)     {                
	    	year = document.createElement("option");
	        year.value = i;
	        year.innerHTML=i+"년";
	        obj_year.options.add(year, i);
	    }
	    
	    var obj_month=document.getElementById("month");         
	    for (var i = 1; i <= 12; i++)     {                
	        month = document.createElement("option");
	        month.value = i;
	        month.innerHTML=i+"월";
	        obj_month.options.add(month, i);
	    }

	    var obj_day=document.getElementById("day");         
	    for (var i = 1; i <= 31; i++)     {                
	        day = document.createElement("option");
	        day.value = i;
	        day.innerHTML=i+"일";
	        obj_day.options.add(day, i);
	    }
});
