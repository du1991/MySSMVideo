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
			<c:forEach items="${map['mappingMovies'] }" var="ss">
				<div style="width: 20%; height: 100%; padding: 10px; float: left">
					<div style="width: 90%;">
						<div class="resent-grid-img recommended-grid-img">
							<a
								href="/single?id=${ss.id }&moviename=${ss.moviename}&movieurl=${ss.movieurl}&
								runningtime=${ss.runningtime }&introduction=${ss.introduction}&publisher=${ss.publisher}&movietypehead=${ss.movietypehead}&movietypedetail=${ss.movietypedetail}
								&publishtime=${ss.publishtime}">
								<img src="${ss.moviepicture }" alt="" style="width: 100%" />
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
			<script type="text/javascript">
				function skip() {
					var a;
					a = parseInt($("#pagein").val());
					if ($("#pagein").val() == "") {
						a = 1;
					}
					$("#pageskip")
							.attr(
									"href",
									"/showmovie?page="
											+ a
											+ "&movietypedetail=${map['movietypedetail']}&movietypehead=${map['movietypehead']}");
				}
			</script>
			<div
				style="width: 40%; height: 300px; text-align: center; margin-left: 50%">
				<c:if test="${fn:length(map['mappingMovies'])>6 }">
					<span>共<input style="width: 30px" type="text"
						value="${map['pages'] } 页"><input style="width: 40px"
						type="text" value="${map['count'] } 条"></span>&nbsp;&nbsp;&nbsp;&nbsp;
								<span><a
						href="/shownews?page=${map['nowPage']-1 }&movietypedetail=${map['movietypedetail']}
								&movietypehead=${map['movietypehead']}"><button>上一页</button></a></span>
								${map['bar'] }
								<span><a
						href="/shownews?page=${map['nowPage']+1 }&movietypedetail=${map['movietypedetail']}&movietypehead=${map['movietypehead']}"><button>下一页</button></a></span>
								&nbsp;&nbsp;&nbsp;&nbsp;<span><input id="pagein"
						type="text" style="width: 40px"><a id="pageskip"><button
								onclick="skip()">GO</button></a></span>
				</c:if>
			</div>
			<c:if test="${fn:length(map['mappingMovies'])<6 }">
				<div
					style="width: 40%; height: 300px; text-align: center; margin-left: 50%">
					<span>共<input style="width: 30px" type="text"
						value="${map['pages'] } 页"><input style="width: 40px"
						type="text" value="${map['count'] } 条"></span>&nbsp;&nbsp;&nbsp;&nbsp;
					<span><a
						href="/shownews?page=${map['nowPage']-1 }&movietypedetail=${map['movietypedetail']}&movietypehead=${map['movietypehead']}"><button>上一页</button></a></span>
					${map['bar'] } <span><a
						href="/shownews?page=${map['nowPage']+1 }&movietypedetail=${map['movietypedetail']}&movietypehead=${map['movietypehead']}"><button>下一页</button></a></span>
					&nbsp;&nbsp;&nbsp;&nbsp;<span><input id="pagein" type="text"
						style="width: 40px"><a id="pageskip"><button
								onclick="skip()">GO</button></a></span>
				</div>
			</c:if>
			<div class="clearfix"></div>
		</div>
		<%@ include file="/WEB-INF/jsp/includes/bottominclude.jsp"%>
	</div>
</body>
</html>