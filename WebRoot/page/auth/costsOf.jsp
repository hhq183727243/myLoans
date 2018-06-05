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
                <div class="weui-cell__hd"><label class="weui-label g9">住房支出</label></div>
                <div>$</div>
                <div class="weui-cell__bd">
                    <input class="weui-input" v-model="money1" type="tel" placeholder="住房支出" value="">
                </div>
            </div>

            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label g9">生活支出</label></div>
                <div>$</div>
                <div class="weui-cell__bd">
                    <input class="weui-input" v-model="money2" type="tel" maxlength="10" placeholder="生活支出" value="">
                </div>
            </div>
            
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label g9">出行支出</label></div>
                <div>$</div>
                <div class="weui-cell__bd">
                    <input class="weui-input" v-model="money3" type="tel" placeholder="出行支出" value="">
                </div>
            </div>

            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label g9">其他支出</label></div>
                <div>$</div>
                <div class="weui-cell__bd">
                    <input class="weui-input" v-model="money4" type="tel" placeholder="其他支出" value="">
                </div>
            </div>
        </div>

        <div class="weui-btn-area">
            <button type="button" @click="submitForm" class="weui-btn weui-btn_primary">重新认证</button>
        </div>
    </section>
</body>
<script>
$(function(){
	//设置导航标题
	headerVue.title = '费用开销';
	
    var app = new Vue({
        el: '#App',
        data: {
            money1: '2000',
            money2: '2000',
            money3: '2000',
            money4: '2000'
        },
        filters: {
            money: function(val){
                var val = val + '',mod,output
                if(isNaN(val)){
                   return '0.00'
                }else{
                    if(val.indexOf('.') < 0){
                        mod = val.length % 3;
                        output = (mod == 0 ? '' : (val.substring(0, mod)));

                        for (i = 0; i < Math.floor(val.length / 3); i++){  
                            if ((mod == 0) && (i == 0))  
                                output += val.substring(mod + 3 * i, mod + 3 * i + 3);  
                            else  
                                output += ',' + val.substring(mod + 3 * i, mod + 3 * i + 3);  
                        }

                        output = output + '.00';
                    }else{
                        var integerNum = val.split('.')[0],
                            decimalNum = val.split('.')[1];

                        mod = integerNum.length % 3;
                        output = (mod == 0 ? '' : (integerNum.substring(0, mod)));

                        for (i = 0; i < Math.floor(integerNum.length / 3); i++){  
                            if ((mod == 0) && (i == 0))  
                                output += integerNum.substring(mod + 3 * i, mod + 3 * i + 3);  
                            else  
                                output += ',' + integerNum.substring(mod + 3 * i, mod + 3 * i + 3);  
                        }

                        if(decimalNum.length == 0){
                            output = output + '.00';
                        }else if(decimalNum.length == 1){
                            output = output + '.' + decimalNum + '0';
                        }else if(decimalNum.length == 2){
                            output = output + '.' + decimalNum;
                        }else{
                            output = output + '.' + decimalNum.substring(0,2);
                        }
                    }
                }

                return output
            }
        },
        methods: {
            //校验
            validate: function(){
                if(this.money1 == ''){
                    weui.alert('请输入住房支出')
                }else if(this.money2 == ''){
                    weui.alert('请输入生活支出')
                }else if(this.money3 == ''){
                    weui.alert('请输入出行支出')
                }else if(this.money3 == ''){
                    weui.alert('请输入其他支出')
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