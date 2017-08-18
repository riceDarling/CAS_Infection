<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8" />
<title keywords="report">报告卡详情</title>
<link rel="stylesheet" type="text/css" href="css/common.css" />
<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
<script type="text/javascript" src="js/localsetting.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script type="text/javascript" src="js/linkjump.js"></script>
<script type="text/javascript" src="js/common.js"></script>


<style type="text/css">
		.followtabbox{
			padding:0 !important;
		}
		.followtab {
			width: 100%;
			border-collapse: collapse;
			
		}
		.followtab td{
			height:30px;
		}
		.followtab thead td {
			border-top:none;
		}
		.followtab tbody td{
		}
		.followtab td:first-child{
			border-left:none!important;
		}
		.followtab td:last-child{
			border-right:none!important;
		}
		.followtab tbody tr:last-child td{
			border-bottom:none!important;
		}
		.followtab td:not(".imglinebox"){
			word-break: break-word;
		}
		.imglinebox{
			overflow-x: auto;
		}
		.imglinebox>div{
			width:40px;
			height:40px;
		}
		.imglinebox>div>img{
			max-width: 40px;
			max-height: 40px;
		}
	</style>
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
							<div class="cardTitle">报告卡详情</div>
							<div class="cardBody">
								<div class="bodybox gray1">
									<div class="bodyrightmain_xk">
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
													<td class="firsttd">密切接触者有无相同症状人数</td>
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
													<td class="firsttd">复课证明</td>
													<td class="secondtd"></td>
												</tr>
												<tr>
													<td class="firsttd">留调报告</td>
													<td class="secondtd"></td>
												</tr>
												<tr>
													<td class="firsttd">整改落实情况</td>
													<td class="secondtd"></td>
												</tr>
												
												<tr>
													<td colspan="2" class="firsttd followtabbox">
															<table class="followtab" border="0" cellspacing="0" cellpadding="0">
																<thead>
																	<tr>
																		<td colspan="5" style="text-align: center;font-size:16px;font-weight: bold;">追踪</th>
																	</tr>
																</thead>
																<tbody id="detailsreport_tracking_tbody">
																
																 <!-- 
																	<tr>
																		<td rowspan="3" style="width:6%;text-align: center;">1</td>
																		<td style="width:17%;">追踪人</td>
																		<td style="width:30%;text-align:left;"></td>
																		<td style="width:17%;">追踪时间</td>
																		<td style="width:30%;text-align:left;"></td>
																	</tr>
																	<tr>
																		<td>追踪图片</td>
																		<td colspan="3" class="imglinebox"><div><img style="max-width: 40px;max-height:40px;" src="img/a2.jpg" alt="" /></div></td>
																	</tr>
																	<tr>
																		<td>追踪文字描述</td>
																		<td colspan="3" style="text-align:left;"></td>
																	</tr>
																  -->
																 
																</tbody>
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
</body>
<script>
	$(function() {
		selectById();
	});

	function GetRequest() {
		var url = location.search;
		if (url.indexOf("?") != -1) {
			var str = url.substr(1);
			return str;
		}
	};
	function selectById() {
		var cardId = GetRequest();
		$.ajax({
			type : 'POST',
			url : "/Infection/report/selectReportById",
			dataType : 'json',
			async : true,
			data : {
				cardId : cardId
			},
			success : function(data) {
				if (data.success) {
					//console.log(data.msg);
					if (data.t.ir.level == 1) {
						$(".edittable tbody tr:eq(0) td:eq(1)").text("幼儿园(民办)");
					} else if (data.t.ir.level == 2) {
						$(".edittable tbody tr:eq(0) td:eq(1)").text("幼儿园(国办)");
					} else if (data.t.ir.level == 3) {
						$(".edittable tbody tr:eq(0) td:eq(1)").text("小学");
					} else if (data.t.ir.level == 4) {
						$(".edittable tbody tr:eq(0) td:eq(1)").text("中学");
					}
					;
					if (data.t.ir.schoolName == null) {
						$(".edittable tbody tr:eq(1) td:eq(1)").text("");
					} else {
						$(".edittable tbody tr:eq(1) td:eq(1)").text(data.t.ir.schoolName);
					}
					;
					if (data.t.ir.classes == null) {
						$(".edittable tbody tr:eq(2) td:eq(1)").text("");
					} else {
						$(".edittable tbody tr:eq(2) td:eq(1)").text(data.t.ir.classes);
					}
					;

					if (data.t.ir.patientName == null) {
						$(".edittable tbody tr:eq(3) td:eq(1)").text("");
					} else {
						$(".edittable tbody tr:eq(3) td:eq(1)").text(data.t.ir.patientName);
					}
					;

					if (data.t.ir.parentName == null) {
						$(".edittable tbody tr:eq(4) td:eq(1)").text("");
					} else {
						$(".edittable tbody tr:eq(4) td:eq(1)").text(data.t.ir.parentName);
					}
					;
					if (data.t.ir.idNumber == null) {
						$(".edittable tbody tr:eq(5) td:eq(1)").text("");
					} else {
						$(".edittable tbody tr:eq(5) td:eq(1)").text(data.t.ir.idNumber);
					}
					;
					if (data.t.ir.sex == 1) {
						$(".edittable tbody tr:eq(6) td:eq(1)").text("女");
					} else {
						$(".edittable tbody tr:eq(6) td:eq(1)").text("男");
					}
					;

					if (data.t.ir.birthDay == null) {
						$(".edittable tbody tr:eq(7) td:eq(1)").text("");
					} else {
						$(".edittable tbody tr:eq(7) td:eq(1)").text(data.t.ir.birthDay);
					}
					;
					if (data.t.ir.age == null) {
						$(".edittable tbody tr:eq(8) td:eq(1)").text("");
					} else {
						$(".edittable tbody tr:eq(8) td:eq(1)").text(data.t.ir.age);
					}
					;

					if (data.t.ir.telephone == null) {
						$(".edittable tbody tr:eq(9) td:eq(1)").text("");
					} else {
						$(".edittable tbody tr:eq(9) td:eq(1)").text(data.t.ir.telephone);
					}
					;
					switch (data.t.ir.area) {
					case 0:
						$(".edittable tbody tr:eq(10) td:eq(1)").text("本县区");
						break;
					case 1:
						$(".edittable tbody tr:eq(10) td:eq(1)").text("本市其他县区");
						break;
					case 2:
						$(".edittable tbody tr:eq(10) td:eq(1)").text("本省其他城市");
						break;
					case 3:
						$(".edittable tbody tr:eq(10) td:eq(1)").text("其他省");
						break;
					case 4:
						$(".edittable tbody tr:eq(10) td:eq(1)").text("港澳台");
						break;
					case 5:
						$(".edittable tbody tr:eq(10) td:eq(1)").text("外籍");
						break;
					default:
						$(".edittable tbody tr:eq(10) td:eq(1)").text("");
						break;
					}
					;

					if (data.t.ir.address == null) {
						$(".edittable tbody tr:eq(11) td:eq(1)").text("");
					} else {
						$(".edittable tbody tr:eq(11) td:eq(1)").text(data.t.ir.address);
					}
					;
					if (data.t.ir.typeName == null) {
						$(".edittable tbody tr:eq(12) td:eq(1)").text("");
					} else {
						$(".edittable tbody tr:eq(12) td:eq(1)").text(data.t.ir.typeName);
					}
					;
					if (data.t.ir.infectionName == null) {
						$(".edittable tbody tr:eq(13) td:eq(1)").text("");
					} else {
						$(".edittable tbody tr:eq(13) td:eq(1)").text(data.t.ir.infectionName);
					}
					;

					if (data.t.ir.onsetTime == null) {
						$(".edittable tbody tr:eq(14) td:eq(1)").text("");
					} else {
						$(".edittable tbody tr:eq(14) td:eq(1)").text(data.t.ir.onsetTime);
					}
					;

					if (data.t.ir.diagnosisTime == null) {
						$(".edittable tbody tr:eq(15) td:eq(1)").text("");
					} else {
						$(".edittable tbody tr:eq(15) td:eq(1)").text(data.t.ir.diagnosisTime);
					}
					;

					if (data.t.ir.deathTime == null) {
						$(".edittable tbody tr:eq(16) td:eq(1)").text("");
					} else {
						$(".edittable tbody tr:eq(16) td:eq(1)").text(data.t.ir.deathTime);
					}
					;

					if (data.t.ir.reporter == null) {
						$(".edittable tbody tr:eq(17) td:eq(1)").text("");
					} else {
						$(".edittable tbody tr:eq(17) td:eq(1)").text(data.t.ir.reporter);
					}
					;

					if (data.t.ir.fillTime == null) {
						$(".edittable tbody tr:eq(18) td:eq(1)").text("");
					} else {
						$(".edittable tbody tr:eq(18) td:eq(1)").text(data.t.ir.fillTime);
					}
					;

					if (data.t.ir.isInfectionnum == null) {
						$(".edittable tbody tr:eq(19) td:eq(1)").text("");
					} else {
						$(".edittable tbody tr:eq(19) td:eq(1)").text(data.t.ir.isInfectionnum);
					}
					;

					if (data.t.ir.diagnosisImg == null) {
						$(".edittable tbody tr:eq(20) td:eq(1)").text("");
					} else {
						//定义一数组
						var strs = new Array();
						//字符分割 
						strs = data.t.ir.diagnosisImg.split(",");
						var html = "";
						for (i in strs) {
							html += "<img src='http://"+strs[i]+"' style='width:100px'/>&nbsp;&nbsp;";
						}
						$(".edittable tbody tr:eq(20) td:eq(1)").append(html);
					}
					;

					if (data.t.ir.note == null) {
						$(".edittable tbody tr:eq(21) td:eq(1)").text("");
					} else {
						$(".edittable tbody tr:eq(21) td:eq(1)").text(data.t.ir.note);
					}
					;
					if (data.t.ir.restoreImg == null) {
						$(".edittable tbody tr:eq(22) td:eq(1)").text("");
					} else {
						//定义一数组
						var strs = new Array();
						//字符分割 
						strs = data.t.ir.restoreImg.split(",");
						var html = "";
						for (i in strs) {
							html += "<img src='http://"+strs[i]+"' style='width:100px'/>&nbsp;&nbsp;";
						}
						$(".edittable tbody tr:eq(22) td:eq(1)").append(html);
					}
					;
					
					if (data.t.ir.keeptuneimg == null) {
						$(".edittable tbody tr:eq(23) td:eq(1)").text("");
					} else {
						//定义一数组
						var strs = new Array();
						//字符分割 
						strs = data.t.ir.keeptuneimg.split(",");
						var html = "";
						for (i in strs) {
							html += "<img src='http://"+strs[i]+"' style='width:100px'/>&nbsp;&nbsp;";
						}
						$(".edittable tbody tr:eq(23) td:eq(1)").append(html);
					}
					;
					if (data.t.ir.implementationimg == null) {
						$(".edittable tbody tr:eq(24) td:eq(1)").text("");
					} else {
						//定义一数组
						var strs = new Array();
						//字符分割 
						strs = data.t.ir.implementationimg.split(",");
						var html = "";
						for (i in strs) {
							html += "<img src='http://"+strs[i]+"' style='width:100px'/>&nbsp;&nbsp;";
						}
						$(".edittable tbody tr:eq(24) td:eq(1)").append(html);
					}
					;
					//追踪信息
					if(data.t.irt.length>0){
						var html="";
						for(i in data.t.irt){
							html+='<tr>'
								+'<td rowspan="3" style="width:6%;text-align: center;">'+i+'</td>'
								+'<td style="width:17%;">追踪人</td>'
								+'<td style="width:30%;text-align:left;">'+data.t.irt[i].trackingpeoplename+'</td>'
								+'<td style="width:17%;">追踪时间</td>'
								+'<td style="width:30%;text-align:left;">'+data.t.irt[i].trackingtime+'</td>'
							+'</tr>'
							+'<tr>'
								+'<td>追踪图片</td>'
								+'<td colspan="3" class="imglinebox"><div>';
								
								if(data.t.irt[i].trackingimg!=null){
									//定义一数组
									var strs = new Array();
									//字符分割 
									strs = data.t.irt[i].trackingimg.split(",");
									for(y in strs){
										html+='<img style="max-width: 40px;max-height:40px;" src="http://'+strs[y]+'" alt="" />';
									}
								
								}
							html+='</div></td>'
							+'</tr>'
							+'<tr>'
								+'<td>追踪文字描述</td>'
								+'<td colspan="3" style="text-align:left;">'+data.t.irt[i].trackingtext+'</td>'
							+'</tr>';
						}
						
						$("#detailsreport_tracking_tbody").append(html);
					}
				}

			}

		});
	};
</script>

</html>