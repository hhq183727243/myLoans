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
	<title>注册</title>
	
	<%@include file="common/link.jsp"%>
</head>
<body>
	<%@include file="common/header.jsp"%>
	
	<section class="main bgf8">
        <form action="" id="Form">
            <div class="panel f18 tc">用户注册</div>

            <div class="weui-cells__title">欢迎新用户，请录入您的email：</div>
    		<div class="weui-cells">
                <div class="weui-cell">
                    <div class="weui-cell__bd">
                        <input class="weui-input" v-model="email" type="email" @blur="checkEmail" placeholder="Email">
                    </div>
                </div>
            </div>
        
            <div class="weui-cells__title">
                <span class="l">设置登陆密码：　</span>
                <div class="weui-flex ml10">
                    <div class="weui-warn">弱</div>
                    <div class="weui-flex__item">
                        <div class="pw-letter">
                            <div class="pw-inner" :class="{'bg-success': intensity > 2, 'bg-danger': intensity < 2,'bg-warn': intensity == 2 }" :style="'width:' + width + ';'">
                                <span v-if="intensity < 2">弱</span>
                                <span v-if="intensity == 2">中</span>
                                <span v-if="intensity > 2">强</span>
                            </div>
                        </div>
                    </div>
                    <div class="weui-success">强</div>
                </div>
            </div>
            <div class="weui-cells">
                <div class="weui-cell">
                    <div class="weui-cell__bd">
                        <input class="weui-input" v-model="password" type="password" @input="checkIntensity" placeholder="Password">
                    </div>
                </div>
            </div>
            
            <div class="ml15 mt10">
                <label><input v-model="agree" type="checkbox" name="agree"/>我已阅读并同意<a>注册协议</a></label>
            </div>

            <div class="weui-btn-area">
                <a @click="submitForm" class="weui-btn weui-btn_primary">注册</a>
            </div>
        </form>
    </section>
</body>
<script>
    $(function(){
    	//设置导航标题
    	headerVue.title = '注册';
    	headerVue.rightOp = true;
        headerVue.text = '登录';
        headerVue.href = 'page/login.jsp';


        var registerVue = new Vue({
            el: '#Form',
            data: {
                width: 0,
                intensity: 0,
                email: '',
                password: '',
                agree: false
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
                checkStrong: function(val) {
                    var modes = 0;
                    if (val.length < 6) return 0;
                    if (/\d/.test(val)) modes++; //数字
                    if (/[a-z]/.test(val)) modes++; //小写
                    if (/[A-Z]/.test(val)) modes++; //大写  
                    if (/\W/.test(val)) modes++; //特殊字符
                    if (val.length > 12) return 4;
                    return modes;
                },

                checkIntensity: function(e){
                    var modes = this.checkStrong(e.target.value);
                    console.log(modes)
                    if(modes < 2){
                        this.width = '33.33%';
                    }else if(modes == 2){
                        this.width = '66.66%';
                    }else{
                        this.width = '100%';
                    }

                    this.intensity = modes;
                },
                //提交注册表单
                submitForm: function(){
                    if(this.checkEmail() && this.checkPassword()){
                        if(!this.agree){
                            weui.topTips('请勾选同意注册协议');
                        }else{
                             //校验通过
                            console.log('email: ' + this.email)
                            console.log('password: ' + this.password)
                            console.log('agree: ' + this.agree)
                        }
                    }
                }
            }
        });
    });
</script>
</html>