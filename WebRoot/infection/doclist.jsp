<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8" />
		<title keywords="index">传染病防控知识</title>
		<link rel="stylesheet" type="text/css" href="css/common.css" />
		<style type="text/css">
			.edittable td {
				height: 26px;
				padding: 1px;
			}
		</style>
		<link rel="stylesheet" type="text/css" href="css/popupwindow.css" />
		<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
		<script type="text/javascript" src="js/localsetting.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="js/linkjump.js"></script>
		<script type="text/javascript" src="js/common.js"></script>
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
								<div class="cardTitle">首页</div>
								<div class="cardBody">
									<div class="bodybox gray1">
										<div class="bodyrightmain_xk">
											<table class="edittable" border="0" cellspacing="0" cellpadding="0" style="width:100%;">
												<tbody>
													<tr>
														<td>简介</td>
														<td>
															<a href="pdfread.jsp?crb.pdf" target="_blank">传染病</a>
														</td>
														<td>
															<input type="button" file_name="crb" value="下载" />
														</td>
													</tr>
													<tr>
														<td rowspan="2">甲类传染病</td>
														<td>
															<a href="pdfread.jsp?hl.pdf" target="_blank">霍乱</a>
														</td>
														<td>
															<input type="button" file_name="hl" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?sy.pdf" target="_blank">鼠疫</a>
														</td>
														<td>
															<input type="button" file_name="sy" value="下载" />
														</td>
													</tr>
													<tr>
														<td rowspan="24">乙类传染病</td>
														<td>
															<a href="pdfread.jsp?azb.pdf" target="_blank">艾滋病</a>
														</td>
														<td>
															<input type="button" file_name="azb" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?brk.pdf" target="_blank">百日咳</a>
														</td>
														<td>
															<input type="button" file_name="brk" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?bdxgy.pdf" target="_blank">病毒性肝炎</a>
														</td>
														<td>
															<input type="button" file_name="bdxgy" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?blsjb.pdf" target="_blank">布鲁氏菌病</a>
														</td>
														<td>
															<input type="button" file_name="blsjb" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?crxfdxfy.pdf" target="_blank">传染性非典型肺炎</a>
														</td>
														<td>
															<input type="button" file_name="crxfdxfy" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?dgr.pdf" target="_blank">登革热</a>
														</td>
														<td>
															<input type="button" file_name="dgr" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?fjh.pdf" target="_blank">肺结核</a>
														</td>
														<td>
															<input type="button" file_name="fjh" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?gdlxt.pdf" target="_blank">钩端螺旋体</a>
														</td>
														<td>
															<input type="button" file_name="gdlxt" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?jshzy.pdf" target="_blank">脊髓灰质炎</a>
														</td>
														<td>
															<input type="button" file_name="jshzy" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?kqb.pdf" target="_blank">狂犬病</a>
														</td>
														<td>
															<input type="button" file_name="kqb" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?lb.pdf" target="_blank">淋病</a>
														</td>
														<td>
															<input type="button" file_name="lb" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?lxxcxr.pdf" target="_blank">流行性出血热</a>
														</td>
														<td>
															<input type="button" file_name="lxxcxr" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?lxxnjsmy.pdf" target="_blank">流行性脑脊髓膜炎</a>
														</td>
														<td>
															<input type="button" file_name="lxxnjsmy" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?lxxyxny.pdf" target="_blank">流行性乙型脑炎</a>
														</td>
														<td>
															<input type="button" file_name="lxxyxny" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?mz.pdf" target="_blank">麻疹</a>
														</td>
														<td>
															<input type="button" file_name="mz" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?md.pdf" target="_blank">梅毒</a>
														</td>
														<td>
															<input type="button" file_name="md" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?nj.pdf" target="_blank">疟疾</a>
														</td>
														<td>
															<input type="button" file_name="nj" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?rgrh7n9qlg.pdf" target="_blank">人感染H7N9禽流感</a>
														</td>
														<td>
															<input type="button" file_name="rgrh7n9qlg" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?rgrgzbxqlg.pdf" target="_blank">人感染高致病性禽流感</a>
														</td>
														<td>
															<input type="button" file_name="rgrgzbxqlg" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?shhfsh.pdf" target="_blank">伤寒和副伤寒</a>
														</td>
														<td>
															<input type="button" file_name="shhfsh" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?tj.pdf" target="_blank">炭疽</a>
														</td>
														<td>
															<input type="button" file_name="tj" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?xsepsf.pdf" target="_blank">新生儿破伤风</a>
														</td>
														<td>
															<input type="button" file_name="xsepsf" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?xhr.pdf" target="_blank">猩红热</a>
														</td>
														<td>
															<input type="button" file_name="xhr" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?xxcb.pdf" target="_blank">血吸虫病</a>
														</td>
														<td>
															<input type="button" file_name="xxcb" value="下载" />
														</td>
													</tr>
													<tr>
														<td rowspan="12">丙类传染病</td>
														<td>
															<a href="pdfread.jsp?bcb.pdf" target="_blank">包虫病</a>
														</td>
														<td>
															<input type="button" file_name="bcb" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?fz.pdf" target="_blank">风疹</a>
														</td>
														<td>
															<input type="button" file_name="fz" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?grxfxb.pdf" target="_blank">感染性腹泻病</a>
														</td>
														<td>
															<input type="button" file_name="grxfxb" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?hrb.pdf" target="_blank">黑热病</a>
														</td>
														<td>
															<input type="button" file_name="hrb" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?jxcxxjmy.pdf" target="_blank">急性出血性结膜炎</a>
														</td>
														<td>
															<input type="button" file_name="jxcxxjmy" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?jxh1n1lg.pdf" target="_blank">甲型H1N1流感</a>
														</td>
														<td>
															<input type="button" file_name="jxh1n1lg" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?lxxgm.pdf" target="_blank">流行性感冒</a>
														</td>
														<td>
															<input type="button" file_name="lxxgm" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?lxxhdfxbzsh.pdf" target="_blank">流行性和地方性斑疹伤寒</a>
														</td>
														<td>
															<input type="button" file_name="lxxhdfxbzsh" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?lxxsxy.pdf" target="_blank">流行性腮腺炎</a>
														</td>
														<td>
															<input type="button" file_name="lxxsxy" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?mfb.pdf" target="_blank">麻风病</a>
														</td>
														<td>
															<input type="button" file_name="mfb" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?szkb.pdf" target="_blank">手足口病</a>
														</td>
														<td>
															<input type="button" file_name="szkb" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?scb.pdf" target="_blank">丝虫病</a>
														</td>
														<td>
															<input type="button" file_name="scb" value="下载" />
														</td>
													</tr>
													<tr>
														<td rowspan="18">其他</td>
														<td>
															<a href="pdfread.jsp?ambxlj.pdf" target="_blank">阿米巴性痢疾</a>
														</td>
														<td>
															<input type="button" file_name="ambxlj" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?ablcxr.pdf" target="_blank">埃博拉出血热</a>
														</td>
														<td>
															<input type="button" file_name="ablcxr" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?bjhlbj.pdf" target="_blank">鼻疽和类鼻疽</a>
														</td>
														<td>
															<input type="button" file_name="bjhlbj" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?dgccxxdcgjo104gr.pdf" target="_blank">德国肠出血性大肠杆菌O104感染</a>
														</td>
														<td>
															<input type="button" file_name="dgccxxdcgjo104gr" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?ekxcb.pdf" target="_blank">颚口线虫病</a>
														</td>
														<td>
															<input type="button" file_name="ekxcb" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?gzgyxcb.pdf" target="_blank">广州管圆线虫病</a>
														</td>
														<td>
															<input type="button" file_name="gzgyxcb" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?hurb.pdf" target="_blank">黄热病</a>
														</td>
														<td>
															<input type="button" file_name="hurb" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?jqkyr.pdf" target="_blank">基孔肯亚热</a>
														</td>
														<td>
															<input type="button" file_name="jqkyr" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?lsr.pdf" target="_blank">拉沙热</a>
														</td>
														<td>
															<input type="button" file_name="lsr" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?lgr.pdf" target="_blank">裂谷热</a>
														</td>
														<td>
															<input type="button" file_name="lgr" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?mebcxr.pdf" target="_blank">马尔堡出血热</a>
														</td>
														<td>
															<input type="button" file_name="mebcxr" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?mzzcb.pdf" target="_blank">美洲锥虫病</a>
														</td>
														<td>
															<input type="button" file_name="mzzcb" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?nrbdjxcwy.pdf" target="_blank">诺如病毒急性胃肠炎</a>
														</td>
														<td>
															<input type="button" file_name="nrbdjxcwy" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?rsghb.pdf" target="_blank">人兽共患病</a>
														</td>
														<td>
															<input type="button" file_name="rsghb" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?rzzzlqjgr.pdf" target="_blank">人猪重症链球菌感染</a>
														</td>
														<td>
															<input type="button" file_name="rzzzlqjgr" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?xnlbd.pdf" target="_blank">西尼罗病毒</a>
														</td>
														<td>
															<input type="button" file_name="xnlbd" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?zkbdb.pdf" target="_blank">寨卡病毒病</a>
														</td>
														<td>
															<input type="button" file_name="zkbdb" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?zdhxzhz.pdf" target="_blank">中东呼吸综合征</a>
														</td>
														<td>
															<input type="button" file_name="zdhxzhz" value="下载" />
														</td>
													</tr>

													<tr>
														<td rowspan="5">法律法规</td>
														<td>
															<a href="pdfread.jsp?jhbfzglbf.pdf" target="_blank">《结核病防治管理办法》（卫生部令第92号）</a>
														</td>
														<td>
															<input type="button" file_name="jhbfzglbf" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?azbfztl.pdf" target="_blank">中华人民共和国国务院令第 457 号《艾滋病防治条例》</a>
														</td>
														<td>
															<input type="button" file_name="azbfztl" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?tfggwssjyjtl.pdf" target="_blank">中华人民共和国国务院令第３７６号《突发公共卫生事件应急条例》</a>
														</td>
														<td>
															<input type="button" file_name="tfggwssjyjtl" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?ymlthyfjzgltl.pdf" target="_blank">中华人民共和国国务院令第４３４号《疫苗流通和预防接种管理条例》</a>
														</td>
														<td>
															<input type="button" file_name="ymlthyfjzgltl" value="下载" />
														</td>
													</tr>
													<tr>
														<td>
															<a href="pdfread.jsp?zhrmghgcrbfzf.pdf" target="_blank">中华人民共和国主席令第17号《中华人民共和国传染病防治法》</a>
														</td>
														<td>
															<input type="button" file_name="zhrmghgcrbfzf" value="下载" />
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
<script type="text/javascript">
	$(document).on("click", ".edittable input[type='button']", function() {
		window.open("/Infection/download/filePdf?fileName=" + $(this).attr("file_name"));
	});
</script>
</html>