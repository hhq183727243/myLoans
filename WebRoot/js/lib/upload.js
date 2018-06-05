var Upload = {
    config: {
        url : '',
        success: function(){}
    },
    //name为后台接受file文件的名字，file为input选择的file数据
    triggerUpload : function(name,file){
        var that = this;
        
        // 遍历所有文件  ，在调用单个文件上传的方法
        $.each(file, function(k, v){
            var formdata = new FormData();
            formdata.append(name, v);
            formdata.append('relatedTable','Seller');

            that.uploadFileFun(formdata);
        });
    },
    uploadFileFun : function(formdata){
        var that = this;
        
        var xhr = new XMLHttpRequest();
        
        // 进度
        xhr.upload.addEventListener("progress",  function(e){
            // 回调到外部
            //that.onProgress(file, e.loaded, e.total);
        }, false); 
       
        // 完成
        xhr.addEventListener("load", function(e){
            var result = null;
            
            try{
                result = JSON.parse(xhr.responseText)
            }catch(e){
                result = xhr.responseText;
                console.log('后台回传数据非json格式...');
                return;
            }
            
            that.config.success(result);
        }, false);  
       
        // 错误
        xhr.addEventListener("error", function(e){
            // 回调到外部
            console.log('上传出错...');
            that.config.fail();
        }, false);  
        
        xhr.open("POST",this.config.url, true);
        xhr.setRequestHeader("X_FILENAME", '');
        xhr.send(formdata);
    }
}
