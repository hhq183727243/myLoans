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
		<div class="weui-cells">
            <div class="weui-cell weui-cell_access">
                <div class="weui-cell__bd">
                    <p class="f18 g3">这里是消息标题</p>
                    <p class="mt10 g9 f12">
						<span>系统消息/系统公告</span>　|　<time>2017-11-17 11:15:40</time>
                    </p>
                </div>
            </div>
            <div class="weui-cell weui-cell_access">
                <div class="weui-cell__bd">
                    <div class="tj lh24">这里是消息内容，可以很多也可以很少这里是消息内容，可以很多也可以很少这里是消息内容，可以很多也可以很少这里是消息内容，可以很多也可以很少这里是消息内容，可以很多也可以很少这里是消息内容，可以很多也可以很少这里是消息内容，可以很多也可以很少</div>
                </div>
            </div>
        </div>
    </section>
</body>
<script>
    $(function(){
    	//设置导航标题
    	headerVue.title = '消息详细';
    	
    });
</script>
</html>