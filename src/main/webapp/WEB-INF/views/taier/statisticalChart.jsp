<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="height:850px">
<head>
<meta charset="utf-8">
</head>
<body style="height: 100%; margin: 0">
	<div id="container" style="height: 100%"></div>
	<script type="text/javascript"
		src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>
	<script type="text/javascript"
		src="http://echarts.baidu.com/gallery/vendors/echarts-gl/echarts-gl.min.js"></script>
	<script type="text/javascript"
		src="http://echarts.baidu.com/gallery/vendors/echarts-stat/ecStat.min.js"></script>
	<script type="text/javascript"
		src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
	<script type="text/javascript"
		src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
	<script type="text/javascript"
		src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>
	<script type="text/javascript"
		src="https://api.map.baidu.com/api?v=2.0&ak=ZUONbpqGBsYGXNIYHicvbAbM"></script>
	<script type="text/javascript"
		src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>
	<script type="text/javascript"
		src="http://echarts.baidu.com/gallery/vendors/simplex.js"></script>
	<script type="text/javascript">
			var dom = document.getElementById("container");
			var myChart = echarts.init(dom);
			var app = {};
			option = null;
			var dataMap = {};
			function dataForCellphone(obj) {
			    var timeList = ['第一季度', '第二季度', '第三季度', '第四季度'];
			    var temp;
			
			    for(var year = 2015; year < 2019; year++){
				    var max = 0;
					temp = obj[year];
					
					for(var i = 0, len = temp.length; i < len; i++){
					    max = Math.max(max, temp[i]);
			            obj[year][i] = {
						   name : timeList[i],
						   value : temp[i]
						};			
					}
					obj[year + 'max'] = Math.floor(max/100) * 100;
				}
			    return obj;	
			}
			
			dataMap.dataTwoG = dataForCellphone({
			    2015:[21,19,17,21],
				2016:[10,10,12,13],
				2017:[17,16,26,30],
				2018:[17,21,20,0]
			});
			
			dataMap.dataThreeG = dataForCellphone({
			    2015:[8,5,4,3],
				2016:[4,1,1,1],
				2017:[1,1,0,1],
				2018:[1,1,1,0]
			});
			
			dataMap.dataFourG = dataForCellphone({
			    2015:[71,76,79,76],
				2016:[86,89,87,86],
				2017:[82,83,74,69],
				2018:[82,78,79,0]
			});
			
			option = {
			    baseOption:{
				    timeline:{
					    // y = 0,
						axisType : 'category',
						// realtime : false,
						// loop : false,
						autoPlay : true,
						playInterval: 3000,
						
						data : [
						     '2015-01-01','2016-01-01','2017-01-01','2018-01-01'
						],
						label : {
						     formatter : function(s){
							     return (new Date(s)).getFullYear();
							 }
						}
					},
					
					title : {
					    subtext : '数据来自中国信息通信研究院'
					},
					
					legend : {
					    x : 'right',
						data : ['2G', '3G', '4G']
					},
					
					calculable : true,
					grid : {
					    top : 200,
						bottom : 100,
						tooltip : {
						    trigger : 'axis',
							axisPointer : {
							    type : 'shadow',
								label :{
								    show : true,
									formatter : function (params){
									    return params.value.replace('\n', '');
									}
								}
							}
						}
					},
					
					xAxis : [{
					    type : 'category',
						axisLabel : {'interval' : 0},
						data : ['第一季度', '第二季度', '第三季度', '第四季度'],
						splitLine : {show : false}
					}],
					
					yAxis : [{
					    type : 'value',
						name : '占比（%）'
					}],
					
					series : [
					    {name : '2G', type : 'bar'},
						{name : '3G', type : 'bar'},
						{name : '4G', type : 'bar'},
						{
						    name : '操作系统占比',
							type : 'sunburst',
							center : ['77%' , '20%'],
							radius : '30%',
							//z : 100,
							label : {
							    rotate : 'radial'
							}
						}
					]
				},
				
				options : [
				    {
					    title : {text : '2015年国内手机产品2G/3G/4G占比'},
						series : [
						    {data : dataMap.dataTwoG['2015']},
							{data : dataMap.dataThreeG['2015']},
							{data : dataMap.dataFourG['2015']},
							{data:[
							     {name : 'Android', 
								  value : 89,
								  children : [
								      {name : 'Android4', value : 34, itemStyle : {color : '#f8aba6'}},
									  {name : 'Android5', value : 55, itemStyle : {color : '#f58f98'}},
									  {name : 'Android6', value : 1, itemStyle : {color : '#ca8687'}}
								  ]
								 },
								 {name : '其他系统', value : 11}
							]}
						]
					},
					
					{
					    title : {text : '2016年国内手机产品2G/3G/4G占比'},
						series : [
						    {data : dataMap.dataTwoG['2016']},
							{data : dataMap.dataThreeG['2016']},
							{data : dataMap.dataFourG['2016']},
							{data:[
							     {name : 'Android', 
								  value : 70,
								  children : [
								      {name : 'Android4', value : 1.5, itemStyle : {color : '#f8aba6'}},
									  {name : 'Android5', value : 32, itemStyle : {color : '#f58f98'}},
									  {name : 'Android6', value : 35, itemStyle : {color : '#ca8687'}},
									  {name : 'Android7', value : 1.5, itemStyle : {color : '#bd6785'}}
								  ]
								 },
								 {name : '其他系统', value : 30}
							]}
						]
					},
					
					{
					    title : {text : '2017年国内手机产品2G/3G/4G占比'},
						series : [
						    {data : dataMap.dataTwoG['2017']},
							{data : dataMap.dataThreeG['2017']},
							{data : dataMap.dataFourG['2017']},
							{data : [
							     {name : 'Android', 
								  value : 79,
								  children : [
								      {name : 'Android4', value : 1, itemStyle : {color : '#f8aba6'}},
									  {name : 'Android5', value : 4, itemStyle : {color : '#f58f98'}},
									  {name : 'Android6', value : 31, itemStyle : {color : '#ca8687'}},
									  {name : 'Android7', value : 39, itemStyle : {color : '#bd6785'}},
									  {name : 'Android8', value : 4, itemStyle : {color : '#d64f44'}}
								  ]
								 },
								 {name : '其他系统', value : 21}
							]}
						]
					},
					
					{
					    title : {text : '2018年国内手机产品2G/3G/4G占比'},
						series : [
						    {data : dataMap.dataTwoG['2018']},
							{data : dataMap.dataThreeG['2018']},
							{data : dataMap.dataFourG['2018']},
							{data : [
							     {name : 'Android',
			    				  value : 75,
								  children : [
								      {name : 'Android4', value : 1, itemStyle : {color : '#f8aba6'}},
									  {name : 'Android5', value : 1, itemStyle : {color : '#f58f98'}},
									  {name : 'Android6', value : 7, itemStyle : {color : '#ca8687'}},
									  {name : 'Android7', value : 18, itemStyle : {color : '#bd6785'}},
									  {name : 'Android8', value : 45, itemStyle : {color : '#d64f44'}},
									  {name : 'Android9', value : 3, itemStyle : {color : '#987165'}}
								  ]
								 },
								 {name : '其他系统', value : 25}
							]}
						]
					},
				]
			};
			
			if (option && typeof option === "object") {
			    myChart.setOption(option, true);
			}
			window.parent.refreshHeight();
			
       </script>
</body>
</html>