<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8" />
		<title keywords="index">首页</title>
		<link rel="stylesheet" type="text/css" href="css/common.css" />
		<link rel="stylesheet" type="text/css" href="css/popupwindow.css" />
		
		<style type="text/css">
			.edittable td {
				height:26px;
				padding:1px;
			}
		</style>
		<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
		<script type="text/javascript" src="js/localsetting.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script>
		if ($.cookie("usertype")!=1){location.href="index2.jsp"};
		</script>
		<script type="text/javascript" src="js/linkjump.js"></script>
		<script type="text/javascript" src="js/common.js"></script>
		<script type="text/javascript" src="js/index.js"></script>
		
		<link rel="stylesheet" type="text/css" href="date/time_plugin_lv.min.css" />
		<script type="text/javascript" src="date/time_plugin_lv.min.js"></script>
	</head>

	<body>
		<div class="bodyTop_xk">
			<div class="Logobox"><img src="" /><span>传染病报告信息管理系统</span></div>
			<ul>
			</ul>
		</div>
		<div class="bodyNav_xk">
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
				<div class="bodyrightarea_xk white">
					<div class="bodybox">
						<div class="bodyrightcenter_xk">
							<div class="bodybox">
								<div class="cardTitle">首页</div>
								<div class="cardBody">
									<div class="bodybox gray1">
										<div class="bodyrightmain_xk">
											<table class="edittable" border="0" cellspacing="0" cellpadding="0" style="width:100%;">
												<thead>
													<tr>
														<td colspan="5" style="text-align: left;border-right:none;">
															<input type="text" class="time_plugin_lv_onclick" time_plugin_lv_type="2" id="startTime" />至<input type="text" class="time_plugin_lv_onclick" time_plugin_lv_type="2" id="endTime" /> <input type="button" value="查询（不填为今日）" onclick="selectByCond()" /><!-- <input type="button" value="清空日期" /> -->
														</td>
														<td style="text-align: right;border-left:none;">
															<input type="button" id="one_notification" onclick="notification()" value="一键通知" />
														</td>
													</tr>
													<tr>
														<td>已上报学校数</td>
														<td id="schoolCount"></td>
														<td>未上报学校数</td>
														<td id="notSchoolCount"></td>
														<td>传染病上报总计</td>
														<td id="infeCount"></td>
													</tr>
													<tr></tr>
												</thead>
												<tbody>
													<tr>
														<td colspan="3" style="vertical-align: top;">
															<table id="leftTable" class="edittable" border="0" cellspacing="0" cellpadding="0" style="width:100%;">
																<thead>
																	<tr>
																		<td colspan="2">已上报学校</td>
																	</tr>
																	<tr>
																		<td>学校名称</td>
																		<td>传染病上报条数</td>
																	</tr>
																</thead>
																<tbody  id="leftData">
																</tbody>
																<tfoot>
																	<tr class="YApage" ><td colspan="2"></td></tr>
																	<tr class="YApage" ><td id="leftPage" style="text-align:center" colspan="2"></td></tr>
																</tfoot>
															</table>
														</td>
														<td colspan="3" style="vertical-align: top;">
															<table id="rightTable" class="edittable" border="0" cellspacing="0" cellpadding="0" style="width:100%;">
																<thead>
																	<tr>
																		<td colspan="2">未上报学校</td>
																	</tr>
																	<tr>
																		<td>学校名称</td>
																		<td>通知学校</td>
																	</tr>
																</thead>
																<tbody id="rightData">
																</tbody>
																<tfoot>
																	<tr class="YApage"><td style="text-align:center" colspan="2"></td></tr>
																	<tr class="YApage"><td id="rightPage" colspan="2"></td></tr>
																</tfoot>
															</table>
														</td>
													</tr>
												</tbody>
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
		<script type="text/javascript">
			function notification(){
				var startTime = $("#startTime").val();
				var endTime = $("#endTime").val();
				var data_cond = {
						"startTime" : startTime,
						"endTime":endTime
				};
				
				$.ajax({
					url : "/Infection/report/getSchoolIdByCond",
					dataType : "json",
					async : true,
					type : "post",
					data : data_cond,
					success : function (data) {
						var schoolId = [];
						for (var i = 0; i < data.t.length; i++) {
							schoolId.push(data.t[i]);
						}
						$.ajax({
							url : "/Infection/notices/oneNotices",
							dataType : "json",
							async : true,
							type : "post",
							data : {
								"schoolId" : schoolId,
							},
							success : function (data) {
								alert("通知成功");
							}
						});
					}
				});
			}
		</script>
	</body>
</html>