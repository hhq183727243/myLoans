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
                <div class="weui-cell__hd"><label class="weui-label g9">工作单位</label></div>
                <div class="weui-cell__bd">
                    <input class="weui-input" v-model="company" type="text" placeholder="单位" value="">
                </div>
            </div>

            <div class="weui-cell">
                <div class="weui-cell__hd"><label for="" class="weui-label g9">联系电话</label></div>
                <div class="weui-cell__bd">
                    <input class="weui-input" v-model="telephone" type="text" value="1528888887">
                </div>
            </div>
            
            <div class="weui-cell weui-cell_access">
                <div class="weui-cell__hd"><label class="weui-label g9">入职日期</label></div>
                <div class="weui-cell__bd">
                    <input class="weui-input" @click="chooseDate" v-model="startTime" type="text" readonly="" placeholder="日期 " value="2017-10-27">
                </div>
                <div class="weui-cell__ft"></div>
            </div>

            <div class="weui-cell weui-cell_select weui-cell_select-after">
                <div class="weui-cell__hd"><label class="weui-label g9">工作年限</label></div>
                <div class="weui-cell__bd">
                    <select class="weui-select" v-model="workYear" name="select1">
                        <option value="1">1年</option>
                        <option value="2" selected>2年</option>
                        <option value="3">3年</option>
                        <option value="4">4年</option>
                        <option value="5">5年</option>
                        <option value="6">6年</option>
                    </select>
                </div>
            </div>


            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label g9">工作岗位</label></div>
                <div class="weui-cell__bd">
                    <input class="weui-input" v-model="job" type="text" placeholder="工作岗位" value="JAVA 架构师">
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
    headerVue.title = '工作情况';
    
    var app = new Vue({
        el: '#App',
        data: {
            company: 'Facebook',
            telephone: '1528888887',
            startTime: '2017-11-12',
            workYear: '1',
            job: 'JAVA 架构师'
        },
        methods: {
            chooseDate: function(){
                var that = this,
                    defaulDate = new Date(this.startTime.replace(/-/g,'/') + ' 00:00:01');

                weui.datePicker({
                    defaultValue: [defaulDate.getFullYear(), defaulDate.getMonth()+1, defaulDate.getDate()],
                    onConfirm: function(res){
                        that.startTime = res[0] + '-' + res[1] + '-' + res[2];
                    },
                    start: 1900,
                    end: (new Date()).getFullYear()
                });
            },
            //校验
            validate: function(){
                if(this.company == ''){
                    weui.alert('请输入工作单位')
                }else if(this.telephone == ''){
                    weui.alert('请选择联系电话')
                }else if(this.startTime == ''){
                    weui.alert('请输入入职时间')
                }else if(this.workYear == ''){
                    weui.alert('请选择工作年限')
                }else if(this.job == ''){
                    weui.alert('请输入工作岗位')
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