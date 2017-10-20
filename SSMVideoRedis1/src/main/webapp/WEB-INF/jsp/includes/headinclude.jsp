<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!--注解总数：		五 		-->
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<!--一：左侧logo -->
		<div class="navbar-header">
			<a class="navbar-brand" href="/home">
				<h1>
					<img src="images/logo.png" alt="" />
				</h1>
			</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<!--二：中间搜索 图片位置：style.css：53r-->
			<div class="top-search">
				<form class="navbar-form navbar-right" action="search">
					<input type="text" class="form-control" name="moviename"> <input
						type="submit" value="">
					<!--三： 此处value="" 有意义，否则搜索栏会有汉字出现 -->
				</form>
			</div>
			<div class="header-top-right">
				<div class="file">
					<c:if test="${!empty sessionScope}">
						<span id="welcome">欢迎：${sessionScope.sessionuser.username}</span>
					</c:if>
					<!--四：上传的效果：没有登录就提示，只有登录了才能上传-->
					<c:if test="${!empty sessionScope}">
						<a href="upload?ss=null">上传</a>
					</c:if>
					<c:if test="${empty sessionScope}">
						<a onclick="pleaseupload()">上传</a>
					</c:if>
				</div>
				<div class="signin">
					<c:if test="${empty sessionScope}">
						<a href="regist1" id="register">注册</a>
					</c:if>
					<c:if test="${!empty sessionScope}">
						<a id="loginout" href="logout">退出</a>
					</c:if>
					<link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
					<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
					<script>
						$(document).ready(function() {
							/* <!--五：magnificPopup click 时的方法--> */
							$('.popup-with-zoom-anim').magnificPopup({
								type : 'inline',
								fixedContentPos : false,
								fixedBgPos : true,
								overflowY : 'auto',
								closeBtnInside : true,
								preloader : false,
								midClick : true,
								removalDelay : 300,
								mainClass : 'my-mfp-zoom-in'
							});		
						});
					</script>
					<script type="text/javascript">
						function pleaseupload() {
							alert("请先登陆！");
						}
						function login() {
							$.ajax({
								url : "/login",
								dataType : "json",
								data : {
									"username" : $("#username").val(),
									"password" : $("#password").val(),
								},
								success : function(result) {
									if (result.tr) {
										window.location = "/home";
									} else {
										$("#error").html("用户或者密码错误！").show();
									}
								},
								error : function() {
									alert("error");
								}
							});
						}
					</script>
				</div>
				<div class="signin">
					<c:if test="${empty sessionScope}">
						<a href="#small-dialog" class="play-icon popup-with-zoom-anim">登录</a>
					</c:if>
					<div id="small-dialog" class="mfp-hide">
						<h3>登录</h3>
						<div class="social-sits">
							<img src="/images/gm1.jpg">
						</div>
						<div class="signup">
							<p id="error" style="color: red; height: 20px"></p>
							<input type="text" class="email" id="username" placeholder="请输入用户名"  name="username" />
							<input type="password" placeholder="请输入密码" id="password" 	name="password" /> 
							<input type="button" value="登录" onclick="login()" id="login" />
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
</nav>