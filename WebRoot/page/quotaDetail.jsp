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
	<title>明细</title>
	
	<%@include file="common/link.jsp"%>
</head>
<body>
	<%@include file="common/header.jsp"%>
	
	<section class="main bgf5">
        <div class="mt15">
            <div class="weui-cells__title">2017年10月</div>

    		<div class="weui-cells">
                <div class="weui-cell" href="javascript:;">
                    <div class="weui-cell__bd">
                        <p>2017年10月25日 23:59:48</p>
                    </div>
                    <div class="weui-cell__ft"><span class="weui-success">+ $50000</span></div>
                </div>
                <div class="weui-cell" href="javascript:;">
                    <div class="weui-cell__bd">
                        <p>2017年10月25日 23:59:48</p>
                    </div>
                    <div class="weui-cell__ft"><span class="weui-warn">- $10000</span></div>
                </div>

                <div class="weui-cell" href="javascript:;">
                    <div class="weui-cell__bd">
                        <p>2017年10月25日 23:59:48</p>
                    </div>
                    <div class="weui-cell__ft"><span class="weui-warn">- $10000</span></div>
                </div>
            </div>
        </div>

        <div class="mt15">
            <div class="weui-cells__title">2017年11月</div>

            <div class="weui-cells">
                <div class="weui-cell" href="javascript:;">
                    <div class="weui-cell__bd">
                        <p>2017年11月25日 23:59:48</p>
                    </div>
                    <div class="weui-cell__ft"><span class="weui-success">+ $50000</span></div>
                </div>
                <div class="weui-cell" href="javascript:;">
                    <div class="weui-cell__bd">
                        <p>2017年11月25日 23:59:48</p>
                    </div>
                    <div class="weui-cell__ft"><span class="weui-warn">- $10000</span></div>
                </div>

                <div class="weui-cell" href="javascript:;">
                    <div class="weui-cell__bd">
                        <p>2017年11月25日 23:59:48</p>
                    </div>
                    <div class="weui-cell__ft"><span class="weui-warn">- $10000</span></div>
                </div>
            </div>
        </div>
    </section>
</body>
<script>
    $(function(){
    	//设置导航标题
    	headerVue.title = '额度明细';
    	
    });
</script>
</html>