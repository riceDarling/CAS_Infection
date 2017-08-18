<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8" />
<title keywords="report">管理已有报告卡</title>
<link rel="stylesheet" type="text/css" href="css/common.css" />
<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script type="text/javascript" src="js/localsetting.js"></script>
<script type="text/javascript" src="js/linkjump.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/report.js"></script>


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
							<div class="cardTitle">管理已有报告卡</div>
							<div class="cardBody">
								<div class="bodybox gray1">
									<div class="bodyrightmain_xk">
										<div class="bordergrp">

											<form id="report_select_form">
												<div class="bordergrpline">
													<select name="schooltype" id="report_schooltype">
														<option value="">-办学层次-</option>
														<option value="1">幼儿园(民办)</option>
														<option value="2">幼儿园(国办)</option>
														<option value="3">小学</option>
														<option value="4">中学</option>
														<option value="5">民办学校</option>
														<option value="6">职业学校</option>
														<option value="7">街道文教科</option>
													</select> <select name="schoolId" id="report_school">
														<option value="">-学校名称-</option>
													</select> <select name="timeType" id="report_timeType">
														<option value="">日期类型</option>
														<option value="3">录入日期</option>
														<option value="1">确诊日期</option>
														<option value="2">死亡日期</option>
													</select> <label for="">起始</label><input type="text" class="time_plugin_lv_onclick" time_plugin_lv_type="2" name="startTime" id="report_startTime" value="" style="width:96px;" /> <label for="">终止</label><input type="text"  class="time_plugin_lv_onclick" time_plugin_lv_type="2" name="endTime" id="report_endTime" value="" style="width:96px;" />
												</div>
												<div class="bordergrpline">
													<input type="radio" name="" id="" value="" /><label for="">疾病分类</label> <select name="infectionType" id="report_infectiontype">
														<option value="">选择分类</option>
													</select> <input type="radio" name="" id="" value="" /><label for="">疾病名称</label> <select name="infectionId" id="report_infectionname">
														<option value="">选择名称</option>
													</select> <input type="radio" name="isPass" id="" value="" /><label for="">全部</label> <input type="radio" name="isPass" id="" value="0" /><label for="">未审核</label> <input type="radio" name="isPass" id="" value="1" /><label for="">已审核</label> <input type="radio" name="isPass" id="" value="2" /><label for="">已删除</label> <input type="button" id="report_select_btn" value="查询" />
												</div>
												<div class="bordergrpline"></div>
										</div>
										</form>

										<div class="mainlistbox_xk">
											<div class="bodybox scrolltable">
												<table class="mainlist_xk" border="0" cellspacing="0" cellpadding="0">
													<thead>
														<tr>
															<th style="width:18px;min-width: auto !important;">序号</th>
															<th>卡片ID</th>
															<th>姓名</th>
															<th>性别</th>
															<th>年龄</th>
															<th>学校</th>
															<th>年级</th>
															<th>现居住地</th>
															<th>疾病分类</th>
															<th>疾病名称</th>
															<th>诊断日期</th>
															<th>录入时间</th>
															<th>订正报告时间</th>
															<th>审核报告时间</th>
															<th>通用操作</th>
															<th>节点操作</th>
														</tr>
													</thead>
													<tbody id="report_tbody">

													</tbody>
													<tfoot>
														<tr>
															<td colspan="16" id="report_footer">第1页 共10页 共100条</td>
														</tr>
														<tr class="YApage">
															<td colspan="16"><a class="button off_xk" id_xk="homepage">首页</a> <a class="button off_xk" id_xk="prevpage">&lt;</a> <a class="button on_xk" id_xk="num">1</a> <a class="button " id_xk="num">2</a> <a class="button " id_xk="num">3</a> <a class="button " id_xk="num">4</a> <a class="button " id_xk="num">5</a> <a class="button " id_xk="nextpage">&gt;</a> <a class="button " id_xk="endpage">尾页</a></td>
														</tr>
													</tfoot>
												</table>
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
	</div>
</body>

</html>