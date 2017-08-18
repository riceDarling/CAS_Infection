<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8" />
<title keywords="report">新增报告卡</title>
<link rel="stylesheet" type="text/css" href="css/common.css" />
<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
<script type="text/javascript" src="js/localsetting.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script type="text/javascript" src="js/linkjump.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/addreport.js"></script>
<link rel="stylesheet" type="text/css" href="date/time_plugin_lv.min.css" />
<script type="text/javascript" src="date/time_plugin_lv.min.js"></script>

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
							<div class="cardTitle">新增报告卡</div>
							<div class="cardBody">
								<div class="bodybox gray1">
									<div class="bodyrightmain_xk">
										<form id="addreport_from">
											<table class="edittable" border="0" cellspacing="0" cellpadding="0">
												<tbody>
													<tr>
														<td class="firsttd">办学层次</td>
														<td class="secondtd">
															<select name="" id="addreport_schooltype" nes="办学层次">
																<option value="">-办学层次-</option>
																<option value="1">幼儿园(民办)</option>
																<option value="2">幼儿园(国办)</option>
																<option value="3">小学</option>
																<option value="4">中学</option>
																<option value="5">民办学校</option>
																<option value="6">职业学校</option>
																<option value="7">街道文教科</option>
															</select></td>
													</tr>
													<tr>
														<td class="firsttd">报告学校</td>
														<td class="secondtd"><select name="schoolId" id="addreport_school" nes="报告学校">
																<option value="">请选择</option>
														</select></td>
													</tr>
													<tr>
														<td class="firsttd">所在年级</td>
														<td class="secondtd"><input type="text" name="classes" id="" value="" nes="所在年级" /></td>
													</tr>
													<tr>
														<td class="firsttd">患者姓名</td>
														<td class="secondtd"><input type="text" name="patientName" id="" value=""  nes="患者姓名"/></td>
													</tr>
													<tr>
														<td class="firsttd">患者家长姓名</td>
														<td class="secondtd"><input type="text" name="parentName" id="" value="" nes="患者家长姓名" /></td>
													</tr>
													<tr>
														<td class="firsttd">学籍号</td>
														<td class="secondtd"><input type="text" name="idNumber" id="" value=""  nes="学籍号"/></td>
													</tr>
													<tr>
														<td class="firsttd">性别</td>
														<td class="secondtd"><input type="radio" name="sex" id="" value="0" checked/><label for="">男</label><input type="radio" name="sex" id="" value="1" /><label for="">女</label></td>
													</tr>
													<tr>
														<td class="firsttd">出生日期</td>
														<td class="secondtd"><input class="year_xk time_plugin_lv_onclick" time_plugin_lv_type="2" type="text" name="birthDay" id="addreport_birthDay" value="" style="width:51% !important" /></td>
													</tr>
													<tr>
														<td class="firsttd">如生日不详，填实足年龄</td>
														<td class="secondtd"><input class="month_xk" type="text" name="age" id="addreport_age" value=""  nes="年龄"/>岁</td>
													</tr>
													<tr>
														<td class="firsttd">联系方式</td>
														<td class="secondtd"><input type="text" name="telephone" id="" value=""  nes="联系方式"/></td>
													</tr>
													<tr>
														<td class="firsttd">病人所属区域</td>
														<td class="secondtd"><input type="radio" name="area" id="" value="0" checked/><label for="">本县区</label> <input type="radio" name="area" id="" value="1" /><label for="">本市其他县区</label> <input type="radio" name="area" id="" value="2" /><label for="">本省其他城市</label> <input type="radio" name="area" id="" value="3" /><label for="">其他省</label> <input type="radio" name="area" id="" value="4" /><label for="">港澳台</label> <input type="radio" name="area" id="" value="5" /><label for="">外籍</label></td>
													</tr>
													<tr>
														<td class="firsttd">现住详细地址</td>
														<td class="secondtd"><input type="text" name="address" id="" value="" /></td>
													</tr>
													<tr>
														<td class="firsttd">传染病种类</td>
														<td class="secondtd"><select name="" id="addreport_infectiontype" nes="传染病种类">
																<option value="">请选择</option>
														</select></td>
													</tr>
													<tr>
														<td class="firsttd">传染病名称</td>
														<td class="secondtd" id="addreport_infectionname"></td>
													</tr>
													<tr>
														<td class="firsttd">病例类型</td>
														<td class="secondtd"><select name="type" id="" nes="病例类型">
																<option value="1">确诊病例</option>
																<option value="0">疑似病例</option>
														</select></td>
													</tr>
													<tr>
														<td class="firsttd">发病日期</td>
														<td class="secondtd"><input class="year_xk time_plugin_lv_onclick" time_plugin_lv_type="2" type="text" name="onsetTime" id="" value="" style="width:51% !important" /></td>
													</tr>
													<tr>
														<td class="firsttd">诊断日期</td>
														<td class="secondtd"><input class="year_xk time_plugin_lv_onclick" time_plugin_lv_type="2" type="text" name="diagnosisTime" id="" value="" style="width:51% !important" /></td>
													</tr>
													<tr>
														<td class="firsttd">死亡日期</td>
														<td class="secondtd"><input class="year_xk time_plugin_lv_onclick" time_plugin_lv_type="2" type="text" name="deathTime" id="" value="" style="width:51% !important" /></td>
													</tr>
													<tr>
														<td class="firsttd">报告人</td>
														<td class="secondtd"><input type="text" name="reporter" id="" value=""  nes="报告人"/></td>
													</tr>
													<!-- <tr>
														<td class="firsttd">填卡日期</td>
														<td class="secondtd"><input class="year_xk time_plugin_lv_onclick" time_plugin_lv_type="2" type="text" name="fillTime" id="" value="" style="width:51% !important" /></td>
													</tr> -->
													<tr>
														<td class="firsttd">密切接触者有无相同症状人数</td>
														<td class="secondtd">
														<!--  <input type="radio" name="isInfection" id="" value="0" /><label for="">无</label><input type="radio" name="isInfection" id="" value="1" /><label for="">有</label>-->
														<span id="addreport_isInfectionnum" style=""><input type="text" style="width:45px" name="isInfectionnum">人</span>
														</td>
													</tr>
													<tr>
														<td class="firsttd">诊断病例</td>
														<td class="secondtd">
															<div style="display:none;">
																<input type="file" class="task_publish_file" style="display:none;" name="file" id="uploadImage1" onchange="return ajaxFileUpload();"><br>
															</div> <input type="hidden" name="diagnosisImg" value=""> <img src="img/zhaopian.png" style="width:100px;" alt="上传照片" class="task_publish_bon"> <label class="mws-form-label">&nbsp;</label>
															<div class="vip_img"></div> <input type="text" name="pictures" style="display: none">
														</td>
													</tr>
													<tr>
														<td class="firsttd">备注</td>
														<td class="secondtd"><textarea class="note_xk" name="note" rows="" cols=""></textarea></td>
													</tr>
												</tbody>
												<tfoot>
													<tr>
														<td colspan="2"><input type="button" name="" id="addreport_from_addbtn" value="提交" /></td>
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