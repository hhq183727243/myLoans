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
	<title>认证中心</title>
	
	<%@include file="common/link.jsp"%>
</head>
<body>
	<%@include file="common/header.jsp"%>
	
	<section class="main bgf5">
		<div class="weui-cells">
            <a class="weui-cell weui-cell_access" href="page/auth/identity.jsp">
                <div class="weui-cell__hd"><img src="image/icon/user.png"/></div>
                <div class="weui-cell__bd">
                    <p>客户身份</p>
                </div>
                <div class="weui-cell__ft"><span class="weui-success mr5">已认证</span></div>
            </a>
            <a class="weui-cell weui-cell_access" href="page/auth/card.jsp">
                <div class="weui-cell__hd"><img src="image/icon/card.png"/></div>
                <div class="weui-cell__bd">
                    <p>银行卡</p>
                </div>
                <div class="weui-cell__ft"><span class="weui-success mr5">已认证</span></div>
            </a>
            <a class="weui-cell weui-cell_access" href="page/auth/tradeKey.jsp">
                <div class="weui-cell__hd"><img src="image/icon/key.png"/></div>
                <div class="weui-cell__bd">
                    <p>交易秘密</p>
                </div>
                <div class="weui-cell__ft"><span class="weui-success mr5">已设置</span></div>
            </a>
            <a class="weui-cell weui-cell_access" href="page/auth/sourceIncome.jsp">
                <div class="weui-cell__hd"><img src="image/icon/comein.png"/></div>
                <div class="weui-cell__bd">
                    <p>收入来源</p>
                </div>
                <div class="weui-cell__ft"><span class="weui-success mr5">已认证</span></div>
            </a>

            <a class="weui-cell weui-cell_access" href="page/auth/workStatus.jsp">
                <div class="weui-cell__hd"><img src="image/icon/work.png"/></div>
                <div class="weui-cell__bd">
                    <p>工作情况</p>
                </div>
                <div class="weui-cell__ft"><span class="weui-warn mr5">未认证</span></div>
            </a>

            <a class="weui-cell weui-cell_access" href="page/auth/costsOf.jsp">
                <div class="weui-cell__hd"><img src="image/icon/fee.png"/></div>
                <div class="weui-cell__bd">
                    <p>费用开销</p>
                </div>
                <div class="weui-cell__ft"><span class="weui-warn mr5">未认证</span></div>
            </a>
        </div>
    </section>
	
</body>
<script>
    $(function(){
    	//设置导航标题
    	headerVue.title = '认证信息';
    });
</script>
</html>