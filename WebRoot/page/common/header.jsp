<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!-- S 顶部导航 -->
<header class="bottom-line" id="header">
	<div class="weui-flex aic container">
		<div>
			<a class="db" href="javascript:history.go(-1);">
				<img height="30" src="image/icon/return.png" alt="">
			</a>
		</div>
        <div class="weui-flex__item tc f16">{{title}}</div>
        <div class="vh" v-if="!rightOp"><img height="30" src="image/icon/return.png"></div>
        <div v-else><a class="f16" :href="href">{{text}}</a></div>
    </div>
</header>
<!-- E 顶部导航 -->

<div style="height: 40px;"></div>

<script>
	var headerVue = new Vue({
  		el: '#header',
		data: {
			title: '',
			text: '首页',
			href: 'page/home.jsp',
			rightOp: true
		},
		methods: {}
	})
</script>
