<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html style="height: 100%">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.2.1.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="css/register.css" />
<link href="css/style.css" rel='stylesheet' type='text/css' media="all" />
<script src="js/jquery-3.2.1.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	var time = 10;
	function returnUrlByTime() {
		window.setTimeout('returnUrlByTime()', 1000);
		time = time - 1;
		document.getElementById("layer").innerHTML = time;
	}
</script>
</head>
<body onload="returnUrlByTime()" style="height: 100%">
	<header>
		<a class="navbar-brand" href="home">
			<h1>
				<img src="images/logo.png" alt="" />
			</h1>
		</a>
		<div class="desc">
			<a href="/home"><span>.......注册成功！请点击跳转,<span id="layer">
						<%
							response.setHeader("Refresh", "9;URL=home");
						%>
				</span>秒之后将自动跳转主页......
			</span></a>
		</div>
	</header>
	<div
		style="background: url(/images/transfer.jpg); height: calc(100% - 110px)">
	</div>
</body>
</html>