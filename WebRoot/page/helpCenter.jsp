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
	<title>帮助中心</title>
	
	<%@include file="common/link.jsp"%>
</head>
<body>
	<%@include file="common/header.jsp"%>
	
	<section class="main bgf5">
        <div class="panel tc">
            <div class="weui-flex pt10 pb10">
                <div class="weui-flex__item">
                    <a><img width="60" src="image/icon/hotline.png" alt=""></a>
                    <p class="mt10">服务热线</p>
                </div>
                <div class="weui-flex__item">
                    <a href="page/addAsk.jsp"><img width="60" src="image/icon/feedback.png" alt=""></a>
                    <p class="mt10">我要反馈</p>
                </div>
            </div>
        </div>

        <div class="weui-cells__title mt20">常见问题提示</div>

		<div class="weui-grids bgwh mt10">
            <a href="page/helpList.jsp" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="image/icon/card.png" alt="">
                </div>
                <p class="weui-grid__label">信用卡借款问题</p>
            </a>
            <a href="page/helpList.jsp" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="image/icon/comein.png" alt="">
                </div>
                <p class="weui-grid__label">简单借款问题</p>
            </a>
            <a href="page/helpList.jsp" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="image/icon/plusmoney.png" alt="">
                </div>
                <p class="weui-grid__label">提额问题</p>
            </a>
            <a href="page/helpList.jsp" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="image/icon/lines.png" alt="">
                </div>
                <p class="weui-grid__label">额度问题</p>
            </a>
            <a href="page/helpList.jsp" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="image/icon/ss.png" alt="">
                </div>
                <p class="weui-grid__label">费用问题</p>
            </a>
            <a href="page/helpList.jsp" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="image/icon/rz.png" alt="">
                </div>
                <p class="weui-grid__label">审核问题</p>
            </a>
            <a href="page/helpList.jsp" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="image/icon/loan.png" alt="">
                </div>
                <p class="weui-grid__label">放贷问题</p>
            </a>
            <a href="page/helpList.jsp" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="image/icon/lending.png" alt="">
                </div>
                <p class="weui-grid__label">还款问题</p>
            </a>
            <a href="page/helpList.jsp" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="image/icon/user.png" alt="">
                </div>
                <p class="weui-grid__label">账号问题</p>
            </a>
        </div>
    </section>
	
</body>
<script>
    $(function(){
    	//设置导航标题
    	headerVue.title = '帮助中心';
    	
    });
</script>
</html>