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
        <div class="panel">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo.
        </div>
        
        <div class="weui-cells weui-cells_form">
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label g9">交易秘密</label></div>
                <div class="weui-cell__bd">
                    <input class="weui-input" v-model="password" type="password" placeholder="交易秘密" value="456489">
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
	headerVue.title = '交易秘密';
	
    var app = new Vue({
        el: '#App',
        data: {
            password: '12345'
        },
        methods: {
            //校验
            validate: function(){
                if(this.password == ''){
                    weui.alert('请输入交易密码')
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
        }
    });
});
</script>
</html>