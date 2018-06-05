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
</head>
<body>
	<%@include file="common/header.jsp"%>
	
	<section class="main bgf0">
		<div class="weui-tab">
	        <div class="weui-navbar">
	            <div class="weui-navbar__item weui-bar__item_on">消息</div>
	            <div class="weui-navbar__item">公告</div>
	        </div>
	        <div class="weui-tab__panel">
				<div class="p10">
					<div class="mb20" >
						<p class="tc">20:30</p>
						<a class="db message-item new g3" href="page/messageDetail.jsp">
							<p>你的账号已审核</p>
							<p class="g9 mt5">这里是未通过审核的原因，由客服填写相关审核原因。</p>
						</a>
					</div>

					<div class="mb20">
						<p class="tc">20:30</p>
						<a class="db message-item new g3" href="page/messageDetail.jsp">
							<p>你的账号已审核</p>
							<p class="g9 mt5">这里是未通过审核的原因，由客服填写相关审核原因。</p>
						</a>
					</div>

					<div class="mb20">
						<p class="tc">20:30</p>
						<a class="db message-item g3" href="page/messageDetail.jsp">
							<p>你的账号已审核</p>
							<p class="g9 mt5">这里是未通过审核的原因，由客服填写相关审核原因。</p>
						</a>
					</div>

					<div class="mb20">
						<p class="tc">20:30</p>
						<a class="db message-item g3" href="page/messageDetail.jsp">
							<p>你的账号已审核</p>
							<p class="g9 mt5">这里是未通过审核的原因，由客服填写相关审核原因。</p>
						</a>
					</div>

					<div class="mb20">
						<p class="tc">20:30</p>
						<a class="db message-item g3" href="page/messageDetail.jsp">
							<p>你的账号已审核</p>
							<p class="g9 mt5">这里是未通过审核的原因，由客服填写相关审核原因。</p>
						</a>
					</div>

					<div class="mb20">
						<p class="tc">20:30</p>
						<a class="db message-item g3" href="page/messageDetail.jsp">
							<p>你的账号已审核</p>
							<p class="g9 mt5">这里是未通过审核的原因，由客服填写相关审核原因。</p>
						</a>
					</div>
				</div>
	        </div>
	    </div>
    </section>
	
</body>
<script>
    $(function(){
    	//设置导航标题
    	headerVue.title = '消息中心';
    	
    	//tab切换
        $('.weui-navbar__item').on('click', function(){
        	var load = weui.loading('加载中...')

            $(this).addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');

            setInterval(function(){
            	load.hide();
            },500);
        });
    });
</script>
</html>