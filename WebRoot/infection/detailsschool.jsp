<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8" />
		<title keywords="school">学校详情</title>
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
								<div class="cardTitle">学校详情</div>
								<div class="cardBody">
									<div class="bodybox gray1">
										<div class="bodyrightmain_xk">
												<table class="edittable" border="0" cellspacing="0" cellpadding="0">
													<tbody>
														<tr><td class="firsttd">学校编号</td><td class="secondtd" id="detail_schoolId"></td></tr>
														<tr><td class="firsttd">学校名称</td><td class="secondtd" id="detail_schoolName"></td></tr>
														<tr><td class="firsttd">办学层次</td><td class="secondtd" id="detail_level"></td></tr>
														<tr><td class="firsttd">邮政编码</td><td class="secondtd" id="detail_postalcode"></td></tr>
														<tr><td class="firsttd">联系人</td><td class="secondtd" id="detail_limkman"></td></tr>
														<tr><td class="firsttd">联系方式</td><td class="secondtd" id="detail_telephone"></td></tr>
														<tr><td class="firsttd">地址</td><td class="secondtd" id="detail_address"></td></tr>
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
		<script type="text/javascript">
			function GetRequest() {
				var url = location.search; 
				if (url.indexOf("?") != -1) { 
					var str = url.substr(1);
					return str;
				}
			}
			$(function() {
				
				var schoolId = GetRequest();
				
				$.ajax({
		
					type : 'POST',
		
					url : "/Infection/school/selectById",
		
					dataType : 'json',
		
					async : true,
		
					data : {
						schoolId : schoolId
					},
		
					success : function(data) {
						var result = data.t;
						$("#detail_schoolId").text(result.schoolId);
						$("#detail_schoolName").text(result.schoolName);
						$("#detail_address").text(result.address);
						$("#detail_postalcode").text(result.postalcode);
						$("#detail_limkman").text(result.limkman);
						$("#detail_telephone").text(result.telephone);
						$("#detail_level").text(result.level);
					}
		
				});
			});
		</script>
	</body>
</html>