var timer = null;
var echartsData = {
    data1: {
        indicator: [
            {name: '状态1', max: 100},
            {name: '状态2', max: 100},
            {name: '状态3', max: 100},
            {name: '状态4', max: 100},
            {name: '状态5', max: 100},
            {name: '状态6', max: 100},
            {name: '状态7', max: 100}
        ],
        data: [
            {
                name: '设备上电状态_外置磁强计',
                value: [80, 86, 88, 76, 90, 49, 78]
            },{
                name: '设备上电状态_磁棒',
                value: [50, 72, 90, 98, 86, 70, 60]
            },{
                name: '设备上电状态_GPS',
                value: [66, 70, 95, 82, 76, 70, 70]
            },{
                name: '设备上电状态_接口板',
                value: [94, 94, 88, 80, 85, 90, 86]
            }
        ]
    },
    data2: [40, 60, 50, 80, 70, 60, 40, 60, 50, 80, 70, 60]
};

var starInfo = [
    {
        name: 'TY11',
        addr: '酒泉',
        timeArea: '9:00-9:10',
        countDown: '1000000',
        pic: '../images/pic-2-1.png'
    }, {
        name: 'TY12',
        addr: '酒泉',
        timeArea: '9:00-9:20',
        countDown: '1000000',
        pic: '../images/pic-2-1.png'
    }, {
        name: 'TY13',
        addr: '酒泉',
        timeArea: '9:00-9:30',
        countDown: '1000000',
        pic: '../images/pic-2-1.png'
    }
]

var $command = {
    hideAside: $('.js_hide_aside'),
    showAside: $('.js_show_aside'),
    tabHead: $('.js_tab_tit'),
    tabBody: $('.js_tab_window'),
    starSel: $('#star_select')
};


var charts1 = echarts.init(document.getElementById('echart1'));
var charts2 = echarts.init(document.getElementById('echart2'));
var charts3 = echarts.init(document.getElementById('echart3'));
var charts4 = echarts.init(document.getElementById('echart4'));

$(function(){

    charts1.setOption(echartOption1(echartsData.data1));
    charts2.setOption(echartOption2(echartsData.data2));
    charts3.setOption(echartOption3(echartsData.data2));
    charts4.setOption(echartOption4(echartsData.data2));
    

    tabToggle();
    asideToggle();

    svgView('#svg1', 80, 80);

    $('.wrap-main').resize(function(){
        chartsResize();
        tabToggle();
    });

    $('.echarts-list').on('click', '.btn', function(){
        if ($(this).parents('li').hasClass('big')) {
            $(this).parents('li').removeClass('big').parents('ul').removeClass('s2');
        } else {
            $(this).parents('li').addClass('big').siblings('li').removeClass('big').parents('ul').addClass('s2');
        }
        chartsResize();
    });

    $command.tabHead.on('click', 'li a', function(){
        var index = $(this).parent().index();
        $(this).parent().addClass('on').siblings().removeClass('on');
        $command.tabBody.find('.tabItem').eq(index).addClass('on').siblings().removeClass('on')
    });

    $command.starSel.on('change', function(e){
        var name = $(this).find('option:selected').text();
        for (var i = 0; i < starInfo.length; i++) {
            if (starInfo[i].name == name) {
                clearInterval(timer);
                $('#starInfo').css('background-image', starInfo[i].pic);
                $('#starInfo .name').text(starInfo[i].name);
                $('#starInfo .addr').text(starInfo[i].addr);
                $('#starInfo .timeArea').text(starInfo[i].timeArea);
                $('#js_countDown').data('time', starInfo[i].countDown);
                countDown();
            }
        }
    });

    countDown();
});

function countDown () {
    var time = $('#js_countDown').data('time');
    var timeFormat = 0;
    timer = setInterval(function(){
        if (time > 0) {
            timeFormat = formatTime(time, '{h}:{i}:{s}');
            $('#js_countDown').text(timeFormat);
            time -= 1000;
        } else {
            clearInterval(timer);
        }
    }, 1000)
}

// 侧边栏
function asideToggle () {
    $command.hideAside.on('click', function () {
        asideHide();
        $command.showAside.removeClass('hide');
        tabToggle();
    });
    $command.showAside.on('click', function () {
        asideShow();
        $(this).addClass('hide');
        tabToggle();
    })
}

