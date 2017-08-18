<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8" />
<title keywords="report">报告卡(追踪)</title>
<link rel="stylesheet" type="text/css" href="css/common.css" />
<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
<script type="text/javascript" src="js/localsetting.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script type="text/javascript" src="js/linkjump.js"></script>
<script type="text/javascript" src="js/common.js"></script>

<script type="text/javascript" src="js/trackingreport.js"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"></script>


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
							<div class="cardTitle">报告卡(追踪)</div>
							<div class="cardBody">
								<div class="bodybox gray1">
									<div class="bodyrightmain_xk">
									<form id="trackingreport_from">
										<table class="edittable" border="0" cellspacing="0" cellpadding="0">
											<tbody>
												<tr>
													<td class="firsttd">办学层次</td>
													<td class="secondtd"></td>
												</tr>
												<tr>
													<td class="firsttd">报告学校</td>
													<td class="secondtd"></td>
												</tr>
												<tr>
													<td class="firsttd">所在年级</td>
													<td class="secondtd"></td>
												</tr>
												<tr>
													<td class="firsttd">患者姓名</td>
													<td class="secondtd"></td>
												</tr>
												<tr>
													<td class="firsttd">患者家长姓名</td>
													<td class="secondtd"></td>
												</tr>
												<tr>
													<td class="firsttd">学籍号</td>
													<td class="secondtd"></td>
												</tr>
												<tr>
													<td class="firsttd">性别</td>
													<td class="secondtd"></td>
												</tr>
												<tr>
													<td class="firsttd">出生日期</td>
													<td class="secondtd"></td>
												</tr>
												<tr>
													<td class="firsttd">如生日不详，填实足年龄</td>
													<td class="secondtd"></td>
												</tr>
												<tr>
													<td class="firsttd">联系方式</td>
													<td class="secondtd"></td>
												</tr>
												<tr>
													<td class="firsttd">病人所属区域</td>
													<td class="secondtd"></td>
												</tr>
												<tr>
													<td class="firsttd">现住详细地址</td>
													<td class="secondtd"></td>
												</tr>
												<tr>
													<td class="firsttd">传染病种类</td>
													<td class="secondtd"></td>
												</tr>
												<tr>
													<td class="firsttd">传染病名称</td>
													<td class="secondtd"></td>
												</tr>
												<tr>
													<td class="firsttd">发病日期</td>
													<td class="secondtd"></td>
												</tr>
												<tr>
													<td class="firsttd">诊断日期</td>
													<td class="secondtd"></td>
												</tr>
												<tr>
													<td class="firsttd">死亡日期</td>
													<td class="secondtd"></td>
												</tr>
												<tr>
													<td class="firsttd">报告人</td>
													<td class="secondtd"></td>
												</tr>
												<tr>
													<td class="firsttd">填卡日期</td>
													<td class="secondtd"></td>
												</tr>
												<tr>
													<td class="firsttd">密切接触者有无相同症状</td>
													<td class="secondtd"></td>
												</tr>
												<tr>
													<td class="firsttd">诊断病例</td>
													<td class="secondtd"></td>
												</tr>
												<tr>
													<td class="firsttd">备注</td>
													<td class="secondtd"></td>
												</tr>
												
												<tr>
													<td class="firsttd">追踪文字描述</td>
													<td class="secondtd"><input type="text" name="trackingtext" id="" value="" /></td>
												</tr>
												<tr>
													<td class="firsttd">追踪图片资料</td>
													<td class="secondtd">
														<div style="display:none;">
															<input type="file" class="task_publish_file" style="display:none;" name="file" id="uploadImage1" onchange="return ajaxFileUpload()"><br>
														</div> <input type="hidden" name="trackingimg" value="" nes="追踪图片资料"> <img src="img/zhaopian.png" style="width:100px;" alt="上传照片" class="task_publish_bon"> <label class="mws-form-label">&nbsp;</label>
														<div class="vip_img" ></div> <input type="text" name="pictures" style="display: none">
													</td>
												</tr>
											</tbody>
											<tfoot>
												<tr>
													<td colspan="2"><input type="button" name="" id="trackingreport_from_addbtn" value="提交" /></td>
												</tr>
											</tfoot>
										</table>
										</form>
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