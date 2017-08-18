<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8" />
<title keywords="report">分时间段统计饼状图</title>
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
							<div class="cardTitle">分时间段统计饼状图</div>
							<div class="cardBody">
								<div class="bodybox gray1">
									<div class="bodyrightmain_xk">
										<div class="bordergrp">
											<div class="bordergrpline">
												<!-- <select name="timeType" id="timeType">
														<option value="">日期类型</option>
														<option value="3">录入日期</option>
														<option value="1">确诊日期</option>
														<option value="2">死亡日期</option>
														<option value="4">审核日期</option>
												</select>  -->
												<label for="">起始</label>
												<input class="year_xk time_plugin_lv_onclick" time_plugin_lv_type="2" type="text" style="width:111px !important;height:17px !important;" id="startTime" name="startTime" />
												<label for="">终止</label>
												<input class="year_xk time_plugin_lv_onclick" time_plugin_lv_type="2" type="text" style="width:111px !important;height:17px !important;" name="endTime"  id="endTime" /> 
												<!-- <select name="">
													<option value="">年统计表</option>
												</select> --> 
													<div class="bordergrpline">
														<span id="divide_user">
															<label for="">办学层次</label> 
																<select name="level" id="report_schooltype">
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
															<select name="schoolId"	id="report_schoolName">
																<option value="">-学校名称-</option>
															</select>
														</span>
														<label for="">疾病分类</label> 
															<select name="infectionType" id="report_infectiontype">
																<option value=""></option>
															</select> 
														<label for="">疾病名称</label> 
														<select name="infectionId" id="report_infectionname">
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
	
	function getChart(){
		var schoolName = $("#report_schoolName option:selected").text();
		var infectionName = $("#report_infectionname option:selected").text();
		if(schoolName == "-学校名称-"){
			schoolName = "";
		}
		if(infectionName == "-疾病名称-"){
			infectionName = "";
		}
		if(infectionName == "选择名称"){
			infectionName = "";
		}
		var data_json = {
			"level" : $("#report_schooltype option:selected").val(),
			"schoolName" : schoolName,
			"type" : $("#report_infectiontype option:selected").val(),
			"infectionName" : infectionName,
			"timeType" : $("#timeType option:selected").val(),
			"startTime" : $("#startTime").val(),
			"endTime" :	$("#endTime").val(),
		};
		$.ajax({
			url:"/Infection/report/getChart",
			type:"post",
			dataType:"json",
			async : true,
			data : data_json,
			success:function(data){
				$('#container_wd').highcharts({
					chart : {
						plotBackgroundColor : null,
						plotBorderWidth : null,
						plotShadow : false
					},
					title : {
						text : data.t.name
					},
					tooltip : {
						headerFormat : '{series.name}<br>',
						pointFormat : '{point.name}: <b>{point.percentage:.1f}%</b>'
					},
					credits: {
		            	text: '',
		            	href: ''
		        	},
					plotOptions : {
						pie : {
							allowPointSelect : true,
							cursor : 'pointer',
							dataLabels : {
								enabled : false
							},
							showInLegend : true
						}
					},
					series : [data.t]
				});
			}
			
			
		});
	}
</script>
</html>