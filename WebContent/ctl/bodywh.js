/**
 * 
 */
$(function(){
  //返回当前页面高度 
  function pageHeight(){ 
    if($.browser.msie){ 
       return document.compatMode == "CSS1Compat"?  document.documentElement.clientHeight : 
    	   document.body.clientHeight; 
    }else{ 
      return self.innerHeight; 
   } 
}; 
 
//返回当前页面宽度 
  function pageWidth(){ 
    if($.browser.msie){ 
      return document.compatMode == "CSS1Compat"? document.documentElement.clientWidth : 
    	  document.body.clientWidth; 
    }else{ 
      return self.innerWidth; 
    } 
};
   //获取页面高度和宽度
   var page_width = pageWidth();
   var page_height = pageHeight()*0.8;
  //设置table高度
  $("#tb1").width(page_width);
  $("#tb1").height(page_height);
});
