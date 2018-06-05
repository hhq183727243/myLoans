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
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label g9">主要工作收入</label></div>
                <div>$</div>
                <div class="weui-cell__bd">
                    <input class="weui-input" v-model="money1" type="tel" placeholder="收入金额" value="">
                </div>
            </div>

            <div class="weui-cell weui-cell_select weui-cell_select-after">
                <div class="weui-cell__hd"><label class="weui-label g9">工作收入周期</label></div>
                <div class="weui-cell__bd">
                    <select class="weui-select" v-model="cycle1" name="select1">
                        <option value="1">每天</option>
                        <option value="2">每月</option>
                        <option value="3">每年</option>
                    </select>
                </div>
            </div>
            
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label g9">政府福利收入</label></div>
                <div>$</div>
                <div class="weui-cell__bd">
                    <input class="weui-input" v-model="money2" type="tel" placeholder="福利金额" value="2000">
                </div>
            </div>
            
            <div class="weui-cell weui-cell_select weui-cell_select-after">
                <div class="weui-cell__hd"><label class="weui-label g9">福利收入周期</label></div>
                <div class="weui-cell__bd">
                    <select class="weui-select" v-model="cycle2" name="select2">
                        <option value="1">每天</option>
                        <option value="2" selected>每月</option>
                        <option value="3">每年</option>
                    </select>
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
	headerVue.title = '收入来源';
	
    var app = new Vue({
        el: '#App',
        data: {
            money1: '50000',
            cycle1: '1',
            money2: '10000',
            cycle2: '1'
        },
        methods: {
            //校验
            validate: function(){
                if(this.money1 == ''){
                    weui.alert('请输入主要工作收入')
                }else if(this.cycle1 == ''){
                    weui.alert('请选择工作收入周期')
                }else if(this.money2 == ''){
                    weui.alert('请输入政府福利收入')
                }else if(this.cycle2 == ''){
                    weui.alert('请选择福利收入周期')
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