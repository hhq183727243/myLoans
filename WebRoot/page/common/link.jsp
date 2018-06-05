<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="css/swiper-3.4.2.min.css">
<link rel="stylesheet" href="css/weui.css">
<link rel="stylesheet" href="css/public.css">
<link rel="stylesheet" href="css/sytle.css">
<script type="text/javascript" src="js/lib/vue.min.js"></script>
<script type="text/javascript" src="js/lib/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="js/lib/weui.min.js"></script>
<script type="text/javascript" src="js/lib/swiper-3.4.2.jquery.min.js"></script>
<script type="text/javascript" src="js/lib/upload.js"></script>

<script type="text/javascript">
	function strToDateformat(str,format){
		var d = new Date(str.replace(/-/g,'/'));

		return d.format(format);
	}

	//时间格式化工具
	Date.prototype.format = function(format){
	    var o = {
	        "M+" : this.getMonth()+1, //month
	        "d+" : this.getDate(),    //day
	        "h+" : this.getHours(),   //hour
	        "m+" : this.getMinutes(), //minute
	        "s+" : this.getSeconds(), //second
	        "q+" : Math.floor((this.getMonth()+3)/3),  //quarter
	        "S" : this.getMilliseconds() //millisecond
	    };
	    
	    if(/(y+)/.test(format)){
	    	format=format.replace(RegExp.$1,(this.getFullYear()+"").substr(4 - RegExp.$1.length));
	    }
	    
	    for(var k in o){
	    	if(new RegExp("("+ k +")").test(format)){
	    		format = format.replace(RegExp.$1,RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length));
	    	}
	    }
	    return format;
	};
</script>