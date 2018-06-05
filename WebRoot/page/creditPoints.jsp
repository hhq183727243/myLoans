<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>" />
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
	<title>Document</title>
	
	<%@include file="common/link.jsp"%>
	<style>
		canvas{ max-width: 100%;background-color: #0099FF; }
	</style>
</head>
<body>
	<%@include file="common/header.jsp"%>
	
	<section class="main">
		<div class="panel">
			<canvas id="meter" width="360" height="220"></canvas>
		</div>
        <div class="p15">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra</div>
    </section>
	
</body>
<script src="js/chart.meter.js"></script>
<script>
    $(function(){
    	//设置导航标题
    	headerVue.title = '信用分';
    	
    	Meter.setOptions({
	        element: 'meter',
	        centerPoint: {
	            x: 180,
	            y: 180
	        },
	        radius: 180,
	        data: {
	            value: 710,
	            title: '信用度{t}',
	            subTitle: '评估时间：2017.10.28',
	            area: [{
	                min: 350, max: 550, text: '较弱'
	            },{
	                min: 550, max: 600, text: '一般'
	            },{
	                min: 600, max: 650, text: '很强'
	            },{
	                min: 650, max: 700, text: '超强'
	            },{
	                min: 700, max: 950, text: '极强'
	            }]
	        }
	    }).init();
    });
</script>
</html>