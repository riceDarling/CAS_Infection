<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8" />
		<title keywords="infectiontype">管理已有传染病种类</title>
		<link rel="stylesheet" type="text/css" href="css/common.css" />
		<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
		<script type="text/javascript" src="js/localsetting.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="js/linkjump.js"></script>
		<script type="text/javascript" src="js/common.js"></script>
		<script type="text/javascript" src="js/type.js"></script>
	</head>

	<body>
		<div class="bodyTop_xk">
			<div class="Logobox"><img src="" /><span>传染病报告信息管理系统</span></div>
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
				<div class="bodyrighttop_xk"><span>某某某你好，欢迎光临！</span></div>
				<div class="bodyrightarea_xk white">
					<div class="bodybox">
						<div class="bodyrightcenter_xk">
							<div class="bodybox">
								<div class="cardTitle">管理已有传染病种类</div>
								<div class="cardBody">
									<div class="bodybox gray1">
										<div class="bodyrightmain_xk">
											<div class="bordergrp">
												<div class="bordergrpline">
													<label for="" style="display: inline-block;min-width:60px;margin-right:6px;">传染病种类名称</label>
													<input type="text" name="" id="type_name" value="" style="width:96px;" />
													<input type="button" id="" onclick="selectByCond()"  value="查询" />
												</div>

											</div>
											<div class="mainlistbox_xk">
												<div class="bodybox scrolltable">
													<table class="mainlist_xk" border="0" cellspacing="0" cellpadding="0">
														<thead>
															<tr>
																<th>序号</th>
																<th>编号</th>
																<th>名称</th>
																<th>操作</th>
															</tr>
														</thead>
														<tbody id="typeList">
															<!-- <tr>
																<td>1</td>
																<td>Data</td>
																<td><input type="button" value="订正"><input type="button" value="删除"><input type="button" value="查看详情"></td>
															</tr> -->
														</tbody>
														<tfoot>
															<tr>
																<td colspan="4" id="type_foot">
																	第1页 共10页 共100条
																</td>
															</tr>
															<tr class="YApage">
																<td colspan="4">
																	<a class="button off_xk" id_xk="homepage">首页</a>
																	<a class="button off_xk" id_xk="prevpage">&lt;</a>
																	<a class="button on_xk" id_xk="num">1</a>
																	<a class="button " id_xk="num">2</a>
																	<a class="button " id_xk="num">3</a>
																	<a class="button " id_xk="num">4</a>
																	<a class="button " id_xk="num">5</a>
																	<a class="button " id_xk="nextpage">&gt;</a>
																	<a class="button " id_xk="endpage">尾页</a>
																</td>
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