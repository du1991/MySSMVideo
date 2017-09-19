<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script src="js/jquery-3.2.1.js" type="text/javascript" charset="utf-8"></script>
	<link rel="stylesheet" type="text/css" href="css/register.css"/>
	<link href="css/style.css" rel='stylesheet' type='text/css' media="all" />
</head>
<body>

	<script src="js/register.js" type="text/javascript" charset="utf-8"></script> 
	
		<header>
			<a class="navbar-brand" href="home">
				<h1>
					<img src="images/logo.png" alt="" />
				</h1>
			</a>			
			<div class="desc">欢迎注册</div>			
		</header>
		<section id="Message_reminding">
			<form method="post" action="doregist">
				<div class="register-box">
					<label for="username" class="username_label" >用 户 名
					<input name="username" maxlength="20" type="text" placeholder="您的用户名和登录名"/>
					</label>
					<div class="tips">
						<div style="width:150px;color:red">${msg}</div>
					</div>
				</div>
				<div class="register-box">
					<label for="username" class="other_label">设 置 密 码
					<input id="pd" name="password" maxlength="20" type="password" placeholder="建议至少使用两种字符组合"/>
					</label>
					<div class="tips">
						
					</div>
				</div>
				<div class="register-box">
					<label for="username" class="other_label">确 认 密 码
					<input id="rpd" name="repassword" maxlength="20" type="password" placeholder="请再次输入密码"/>
					</label>
					<div class="tips">
					
					</div>
				</div> 
				 <div class="register-box">
					<label for="username" class="other_label">验 证 码
					<input id="vcode" maxlength="20" type="text" placeholder="请输入验证码"/>
					</label>
					<span id="code"></span>
					<div class="tips">
					
					</div>
				</div>
				<div class="arguement">
					<input type="checkbox" id="xieyi" checked="checked"/>
					阅读并同意
					<a href="#">《myplay用户注册协议》</a>
					<a href="#">《隐私政策》</a>
					<div class="tips">
						
					</div>
				</div> 
				<div class="submit_btn">
					<button type="submit" id="submit_btn">立 即 注 册</button>
				</div> 
			</form>
		</section> 
	</body>
</html>