function chartsResize () {
    charts1.resize();
    charts2.resize();
    charts3.resize();
    charts4.resize();
}
var listData;
var SeriesData = [];
var field_cn = ['面板+X','面板-Z','面板-X','面板+Y','面板+Z','帆板背面+X'];
var field_en = ['vp','vq','vr','vs','vt','vx'];
// 雷达图
function echartOption1(datas) {
	var option = {
	        grid: {
	            top: 15,
	            bottom: 15,
	            left: 35,
	            right: 10
	        },
	        legend: {
	            data:['面板+X','面板-Z','面板-X','面板+Y','面板+Z','帆板背面+X']
	        },
	        xAxis: {
	            show: false,
	            type: 'category',
	            boundaryGap: false
	        },
	        yAxis: {
	            type: 'value',
	            axisLine: {
	                show: false
	            },
	            axisLabel: {
	                color: '#5B6BAE'
	            },
	            splitLine: {
	                lineStyle: {
	                    color: '#303C67',
	                    type: 'dashed'
	                }
	            }
	        },
	        series: [
	            
	       ]
	    };
		$.ajax({
	        url: contextPath+"/TYSpace/ycpzb/getWd",
	        type:"post",
	        dataType:"json",
	        success: function (data){
	            if(data.code==200){
	            	var Item = function(){  
	                    return {  
	                        name:'',  
	                        type:'line', //柱状图这么显示，折线图为line 
	                        data:[]  
	                    }  
	                }; 
	            	var ztlist = data.hashMap.ztlist;
	            	listData = data.hashMap.ztlist;	            	
	            	var Series = [];
	            	for(var i=0;i < field_en.length;i++){  
	            		var wd = [];
	                    var it = new Item();  
	                    it.name = field_cn[i];
	                    it.type = "line";
	                    it.stack = "总量";
	                    for(var j=0;j<1;j++){
	                    	wd.push(ztlist[j][field_en[i]].replace(" ℃",""));
	                    }
	                    
	                    it.data = wd;
	                    Series.push(it);  
	                }
	                option.series = Series; // 设置图表  
	                charts1.setOption(option);// 重新加载图表
	            }
	        }
		});
	    return option;
}
var index_num=0;
var line1 = setInterval(function () {
	var option = {
	        grid: {
	            top: 15,
	            bottom: 15,
	            left: 35,
	            right: 10
	        },
	        legend: {
	            data:['面板+X','面板-Z','面板-X','面板+Y','面板+Z','帆板背面+X']
	        },
	        xAxis: {
	            show: false,
	            type: 'category',
	            boundaryGap: false
	        },
	        yAxis: {
	            type: 'value',
	            axisLine: {
	                show: false
	            },
	            axisLabel: {
	                color: '#5B6BAE'
	            },
	            splitLine: {
	                lineStyle: {
	                    color: '#303C67',
	                    type: 'dashed'
	                }
	            }
	        },
	        series: [
	            
	       ]
	    };
	if(index_num<listData.length){
		index_num++;
	}else{
		clearInterval(line1);
	}
	var Item = function(){  
        return {  
            name:'',  
            type:'line', //柱状图这么显示，折线图为line 
            data:[]  
        }  
    };

	for(var i=0;i < field_en.length;i++){  
		var wd = [];
        var it = new Item();  
        it.name = field_cn[i];
        it.type = "line";
        it.stack = "总量";
        for(var j=0;j<index_num;j++){
        	wd.push(listData[j][field_en[i]].replace(" ℃",""));
        }
        
        it.data = wd;
        SeriesData.push(it);  
    }
	option.series = SeriesData; // 设置图表  
    charts1.setOption(option);// 重新加载图表
}, 1000);

