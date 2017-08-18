<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<title keywords="manage">日常管理</title>
<link rel="stylesheet" type="text/css" href="css/common.css" />
<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script type="text/javascript" src="js/localsetting.js"></script>
<script type="text/javascript" src="js/managesys.js"></script>
<script type="text/javascript" src="js/linkjump.js"></script>
<script type="text/javascript" src="js/common.js"></script>


</head>

<body>
	<div class="bodyTop_xk">
		<div class="Logobox">
			<img src="" /><span>传染病报告信息管理系统</span>
		</div>
		<ul>
		</ul>
	</div>
	<div class="bodyNav_xk"></div>
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
							<div class="cardTitle">日常管理系统</div>
							<div class="cardBody">
								<div class="bodybox gray1">
									<div class="bodyrightmain_xk">
										<div class="bordergrp" style="display:none">
											<div class="bordergrpline" >
												<select name="schooltype" id="managesys_schooltype">
													<option value="">-办学层次-</option>
													<option value="1">幼儿园(民办)</option>
													<option value="2">幼儿园(国办)</option>
													<option value="3">小学</option>
													<option value="4">中学</option>
													<option value="5">民办学校</option>
													<option value="6">职业学校</option>
													<option value="7">街道文教科</option>
												</select> 
												<select name="schoolId" id="managesys_school">
													<option value="">-学校名称-</option>
												</select> 
												<input type="button" id="managesys_select_btn" value="查询" />
											</div>
										</div>
										<div class="mainlistbox_xk">
											<div class="bodybox scrolltable">
												<table class="mainlist_xk edittable" border="0"
													cellspacing="0" cellpadding="0">
													<thead>
														<tr id="managesys_tr_1" style="display:none;">
															<td colspan="3" style="text-align: left;"><select
																name="">
																	<option value="">选择学校</option>
															</select></td>
														</tr>
														<tr>
															<td style="width:30%;">类型</td>
															<td>文件</td>
															<td style="width:25%;">操作</td>
														</tr>
													</thead>
													<tbody>

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
		</div>
	</div>
</body>


</html>