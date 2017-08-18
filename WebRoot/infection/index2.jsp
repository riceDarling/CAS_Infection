<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8" />
		<title keywords="index">首页</title>
		<link rel="stylesheet" type="text/css" href="css/common.css" />
		<style type="text/css">
			.edittable td {
				height:26px;
				padding:1px;
				overflow:hidden;
				text-overflow: ellipsis;
			}
			.edittable tbody td input{
			margin-left:10px;}
		</style>
		<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
		<script type="text/javascript" src="js/localsetting.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script>
		if ($.cookie("usertype")==1){location.href="index.jsp"};
		</script>
		<script type="text/javascript" src="js/linkjump.js"></script>
		<script type="text/javascript" src="js/common.js"></script>
		<script type="text/javascript" src="js/index2.js"></script>
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
														<td colspan="3" style="text-align: left;">
															<select id="isRead" onchange="selectByCond()">
																<option value="">全部通知</option>
																<option value="0">未读通知</option>
																<option value="1">已读通知</option>
															</select>
															<!-- <label style="color:#188AFF;margin-left:8px;">您有XX条未读通知！</label> -->
															<input type="button" onclick="updateAll()" value="全部标记为已读" />
														</td>
													</tr>
													<tr>
														<td>
															通知内容
														</td>
														<td>
															通知日期
														</td>
														<td>
															是否已读
														</td>
													</tr>
												</thead>
												<tbody id="tbIndex">
													<!-- <tr>
														<td>
															aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaSS
														</td>
														<td>
															2017-05-28
														</td>
														<td>
															<label for="">未读</label><input type="button" name="" id="" value="标记为已读" />
														</td>
													</tr> -->
												</tbody>
												<tfoot id="tbFoot">
													<tr><td colspan="3" ></td></tr>
													<tr class="YApage"><td colspan="3"></td></tr>
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
	</body>
</html>