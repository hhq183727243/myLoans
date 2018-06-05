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
	
	<section class="main bgf8" id="App11" v-cloak>
        <div class="panel">当前还有两笔借款未还清，金额：$20000</div>

        <div class="mt15" v-for="(item,index) in  viewList"> 
            <div class="weui-cells__title">{{item.year}}</div>

    		<div class="weui-cells">
                <a class="weui-cell weui-cell_access" v-for="it in item.children" href="page/loanDetail.jsp">
                    <div class="weui-cell__bd">
                        <p>{{it.content}}
                            <span v-if="it.status == 0" class="weui-info">（放款中）</span>
                            <span v-if="it.status == 1" class="weui-success">（已结清）</span>
                            <span v-if="it.status == 2" class="weui-warn">（已逾期）</span>
                        </p>
                    </div>
                    <div class="weui-cell__ft">$5000</div>
                </a>
            </div>
        </div>
        
        <div class="weui-loadmore" v-show="loading">
            <i class="weui-loading"></i>
            <span class="weui-loadmore__tips">正在加载</span>
        </div>

        <div class="weui-loadmore weui-loadmore_line" v-show="!loading">
            <a class="weui-loadmore__tips" @click="loadMore">点击加载更多</a>
        </div>

        <div class="weui-btn-area">
            <a href="page/loanApply.jsp" class="weui-btn weui-btn_primary">借款申请</a>
        </div>
    </section>
</body>
<script>
    $(function(){
    	//设置导航标题
    	headerVue.title = '借款账单';

        var app = new Vue({
            el: '#App11',
            data: {
                list: [],
                viewList: [],//按年月分类后的列表
                currentPage: 1,
                loading: false//是否在加载中
            },
            methods: {
                //加载更多
                loadMore: function(){
                    var that = this;
                    this.loading = true;

                    setTimeout(function() {
                        that.getList(that.currentPage + 1);
                    },500);
                },
                //获取列表
                getList: function(currentPage){
                    var res = [];
                    for(var i = 0;i < 5; i++){
                        res.push({
                            id: Math.random(),
                            time: '2017-0' + currentPage + '-9 09:15:36',
                            content: '借款用途',
                            status: i%3
                        });
                    }

                    this.currentPage = currentPage;
                    this.list = this.list.concat(res);
                    this.loading = false;

                    this.classification();
                },
                //按年月分类数据
                classification: function(){
                    var that = this,
                        temp = [];

                    this.list.forEach(function(item,idx){
                        var time = strToDateformat(item.time,'yyyy-MM');

                        if(temp.length == 0){
                            temp.push({
                                year: time,
                                children: [item]
                            });
                        }else{
                            var len = temp.length;

                            for(var i = 0;i < len;i++){
                                if(temp[i].year == time){
                                    temp[i].children.push(item);
                                    break;
                                }

                                if(i == temp.length - 1){
                                    temp.push({
                                        year: time,
                                        children: [item]
                                    });
                                }
                            }
                        }
                    });

                    this.viewList = temp;
                }
            },
            mounted: function(){
                var that = this;

                this.$nextTick(function(){
                    that.getList(1);
                })
            }
        });
    });
</script>
</html>