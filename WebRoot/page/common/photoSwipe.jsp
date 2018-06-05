<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="PhotoSwipe/photoswipe.css"> 
<link rel="stylesheet" href="PhotoSwipe/default-skin/default-skin.css">
<script src="PhotoSwipe/photoswipe-ui-default.js"></script>
<script src="PhotoSwipe/photoswipe.js"></script>


<div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">
    <!-- Background of PhotoSwipe. 
         It's a separate element, as animating opacity is faster than rgba(). -->
    <div class="pswp__bg"></div>

    <!-- Slides wrapper with overflow:hidden. -->
    <div class="pswp__scroll-wrap">

    <!-- Container that holds slides. PhotoSwipe keeps only 3 slides in DOM to save memory. -->
    <div class="pswp__container">
        <!-- don't modify these 3 pswp__item elements, data is added later on -->
        <div class="pswp__item"></div>
        <div class="pswp__item"></div>
        <div class="pswp__item"></div>
    </div>

    <!-- Default (PhotoSwipeUI_Default) interface on top of sliding area. Can be changed. -->
    <div class="pswp__ui pswp__ui--hidden">

        <div class="pswp__top-bar">

            <!--  Controls are self-explanatory. Order can be changed. -->

            <div class="pswp__counter"></div>

            <button class="pswp__button pswp__button--close" title="退出(Esc)"></button>

            <button class="pswp__button pswp__button--share" title="Share"></button>

            <button class="pswp__button pswp__button--fs" title="全屏"></button>

            <button class="pswp__button pswp__button--zoom" title="缩放"></button>

            <!-- Preloader demo https://codepen.io/dimsemenov/pen/yyBWoR -->
            <!-- element will get class pswp__preloader--active when preloader is running -->
            <div class="pswp__preloader">
                <div class="pswp__preloader__icn">
                  <div class="pswp__preloader__cut">
                    <div class="pswp__preloader__donut"></div>
                  </div>
                </div>
            </div>
        </div>

        <div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
            <div class="pswp__share-tooltip"></div> 
        </div>

        <button class="pswp__button pswp__button--arrow--left" title="上一张">
        </button>

        <button class="pswp__button pswp__button--arrow--right" title="下一张">
        </button>

        <div class="pswp__caption">
            <div class="pswp__caption__center"></div>
        </div>

      </div>

    </div>
</div>

<script type="text/javascript">
window.onload=function(){
	auto_data_size();
};

function auto_data_size(){
	var imgs= $('#pingzheng img');
	
	imgs.each(function(index,item){
		var img = new Image();

		img.onload = function(){
			var w = img.width,
				h = img.height,
				width = w > 1024 ? 1024 : w,
				height = w > 1024 ? (h * 1024 / w) : h;
			
			$(item).data('size',width + 'x' + parseInt(height,10));
		};
		
		img.src = $(this).attr('src').split('_')[0];
	})
};

function createItems(){
	var imgs = $("#pingzheng img"),
		items = [];

	imgs.each(function(index,item){
		var size = $(item).data('size').split('x'),
			width = parseInt(size[0],10),
			height = parseInt(size[1],10),
			src = $(item).attr('src').split('_')[0];
			
		items.push({
			src: src,
            w: width,
            h: height
		});
	});

	return items
}

var openPhotoSwipe = function() {
    var pswpElement = document.querySelectorAll('.pswp')[0];

    // build items array
    var items = createItems();
    
    // define options (if needed)
    var options = {
    	index: $('#thumbnailListWrap .show_current').index(),
        // history & focus options are disabled on CodePen        
        history: false,
        focus: false,
        loop: false,
        closeOnScroll: false,
        //showAnimationDuration: 0,
        //hideAnimationDuration: 0,
        mainClass: 'pswp--minimal--dark',
        barsSize: {top:0,bottom:0},
		captionEl: false,
		fullscreenEl: true,
		shareEl: false,
		bgOpacity: 0.85,
		tapToClose: true,
		tapToToggleControls: false
        
    };
    
    var gallery = new PhotoSwipe(pswpElement, PhotoSwipeUI_Default, items, options);
    gallery.init();
};


//查看原图事件绑定	
$('#originalImg').click(function(){	
	openPhotoSwipe();
});
</script>
</html>
