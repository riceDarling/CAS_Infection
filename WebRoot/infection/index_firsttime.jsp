<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html >
<html>

	<head>
		<meta charset="utf-8" />
		<title keywords="index">管理架构</title>
		<link rel="stylesheet" type="text/css" href="css/common.css" />
		<link rel="stylesheet" type="text/css" href="css/popupwindow.css" />
		<style type="text/css">
			.dendrogramtab {
				font-size: 12px;
				border: 1px solid #666;
				display: inline-block;
				line-height: 24px;
				white-space: normal;
				margin-left: 8px;
				margin-right: 4px;
				height: 174px;
			}
			
			.dendrogramtab>li {}
			
			.dendrogramtab>li>label {
				display: inline-block;
				width: 30px;
				vertical-align: top;
				text-align: left;
			}
			
			.dendrogramtab>li.singlecontent>span {
				width: 180px;
			}
			
			.dendrogramtab>li.multicontent>span {
				width: 68px;
			}
			
			.dendrogramtab>li>span {
				padding-left: 10px;
				padding-right: 4px;
				display: inline-block;
				vertical-align: top;
				word-break: break-all;
				text-align: left;
				max-height: 150px;
				overflow-y: auto;
			}
			
			.nobordertable,
			.nobordertable th,
			.nobordertable td {
				border: none !important;
			}
			
			.blankline {
				height: 14px;
			}
			
			.edittable.nobordertable td {
				font-size: 0;
				overflow-x: auto;
				white-space: nowrap;
			}
		</style>
		<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
		<script type="text/javascript" src="js/localsetting.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="js/linkjump.js"></script>
		<script type="text/javascript" src="js/common.js"></script>
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
								<div class="cardTitle">管理架构</div>
								<div class="cardBody">
									<div class="bodybox gray1">
										<div class="bodyrightmain_xk">
											<div class="bordergrp" style="display:none;">
												<div class="bordergrpline" >
													<select name="schooltype" id="index_firsttime_schooltype">
														<option value="">-办学层次-</option>
														<option value="1">幼儿园(民办)</option>
														<option value="2">幼儿园(国办)</option>
														<option value="3">小学</option>
														<option value="4">中学</option>
													</select> <select name="schoolId" id="index_firsttime_school">
														<option value="">-学校名称-</option>
													</select> 
													<input type="button" id="index_firsttime_select_btn" value="查询" />
												</div>
											</div>
											<table class="edittable nobordertable" border="0" cellspacing="0" cellpadding="0" style="display:none;">
												<tbody>
													<tr>
														<td id="index_firsttime_level0">
															
														</td>
													</tr>
													<tr>
														<td class="blankline"></td>
													</tr>
													<tr>
														<td id="index_firsttime_level1">
															
														</td>
													</tr>
													<tr>
														<td class="blankline"></td>
													</tr>
													<tr>
														<td id="index_firsttime_level2">
															
														</td>
													</tr>
													<tfoot>
														<tr>
															<td><input type="button" name="" id="index_firsttime_edit" value="编辑" style="font-size: 14px;padding: 5px 8px;"/></td>
														</tr>
													</tfoot>
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
	</body>
	<script src="js/index_firsttime.js">
	</script>
</html>