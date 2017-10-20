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
<script src="js/jquery-1.11.1.min.js"></script>
</head>

<body>
	<%@ include file="/WEB-INF/jsp/includes/headinclude.jsp"%>
	<%@ include file="/WEB-INF/jsp/includes/leftinlcude.jsp"%>
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<div class="show-top-grids" style="width: 100%; height: 100%;">
			<c:forEach items="${contnt }" var="ss">
				<div style="width: 20%; height: 100%; padding: 10px; float: left">
					<div style="width: 90%;">
						<div class="resent-grid-img recommended-grid-img">
							<a
								href="/single?id=${ss.id }&moviename=${ss.moviename}&movieurl=${ss.movieurl}&
								runningtime=${ss.runningtime }&introduction=${ss.introduction}&publisher=${ss.publisher}&movietypehead=${ss.movietypehead}&movietypedetail=${ss.movietypedetail}
								&publishtime=${ss.publishtime}">
								<img src="${ss.moviepicture }" height="200" width="200" />
							</a>
							<div class="time small-time show-time">
								<p>${ss.runningtime }</p>
							</div>
							<div class="clck show-clock">
								<span class="glyphicon glyphicon-time" aria-hidden="true"></span>
							</div>
						</div>
						<div class="resent-grid-info recommended-grid-info">
							<h5>
								<a class="title">${ss.moviename }:${ss.introduction }</a>
							</h5>
							<p class="author">
								<a href="#" class="author">${ss.publisher }</a>
							</p>
							<p class="views">1,200 views</p>
						</div>
					</div>
				</div>
			</c:forEach>
			<div class="clearfix"></div>
			<div
				style="width: 40%; height: 300px; text-align: center; margin-left: 50%">
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</body>
</html>