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
	
	<section class="main bgf8" id="App">
        <div class="panel">当前选择的借款信息：</div>
        
        <div class="bgwh p20 bottom-line">
            <div class="weui-flex tc">
                <div class="weui-flex__item">
                    <p class="gold f16 b">$<span id="loanMoney">10000</span></p>
                    <p class="mt5">借款金额</p>
                </div>
                <div class="weui-flex__item">
                    <p class="gold f16 b"><span id="loanDay">7</span>天</p>
                    <p class="mt5">期限</p>
                </div>
                <div class="weui-flex__item">
                    <p class="gold f16 b">$700</p>
                    <p class="mt5">预计费用</p>
                </div>
            </div>
        </div>

        <div class="weui-cells">
            <div class="weui-cell weui-cell_select weui-cell_select-after">
                <div class="weui-cell__hd"><img src="image/icon/zd.png"/></div>
                <div class="weui-cell__hd">
                    <label class="weui-label g9">收款账号</label>
                </div>
                <div class="weui-cell__bd">
                    <select class="weui-select select_account" @change="selectAccount" v-model="account" name="select2">
                        <option value="1">张长青-66225486545</option>
                        <option value="2">张小程-66225486545</option>
                        <option value="3">张丽丽-66225486545</option>
                        <option value="-1">其他账户</option>
                    </select>
                </div>
            </div>

            <div class="weui-cell other_account" :class="{dn: !isAtherAccount}">
                <div class="weui-cell__hd"><img src="image/icon/card.png"/></div>
                <div class="weui-cell__hd">
                    <label class="weui-label g9">其他账户</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" v-model="accountNumber" type="text" placeholder="账户号码" autocomplete="off">
                </div>
            </div>
            <div class="weui-cell other_account" :class="{dn: !isAtherAccount}">
                <div class="weui-cell__hd"><img src="image/icon/user.png"/></div>
                <div class="weui-cell__hd">
                    <label class="weui-label g9">开户人</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" v-model="accountName" type="text" placeholder="开户人姓名" autocomplete="off">
                </div>
            </div>

            <div class="weui-cell">
                <div class="weui-cell__hd"><img src="image/icon/rz.png"/></div>
                <div class="weui-cell__hd">
                    <label class="weui-label g9">借款用途</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" v-model="use" type="text" placeholder="用途" autocomplete="off">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><img src="image/icon/bz.png"/></div>
                <div class="weui-cell__hd">
                    <label class="weui-label g9">交易密码</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" v-model="password" type="password" placeholder="密码" autocomplete="off">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__bd">
                    <label>
                        <input type="checkbox" v-model="agreement" name="checkbox1" checked="checked">
                        我已阅读并同意<a>《借款协议》</a></label>
                </div>
            </div>
        </div>
		

        <div class="weui-btn-area">
            <a href="javascript:;" @click="submitForm" id="submitBtn" class="weui-btn weui-btn_primary">提交申请</a>
        </div>
    </section>
</body>
<script>
$(function(){
	//设置导航标题
	headerVue.title = '借款申请';

	app = new Vue({
        el: '#App',
        data: {
            isAtherAccount: false,
            account: '1',
            accountNumber: '',
            accountName: '',
            use: '买车',
            password: '123455',
            agreement: false
        },
        methods: {
            selectAccount: function(){
               this.isAtherAccount = this.account == -1;
            },
            //校验
            validate: function(){
                if(this.isAtherAccount){
                    if(this.accountNumber == ''){
                        weui.alert('请输入账户号码');
                        return false;
                    }else if(this.accountName == ''){
                        weui.alert('请输入开户人姓名');
                        return false;
                    }
                }

                if(this.use == ''){
                    weui.alert('请输入借款用途')
                }else if(this.password == ''){
                    weui.alert('请输入交易密码')
                }else if(!this.agreement){
                    weui.alert('请勾选借款协议')
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