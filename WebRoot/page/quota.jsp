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
	<title>额度</title>
	
	<%@include file="common/link.jsp"%>
</head>
<body>
	<%@include file="common/header.jsp"%>
	
	<section class="main bgf5">
		<div class="weui-cells">
            <div class="weui-cell" href="javascript:;">
                <div class="weui-cell__bd">
                    <p>我的最大信用额度</p>
                </div>
                <div class="weui-cell__ft"><span class="weui-cell_warn">$50000</span></div>
            </div>
            <div class="weui-cell" href="javascript:;">
                <div class="weui-cell__bd">
                    <p>已借款额度</p>
                </div>
                <div class="weui-cell__ft"><span class="weui-cell_warn">$50000</span></div>
            </div>

            <div class="weui-cell" href="javascript:;">
                <div class="weui-cell__bd">
                    <p>当前剩余可用额度</p>
                </div>
                <div class="weui-cell__ft"><span class="weui-cell_warn">$50000</span></div>
            </div>
        </div>

        <div class="weui-btn-area">
	        <a href="javascript:;" class="weui-btn weui-btn_primary">提升额度申请</a>
	    </div>
        
        <div class="weui-tabbar">
            <div class="panel">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra</div>
        </div>
    </section>
	
</body>
<script>
    $(function(){
    	//设置导航标题
    	headerVue.title = '我的额度';
    	headerVue.rightOp = true;
    	headerVue.text = '明细';
    	headerVue.href = 'page/quotaDetail.jsp';
    	
    });
</script>
</html>