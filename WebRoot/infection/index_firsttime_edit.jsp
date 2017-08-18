<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html >
<html>

	<head>
		<meta charset="utf-8" />
		<title keywords="index">编辑管理架构</title>
		<link rel="stylesheet" type="text/css" href="css/common.css" />
		<link rel="stylesheet" type="text/css" href="css/popupwindow.css" />
		<style type="text/css">
			.dendrogramtab {
				font-size: 12px;
				border: 1px solid #666;
				display: inline-block;
				line-height: 24px;
				white-space: normal;
				margin-left: 8px;
				margin-right: 4px;
				height: 174px;
				position: relative;
				margin-right:20px;
			}
			
			.dendrogramtab>li>label {
				display: inline-block;
				width: 30px;
				vertical-align: top;
				text-align: left;
			}
			
			.dendrogramtab>li.singlecontent>span {
				width: 180px;
			}
			
			.dendrogramtab>li.multicontent>span {
				width: 68px;
			}
			
			.dendrogramtab>li>span {
				padding-left: 10px;
				padding-right: 4px;
				display: inline-block;
				vertical-align: top;
				word-break: break-all;
				text-align: left;
				max-height: 150px;
				overflow-y: auto;
			}
			.dendrogramtab>li>span>input,.dendrogramtab>li>span>textarea{
				width:100%;
				box-sizing: border-box;
				box-sizing: -o-border-box;
				box-sizing: -moz-border-box;
				box-sizing: -ms-border-box;
				box-sizing: -webkit-border-box;
			}
			.dendrogramtab>li>span>textarea{
				height:142px;
			}
			.nobordertable,
			.nobordertable th,
			.nobordertable td {
				border: none !important;
			}
			
			.blankline {
				height: 14px;
			}
			.addbtn{
				display: inline-block;
				width:200px;
				height:176px;
				box-sizing: border-box;
				box-sizing: -o-border-box;
				box-sizing: -moz-border-box;
				box-sizing: -ms-border-box;
				box-sizing: -webkit-border-box;
				background:transparent url(img/addbtn1.png) no-repeat center;
				vertical-align: bottom;
				margin-left:20px;
			}
			.addbtn:hover{
				background:#f8f8f8 url(img/addbtn2.png) no-repeat center;
				border:none;
			}
			.edittable.nobordertable td {
				font-size: 0;
				overflow-x: auto;
				white-space: nowrap;
			}
			.reducebtn{
				position: absolute;
				right:-20px;
				top:-1px;
				display:inline-block;
				width:20px;
				height:20px;
				background:#333;
				color:#ffffff;
				border-top-right-radius: 10px;
				border-bottom-right-radius: 10px;
				cursor: pointer;
				line-height:20px;
				text-align: center;
				font-size:10px;
			}
		</style>
		<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
		<script type="text/javascript" src="js/localsetting.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="js/linkjump.js"></script>
		<script type="text/javascript" src="js/common.js"></script>
		<link rel="stylesheet" type="text/css" href="date/time_plugin_lv.min.css" />
		<script type="text/javascript" src="date/time_plugin_lv.min.js"></script>
		<script type="text/javascript" src="js/index_first_edit.js"></script>
	</head>

	<body>
		<div class="bodyTop_xk">
			<div class="Logobox"><img src="" /><span>传染病报告信息管理系统</span></div>
			<ul>
			</ul>
		</div>
		<div class="bodyNav_xk">
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
				<div class="bodyrightarea_xk white">
					<div class="bodybox">
						<div class="bodyrightcenter_xk">
							<div class="bodybox">
								<div class="cardTitle">编辑管理架构</div>
								<div class="cardBody">
									<div class="bodybox gray1">
										<div class="bodyrightmain_xk">
											<table class="edittable nobordertable" border="0" cellspacing="0" cellpadding="0" style="width:100%;">
												<tbody>
													<tr>
														<td id="index_firsttime_edit_level0">
															
														</td>
													</tr>
													<tr>
														<td class="blankline"></td>
													</tr>
													<tr>
														<td id="index_firsttime_edit_level1">
															
														</td>
													</tr>
													<tr>
														<td class="blankline"></td>
													</tr>
													<tr>
														<td id="index_firsttime_edit_level2">
															
														</td>
													</tr>
													<tfoot>
														<tr>
															<td><input type="button" name="" id="savethispage" value="保存" style="font-size: 14px;padding: 5px 8px;"/><input type="button" name="" id="cancel" value="取消并重置" style="font-size: 14px;padding: 5px 8px;"/></td>
														</tr>
													</tfoot>
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
	
</html>