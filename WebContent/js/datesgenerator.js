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
