<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css'
	media="all" />
<link href="css/dashboard.css" rel="stylesheet">
<link href="css/style.css" rel='stylesheet' type='text/css' media="all" />
<link href="css/popuo-box.css" rel="stylesheet" type="text/css"
	media="all" />
<script src="js/jquery-1.11.1.min.js"></script>
</head>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="/home"><h1>
					<img src="images/logo.png" alt="" />
				</h1></a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<div class="top-search">
				<form class="navbar-form navbar-right" action="search">
					<input type="text" class="form-control" name="moviename"> <input
						type="submit" value=" ">
				</form>
			</div>
			<div class="header-top-right">
				<div class="file">
					<c:if test="${!empty sessionScope}">
						<span id="welcome">欢迎：${sessionScope.sessionuser.username}</span>
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
						<a href="regist1" id="register">注册</a>
					</c:if>
					<c:if test="${!empty sessionScope}">
						<a id="loginout" href="logout">退出</a>
					</c:if>
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
							var a = $("#id").val();
							var b = $("#moviename").val();
							var c = $("#movieurl").val();
							var d = $("#runningtime").val();
							var e = $("#introduction").val();
							var f = $("#publisher").val();
							var g = $("#movietypehead").val();
							var h = $("#movietypedetail").val();
							var i = $("#publishtime").val();
							$.ajax({
								url : "/login",
								dataType : "json",
								data : {
									"username" : $("#username").val(),
									"password" : $("#password").val(),
								},
								success : function(result) {
									if (result.tr) {
										window.location = "/single?id=" + a
												+ "&moviename=" + b
												+ "&movieurl=" + c
												+ "&runningtime=" + d
												+ "&introduction=" + e
												+ "&publisher=" + f
												+ "&movietypehead=" + g
												+ "&movietypedetail=" + h
												+ "&publishtime=" + i
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
	<%@ include file="/WEB-INF/jsp/includes/leftinlcude.jsp"%>
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<div class="show-top-grids">
			<div class="col-sm-8 single-left">
				<div class="song" style="width: 100%">
					<div class="song-info">
						<input style="display: none" id="id"
							value="${mv['singlemovie'].id }" /> <input style="display: none"
							id="moviename" value="${mv['singlemovie'].moviename }" /> <input
							style="display: none" id="movieurl"
							value="${mv['singlemovie'].movieurl }" /> <input
							style="display: none" id="runningtime"
							value="${mv['singlemovie'].runningtime }" /> <input
							style="display: none" id="introduction"
							value="${mv['singlemovie'].introduction }" /> <input
							style="display: none" id="publisher"
							value="${mv['singlemovie'].publisher }" /> <input
							style="display: none" id="movietypehead"
							value="${mv['singlemovie'].movietypehead }" /> <input
							style="display: none" id="movietypedetail"
							value="${mv['singlemovie'].movietypedetail }" /> <input
							style="display: none" id="publishtime"
							value="${mv['singlemovie'].publishtime }" />
						<h3>${mv['singlemovie'].moviename }</h3>
					</div>
					<div class="video-grid">
						<video width="100%" height="100%" controls> <source
							src="${mv['singlemovie'].movieurl }" type="video/mp4"></video>
					</div>
				</div>
				<div class="clearfix"></div>
				<div class="published">
					<div class="load_more">
						<ul id="myList">
							<li>
								<h4>发布于：${mv['singlemovie'].publishtime }</h4>
								<p>简 介：${mv['singlemovie'].introduction }</p>
							</li>
						</ul>
					</div>
				</div>
				<script type="text/javascript">
					function show1() {
						$.ajax({
									url : "ContentController",
									dataType : "json",
									data : {
										"content" : $("#p1").val(),
										"moviename" : $("#p2").val(),
										"movieid" : $("#p3").val(),
									},
									success : function(result) {

										$("#newcontent1").html(
												result.username + ":"
														+ result.content);
										$("#newcontent2").html(
												result.contenttime);

										$("#divshow").show();
									},
									error : function() {
										alert("error");
									}
								});
					}

					function show2() {
						alert("请先登录！");
					}
				</script>
				<div class="all-comments">
					<div class="all-comments-info">
						<div class="box">
							<textarea placeholder="Message" name="content" id="p1"></textarea>
							<input type="text" value="${mv['singlemovie'].moviename }"
								name="moviename" style="display: none" id="p2" /> <input
								type="text" value="${mv['singlemovie'].id }" name="movieid"
								style="display: none" id="p3" />
						<c:if test="${!empty sessionScope}">
								<input type="submit" onclick="show1()" value="提交">
							</c:if>
							<c:if test="${empty sessionScope}">
								<input type="submit" onclick="show2()" value="提k交">
							</c:if>
						<div class="clearfix"></div>
						</div>
						<div style="width: 100%;">
							<div style="border: solid; height: 60px; display: none;"
								id="divshow">
								<p id="ssssss"></p>
								<p id="newcontent1"></p>
								<p style="text-align: right" id="newcontent2"></p>
							</div>
							<c:forEach items="${mv['contents'] }" var="ss">
								<div style="border: solid">
									<p>
										<br />${ss.username}: ${ss.content}
									</p>
									<p style="text-align: right">${ss.contenttime}</p>
								</div>
							</c:forEach>
						</div>
						<div class="all-comments-buttons">
							<ul>
								<li><a href="#" class="top">返回顶部</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4 single-right">
				<h3>其他相关</h3>
				<c:if test="${empty mv['isuploadornot'] }">
					<c:forEach items="${mv['rightmovies'] }" var="ss">
						<div class="single-grid-right">
							<div class="single-right-grids">
								<div class="col-md-4 single-right-grid-left">
									<a
										href="/single?id=${ss.id }&moviename=${ss.moviename}&movieurl=${ss.movieurl}&
										runningtime=${ss.runningtime }&introduction=${ss.introduction}&publisher=${ss.publisher}&movietypehead=${ss.movietypehead}&movietypedetail=${ss.movietypedetail}"
										alt="等待加载..."><img src="${ss.moviepicture }" /></a>
								</div>
								<div class="col-md-8 single-right-grid-right">
									<a class="title"
										href="/single?id=${ss.id }&moviename=${ss.moviename}&movieurl=${ss.movieurl}&
										runningtime=${ss.runningtime }&introduction=${ss.introduction}&publisher=${ss.publisher}&movietypehead=${ss.movietypehead}&movietypedetail=${ss.movietypedetail}"
										alt="等待加载...">${ss.moviename }</a>
									<p class="author">
										<a href="#" class="author">${ss.publisher }</a>
									</p>
									<p class="views">2,114,200 views</p>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${!empty mv['isuploadornot'] }">
					<c:forEach items="${mv['uploadmovies'] }" var="ss">
						<div class="single-grid-right">
							<div class="single-right-grids">
								<div class="col-md-4 single-right-grid-left">
									<a
										href="/single?id=${ss.id }&moviename=${ss.moviename}&movieurl=${ss.movieurl}&
										runningtime=${ss.runningtime }&introduction=${ss.introduction}&publisher=${ss.publisher}&movietypehead=${ss.movietypehead}&movietypedetail=${ss.movietypedetail}
										&upload=1"
										alt="等待加载..."><img src="${ss.moviepicture }" /></a>
								</div>
								<div class="col-md-8 single-right-grid-right">
									<a class="title"
										href="/single?id=${ss.id }&moviename=${ss.moviename}&movieurl=${ss.movieurl}&
										runningtime=${ss.runningtime }&introduction=${ss.introduction}&publisher=${ss.publisher}&movietypehead=${ss.movietypehead}&movietypedetail=${ss.movietypedetail}
										&upload=1"
										alt="等待加载...">${ss.moviename }</a>
									<p class="author">
										<a href="#" class="author">${ss.publisher }</a>
									</p>
									<p class="views">2,114,200 views</p>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
			<div class="clearfix"></div>
		</div>
		<%@ include file="/WEB-INF/jsp/includes/bottominclude.jsp"%>	
	</div>
</body>
</html>