// 柱状图
function echartOption2(datas) {
    var option = {
        grid: {
            top: 15,
            bottom: 15,
            left: 35,
            right: 10
        },
        xAxis: {
            show: true,
            type: 'category',
            axisLabel: {
                inside: true,
                textStyle: {
                    color: '#fff'
                }
            },
            z: 10
        },
        yAxis: {
            type: 'value',
            axisLine: {
                show: false
            },
            axisLabel: {
                color: '#5B6BAE'
            },
            splitLine: {
                lineStyle: {
                    color: '#303C67',
                    type: 'dashed'
                }
            }
        },
        series: [{
            //data: datas,
            type: 'bar',
            barMaxWidth: 12,
            itemStyle: {
                color: {
                    type: 'linear',
                    x: 0,
                    y: 0,
                    x2: 0,
                    y2: 1,
                    colorStops: [{
                        offset: 0, color: 'rgba(68, 85, 151, 1)'
                    }, {
                        offset: 1, color: 'rgba(114, 202, 254, 1)'
                    }],
                }
            }
        }]
    };
    $.ajax({
        url: contextPath+"/TYSpace/ycpzb/getVoltage",
        type:"post",
        dataType:"json",
        success: function (data){
            if(data.code==200){ 
            	var ztlist=data.hashMap.ztlist;
            	list_bar = data.hashMap.ztlist;
            	var Series = [];
            	for(var i=0;i < field_bar.length;i++){ 
                    for(var j=0;j<1;j++){
                    	Series.push(ztlist[j][field_bar[i]].replace(" V",""));
                    } 
                }
            	Series = Series.map(Number);
                charts2.setOption({
                	xAxis: {
                        data: ['太阳能电池板输入1电压','太阳能电池板输入2电压','太阳能电池板输入3电压']
                    },
                	series: [{
	                    data: Series,
						type: 'bar',
					    barMaxWidth: 12,
					    itemStyle: {
					        color: {
					            type: 'linear',
					            x: 0,
					            y: 0,
					            x2: 0,
					            y2: 1,
					            colorStops: [{
					                offset: 0, color: 'rgba(68, 85, 151, 1)'
					            }, {
					                offset: 1, color: 'rgba(114, 202, 254, 1)'
					            }],
					        }
					    }
	                }]                	
                });//重新加载图表
            }
        }
	});
    return option;
}
var list_bar;
var Series_bar = [];
var field_bar = ['vab','vac','vad'];
var index_bar = -1;
var bar1 = setInterval(function () {
	if(index_bar<(list_bar.length-1)){
		index_bar++;
	}else{
		clearInterval(bar1);
		return;
	}
	Series_bar = [];
    for(var i=0;i < field_bar.length;i++){ 
        for(var j=index_bar;j<(index_bar+1);j++){
        	Series_bar.push(list_bar[j][field_bar[i]].replace(" V",""));
        } 
    }    
    Series_bar = Series_bar.map(Number);
    charts2.setOption({
    	xAxis: {
            data: ['太阳能电池板输入1电压','太阳能电池板输入2电压','太阳能电池板输入3电压']
        },
    	series: [{
            data: Series_bar,
			type: 'bar',
		    barMaxWidth: 12,
		    itemStyle: {
		        color: {
		            type: 'linear',
		            x: 0,
		            y: 0,
		            x2: 0,
		            y2: 1,
		            colorStops: [{
		                offset: 0, color: 'rgba(68, 85, 151, 1)'
		            }, {
		                offset: 1, color: 'rgba(114, 202, 254, 1)'
		            }],
		        }
		    }
                }]                	
    });//重新加载图表    
}, 1000);

function echartOption3(datas) {
            	
	var option = {
        grid: {
            top: 15,
            bottom: 15,
            left: 35,
            right: 10
        },
        legend: {
            data:['面板+X','面板-Z','面板-X','面板+Y','面板+Z','帆板背面+X']
        },
        xAxis: {
            show: false,
            type: 'category',
            boundaryGap: false
        },
        yAxis: {
            type: 'value',
            axisLine: {
                show: false
            },
            axisLabel: {
                color: '#5B6BAE'
            },
            splitLine: {
                lineStyle: {
                    color: '#303C67',
                    type: 'dashed'
                }
            }
        },
        series: [
            
       ]
    };
	$.ajax({
        url: contextPath+"/TYSpace/ycpzb/getWd",
        type:"post",
        dataType:"json",
        success: function (data){
            if(data.code==200){
            	var Item = function(){  
                    return {  
                        name:'',  
                        type:'line', //柱状图这么显示，折线图为line 
                        data:[]  
                    }  
                }; 
            	var ztlist=data.hashMap.ztlist;
            	var field_cn = ['面板+X','面板-Z','面板-X','面板+Y','面板+Z','帆板背面+X'];
            	var field_en = ['vp','vq','vr','vs','vt','vx'];
            	var Series = [];
            	for(var i=0;i < field_cn.length;i++){  
            		var wd = [];
                    var it = new Item();  
                    it.name = field_cn[i];
                    it.type = "line";
                    it.stack = "总量";
                    for(var j=0;j<ztlist.length;j++){
                    	wd.push(ztlist[j][field_en[i]].replace(" ℃",""));
                    }
                    
                    it.data = wd;
                    Series.push(it);  
                }
                option.series = Series; // 设置图表  
                charts3.setOption(option);// 重新加载图表
            }
        }
	});
    return option;
}
var list_pie;
var Series_pie = [];
var field_pie = ['vae','vaf','vag'];
var field_cn_pie = ['太阳能电池板输入1电流','太阳能电池板输入2电流','太阳能电池板输入3电流'];

