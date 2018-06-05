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
	
	<%@include file="../common/link.jsp"%>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	
	<section class="main bgf5" id="App">
        <div class="weui-cells weui-cells_form">
            <div class="weui-cell weui-cell_select weui-cell_select-after">
                <div class="weui-cell__hd"><label class="weui-label g9">银行(BSB)</label></div>
                <div class="weui-cell__bd">
                    <select class="weui-select" v-model="bank" name="select1">
                        <option value="花旗银行">花旗银行</option>
                        <option value="瑞士银行">瑞士银行</option>
                    </select>
                </div>
            </div>
            
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label g9">开户人</label></div>
                <div class="weui-cell__bd">
                    <input class="weui-input" v-model="userName" type="text" placeholder="开户人" value="张长青">
                </div>
            </div>

            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label g9">账号</label></div>
                <div class="weui-cell__bd">
                    <input class="weui-input" v-model="cardNumer" type="tel" placeholder="账号" value="6854564865463456">
                </div>
            </div>
        </div>

        <div class="weui-btn-area">
            <a href="javascript:void(0);" @click="submitForm" id="submitBtn" class="weui-btn weui-btn_primary">重新认证</a>
        </div>
    </section>
</body>
<script>
$(function(){
	//设置导航标题
	headerVue.title = '银行卡';
	
    var app = new Vue({
        el: '#App',
        data: {
            bank: '花旗银行',
            userName: '张长青',
            cardNumer: '6854564865463456'
        },
        methods: {
            //校验
            validate: function(){
                if(this.bank == ''){
                    weui.alert('请选择银行')
                }else if(this.userName == ''){
                    weui.alert('请输入开户人姓名')
                }else if(this.cardNumer == ''){
                    weui.alert('请输入银行卡账号')
                }else{
                    return true;
                }

                return false;                
            },

            //提交
            submitForm: function(){
                if(this.validate()){

                    weui.alert('提交成功',function(){
                        console.log('点击确定后回调函数');
                    })
                }
            }           
        },
        mounted: function(){
       
        }
    });
});
</script>
</html>