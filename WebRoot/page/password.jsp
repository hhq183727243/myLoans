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
	<title>登录</title>
	
	<%@include file="common/link.jsp"%>
</head>
<body>
	<%@include file="common/header.jsp"%>
	
	<section class="main bgf8">
        <form id="form">
            <!-- S 第一步 -->
            <div class="step_item" :class="{active : step==0}">
                <div class="panel f18 tc">第一步账号验证</div>

                <div class="weui-cells__title">请输入注册的邮箱</div>
        		<div class="weui-cells">
                    <div class="weui-cell">
                        <div class="weui-cell__bd">
                            <input class="weui-input" v-model="email" type="text" placeholder="Email">
                        </div>
                    </div>
                </div>
            
                <div class="weui-cells__title">邮箱验证码：</div>
                <div class="weui-cells">
                    <div class="weui-cell weui-cell_vcode">
                        <div class="weui-cell__bd">
                            <input class="weui-input" v-model="code" type="tel" placeholder="验证码">
                        </div>
                        <div class="weui-cell__ft">
                            <button class="weui-vcode-btn">获取验证码</button>
                        </div>
                    </div>
                </div>

                <div class="weui-btn-area">
                    <a href="javascript:;" @click="checkAccount" class="weui-btn weui-btn_primary">下一步</a>
                </div>
            </div>
            <!-- E 第一步 -->

            <!-- S 第二步 -->
            <div class="step_item" :class="{active : step==1}">
                <div class="panel f18 tc">第二步重置密码</div>

                <div class="weui-cells__title">请输入新密码</div>
                <div class="weui-cells">
                    <div class="weui-cell">
                        <div class="weui-cell__bd">
                            <input class="weui-input" v-model="password" type="password" placeholder="Password">
                        </div>
                    </div>
                </div>
            
                <div class="weui-cells__title">重复密码：</div>
                <div class="weui-cells">
                    <div class="weui-cell">
                        <div class="weui-cell__bd">
                            <input class="weui-input" v-model="repeatPassword" type="password" placeholder="Password Repeat">
                        </div>
                    </div>
                </div>

                <div class="weui-btn-area">
                    <a href="javascript:;" @click="submitForm" class="weui-btn weui-btn_primary">确认</a>
                </div>
            </div>
            <!-- E 第二步 -->
        </form>
        
    </section>
</body>
<script>
    $(function(){
    	//设置导航标题
    	headerVue.title = '找回密码';
        headerVue.rightOp = true;
        headerVue.text = '登录';
        headerVue.href = 'page/login.jsp';
    	
        //表单vue
        new Vue({
            el: '#form',
            data: {
                email: '',
                code: '',
                step: 0,
                password: '',
                repeatPassword: ''
            },
            methods: {
                //邮箱检查
                checkEmail: function(){
                    var reg = new RegExp(/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/);
                    
                    if(!reg.test(this.email)){
                        weui.topTips('邮箱格式错误');
                        return false;
                    }else{
                        return true;
                    }
                },
                checkCode: function(){
                    if(this.code.length == 0){
                        weui.topTips('请输入验证码');
                        return false;
                    }else{
                        return true;
                    }
                },
                checkPassword: function(){
                    if(this.password.length < 6){
                        weui.topTips('密码长度不得少于6位');
                        return false;
                    }else if(this.password != this.repeatPassword){
                        weui.topTips('两次密码不一致');
                        return false;
                    }else{
                        return true;
                    }
                },
                checkAccount: function () {
                    if(this.checkEmail() && this.checkCode()){
                         this.step = this.step + 1;
                    }
                },
                submitForm: function(){
                    if(this.checkPassword()){
                        //密码校验通过，这里提交密码重置表单
                        console.log(this.password)
                    }
                }
            }
        });
    });
</script>
</html>