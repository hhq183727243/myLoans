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
	
	<section class="main bgf8">
        <div class="mt15">
            <div class="weui-cells__title">2017年10月</div>

            <div class="weui-cells">
                <div class="weui-cell">
                    <div class="weui-cell__bd">
                        <p>流水号：3324133121312</p>
                        <p class="mt5 g9">2017-10-31 12:16:48</p>
                    </div>
                    <div class="weui-cell__ft"><span class="weui-success">+$5000</span></div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__bd">
                        <p>流水号：3324133121312</p>
                        <p class="mt5 g9">2017-10-31 12:16:48</p>
                    </div>
                    <div class="weui-cell__ft"><span class="weui-success">+$5000</span></div>
                </div>

                <div class="weui-cell">
                    <div class="weui-cell__bd">
                        <p>流水号：3324133121312</p>
                        <p class="mt5 g9">2017-10-31 12:16:48</p>
                    </div>
                    <div class="weui-cell__ft"><span class="weui-warn">-$1000</span></div>
                </div>
            </div>
        </div>

        <div class="mt15">
            <div class="weui-cells__title">2017年11月</div>

            <div class="weui-cells">
                <div class="weui-cell">
                    <div class="weui-cell__bd">
                        <p>流水号：3324133121312</p>
                        <p class="mt5 g9">2017-10-31 12:16:48</p>
                    </div>
                    <div class="weui-cell__ft"><span class="weui-success">+$5000</span></div>
                </div>

                <div class="weui-cell">
                    <div class="weui-cell__bd">
                        <p>流水号：3324133121312</p>
                        <p class="mt5 g9">2017-10-31 12:16:48</p>
                    </div>
                    <div class="weui-cell__ft"><span class="weui-warn">-$1000</span></div>
                </div>

                <div class="weui-cell">
                    <div class="weui-cell__bd">
                        <p>流水号：3324133121312</p>
                        <p class="mt5 g9">2017-10-31 12:16:48</p>
                    </div>
                    <div class="weui-cell__ft"><span class="weui-success">+$5000</span></div>
                </div>
            </div>
        </div>
    </section>
</body>
<script>
    $(function(){
    	//设置导航标题
    	headerVue.title = '还款记录';
    });
</script>
</html>