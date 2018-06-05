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
        <form id="Form">
            <div class="panel f18 tc">用户登录</div>

            <div class="weui-cells__title">请录入您的email：</div>
    		<div class="weui-cells">
                <div class="weui-cell">
                    <div class="weui-cell__bd">
                        <input class="weui-input" v-model="email" type="text" placeholder="Email">
                    </div>
                </div>
            </div>
        
            <div class="weui-cells__title">登陆密码：</div>
            <div class="weui-cells">
                <div class="weui-cell">
                    <div class="weui-cell__bd">
                        <input class="weui-input"  v-model="password" type="password" placeholder="Password">
                    </div>
                </div>
            </div>

            <div class="ml15 mt10">如果您忘记密码了，<a href="page/password.jsp">请点击这里</a></div>

            <div class="weui-btn-area">
                <a href="javascript:;" @click="submitForm" class="weui-btn weui-btn_primary">登录</a>
            </div>
        </form>
    </section>
</body>
<script>
    $(function(){
    	//设置导航标题
    	headerVue.title = '登录';
        headerVue.rightOp = true;
        headerVue.text = '注册';
        headerVue.href = 'page/register.jsp';
    	
        new Vue({
            el: '#Form',
            data: {
                email: '',
                password: ''
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
                checkPassword: function(){
                    if(this.password.length < 6){
                        weui.topTips('密码长度不得少于6位');
                        return false;
                    }else{
                        return true;
                    }
                },
                
                //提交注册表单
                submitForm: function(){
                    if(this.checkEmail() && this.checkPassword()){
                         //校验通过
                        console.log('email: ' + this.email)
                        console.log('password: ' + this.password)
                    }
                }
            }
        });
    });
</script>
</html>