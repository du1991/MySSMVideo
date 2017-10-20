<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="height: 100%;">

<head>
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css'
	media="all" />
<link href="css/dashboard.css" rel="stylesheet">
<link href="css/style.css" rel='stylesheet' type='text/css' media="all" />
<script src="js/jquery-1.11.1.min.js"></script>
</head>

<body style="height: 100%; padding: 0">
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="/home"><h1>
						<img src="images/logo.png" alt="" />
					</h1></a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<div class="header-top-right">
					<div class="file">
						<c:if test="${!empty su }">
						上传成功！
						</c:if>						
						<c:if test="${!empty sessionScope}">
							<a href="myUpload">我的上传</a>
						</c:if>
						<c:if test="${!empty sessionScope}">
							<a href="upload">上传</a>
						</c:if>
						<c:if test="${empty sessionScope}">
							<a onclick="pleaseupload()">上传</a>
						</c:if>
					</div>
					<div class="signin">
						<c:if test="${empty sessionScope}">
							<a href="#small-dialog2" class="play-icon popup-with-zoom-anim"
								id="register">注册</a>
						</c:if>
						<c:if test="${!empty sessionScope}">
							<a id="loginout" href="logout">退出</a>
						</c:if>
						<link href="css/popuo-box.css" rel="stylesheet" type="text/css"
							media="all" />
						<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>						
						<script>
							$(document).ready(function() {
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
								alert("请先登陆！")
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
											$("#error").html("用户或者密码错误！")
													.show();
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
							<p id=error style="color: red; height: 20px"></p>
							<input type="text" class="email" id="username" name="username" />
							<input type="password" id="password" name="password" /> 
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
	<script type="text/javascript">
		function handleFile(){
			 var reg = /[^\\\/]*[\\\/]+/g; //匹配文件的名称和后缀的正则表达式
		     var name = $("#fileload").val().replace(reg, '');
		     var postfix = /\.[^\.]+/.exec(name);//获取文件的后缀
		     var text =name.substr(0,postfix['index']);//参考网址：http://www.jb51.net/article/66470.htm
			$("#moviena").val(text);
		}
	</script>
<div  style="padding-top:50px;padding-left:200px;height:calc(100% - 208px);position:relative;top:86px;text-align:left;font-size:22px
		;background:url(/images/biz2.jpg) no-repeat 60% 30%;background-size:cover" >
				<form action="uploadfile" method="post" enctype="multipart/form-data">
				<input type="file" name="file" onchange="handleFile()" id="fileload" style="color: transparent;float:none;margin-left:100px;font-size:20px
				;width:80px" />
			<p>
				主要类型:<select name="movietypehead">
					<option>movie</option>
					<option>sport</option>
					<option>MV</option>
					<option>TV</option>
					<option>news</option>
				</select>
			</p>
			<p>
				详细类型: <select name="movietypedetail">
					<option>comedy</option>
					<option>hot</option>
					<option>science</option>
					<option>sport</option>
					<option>football</option>
					<option>basketball</option>
					<option>badminton</option>
					<option>pingpong</option>
					<option>action</option>
					<option>horrible</option>
					<option>news</option>
					<option>MV</option>
					<option>TV</option>
				</select>
			</p>
			<p>
				视频名字:<input id="moviena" name="moviename"  type="text" />
			</p>
			<p>
				视频时长:<input id="runningtime" name="runningtime"  type="text" />
			</p>
			<p>
				视频导演:<input id="publisher" name="publisher" type="text" />
			</p>
			<p>
				电影图片:<input id="picture" type="text" />
			</p>
			<p >电影描述</p>
			<textarea name="introduction"></textarea>
			<p>
				<input type="submit" value="上传">
			</p>
		</form>
	</div>
	<div class="footer"
		style="height: 122px; position: relative; top: 86px">
		<div class="container">
			<div class="footer-top">
				<div class="footer-top-nav">
				<ul>
					<li><a href="#">关于</a></li>
					<li><a href="#">版权</a></li>
					<li><a href="#">广告</a></li>
					<li><a href="#">开发者</a></li>
				</ul>
			</div>
			<div class="footer-bottom-nav">
				<ul>
					<li><a href="#">Terms</a></li>
					<li><a href="#">Privacy</a></li>
					<li><a href="#">Policy & Safety </a></li>
					<li><a href="#">Try something new!</a></li>
				</ul>
			</div>
			</div>
		</div>
	</div>
</body>
</html>