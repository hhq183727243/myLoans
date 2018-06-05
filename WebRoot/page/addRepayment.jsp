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
	<title>还款</title>
	
	<%@include file="common/link.jsp"%>
</head>
<body>
	<%@include file="common/header.jsp"%>
	
	<section class="main bgfb" id="App">
        <div class="panel">请您输入本次还款信息</div>
        
        <!-- S 还款信息 -->
        <div class="weui-cells">
            <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label g9">还款账号</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" v-model="accountNumber" type="number" pattern="[0-9]*" placeholder="账号">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label g9">开户人</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" v-model="accountName" type="text" placeholder="开户人姓名">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label g9">银行流水号</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" v-model="serialNumber" type="text" placeholder="流水号">
                </div>
            </div>

            <div class="weui-cell">
                <div class="weui-cell__bd">
                    <div class="weui-uploader">
                        <div class="weui-uploader__hd">
                            <p class="weui-uploader__title g9">转账凭证</p>
                        </div>
                        <div class="weui-uploader__bd">
                            <ul class="weui-uploader__files" id="uploaderFiles">
                                <li class="weui-uploader__file" data-url="image/test/p1.jpg" style="background-image:url(image/test/p1.jpg)"></li>
                            </ul>
                            <div class="weui-uploader__input-box">
                                <input id="uploaderInput" class="weui-uploader__input" type="file" accept="image/*" multiple="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- E 还款信息 -->

        <div class="weui-btn-area">
            <a href="javascript:;" @click="submitForm" id="submitBtn" class="weui-btn weui-btn_primary">提交</a>
        </div>
    </section>
</body>
<script>
$(function(){
	//设置导航标题
	headerVue.title = '还款信息';
    headerVue.text = '明细';
    headerVue.href = 'page/repaymentList.jsp';

	var app = new Vue({
        el: '#App',
        data: {
            accountNumber: '',
            accountName: '',
            serialNumber: ''
        },
        methods: {
            //校验
            validate: function(){
                if(this.accountNumber == ''){
                    weui.alert('请输入还款账号')
                }else if(this.accountName == ''){
                    weui.alert('请输入开户人姓名')
                }else if(this.serialNumber == ''){
                    weui.alert('请输入流水号')
                }else if($('#uploaderFiles li').length == 0){
                    weui.alert('请上传转账凭证')
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

    var tmpl = '<li class="weui-uploader__file" data-url="#url#" style="background-image:url(#url#)"></li>',
        $gallery = $("#gallery"), 
        $galleryImg = $("#galleryImg"),
        $uploaderInput = $("#uploaderInput"),
        $uploaderFiles = $("#uploaderFiles");

    $uploaderInput.on("change", function(e){
        var src, 
            url = window.URL || window.webkitURL || window.mozURL, 
            files = e.target.files;
        for (var i = 0, len = files.length; i < len; ++i) {
            var file = files[i];

            if (url) {
                src = url.createObjectURL(file);
            } else {
                src = e.target.result;
            }

            $uploaderFiles.append($(tmpl.replace(/#url#/g, src)));
        }
    });
    
    $uploaderFiles.on("click", "li", function(){
        var weuig = weui.gallery($(this).data('url'),{
            onDelete: function(arg){
                console.log(arg)
                $('#uploaderFiles').find('li[data-url="' + arg+ '"]').remove();
                weuig.hide();
            }
        });
    });
});
</script>
</html>