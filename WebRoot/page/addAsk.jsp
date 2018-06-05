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
	<title>我要反馈</title>
	
	<%@include file="common/link.jsp"%>
</head>
<body>
	<%@include file="common/header.jsp"%>
	
	<section class="main bgf5">
		<div class="weui-cells">
            <div class="weui-cell weui-cell_select">
                <div class="weui-cell__bd">
                    <select class="weui-select g6" name="select1">
                        <option value="-1">请选择问题类型</option>
                        <option value="1">类型一</option>
                        <option value="2">类型一</option>
                        <option value="3">类型一</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="weui-cells">
            <div class="weui-cell">
                <div class="weui-cell__bd">
                    <textarea class="weui-textarea" placeholder="亲，您的每个问题都将来帮助我们改善产品，期待您的反馈！" rows="4"></textarea>
                    <div class="weui-textarea-counter"><span>0</span>/200</div>
                </div>
            </div>
        </div>

        <div class="weui-cells weui-cells_form">
            <div class="weui-cell">
                <div class="weui-cell__bd">
                    <div class="weui-uploader">
                        <div class="weui-uploader__hd">
                            <p class="weui-uploader__title g9">上传问题截图（最多5张）</p>
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

        <div class="weui-btn-area">
	        <a href="javascript:;" class="weui-btn weui-btn_primary">提交</a>
	    </div>
    </section>
	
</body>
<script>
    $(function(){
    	//设置导航标题
    	headerVue.title = '我要反馈';
    	
        var tmpl = '<li class="weui-uploader__file" data-url="#url#" style="background-image:url(#url#)"></li>',
            $gallery = $("#gallery"), 
            $galleryImg = $("#galleryImg"),
            $uploaderInput = $("#uploaderInput"),
            $uploaderFiles = $("#uploaderFiles");

        //上传图片配置
        Upload.config = {
            url: 'upload/uploadAction.do',//异步上传url
            success: function(){//上传成功回调函数
                console.log(res)
            }
        }        

        //选择图片
        $uploaderInput.on("change", function(e){
            var src, 
                url = window.URL || window.webkitURL || window.mozURL, 
                files = e.target.files;
            
            //页面预览
            for (var i = 0, len = files.length; i < len; ++i) {
                var file = files[i];

                if (url) {
                    src = url.createObjectURL(file);
                } else {
                    src = e.target.result;
                }

                $uploaderFiles.append($(tmpl.replace(/#url#/g, src)));
            }

            //触发上传方法
            Upload.triggerUpload('filename',files);
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