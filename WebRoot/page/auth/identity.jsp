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
                <div class="weui-cell__hd"><label class="weui-label g9">驾照号码</label></div>
                <div class="weui-cell__bd">
                    <input class="weui-input" v-model="license" type="text" placeholder="驾照号码" value="">
                </div>
            </div>

            <div class="weui-cell weui-cell_access">
                <div class="weui-cell__hd"><label class="weui-label g9">驾照获取时间</label></div>
                <div class="weui-cell__bd">
                    <input class="weui-input" @click="chooseDate" v-model="getTheTime" type="text" readonly value="">
                </div>
                <div class="weui-cell__ft"></div>
            </div>
            
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label g9">SSN号码</label></div>
                <div class="weui-cell__bd">
                    <input class="weui-input" type="text" v-model="ssnNumber" placeholder="SSN号码" value="">
                </div>
            </div>

            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label g9">SSN所在地</label></div>
                <div class="weui-cell__bd">
                    <input class="weui-input" type="text" v-model="ssnAddress" placeholder="请输入住址" value="">
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
	headerVue.title = '客户身份';

    var app = new Vue({
        el: '#App',
        data: {
            license: '456489',
            getTheTime: '2017-10-27',
            ssnNumber: 'SSF5564456',
            ssnAddress: '美国旧金山'
        },
        methods: {
            chooseDate: function(){
                var that = this,
                    defaulDate = new Date(this.getTheTime.replace(/-/g,'/') + ' 00:00:01');

                weui.datePicker({
                    defaultValue: [defaulDate.getFullYear(), defaulDate.getMonth()+1, defaulDate.getDate()],
                    onConfirm: function(res){
                        that.getTheTime = res[0] + '-' + res[1] + '-' + res[2];
                    },
                    start: 1900,
                    end: (new Date()).getFullYear()
                });
            },
            //校验
            validate: function(){
                if(this.license == ''){
                    weui.alert('请输入驾照号码')
                }else if(this.getTheTime == ''){
                    weui.alert('请选择驾照获取时间')
                }else if(this.ssnNumber == ''){
                    weui.alert('请输入SSN号码')
                }else if(this.ssnAddress == ''){
                    weui.alert('请输入SSN所在地')
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