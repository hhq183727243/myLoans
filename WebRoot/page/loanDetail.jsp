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
	
	<section class="main bgfb">
        <div class="panel tc">装修借款，共$10000，交易成功</div>
        
        <!-- S 放贷信息 -->
        <div class="mt15">
            <div class="weui-cells__title"><span class="f16">放贷</span></div>

            <div class="weui-cells">
                <div class="weui-cell">
                    <div class="weui-cell__hd">
                        <label class="weui-label g9">银行名称</label>
                    </div>
                    <div class="weui-cell__bd">花旗银行</div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__hd">
                        <label class="weui-label g9">账户</label>
                    </div>
                    <div class="weui-cell__bd">6229009090909</div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__hd">
                        <label class="weui-label g9">时间</label>
                    </div>
                    <div class="weui-cell__bd">2017年10月31日 11:53:14</div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__hd">
                        <label class="weui-label g9">放款凭证</label>
                    </div>
                    <div class="weui-cell__bd">
                        <div class="dn" id="pingzheng">
                            <img src="image/test/z1.jpg" alt="">
                            <img src="image/test/z2.jpg" alt="">
                            <img src="image/test/z3.jpg" alt="">
                            <img src="image/test/z4.jpg" alt=""> 
                        </div>
                        <a href="javascript:void(0);" id="originalImg">查看</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- E 放贷信息 -->
        
        <!-- S 还款信息 -->
        <div class="mt15">
            <div class="weui-cells__title"><span class="f16">还款</span></div>

            <div class="weui-cells">
                <div class="weui-cell">
                    <div class="weui-cell__hd">
                        <label class="weui-label g9">计算利息费用</label>
                    </div>
                    <div class="weui-cell__bd">5000</div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__hd">
                        <label class="weui-label g9">应还本金+利息</label>
                    </div>
                    <div class="weui-cell__bd">$10000</div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__hd">
                        <label class="weui-label g9">已还金额</label>
                    </div>
                    <div class="weui-cell__bd">$5000</div>
                </div>
            </div>
        </div>
        <!-- E 还款信息 -->

        <div class="weui-btn-area">
            <a href="page/addRepayment.jsp" class="weui-btn weui-btn_primary">马上还款</a>
        </div>
    </section>

    <%@include file="common/photoSwipe.jsp"%>
</body>
<script>
    $(function(){
    	//设置导航标题
    	headerVue.title = '借款详细';
    });
</script>
</html>