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
	<title>明细</title>
	
	<%@include file="common/link.jsp"%>
</head>
<body>
	<%@include file="common/header.jsp"%>
	
	<section class="main bgf5">
        <form action="" id="Form">
            <div class="userinfo tc">
                <div class="dib rel">
                    <img class="userhead" :src="portrait" />
                    <input class="choose-img" type="file" @change="choosePortrait" accept="image/gif,image/jpeg,image/png,image/jpg,image/bmp">
                </div>
                <div class="mt10">张长青</div>
            </div>

            <div class="weui-cells weui-cells_form">
                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label g9">姓名</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" type="text" placeholder="请输入姓名">
                    </div>
                </div>
                <div class="weui-cell weui-cell_select weui-cell_select-after">
                    <div class="weui-cell__hd">
                        <label class="weui-label g9">性别</label>
                    </div>
                    <div class="weui-cell__bd">
                        <select class="weui-select" name="select1">
                            <option value="-1">请选择</option>
                            <option value="1">男</option>
                            <option value="2">女</option>
                        </select>
                    </div>
                </div>

                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label g9">手机号</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" type="number" value="" placeholder="手机号">
                    </div>
                </div>

                <div class="weui-cell weui-cell_access">
                    <div class="weui-cell__hd"><label class="weui-label g9">出生日期</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" id="birthday" type="text" @click="chooseDate" readonly v-model="birthday" placeholder="yyyy-mm-dd">
                    </div>
                    <div class="weui-cell__ft"></div>
                </div>
                
                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label g9">电子邮箱</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" type="email" @blur="checkEmail" placeholder="请输入邮箱">
                    </div>
                </div>

                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label g9">当前住址</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" type="text" placeholder="请输入住址">
                    </div>
                </div>

                <div class="weui-cell weui-cell_select weui-cell_select-after">
                    <div class="weui-cell__hd">
                        <label class="weui-label g9">婚姻状况</label>
                    </div>
                    <div class="weui-cell__bd">
                        <select class="weui-select" name="select2">
                            <option value="-1">请选择</option>
                            <option value="1">已婚</option>
                            <option value="2">未婚</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="weui-btn-area">
                <a href="javascript:void(0);" @click="submitForm" class="weui-btn weui-btn_primary">保存修改</a>
            </div>
        </form>
    </section>
</body>
<script>
    $(function(){
    	//设置导航标题
    	headerVue.title = '个人资料';

        var registerVue = new Vue({
            el: '#Form',
            data: {
                portrait: 'image/test.png',
                birthday: '2010-10-31'
            },
            methods: {
                //上传头像
                choosePortrait: function(e){
                    var that = this;
                    Upload.config.url = 'upload/uploadAction';

                    //第一个参数后台接受的name，第二个参数file数据
                    Upload.triggerUpload('file',e.target.files);

                    Upload.config.success = function(res){
                        //上传成功回调
                        console.log(res)
                        //将后台返回的url赋值给portrait
                        that.portrait = res.data;
                    };
                },
                //选择出生日期
                chooseDate: function(){
                    var that = this;
                    var defaulDate = new Date(this.birthday.replace(/-/g,'/') + ' 00:00:01')

                    weui.datePicker({
                        id: "birthday",
                        defaultValue: [defaulDate.getFullYear(), defaulDate.getMonth()+1, defaulDate.getDate()],
                        onConfirm: function(res){
                            that.birthday = res[0] + '-' + res[1] + '-' + res[2]
                        },
                        start: 1900,
                        end: (new Date()).getFullYear()
                    });
                },
                //邮箱检查
                checkEmail: function(e){
                    var reg = new RegExp(/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/);
                    
                    if(!reg.test(e.target.value)){
                        weui.topTips('邮箱格式错误');
                    }
                },
                submitForm: function(){
                    weui.alert('保存成功',function(){

                        console.log('点击确定后回调函数');
                    });
                }
            }
        });
    });
</script>
</html>