<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8" />
		<title keywords="infection">编辑传染病</title>
		<link rel="stylesheet" type="text/css" href="css/common.css" />
		<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
		<script type="text/javascript" src="js/localsetting.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
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
								<div class="cardTitle">编辑传染病</div>
								<div class="cardBody">
									<div class="bodybox gray1">
										<div class="bodyrightmain_xk">
												<table class="edittable" border="0" cellspacing="0" cellpadding="0">
													<tbody>
														<tr><td class="firsttd">传染病种类</td><td class="secondtd">
															<select id="allType">
																<!-- <option value=""></option> -->
															</select>
														</td></tr>
														<tr>
															<td class="firsttd">传染病名称</td>
															<td class="secondtd">
																<input type="hidden" id="infectionId" />
																<input type="hidden" id="hidType" />
																<input type="text" id="infectionName" nes="传染病名称"/>
															</td>
														</tr>
														<tr>
															<td class="firsttd">隔离天数</td>
															<td class="secondtd">
																<input type="text" id="insulateTime" />
															</td>
														</tr>
													</tbody>
													<tfoot>
														<tr><td colspan="2">
															<input type="button" onclick="editInfection()" id="" value="提交" />
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
	$(function() {
		selectById();
		
	});

	function GetRequest() {
		var url = location.search; //获取url中"?"符后的字串
		if (url.indexOf("?") != -1) { //判断是否有参数
			var str = url.substr(1);
			return str;
		}
	}
	function selectById() {
		var infectionId = GetRequest();

		$.ajax({

			type : 'POST',

			url : "/Infection/infection/selectById",

			dataType : 'json',

			async : true,

			data : {
				infectionId : infectionId
			},

			success : function(data) {
				var result = data.t;
				$("#infectionId").val(result.infectionId);
				$("#infectionName").val(result.infectionName);
				$("#insulateTime").val(result.insulateTime);
				$("#hidType").val(result.type);
				//alert($("#hid_level").val());
				$("#allType").click(allType());
			}

		});
	};
	
	function allType(){
		var thisType = $("#hidType").val();
		$("#allType").empty();
		$.ajax({
			
			type : 'POST',

			url : "/Infection/type/selectAllType",

			dataType : 'json',

			async : true,

    		success:function(date){
    			var res = date.t;
    			for (var i = 0;i < res.length; i++) {
    				if (res[i].typeId == thisType) {
			        	$("#allType").append("<option value="+res[i].typeId+" selected='selected'>" + res[i].typeName + "</option>");
					} else {
			        	$("#allType").append("<option value="+res[i].typeId+">" + res[i].typeName + "</option>");
					}
			    }
    		}
    	});
	}
	function editInfection(){
		if(AllisNes()){
			var data_json = {
					"infectionId" : $("#infectionId").val(),
					"infectionName" : $("#infectionName").val(),
					"insulateTime" : $("#insulateTime").val(),
					"type" : $("#allType").find("option:selected").val(),
				};
			
			$.ajax({

				type : 'POST',

				url : "/Infection/infection/update",

				dataType : 'json',

				async : true,

				data : data_json,

				success : function(data) {
					window.location.href="infection.jsp";
				}
			});
		}
	}
</script>
	</body>
</html>
