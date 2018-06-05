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
        <div class="weui-cells">
            <a class="weui-cell weui-cell_access j-show-answer" href="javascript:;">
                <div class="weui-cell__bd">
                    <p>1、什么是简单借款？</p>
                </div>
                <div class="weui-cell__ft"></div>
            </a>
            <a class="weui-cell weui-cell_access j-show-answer" href="javascript:;">
                <div class="weui-cell__bd">
                    <p>2、申请成功后是否可以放弃借款？</p>
                </div>
                <div class="weui-cell__ft"></div>
            </a>
            <a class="weui-cell weui-cell_access j-show-answer" href="javascript:;">
                <div class="weui-cell__bd">
                    <p>3、在宜人贷出借时，如何降低风险？</p>
                </div>
                <div class="weui-cell__ft"></div>
            </a>
            <a class="weui-cell weui-cell_access j-show-answer" href="javascript:;">
                <div class="weui-cell__bd">
                    <p>4、出借人是否需要支付相应费用？</p>
                </div>
                <div class="weui-cell__ft"></div>
            </a>
            <a class="weui-cell weui-cell_access j-show-answer" href="javascript:;">
                <div class="weui-cell__bd">
                    <p>5、出借人如何参与质保专款保障服务？</p>
                </div>
                <div class="weui-cell__ft"></div>
            </a>

        </div>
    </section>
</body>
<script>
    $(function(){
    	//设置导航标题
    	headerVue.title = '常见问题';
    	
        $('.j-show-answer').click(function(){
            var title = $(this).find('.weui-cell__bd:first').text();

            weui.alert('贷款余额指至某一节点日期为止，借款人尚未归还放款人的贷款总额。亦指到会计期末尚未偿还的贷款，尚未偿还的贷款余额等于贷款总额扣除已偿还的银行贷款。',function(){

            },{
                title: title,
                buttons: [{label: '我知道了'}]
            })
        })
    });
</script>
</html>