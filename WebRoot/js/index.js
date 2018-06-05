$(function(){

	var swiper = new Swiper('#bannerSwiper', {
        pagination: '.swiper-pagination',
        paginationClickable: true
    });


	//贷款金额
    var initMoney = function(){
        var $loanMoney = $('#loanMoney'),
            min = parseInt($('#minMoney').text(),10),//最新金额
            max = parseInt($('#maxMoney').text(),10),//最大金额
            step = max/100 < 500 ? 500 : 1000;//每次增长;

        var stepNum = Math.ceil((max - min) / step);

        $('.middle-money').text(Math.ceil(50 * stepNum/100) * step + min);
        //var step = Math.ceil((max - min) / 10000) * 100;//每1%增长金额，并取整百

        sliderTool($('#sliderWrap_1'),function(percent){
            //var result = min + percent * step;
            var result = Math.ceil(percent * stepNum/100) * step + min;

            $loanMoney.text(result > max ? max : result);//设置金额，不超过最大金额
        });
    }();
	
    
    //贷款天数
    var initDay = function(){
        var $loanDay = $('#loanDay'),
            min = parseInt($('#minDay').text(),10),//最新金额
            max = parseInt($('#maxDay').text(),10);//最大金额

        $('.middle-day').text(Math.ceil((max - min) / 2));

        var step = (max - min) / 100;//每1%增长金额，并取整百

        sliderTool($('#sliderWrap_2'),function(percent){
            var result = Math.ceil(min + percent * step);

            $loanDay.text(result > max ? max : result);//设置金额，不超过最大金额
        });
    }();


    //vue 初始化
    var app = new Vue({
  		el: '#app',
		data: {
			asideStatus: false
		},
		methods: {
		    toggleAside: function (status) {
		      	this.asideStatus = status
		    }
		}
	})

});


/* 滑条拖拽 */
function sliderTool($sliderWrap,callback){
    var $sliderTrack = $sliderWrap.find('.weui-slider__track:first'),
        $sliderHandler = $sliderWrap.find('.weui-slider__handler:first');

    var totalLen = $sliderWrap.find('.weui-slider__inner:first').width(),
    	startLeft = 0,
        startX = 0;

    $sliderHandler
        .on('touchstart', function (e) {
            startLeft = parseInt($sliderHandler.css('left')); //* totalLen / 100;
            startX = e.originalEvent.changedTouches[0].clientX;
        })
        .on('touchmove', function(e){
            var dist = startLeft + e.originalEvent.changedTouches[0].clientX - startX,
                percent;
            dist = dist < 0 ? 0 : dist > totalLen ? totalLen : dist;
            percent =  parseInt(dist / totalLen * 100);
            $sliderTrack.css('width', percent + '%');
            $sliderHandler.css('left', percent + '%');
            
            callback(percent);

            e.preventDefault();
        });
}