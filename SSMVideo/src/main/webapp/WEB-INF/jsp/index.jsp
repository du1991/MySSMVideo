<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' media="all" />
<link href="css/dashboard.css" rel="stylesheet">
<link href="css/style.css" rel='stylesheet' type='text/css' media="all" />
<script src="js/jquery-1.11.1.min.js"></script>
</head>

<body>
	<%@ include file="/WEB-INF/jsp/includes/headinclude.jsp"%>
	<%@ include file="/WEB-INF/jsp/includes/leftinlcude.jsp"%>
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<div class="main-grids">
			<div class="top-grids">
				<div class="recommended-info">
					<h3>热门</h3>
				</div>
				<c:forEach items="${movies['hot']}" var="ss">
					<div class="col-md-4 resent-grid recommended-grid slider-top-grids">
						<div class="resent-grid-img recommended-grid-img">
							<a href="/single?id=${ss.id }&moviename=${ss.moviename}&movieurl=${ss.movieurl}&
								runningtime=${ss.runningtime }&introduction=${ss.introduction}&publisher=${ss.publisher}
								&movietypehead=${ss.movietypehead}&movietypedetail=${ss.movietypedetail}
								&publishtime=${ss.publishtime}">
								<img src="${ss.moviepicture }" /></a>
							<div class="time">
								<p>${ss.runningtime }</p>
							</div>
							<div class="clck">
								<span class="glyphicon glyphicon-time" aria-hidden="true"></span>
							</div>
						</div>
						<div class="resent-grid-info recommended-grid-info">
							<h3>
								<a class="title title-info">${ss.moviename}:${ss.introduction }</a>
							</h3>
							<ul>
								<li><p class="author author-info">
										<a href="#" class="author">${ss.publisher }</a>
									</p></li>
								<li class="right-list"><p class="views views-info">0次数</p></li>
							</ul>
						</div>
					</div>
				</c:forEach>
				<div class="clearfix"></div>
			</div>
			<div class="recommended">
				<div class="recommended-grids">
					<div class="recommended-info">
						<h3>喜剧</h3>
					</div>
					<!-- 轮博图 -->
					<script src="js/responsiveslides.min.js"></script>
					<script>
						// 也可以换成 "$(window).load(function() {"
						$(function() {
							$("#slider3")
									.responsiveSlides(
											{
												auto : true,
												pager : false,
												nav : true,
												speed : 500,
												namespace : "callbacks",
												before : function() {
													$('.events')
															.append(
																	"<li>before event fired.</li>");
												},
												after : function() {
													$('.events')
															.append(
																	"<li>after event fired.</li>");
												}
											});

						});
					</script>
					<div id="top" class="callbacks_container">
						<ul class="rslides" id="slider3">
							<li>
								<div class="animated-grids">
									<c:forEach items="${movies['comedy1']}" var="ss">
										<div
											class="col-md-3 resent-grid recommended-grid slider-first">
											<div class="resent-grid-img recommended-grid-img">
												<a
													href="/single?id=${ss.id }&moviename=${ss.moviename}&movieurl=${ss.movieurl}&
													runningtime=${ss.runningtime }&introduction=${ss.introduction}
													&publisher=${ss.publisher}&movietypehead=${ss.movietypehead}&movietypedetail=
													${ss.movietypedetail}&publishtime=${ss.publishtime}">
													<img src="${ss.moviepicture }" /></a>
												<div class="time small-time slider-time">
													<p>${ss.getRunningtime() }</p>
												</div>
												<div class="clck small-clck">
													<span class="glyphicon glyphicon-time" aria-hidden="true"></span>
												</div>
											</div>
											<div class="resent-grid-info recommended-grid-info">
												<h5>
													<a class="title">${ss.getMoviename()}:${ss.getIntroduction() }</a>
												</h5>
												<div class="slid-bottom-grids">
													<div class="slid-bottom-grid">
														<p class="author author-info">
															<a href="#" class="author">${ss.getPublisher() }</a>
														</p>
													</div>
													<div class="slid-bottom-grid slid-bottom-right">
														<p class="views views-info">2,114,200 views</p>
													</div>
													<div class="clearfix"></div>
												</div>
											</div>
										</div>
									</c:forEach>
									<div class="clearfix"></div>
								</div>
							</li>
							<li>
								<div class="animated-grids">
									<c:forEach items="${movies['comedy2'] }" var="ss">
										<div
											class="col-md-3 resent-grid recommended-grid slider-first">
											<div class="resent-grid-img recommended-grid-img">
												<a
													href="/single?id=${ss.id }&moviename=${ss.moviename}&movieurl=${ss.movieurl}&
													runningtime=${ss.runningtime }&introduction=${ss.introduction}&publisher=${ss.publisher}
													&movietypehead=${ss.movietypehead}&movietypedetail=${ss.movietypedetail}
													&publishtime=${ss.publishtime}">
													<img src="${ss.moviepicture }" /></a>
												<div class="time small-time slider-time">
													<p>${ss.runningtime }</p>
												</div>
												<div class="clck small-clck">
													<span class="glyphicon glyphicon-time" aria-hidden="true"></span>
												</div>
											</div>
											<div class="resent-grid-info recommended-grid-info">
												<h5>
													<a class="title">${ss.moviename}:${ss.introduction }</a>
												</h5>
												<div class="slid-bottom-grids">
													<div class="slid-bottom-grid">
														<p class="author author-info">
															<a href="#" class="author">${ss.publisher }</a>
														</p>
													</div>
													<div class="slid-bottom-grid slid-bottom-right">
														<p class="views views-info">2,114,200 views</p>
													</div>
													<div class="clearfix"></div>
												</div>
											</div>
										</div>
									</c:forEach>
									<div class="clearfix"></div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="recommended">
				<div class="recommended-grids">
					<div class="recommended-info">
						<h3>科幻</h3>
					</div>
					<c:forEach items="${movies['science1'] }" var="ss">
						<div class="col-md-3 resent-grid recommended-grid">
							<div class="resent-grid-img recommended-grid-img">
								<a
									href="/single?id=${ss.id }&moviename=${ss.moviename}&movieurl=${ss.movieurl}&
									runningtime=${ss.runningtime }&introduction=${ss.introduction}&publisher=${ss.publisher}&movietypehead=${ss.movietypehead}&movietypedetail=${ss.movietypedetail}
									&publishtime=${ss.publishtime}">
									<img src="${ss.moviepicture }" /></a>
								<div class="time small-time">
									<p>${ss.runningtime }</p>
								</div>
								<div class="clck small-clck">
									<span class="glyphicon glyphicon-time" aria-hidden="true"></span>
								</div>
							</div>
							<div
								class="resent-grid-info recommended-grid-info video-info-grid">
								<h5>
									<a class="title">${ss.moviename}:${ss.introduction }</a>
								</h5>
								<ul>
									<li><p class="author author-info">
											<a href="#" class="author">${ss.publisher }</a>
										</p></li>
									<li class="right-list"><p class="views views-info">2,114,200
											views</p></li>
								</ul>
							</div>
						</div>
					</c:forEach>
					<div class="clearfix"></div>
				</div>
				<div class="recommended-grids">
					<c:forEach items="${movies['science2'] }" var="ss">
						<div class="col-md-3 resent-grid recommended-grid">
							<div class="resent-grid-img recommended-grid-img">
								<a
									href="/single?id=${ss.id }&moviename=${ss.moviename}&movieurl=${ss.movieurl}&
									runningtime=${ss.runningtime }&introduction=${ss.introduction}&publisher=${ss.publisher}
									&movietypehead=${ss.movietypehead}&movietypedetail=${ss.movietypedetail}
									&publishtime=${ss.publishtime}"><img
									src="${ss.moviepicture }" /></a>
								<div class="time small-time">
									<p>${ss.runningtime }</p>
								</div>
								<div class="clck small-clck">
									<span class="glyphicon glyphicon-time" aria-hidden="true"></span>
								</div>
							</div>
							<div
								class="resent-grid-info recommended-grid-info video-info-grid">
								<h5>
									<a class="title">${ss.moviename}:${ss.introduction }</a>
								</h5>
								<ul>
									<li><p class="author author-info">
											<a href="#" class="author">${ss.publisher }</a>
										</p></li>
									<li class="right-list"><p class="views views-info">2,114,200
											views</p></li>
								</ul>
							</div>
						</div>
					</c:forEach>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="recommended">
				<div class="recommended-grids">
					<div class="recommended-info">
						<h3>体育</h3>
					</div>
					<c:forEach items="${movies['sport1'] }" var="ss">
						<div class="col-md-3 resent-grid recommended-grid">
							<div class="resent-grid-img recommended-grid-img">
								<a
									href="/single?id=${ss.id }&moviename=${ss.moviename}&movieurl=${ss.movieurl}&
									runningtime=${ss.runningtime }&introduction=${ss.introduction}&publisher=${ss.publisher}
									&movietypehead=${ss.movietypehead}&movietypedetail=${ss.movietypedetail}&publishtime=${ss.publishtime}">
									<img src="${ss.moviepicture }" /></a>
								<div class="time small-time">
									<p>${ss.runningtime }</p>
								</div>
								<div class="clck small-clck">
									<span class="glyphicon glyphicon-time" aria-hidden="true"></span>
								</div>
							</div>
							<div
								class="resent-grid-info recommended-grid-info video-info-grid">
								<h5>
									<a class="title">${ss.moviename}:${ss.introduction }</a>
								</h5>
								<ul>
									<li><p class="author author-info">
											<a href="#" class="author">${ss.publisher }</a>
										</p></li>
									<li class="right-list"><p class="views views-info">2,114,200
											views</p></li>
								</ul>
							</div>
						</div>
					</c:forEach>
					<div class="clearfix"></div>
				</div>
				<div class="recommended-grids">
					<c:forEach items="${movies['sport2'] }" var="ss">
						<div class="col-md-3 resent-grid recommended-grid">
							<div class="resent-grid-img recommended-grid-img">
								<a
									href="/single?id=${ss.id }&moviename=${ss.moviename}&movieurl=${ss.movieurl}&
									runningtime=${ss.runningtime }&introduction=${ss.introduction}&publisher=${ss.publisher}
									&movietypehead=${ss.movietypehead}&movietypedetail=${ss.movietypedetail}
									&publishtime=${ss.publishtime}"><img
									src="${ss.moviepicture }" /></a>
								<div class="time small-time">
									<p>${ss.runningtime }</p>
								</div>
								<div class="clck small-clck">
									<span class="glyphicon glyphicon-time" aria-hidden="true"></span>
								</div>
							</div>
							<div
								class="resent-grid-info recommended-grid-info video-info-grid">
								<h5>
									<a class="title">${ss.id},${ss.moviename}:${ss.introduction }</a>
								</h5>
								<ul>
									<li><p class="author author-info">
											<a href="#" class="author">${ss.publisher }</a>
										</p></li>
									<li class="right-list"><p class="views views-info">2,114,200
											views</p></li>
								</ul>
							</div>
						</div>
					</c:forEach>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/jsp/includes/bottominclude.jsp"%>
	</div>
</body>
</html>