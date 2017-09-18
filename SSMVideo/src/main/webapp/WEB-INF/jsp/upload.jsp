<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html style="height: 100%">
<head>
<title>Upload</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="My Play Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!-- bootstrap -->
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css'
	media="all" />
<!-- //bootstrap -->
<link href="css/dashboard.css" rel="stylesheet">
<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' media="all" />
<script src="js/jquery-1.11.1.min.js"></script>
<!--start-smoth-scrolling-->
</head>
<body style="height: 100%; padding: 0">

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
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
						<script type="text/javascript" src="js/modernizr.custom.min.js"></script>
						<link href="css/popuo-box.css" rel="stylesheet" type="text/css"
							media="all" />
						<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
						<div id="small-dialog2" class="mfp-hide">
							<h3>Create Account</h3>
							<div class="social-sits">
								<div class="facebook-button">
									<a href="#">Connect with Facebook</a>
								</div>
								<div class="chrome-button">
									<a href="#">Connect with Google</a>
								</div>
								<div class="button-bottom">
									<p>
										Already have an account? <a href="#small-dialog"
											class="play-icon popup-with-zoom-anim">Login</a>
									</p>
								</div>
							</div>
							<div class="signup">
								<form>
									<input type="text" class="email" placeholder="Mobile Number"
										maxlength="10" pattern="[1-9]{1}\d{9}"
										title="Enter a valid mobile number" />
								</form>
								<div class="continue-button">
									<a href="#small-dialog3"
										class="hvr-shutter-out-horizontal play-icon popup-with-zoom-anim">CONTINUE</a>
								</div>
							</div>
							<div class="clearfix"></div>
						</div>
						<div id="small-dialog3" class="mfp-hide">
							<h3>Create Account</h3>
							<div class="social-sits">
								<div class="facebook-button">
									<a href="#">Connect with Facebook</a>
								</div>
								<div class="chrome-button">
									<a href="#">Connect with Google</a>
								</div>
								<div class="button-bottom">
									<p>
										Already have an account? <a href="#small-dialog"
											class="play-icon popup-with-zoom-anim">Login</a>
									</p>
								</div>
							</div>
							<div class="signup">
								<form>
									<input type="text" class="email" placeholder="Email"
										required="required"
										pattern="([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?"
										title="Enter a valid email" /> <input type="password"
										placeholder="Password" required="required" pattern=".{6,}"
										title="Minimum 6 characters required" autocomplete="off" /> <input
										type="text" class="email" placeholder="Mobile Number"
										maxlength="10" pattern="[1-9]{1}\d{9}"
										title="Enter a valid mobile number" /> <input type="submit"
										value="Sign Up" />
								</form>
							</div>
							<div class="clearfix"></div>
						</div>
						<div id="small-dialog7" class="mfp-hide">
							<h3>Create Account</h3>
							<div class="social-sits">
								<div class="facebook-button">
									<a href="#">Connect with Facebook</a>
								</div>
								<div class="chrome-button">
									<a href="#">Connect with Google</a>
								</div>
								<div class="button-bottom">
									<p>
										Already have an account? <a href="#small-dialog"
											class="play-icon popup-with-zoom-anim">Login</a>
									</p>
								</div>
							</div>
							<div class="signup">
								<form action="upload.html">
									<input type="text" class="email" placeholder="Email"
										required="required"
										pattern="([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?"
										title="Enter a valid email" /> <input type="password"
										placeholder="Password" required="required" pattern=".{6,}"
										title="Minimum 6 characters required" autocomplete="off" /> <input
										type="submit" value="Sign In" />
								</form>
							</div>
							<div class="clearfix"></div>
						</div>
						<div id="small-dialog4" class="mfp-hide">
							<h3>Feedback</h3>
							<div class="feedback-grids">
								<div class="feedback-grid">
									<p>Suspendisse tristique magna ut urna pellentesque, ut
										egestas velit faucibus. Nullam mattis lectus ullamcorper dui
										dignissim, sit amet egestas orci ullamcorper.</p>
								</div>
								<div class="button-bottom">
									<p>
										<a href="#small-dialog" class="play-icon popup-with-zoom-anim">Sign
											in</a> to get started.
									</p>
								</div>
							</div>
						</div>
						<div id="small-dialog5" class="mfp-hide">
							<h3>Help</h3>
							<div class="help-grid">
								<p>Suspendisse tristique magna ut urna pellentesque, ut
									egestas velit faucibus. Nullam mattis lectus ullamcorper dui
									dignissim, sit amet egestas orci ullamcorper.</p>
							</div>
							<div class="help-grids">
								<div class="help-button-bottom">
									<p>
										<a href="#small-dialog4"
											class="play-icon popup-with-zoom-anim">Feedback</a>
									</p>
								</div>
								<div class="help-button-bottom">
									<p>
										<a href="#small-dialog6"
											class="play-icon popup-with-zoom-anim">Lorem ipsum dolor
											sit amet</a>
									</p>
								</div>
								<div class="help-button-bottom">
									<p>
										<a href="#small-dialog6"
											class="play-icon popup-with-zoom-anim">Nunc vitae rutrum
											enim</a>
									</p>
								</div>
								<div class="help-button-bottom">
									<p>
										<a href="#small-dialog6"
											class="play-icon popup-with-zoom-anim">Mauris at volutpat
											leo</a>
									</p>
								</div>
								<div class="help-button-bottom">
									<p>
										<a href="#small-dialog6"
											class="play-icon popup-with-zoom-anim">Mauris vehicula
											rutrum velit</a>
									</p>
								</div>
								<div class="help-button-bottom">
									<p>
										<a href="#small-dialog6"
											class="play-icon popup-with-zoom-anim">Aliquam eget ante
											non orci fac</a>
									</p>
								</div>
							</div>
						</div>
						<div id="small-dialog6" class="mfp-hide">
							<div class="video-information-text">
								<h4>Video information & settings</h4>
								<p>Suspendisse tristique magna ut urna pellentesque, ut
									egestas velit faucibus. Nullam mattis lectus ullamcorper dui
									dignissim, sit amet egestas orci ullamcorper.</p>
								<ol>
									<li>Nunc vitae rutrum enim. Mauris at volutpat leo.
										Vivamus dapibus mi ut elit fermentum tincidunt.</li>
									<li>Nunc vitae rutrum enim. Mauris at volutpat leo.
										Vivamus dapibus mi ut elit fermentum tincidunt.</li>
									<li>Nunc vitae rutrum enim. Mauris at volutpat leo.
										Vivamus dapibus mi ut elit fermentum tincidunt.</li>
									<li>Nunc vitae rutrum enim. Mauris at volutpat leo.
										Vivamus dapibus mi ut elit fermentum tincidunt.</li>
									<li>Nunc vitae rutrum enim. Mauris at volutpat leo.
										Vivamus dapibus mi ut elit fermentum tincidunt.</li>
								</ol>
							</div>
						</div>
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
								<input type="text" class="email" id="username"
									placeholder="Enter email / mobile" required="required"
									pattern="([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?" name="username" />
								<input type="password" placeholder="Password"
									required="required" id="password" pattern=".{6,}"
									title="Minimum 6 characters required" autocomplete="off"
									name="password" /> <input type="button" value="登录"
									onclick="login()" id="login" />

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

			$("#moviename").val(text);
		}
	</script>
	
	<div style="padding-top: 50px; padding-left: 200px; height: calc(100% - 208px); position: relative; top: 86px; text-align: left; font-size: 22px; background: url(/images/sss.jpg) no-repeat 60% 30%; background-size: cover">
		<form action="uploadfile" method="post" enctype="multipart/form-data">
			<input type="file" name="file" onchange="handleFile()" id="fileload">
			
			<p>
				视频时长:<input id="runningtime" name="runningtime"  type="text" />
			</p>
			<p>
				视频导演:<input id="publisher" name="publisher" type="text" />
			</p>
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
						<li><a href="about.html">About</a></li>
						<li><a href="press.html">Press</a></li>
						<li><a href="copyright.html">Copyright</a></li>
						<li><a href="creators.html">Creators</a></li>
						<li><a href="#">Advertise</a></li>
						<li><a href="developers.html">Developers</a></li>
					</ul>
				</div>
				<div class="footer-bottom-nav">
					<ul>
						<li><a href="about.html">关于</a></li>
						<li><a href="copyright.html">版权</a></li>
						<li><a href="#">广告</a></li>
						<li><a href="developers.html">开发者</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>