<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!--注解总数：		二 		-->	
<div class="col-sm-3 col-md-2 sidebar">
	<div class="drop-navigation drop-navigation">
		<ul class="nav nav-sidebar">
			<li class="active">
				<a href="/home" class="home-icon"> 
					<span class="glyphicon glyphicon-home" aria-hidden="true"></span>主页<!--一：span表示左侧图标-->
				</a>
			</li>
			<li>
				<a href="/showTV?page=1&movietypedetail=TV&movietypehead=TV" class="user-icon">
					<span class="glyphicon glyphicon-home glyphicon-blackboard" aria-hidden="true"></span> TV 
				</a>
			</li>
			<li>
				<a href="#" class="menu1">
					<span class="glyphicon glyphicon-film" aria-hidden="true"></span>电影
					<span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span>
				</a>
			</li>
			<!--二：下拉方法-->
			<script>
				$("li a.menu1").click(function() {
					$("ul.cl-effect-2").slideToggle(300, function() {
					});
				});
			</script>
			<ul class="cl-effect-2">
				<li><a
					href="/showmovie?page=1&movietypedetail=comedy&movietypehead=movie">喜剧</a></li>
				<li><a
					href="/showmovie?page=1&movietypedetail=science&movietypehead=movie">科幻</a></li>
				<li><a
					href="/showmovie?page=1&movietypedetail=action&movietypehead=movie">动作</a></li>
				<li><a
					href="/showmovie?page=1&movietypedetail=horrible&movietypehead=movie">恐怖</a></li>
			</ul>
			<li><a href="#" class="menu">
				<span class="glyphicon glyphicon-film glyphicon-king" aria-hidden="true"></span>体育
				<span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span>
			</a></li>
			<ul class="cl-effect-1">
				<li><a
					href="/showsport?page=1&movietypedetail=football&movietypehead=sport">足球</a></li>
				<li><a
					href="/showsport?page=1&movietypedetail=basketball&movietypehead=sport">篮球</a></li>
				<li><a
					href="/showsport?page=1&movietypedetail=badminton&movietypehead=sport">羽毛球</a></li>
				<li><a
					href="/showsport?page=1&movietypedetail=pingpong&movietypehead=sport">乒乓球</a></li>
			</ul>
			
			<script>
				$("li a.menu").click(function() {
					$("ul.cl-effect-1").slideToggle(300, function() {
					});
				});
			</script>
			<li><a href="/showMV?page=1&movietypedetail=MV&movietypehead=MV" class="song-icon">
				<span class="glyphicon glyphicon-music" aria-hidden="true"></span>MV
			</a></li>
			<li><a href="/shownews?page=1&movietypedetail=news&movietypehead=news" class="news-icon">
				<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>新闻
				</a></li>
		</ul>
		<div class="side-bottom">
			<div class="copyright">
				<p>Copyright &copy; 2017.Company name All rights reserved.</p>
			</div>
		</div>
	</div>
</div>