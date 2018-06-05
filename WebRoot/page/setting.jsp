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
	<title>帮助中心</title>
	
	<%@include file="common/link.jsp"%>
</head>
<body>
	<%@include file="common/header.jsp"%>
	
	<section class="main bgf5">
        <div class="weui-cells">
            <a class="weui-cell weui-cell_access j-show-answer" href="page/modifyPassword.jsp">
                <div class="weui-cell__bd">
                    <p>修改登录密码</p>
                </div>
                <div class="weui-cell__ft"></div>
            </a>
            <a class="weui-cell weui-cell_access" id="clearLocalStorage" href="javascript:;">
                <div class="weui-cell__bd">
                    <p>清除缓存</p>
                </div>
                <div class="weui-cell__ft"></div>
            </a>
            <div class="weui-cell" href="javascript:;">
                <div class="weui-cell__bd">
                    <p>当前版本</p>
                </div>
                <div class="weui-cell__ft">1.0.1</div>
            </div>
        </div>

        <div class="weui-btn-area">
            <a href="page/home.jsp" class="weui-btn weui-btn_primary">退出登录</a>
        </div>
    </section>
</body>
<script>
    $(function(){
    	//设置导航标题
    	headerVue.title = '设置';

        /* 清除本地缓存 */
        $('#clearLocalStorage').click(function(){
            
            weui.confirm('确认清除？',function(res){
                if(res.isTrusted){
                    localStorage.clear();
                    sessionStorage.clear();
                    weui.toast('已清除',2000)
                }
            })
        });
    });
</script>
</html>