<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8" />
		<title keywords="infectiontype">编辑传染病种类</title>
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
								<div class="cardTitle">编辑传染病种类</div>
								<div class="cardBody">
									<div class="bodybox gray1">
										<div class="bodyrightmain_xk">
												<table class="edittable" border="0" cellspacing="0" cellpadding="0">
													<tbody>
														<tr><td class="firsttd">编号</td><td class="secondtd"><input type="text" id="typeId" readonly="readonly"/></td></tr>
														<tr><td class="firsttd">名称</td><td class="secondtd"><input type="text" id="typeName" nes="传染病种类名称"/></td></tr>
													</tbody>
													<tfoot>
														<tr><td colspan="2">
															<input type="button" name="" onclick="editType()" value="提交" />
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
		var typeId = GetRequest();

		$.ajax({

			type : 'POST',

			url : "/Infection/type/selectById",

			dataType : 'json',

			async : true,

			data : {
				typeId : typeId
			},

			success : function(data) {
				var result = data.t;
				$("#typeId").val(result.typeId);
				$("#typeName").val(result.typeName);
			}

		});
	};
	
	function editType(){
		if(AllisNes()){
			var data_json = {
					"typeName" : $("#typeName").val(),
					"typeId" : $("#typeId").val(),
				};
				
				$.ajax({

					type : 'POST',

					url : "/Infection/type/update",

					dataType : 'json',

					async : true,

					data : data_json,

					success : function(data) {
						window.location.href="infectiontype.jsp";
					}
				});
		}
	}
</script>
	</body>
</html>


