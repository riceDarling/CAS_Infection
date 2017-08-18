<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="" />
		<title keywords="infection">新增传染病</title>
		<link rel="stylesheet" type="text/css" href="css/common.css" />
		<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="js/localsetting.js"></script>
		<script type="text/javascript" src="js/linkjump.js" ></script>
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
								<div class="cardTitle">新增传染病</div>
								<div class="cardBody">
									<div class="bodybox gray1">
										<div class="bodyrightmain_xk">
												<table class="edittable" border="0" cellspacing="0" cellpadding="0">
													<tbody>
														<tr>
															<td class="firsttd">传染病种类</td><td class="secondtd">
																<select id="infectionType" nes="传染病种类">
																	<!-- <option value=""></option> -->
																</select>
															</td>
														</tr>
														<tr><td class="firsttd">传染病名称</td><td class="secondtd"><input type="text" id="infectionName"  nes="传染病名称"/></td></tr>
														<tr><td class="firsttd">隔离天数</td><td class="secondtd"><input type="text" id="insulateTime" /></td></tr>
													</tbody>
													<tfoot>
														<tr><td colspan="2">
															<input type="button" onclick="addInfection()" id="" value="提交" />
														</td></tr>
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
		<script type="text/javascript">		 	
			function allType(){
				$("#infectionType").empty();
				$.ajax({
					type : 'POST',
					url : "/Infection/type/selectAllType",
					dataType : 'json',
					async : true,
		    		success:function(date){
		    			var res = date.t;
				        	$("#infectionType").append("<option value=''>请选择</option>");
		    			for (var i = 0;i < res.length; i++) {
 				        	$("#infectionType").append("<option value="+res[i].typeId+">" + res[i].typeName + "</option>");
 				        }
		    		}
		    	});
			}
			allType();
			
			function addInfection() {
				if(AllisNes()){
					var data_json = {
							"infectionName" : $("#infectionName").val(),
							"type" : $("#infectionType").find("option:selected").val(),
							"insulateTime" : $("#insulateTime").val()
						};
						$.ajax({
							type : 'POST',
							url : "/Infection/infection/insert",
							dataType : 'json',
							async : true,
							data : data_json,
							success : function(data) {
								//window.location.href="infection.jsp";
							}
						});
				}
			}
		</script>
	</body>
</html>