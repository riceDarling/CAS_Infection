<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8" />
<title keywords="report">分时间段同期对比折线图</title>
<link rel="stylesheet" type="text/css" href="css/common.css" />
<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
<script type="text/javascript" src="js/localsetting.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script type="text/javascript" src="js/linkjump.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script src="js/highcharts/highcharts.js"></script>
<script src="js/highcharts/highcharts-3d.js"></script>
<script src="js/highcharts/modules/exporting.js"></script>
<link rel="stylesheet" type="text/css" href="date/time_plugin_lv.min.css" />
<script type="text/javascript" src="date/time_plugin_lv.min.js"></script>
</head>

<body>
	<div class="bodyTop_xk">
		<div class="Logobox">
			<img src="" /><span>传染病报告信息管理系统</span>
		</div>
		<ul>
			<li class="tabstyle1">操作标签</li>
			<li class="tabstyle2">操作标签</li>
			<li class="tabstyle2">操作标签</li>
			<li class="tabstyle2">操作标签</li>
			<li class="tabstyle2">操作标签</li>
		</ul>
	</div>
	<div class="bodyNav_xk">
		<span>功能1</span><span>功能2</span><span>功能3</span>
	</div>
	<div class="bodyLeft_xk">
		<div class="bodyLeftBody_xk">
			<div class="bodyLeftMain_xk">
				<ul>
					<li class="leftListTitle_xk">功能菜单</li>
					<li class="leftListContent_xk"></li>
				</ul>
			</div>
			<div class="bodyLeftarrowbox_xk"></div>
		</div>
	</div>
	<div class="bodyRight_xk">
		<div class="bodybox">
			<div class="bodyrighttop_xk">
				<span>某某某你好，欢迎光临！</span>
			</div>
			<div class="bodyrightarea_xk white">
				<div class="bodybox">
					<div class="bodyrightcenter_xk">
						<div class="bodybox">
							<div class="cardTitle">分时间段同期对比折线图</div>
							<div class="cardBody">
								<div class="bodybox gray1">
									<div class="bodyrightmain_xk">
										<div class="bordergrp">
											<div class="bordergrpline">
												<label for="">开始年份</label> 
													<select id="firYear">
													</select>
												<label for="">结束年份</label> 
													<select  id="secYear">
													</select>
												<label for="">选择月份</label> 
												<select id="firMonth">
													<option value="">月份</option>
													<option value="01">01</option>
													<option value="02">02</option>
													<option value="03">03</option>
													<option value="04">04</option>
													<option value="05">05</option>
													<option value="06">06</option>
													<option value="07">07</option>
													<option value="08">08</option>
													<option value="09">09</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
												</select>
													<div class="bordergrpline">
														<span id="divide_user">
															<label for="">办学层次</label> 
															<select id="report_schooltype">
																<option value="">-办学层次-</option>
																<option value="1">幼儿园(民办)</option>
																<option value="2">幼儿园(国办)</option>
																<option value="3">小学</option>
																<option value="4">中学</option>
																<option value="5">民办学校</option>
																<option value="6">职业学校</option>
																<option value="7">街道文教科</option>
															</select> 
															<label for="">学校名称</label> 
															<select	id="report_schoolName">
																<option value="">-学校名称-</option>
															</select>
														</span>
														<label for="">疾病分类</label> 
															<select id="report_infectiontype">
																<option value=""></option>
															</select> 
														<label for="">疾病名称</label> 
														<select id="report_infectionname">
															<option value="">-疾病名称-</option>
														</select>
													</div>
											</div>
											<div class="bordergrpline">
												<input type="button" onclick="getChart()" value="查询" />
											</div>

										</div>
										<div class="mainlistbox_xk">
											<div class="bodybox scrolltable" id="container_wd"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$(function() {
		var usertype=$.cookie("usertype");
		console.log(usertype);
		//此处根据当前登录的账号来查询，如果为普通用户，多传usertype字段，后台根据来处理schoolId
		if(usertype==0){
			$("#divide_user").hide();
		}
		getChart();
		selectAllType();
		$("#report_infectiontype").change(function() {
			getAllByTypeId();
		});
		$("#report_schooltype").change(function() {
			getAllSchoolByLevel();
		});
		
	});
	
	function getYear(){
		var firYear = new Date();
		var showYear = firYear.getFullYear();
		var html = "";
		html += "<option value='" + showYear + "'>"+showYear+"</option>";
		for (var i = 0; i < 10; i++) {
			html += "<option value='" + (showYear - 1) + "'>" + (showYear - 1) + "</option>";
			showYear--;
		}
		$("#firYear").html(html);
		$("#secYear").html(html);
	}
	getYear();
	function getChart(){
		var schoolId = $("#report_schoolName option:selected").val();
		var infectionName = $("#report_infectionname option:selected").val();
		var startYear = $("#firYear option:selected").val();
		var endYear = $("#secYear option:selected").val();
		var month = $("#firMonth option:selected").val();
		var type = $("#report_infectiontype option:selected").val();
		var level = $("#report_schooltype option:selected").val();
		var data_json = {
			"level" : level,
			"schoolId" : schoolId,
			"type" : type,
			"infectionName" : infectionName,
			"startYear" : startYear,
			"endYear" : endYear,
			"month" : month
		};
		if (startYear > endYear) {
			alert("结束年份小于开始年份，请选择正确的查询年份~");
		} else {
			$.ajax({
				url:"/Infection/report/getLineChart",
				type:"post",
				dataType:"json",
				async : true,
				data : data_json,
				success:function(data){
					console.log(data);
					 $('#container_wd').highcharts({
						    title: {
						        text: '分时间段同期对比图',
						        x: -20
						    },
						    credits: {
				            	text: '',
				            	href: ''
				        	},
						    xAxis: {
						        categories: data.t.xAxis
						    },
						    yAxis: {
						    	allowDecimals : false,
						        title: {
						            text: '数量 (个)'
						        },
						        plotLines: [{
						            value: 0,
						            width: 1,
						            color: '#808080'
						        }]
						    },
						    tooltip: {
						        valueSuffix: '个'
						    },
						    legend: {
						        layout: 'vertical',
						        align: 'right',
						        verticalAlign: 'middle',
						        borderWidth: 0
						    },
						    series: data.t.data
						});
				}
				
				
			});
		}
	}
</script>
</html>