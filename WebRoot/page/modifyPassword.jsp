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
	<title>修改密码</title>
	
	<%@include file="common/link.jsp"%>
</head>
<body>
	<%@include file="common/header.jsp"%>
	
	<section class="main bgf8">
        <form action="" id="passwordForm">
            <div class="weui-cells__title">请输入旧密码</div>
            <div class="weui-cells">
                <div class="weui-cell">
                    <div class="weui-cell__bd">
                        <input class="weui-input" v-model="oldPassword" type="password" placeholder="旧密码">
                    </div>
                </div>
            </div>

            <div class="weui-cells__title">
                <span class="l">请输入新密码　　</span>
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
                        <input class="weui-input" v-model="newPassword" @input="checkIntensity" type="password" placeholder="新密码">
                    </div>
                </div>
            </div>
        
            <div class="weui-cells__title">重复新密码：</div>
            <div class="weui-cells">
                <div class="weui-cell">
                    <div class="weui-cell__bd">
                        <input class="weui-input" v-model="repeatPassword" type="password" placeholder="重复密码：">
                    </div>
                </div>
            </div>

            <div class="weui-btn-area">
                <a href="javascript:;" @click="submitForm" class="weui-btn weui-btn_primary">确认</a>
            </div>
        </form>
    </section>
</body>
<script>
    $(function(){
    	//设置导航标题
    	headerVue.title = '修改密码';

        var resetPassword = new Vue({
            el: '#passwordForm',
            data: {
                width: 0,
                intensity: 0,
                oldPassword: '',
                newPassword: '',
                repeatPassword: ''
            },
            methods: {
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
                    
                    if(e.target.value == ''){
                        this.width = '0';
                    }else if(modes < 2){
                        this.width = '33.33%';
                    }else if(modes == 2){
                        this.width = '66.66%';
                    }else{
                        this.width = '100%';
                    }

                    this.intensity = modes;
                },
                checkPassword: function(){
                    if(this.oldPassword.length == 0){
                        weui.topTips('请输入旧密码');
                        return false;
                    }else if(this.newPassword.length < 6){
                        weui.topTips('新密码长度不得少于6位');
                        return false;
                    }else if(this.newPassword != this.repeatPassword){
                        weui.topTips('两次密码不一致');
                        return false;
                    }else{
                        return true;
                    }
                },
                submitForm: function(){
                    if(this.checkPassword()){
                        //校验通过
                        console.log(this.oldPassword);
                        console.log(this.newPassword);
                        console.log(this.repeatPassword);
                    }
                }
            }
        });
    });
</script>
</html>