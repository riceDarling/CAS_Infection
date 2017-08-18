<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8" />
		<title keywords="report">分人群实时统计</title>
		<link rel="stylesheet" type="text/css" href="css/common.css" />
		<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
		<script type="text/javascript" src="js/localsetting.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="js/linkjump.js"></script>
		<script type="text/javascript" src="js/common.js"></script>
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
								<div class="cardTitle">分人群实时统计</div>
								<div class="cardBody">
									<div class="bodybox gray1">
										<div class="bodyrightmain_xk">
											<div class="bordergrp">
												<div class="bordergrpline">
													<select name="">
														<option value="">按审核日期</option>
													</select>
													<select name="">
														<option value="">2017</option>
													</select><label>年</label>
													<select name="">
														<option value="">任意时段</option>
													</select>
													<select name="">
														<option value="">月</option>
													</select>
													<select name="">
														<option value="">日</option>
													</select>
													<label>至</label>
													<select name="">
														<option value="">月</option>
													</select>
													<select name="">
														<option value="">日</option>
													</select>
													<input type="button" id="" value="查询" />
												</div>
												<div class="bordergrpline">
													<label for="">学校名称</label>
													<select name="">
														<option value="">----</option>
													</select>
													<input type="radio" name="conditiontype" id="" value="" /><label for="">疾病分类</label>
													<select name="">
														<option value=""></option>
													</select>
													<input type="radio" name="conditiontype" id="" value="" /><label for="">疾病名称</label>
													<select name="">
														<option value=""></option>
													</select>
													<input type="checkbox" name="audit" id="" value="" /><label for="">确诊病例</label>
													<input type="checkbox" name="audit" id="" value="" /><label for="">疑似病例</label>
													<input type="checkbox" name="audit" id="" value="" /><label for="">按发病率统计</label>
													
												</div>
											</div>
											<div class="mainlistbox_xk">
												<div class="bodybox scrolltable">
													<table class="mainlist_xk" border="0" cellspacing="0" cellpadding="0">
														<thead>
															<tr>
																<th rowspan="2">
																	<div style="text-align: right;margin-bottom:30px;">疾病名称</div>
																	<div style="text-align: left;">分人群分类</div>
																</th>
																<th colspan="2">总计</th>
																<th colspan="2">鼠疫</th>
																<th colspan="2">霍乱</th>
																<th colspan="2">传染性非典</th>
																<th colspan="2">艾滋病</th>
																<th colspan="2">HIV</th>
																<th colspan="2">肝炎</th>
																<th colspan="2">甲肝</th>
																<th colspan="2">乙肝</th>
																<th colspan="2">丙肝</th>
																<th colspan="2">丁肝</th>
																<th colspan="2">戊肝</th>
															</tr>
															<tr>
																<th>发病数</th>
																<th>死亡数</th>
																<th>发病数</th>
																<th>死亡数</th>
																<th>发病数</th>
																<th>死亡数</th>
																<th>发病数</th>
																<th>死亡数</th>
																<th>发病数</th>
																<th>死亡数</th>
																<th>发病数</th>
																<th>死亡数</th>
																<th>发病数</th>
																<th>死亡数</th>
																<th>发病数</th>
																<th>死亡数</th>
																<th>发病数</th>
																<th>死亡数</th>
																<th>发病数</th>
																<th>死亡数</th>
																<th>发病数</th>
																<th>死亡数</th>
																<th>发病数</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>全部</td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
															</tr>
															<tr>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
															</tr>
														</tbody>
														<tfoot>
															<tr>
																<td colspan="25">
																	第1页 共10页 共100条
																</td>
															</tr>
															<tr class="YApage">
																<td colspan="25">
																	<a class="button off_xk" id_xk="homepage">首页</a>
																	<a class="button off_xk" id_xk="prevpage">&lt;</a>
																	<a class="button on_xk" id_xk="num">1</a>
																	<a class="button" id_xk="num">2</a>
																	<a class="button" id_xk="num">3</a>
																	<a class="button" id_xk="num">4</a>
																	<a class="button" id_xk="num">5</a>
																	<a class="button" id_xk="nextpage">&gt;</a>
																	<a class="button" id_xk="endpage">尾页</a>
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