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
	<title>Document</title>
	<%@include file="common/link.jsp"%>
</head>
<body>
	<div id="app">
		<!-- S 顶部导航 -->
		<header class="bottom-line">
			<div class="weui-flex aic container">
				<div class="mr10" @click="toggleAside(true)">
					<img width="30" src="image/icon/user.png" alt="">
				</div>
		        <div>未登录</div>
		        <div class="weui-flex__item tr">
					<a href="page/messages.jsp"><img width="30" src="image/icon/email.png" alt=""></a>
		        </div>
	        </div>
		</header>
		<!-- E 顶部导航 -->

		<!-- S 侧滑菜单 -->
		<aside class="aside" :class="{active: asideStatus}">
			<div class="weui-flex aic p10 usered">
				<div class="mr10">
					<a href="page/userInfo.jsp"><img width="60" src="image/icon/usered.png" alt="">
				</div>
		        <div class="weui-flex__item wh">未登录</div>
	        </div>

	        <div class="weui-flex mt30 tc">
	            <div class="weui-flex__item">
	            	<p class="b"><a class="gold f16" href="page/creditPoints.jsp">760</a></p>
	            	<p class="mt5">信用分</p>
	            </div>
	            <div class="weui-flex__item">
					<p class="b"><a class="gold f16" href="page/quota.jsp">$10000</a></p>
	            	<p class="mt5">额度</p>
	            </div>
	        </div>

	        <div class="weui-cells mt30">
	            <a class="weui-cell weui-cell_access" href="page/loanBill.jsp">
	                <div class="weui-cell__hd"><img src="image/icon/zd.png"/></div>
	                <div class="weui-cell__bd">
	                    <p>借款账单</p>
	                </div>
	                <div class="weui-cell__ft"></div>
	            </a>
	            <a class="weui-cell weui-cell_access" href="page/certification.jsp">
	                <div class="weui-cell__hd"><img src="image/icon/rz.png"/></div>
	                <div class="weui-cell__bd">
	                    <p>认证信息</p>
	                </div>
	                <div class="weui-cell__ft"></div>
	            </a>
	            <a class="weui-cell weui-cell_access" href="page/helpCenter.jsp">
	                <div class="weui-cell__hd"><img src="image/icon/bz.png"/></div>
	                <div class="weui-cell__bd">
	                    <p>帮助中心</p>
	                </div>
	                <div class="weui-cell__ft"></div>
	            </a>
	            <a class="weui-cell weui-cell_access" href="page/setting.jsp">
	                <div class="weui-cell__hd"><img src="image/icon/sz.png"/></div>
	                <div class="weui-cell__bd">
	                    <p>设置</p>
	                </div>
	                <div class="weui-cell__ft"></div>
	            </a>
	        </div>
		</aside>
		<!-- E 侧滑菜单 -->

		<div v-bind:class="{ backdrop: asideStatus }" @click="toggleAside(false)"></div>
	</div>
	
	<div class="main bgf8">
		<!-- S banner -->
	    <div class="swiper-container" id="bannerSwiper">
	        <div class="swiper-wrapper">
	            <div class="swiper-slide"><img width="100%" height="140" src="image/banner_1.jpg" alt=""></div>
	            <div class="swiper-slide"><img width="100%" height="140" src="image/banner_1.jpg" alt=""></div>
	        </div>
	        <!-- Add Pagination -->
	        <div class="swiper-pagination"></div>
	    </div>
	    <!-- E banner -->
		
		<!-- S 主题内容 -->
		<section>
			<div class="panel"><p>信用借款(1分钟申请，快速到账)</p></div>

			<div class="weui-flex tc bgwh bottom-line p15">
	            <div class="weui-flex__item">
	            	<p class="gold f20 b">$<span class="middle-money" id="loanMoney"></span></p>
	            	<p class="mt5">借款金额</p>
	            </div>
	            <div class="weui-flex__item">
					<p class="gold f20 b"><span class="middle-day" id="loanDay">7</span>天</p>
	            	<p class="mt5">期限</p>
	            </div>
	        </div>
			
			<div class="p15 bgwh bottom-line">
				<div class="slider-wrap pb15 bottom-line" id="sliderWrap_1">
					<p>金额($)</p>
					<div class="weui-slider-box">
			            <div class="weui-slider">
			                <div class="weui-slider__inner">
			                    <div style="width: 50%;" class="weui-slider__track"></div>
			                    <div style="left: 50%;" class="weui-slider__handler"></div>
			                </div>
			            </div>
			        </div>
			        <div class="weui-flex">
			            <div class="weui-flex__item" id="minMoney">1000</div>
			            <div class="weui-flex__item tc middle-money"></div>
			            <div class="weui-flex__item tr" id="maxMoney">20000</div>
			        </div>
				</div>

				<div class="slider-wrap pt15" id="sliderWrap_2">
					<p>期限(day)</p>
					<div class="weui-slider-box">
			            <div class="weui-slider">
			                <div class="weui-slider__inner">
			                    <div style="width: 50%;" class="weui-slider__track"></div>
			                    <div style="left: 50%;" class="weui-slider__handler"></div>
			                </div>
			            </div>
			        </div>
			        <div class="weui-flex">
			            <div class="weui-flex__item"><span id="minDay">7</span>天</div>
			            <div class="weui-flex__item tc"><span class="middle-day"></span>天</div>
			            <div class="weui-flex__item tr"><span id="maxDay">60</span>天</div>
			        </div>
				</div>
			</div>
		</section>
		<!-- E 主题内容 -->

		<div class="weui-btn-area">
	        <a href="page/loanApply.jsp" class="weui-btn weui-btn_primary">立即申请</a>
	    </div>
	</div>
</body>
	<script type="text/javascript" src="js/index.js"></script>

	<script>

		$('#test').click(function(){console.log(1)});
	</script>
</html>