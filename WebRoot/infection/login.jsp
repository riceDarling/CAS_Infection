<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--登录-->
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/login.css"/>
		<script type="text/javascript" src="js/jquery-1.11.0.js" ></script>	
		<script type="text/javascript" src="js/common.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="js/localsetting.js"></script>
		<script type="text/javascript" src="js/login.js" ></script>
	</head>
	<body>
		<div class="loginbox">
			<div class="login">
				<div class="logintitle">
					传染病报告信息管理系统
				</div>
				<div class="loginmain">
					<ul>
						<li class="inputline"><label for="">用户名：</label><input type="text" name="account" id="name"/></li>
						<li class="inputline"><label for="">密&nbsp;码：</label><input type="password" name="password" id="password"/></li>
					</ul>
					<div class="loginbtn">登录</div>
					
				</div>
			</div>
			<div class="bgbox">
				<div class="bgcover">
					<img src="img/bgcover.jpg"/>
				</div>
			</div>
		</div>
		
	</body>
</html>
