function getStyle(ele,attr){
	if (ele.currentStyle) {
		return ele.currentStyle[attr];
	} else{
		return getComputedStyle(ele,false)[attr];
	}
}
function move(ele,json,callBack){
	   clearInterval(ele.time);
	   ele.time=setInterval(function(){
	   	var flag=true;
	   	for (var attr in json) {
	   		var iNow=attr=="opcity"?getStyle(ele,attr)*100:parseInt(getStyle(ele,attr));
	   		var speed=(json[attr]-iNow)/7;
	   		speed= speed<0?Math.floor(speed):Math.ceil(speed);
	   		if (json[attr]!=iNow) {
	   			flag=false;
	   		} 
	   		if (iNow=="opcity") {
	   			ele.style.opcity=(iNow+speed)/100;
	   			ele.style.filter="(alpha="+(iNow+speed)+")";
	   		} else{
	   			ele.style[attr]=iNow+speed+"px";
	   		}
	   	}
	   	if (flag) {
	   		clearInterval(ele.time);
	   		if (callBack) {
	   			callBack();
	   		}
	   	}
	   },30)
}
