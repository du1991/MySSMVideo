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
<script src="/js/ZoomPic.js"></script>

<style>
#focus_Box{position:relative;width:710px;height:200px;margin:150px auto;margin-top: 60px}
#focus_Box ul{position:relative;width:100px;height:200px}
#focus_Box li img{width:100%;background:url(images/loading.gif) no-repeat center 50%;height:100%;vertical-align:top}
#focus_Box li{z-index:0;position:absolute; width:0px;height:0px;top:146px;cursor:pointer;left:377px;border-radius:4px;}
#focus_Box li p span{display:inline-block;width:20%;height:40px;overflow:hidden;}
#focus_Box .prev,#focus_Box .next{display:block;z-index:100;overflow:hidden;cursor:pointer;position:absolute;width:52px;height:52px;top:131px;}
#focus_Box .prev{background:url(/images/lunbo.png) left bottom no-repeat;left:10px}
#focus_Box .next{background:url(/images/lunbo.png) right bottom no-repeat;right:0px} 
</style>

</head>

<body>
	<%@ include file="/WEB-INF/jsp/includes/headinclude.jsp"%>
	<%@ include file="/WEB-INF/jsp/includes/leftinlcude.jsp"%>
	
	
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<div class="main-grids">
			
			<div id="focus_Box">
							<span class="prev" >&nbsp;</span>
							<span class="next" >&nbsp;</span>    
			             <c:forEach items="${movies['hot']}" var="ss">
			            <ul>
		                    <li>
						               <a href="/single?id=${ss.id }&moviename=${ss.moviename}&movieurl=${ss.movieurl}&
										runningtime=${ss.runningtime }&introduction=${ss.introduction}&publisher=${ss.publisher}
										&movietypehead=${ss.movietypehead}&movietypedetail=${ss.movietypedetail}
										&publishtime=${ss.publishtime}">
										<img src="${ss.moviepicture }" /></a>
							</li>
						   </ul>
						    </c:forEach>
						      
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