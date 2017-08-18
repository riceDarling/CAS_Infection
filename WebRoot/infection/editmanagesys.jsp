<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<title keywords="manage">日常管理</title>
<link rel="stylesheet" type="text/css" href="css/common.css" />
<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script type="text/javascript" src="js/localsetting.js"></script>
<script type="text/javascript" src="js/linkjump.js"></script>
<script type="text/javascript" src="js/common.js"></script>

<script type="text/javascript" src="js/ajaxfileupload.js"></script>
<script type="text/javascript" src="js/editmanagesys.js"></script>

</head>

<body>
	<div class="bodyTop_xk">
		<div class="Logobox">
			<img src="" /><span>传染病报告信息管理系统</span>
		</div>
		<ul>
		</ul>
	</div>
	<div class="bodyNav_xk"></div>
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
							<div class="cardTitle">日常管理系统</div>
							<div class="cardBody">
								<div class="bodybox gray1">
									<div class="bodyrightmain_xk">
										<form id="editmanagesys_from">
											<table class="edittable" border="0" cellspacing="0"
												cellpadding="0">
												<tbody>
													<tr>
														<td class="firsttd">名称</td>
														<td class="secondtd" id='editmanagesys_tr_1'></td>
													</tr>
													<tr>
														<td class="firsttd">文件</td>
														<td class="secondtd" id='editmanagesys_tr_2'>
														<img src="img/upload.png"  height="60px" alt="上传文件" style="padding-top: 10px;padding-left: 10px;">
															<input type="file" name='file' id="uploadImage1" style="display:none"/>
														</td>
													</tr>

												</tbody>
												<tfoot>
													<tr>
														<td colspan="2"><input type="button" name=""
															id="editmanagesys_from_addbtn" value="提交" /></td>
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