<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8" />
		<title keywords="school">新增学校</title>
		<link rel="stylesheet" type="text/css" href="css/common.css" />
		<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
		<script type="text/javascript" src="js/localsetting.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="js/linkjump.js" ></script>
		<script type="text/javascript" src="js/common.js"></script>
		<script type="text/javascript" src="js/school.js"></script>
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
								<div class="cardTitle">新增学校</div>
								<div class="cardBody">
									<div class="bodybox gray1">
										<div class="bodyrightmain_xk">
												<table class="edittable" border="0" cellspacing="0" cellpadding="0">
													<tbody>
														<tr><td class="firsttd">学校名称</td><td class="secondtd"><input type="text" id="schoolName" nes="学校名称" /></td></tr>
														<tr><td class="firsttd">办学层次</td><td class="secondtd">
															<select id="level" nes="办学层次">
																<option value="">-办学层次-</option>
																<option value="1">幼儿园(民办)</option>
																<option value="2">幼儿园(国办)</option>
																<option value="3">小学</option>
																<option value="4">中学</option>
																<option value="5">民办学校</option>
																<option value="6">职业学校</option>
																<option value="7">街道文教科</option>
															</select>
														</td></tr>
														<tr><td class="firsttd">邮政编码</td><td class="secondtd"><input type="text" id="postalcode"/></td></tr>
														<tr><td class="firsttd">联系人</td><td class="secondtd"><input type="text" id="limkman" nes="联系人" /></td></tr>
														<tr><td class="firsttd">联系方式</td><td class="secondtd"><input type="text" id="telephone" nes="联系方式" /></td></tr>
														<tr><td class="firsttd">地址</td><td class="secondtd"><input type="text" id="address"/></td></tr>
														<tr><td class="firsttd">登录名</td><td class="secondtd"><input type="text" id="account" nes="登录名" /></td></tr>
														<tr><td class="firsttd">密码</td><td class="secondtd"><input type="text" id="pwd" value="123456" nes="密码"/></td></tr>
													</tbody>
													<tfoot>
														<tr><td colspan="2">
															<input type="button" id="addSchool" onclick="addSchool()" value="提交" />
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
		 	
			/* function allLevel(){
				var slv = $("#level").val();
				$("#level").empty();
				$.ajax({
					
					type : 'POST',

					url : "/Infection/school/getAllLevel",

					dataType : 'json',

					async : true,

		    		success:function(date){
		    			var res = date.t;
				        	$("#level").append("<option>请选择</option>");
		    			for (var i = 0;i < res.length; i++) {
 				        	$("#level").append("<option>" + res[i].level + "</option>");
 				        }
		    		}
		    	});
			}
			allLevel(); */
			function addSchool() {
				if(AllisNes()){
					var data_json = {
							"schoolName" : $("#schoolName").val(),
							"postalcode" : $("#postalcode").val(),
							"limkman" : $("#limkman").val(),
							"level" : $("#level").find("option:selected").val(),
							"telephone" : $("#telephone").val(),
							"address" : $("#address").val(),
						};
						
						var data_acc = {
							"name" : $("#account").val(),
							"password" : $("#pwd").val(),
							"nickname" : $("#schoolName").val(),
							"level" : 0,
							"schoolId" : 0,
						};
						$.ajax({

							type : 'POST',

							url : "/Infection/school/insert",

							dataType : 'json',

							async : true,

							data : data_json,

							success : function(data) {
								//alert(data.t);
								data_acc.schoolId = data.t;
								
								$.ajax({

									type : 'POST',

									url : "/Infection/account/insert",

									dataType : 'json',

									async : true,

									data : data_acc,

									success : function(data) {
										window.location.href="school.jsp";
									}
								}); 
							}
						});
				}
			}
		</script>
	</body>
</html>