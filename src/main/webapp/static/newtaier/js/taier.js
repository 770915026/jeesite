//vote function
function voteIco(paraId){
	var voteEm = document.getElementById(paraId.voteIco);	
	var voteIntro = document.getElementById(paraId.voteContent);
	$('#'+paraId.voteIco).on('click', function(){
		$('#'+paraId.voteContent).fadeToggle(800)
	})
	// voteEm.onclick = function(){
	// 	if(voteIntro.style.display == "none"){
	// 		voteIntro.style.display = "block";	
	// 	}else{
	// 		voteIntro.style.display = "none";		
	// 	}
	// }
	// voteIntro.onclick = function(){
	// 	voteIntro.style.display = "none";	
	// }
}
//pictrue list
function pictrueList(numPara){
	var numMath = numPara.listNum;
	//左边箭头
	var leftArrow = document.getElementById(numPara.leftArrow);
	var jQleftArrow = jQuery(leftArrow);
	//右边箭头
	var rightArrow = document.getElementById(numPara.rightArrow);
	var jQrightArrow = jQuery(rightArrow);
	//滚动元素
	var scrollId = document.getElementById(numPara.scrollId);	
	var jQscrollId = jQuery(scrollId);
	var lis = document.getElementById(numPara.scrollId).getElementsByTagName("dd").length;
	//默认数值
	var currentPath = 0;
	var distance = numPara.spaceLong;	
	//点击左边箭头
	jQleftArrow.click(function(){
		if(currentPath <lis - numMath){
			currentPath++;
		}else{
			currentPath = 0;	
		}	
		jQscrollId.stop(true).animate({"left":-currentPath*distance});
	});
	//点击右边箭头
	jQrightArrow.click(function(){
		if(currentPath > 0){
			currentPath--;
		}else{
			currentPath = lis - numMath;	
		}	
		jQscrollId.stop(true).animate({"left":-currentPath*distance});
	});
}

//自动轮播图片切换
function changeTagzdlb(changeCont){
	var thumList = document.getElementById(changeCont.thumList).getElementsByTagName(changeCont.thumListTag);
	var thumShow = document.getElementById(changeCont.thumShow).getElementsByTagName(changeCont.thumShowTag);
	for(var i = 0;i<thumList.length;i++){
		thumList[i].id = "thumList" + i;
		thumShow[i].id = "thumShow" + i;
		thumShow[i].style.display = "none";
		//默认显示第几个
		thumShow[changeCont.thumNum].style.display = "block";
		thumList[changeCont.thumNum].className = changeCont.thumListCurrent;
		thumList[i].onclick = function(){
			for(var i = 0;i<thumList.length;i++){
				if(this.id == "thumList" + i){
					thumList[i].className = changeCont.thumListCurrent;
					thumShow[i].style.display = "block";
					currentScroll = i;
				}else{
					thumList[i].className = "";
					thumShow[i].style.display = "none";
				}
			}	
		}
	}
	//自动轮播
	var currentScroll = changeCont.thumNum;
	window.setInterval(
	function(){
		if(changeCont.thumTrue){
			currentScroll++;
			if(currentScroll > thumList.length - 1 ){
				currentScroll = 0;	
			}
			for(var i= 0;i<thumList.length;i++){
				thumList[i].className = "";
				thumShow[i].style.display = "none";	
			}
			thumList[currentScroll].className = changeCont.thumListCurrent;
			thumShow[currentScroll].style.display = "block";	
		}		
	},changeCont.scrollTime)
}


function detectZoom() {
	var ratio = 0,
		screen = window.screen,
		ua = navigator.userAgent.toLowerCase();

	if (window.devicePixelRatio !== undefined) {
		ratio = window.devicePixelRatio;
	}
	else if (~ua.indexOf('msie')) {
		if (screen.deviceXDPI && screen.logicalXDPI) {
			ratio = screen.deviceXDPI / screen.logicalXDPI;
		}
	}
	else if (window.outerWidth !== undefined && window.innerWidth !== undefined) {
		ratio = window.outerWidth / window.innerWidth;
	}

	if (ratio) {
		ratio = Math.round(ratio * 100);
	}
	return ratio;
}
$(window).on("load",function(){
	if(detectZoom()>200){
		$('body').css({'zoom':'0.75'})
	}
})
$(function(){
	$('.header-box').find('dl dd').on('click', function(){
		$(this).addClass('current').siblings().removeClass('current')
	})
})