// 饼图
function echartOption4(datas) {
    var option = {
		title: {
	        text: '',
	        subtext: '',
	        left: 'center'
	    },
	    tooltip : {
	        trigger: 'item',
	        formatter: "{b} : {c}A ({d}%)"
	    },
	    legend: {
	        bottom: 10,
	        left: 'center',
	        data: ['太阳能电池板输入1电流', '太阳能电池板输入2电流','太阳能电池板输入3电流']
	    },
	    series : [
	        {
	            type: 'pie',
	            radius : '65%',
	            center: ['50%', '50%'],
	            selectedMode: 'single',
	            data:[	                
	                {value:535, name: '太阳能电池板输入1电流'},
	                {value:510, name: '太阳能电池板输入2电流'},
	                {value:634, name: '太阳能电池板输入3电流'}
	            ],
	            itemStyle: {
	                emphasis: {
	                    shadowBlur: 10,
	                    shadowOffsetX: 0,
	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
	                }
	            }
	        }
	    ]
    };
    $.ajax({
        url: contextPath+"/TYSpace/ycpzb/getCurrent",
        type:"post",
        dataType:"json",
        success: function (data){
            if(data.code==200){ 
            	var ztlist=data.hashMap.ztlist;
            	list_pie = data.hashMap.ztlist;
            	var Series = [];
            	var Item = function(){  
                    return {  
                        name:'',  
                        value:''   
                    }  
                };
            	for(var i=0;i < field_pie.length;i++){   
            		var it = new Item();
            		it.name = field_cn_pie[i];
                    for(var j=0;j<1;j++){
                    	it.value = ztlist[j][field_pie[i]].replace(" A","");
                    }
                    Series.push(it);
                }
                charts4.setOption({
                	series: [{
	                    type: 'pie',
					    radius : '65%',
					    center: ['50%', '50%'],
					    selectedMode: 'single',
					    data:Series,
					    itemStyle: {
					        emphasis: {
					            shadowBlur: 10,
					            shadowOffsetX: 0,
					            shadowColor: 'rgba(0, 0, 0, 0.5)'
					        }
					    }
	                }]                	
                });//重新加载图表
            }
        }
	});
    return option;
}
var index_pie = -1;
var pie1 = setInterval(function () {
	if(index_pie<(list_pie.length-1)){
		index_pie++;
	}else{
		clearInterval(pie1);
		return;
	}
	Series_pie = [];
	var Item = function(){  
        return {  
            name:'',  
            value:''  
        }  
    };
	for(var i=0;i < field_pie.length;i++){   
		var it = new Item();
		it.name = field_cn_pie[i];
        for(var j=index_pie;j<(index_pie+1);j++){
        	it.value = list_pie[j][field_pie[i]].replace(" A","");
        }
        Series_pie.push(it);
    }   
    charts4.setOption({
    	series: [{
            type: 'pie',
		    radius : '65%',
		    center: ['50%', '50%'],
		    selectedMode: 'single',
		    data:Series_pie,
		    itemStyle: {
		        emphasis: {
		            shadowBlur: 10,
		            shadowOffsetX: 0,
		            shadowColor: 'rgba(0, 0, 0, 0.5)'
		        }
		    }
         }]                	
    });//重新加载图表   
}, 1000);
