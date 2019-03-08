
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
