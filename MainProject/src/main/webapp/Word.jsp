<%@page import="com.VO.T_memberVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<% T_memberVO vo = (T_memberVO)session.getAttribute("vo"); %>
<!DOCTYPE HTML>
<html>
<head>
<title>MBTrIp_MusicList</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="single is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<h1>
				<a href="pageMain/intro.html">MBTrIp</a>
			</h1>
			<nav class="links">
				<ul>
					<li><a href="Awesome.jsp">신나는 너에게</a></li>
					<li><a href="Idea.jsp">생각이 많은 너에게</a></li>
					<li><a href="Korea.jsp">한국을 노래하다</a></li>
					<li><a href="Word.jsp">세계를 듣다</a></li>
				</ul>
			</nav>
			<nav class="main">
				<ul>
					<li class="search"><a class="fa-search" href="#search">Search</a>
						<form id="search" method="get" action="#">
							<input type="text" name="query" placeholder="Search" />
						</form></li>
					<li class="menu"><a class="fa-bars" href="#menu">Menu</a></li>
				</ul>
			</nav>
		</header>
		<!-- Menu -->
		<section id="menu">
			<!-- Search -->
			<section>
				<form class="search" method="get" action="#">
					<input type="text" name="query" placeholder="Search" />
				</form>
			</section>
			<!-- Links -->
			<section>
				<ul class="links">
					<li><a href="Awesome.jsp">
							<h3>신나는 너에게</h3>
							<p>가슴이 더 벅차오르게 도와줄 노래</p>
					</a></li>
				</ul>
				<li><a href="Idea.jsp">
						<h3>생각이 많은 너에게</h3>
						<p>도움을 줄 수 있을 만한 노래</p>
				</a></li>
				</ul>
				<li><a href="Korea.jsp">
						<h3>한국을 노래하다</h3>
						<p>오늘은 너가 가수이자 주인공이야</p>
				</a></li>
				</ul>
				<li><a href="Word.jsp">
						<h3>세계를 듣다</h3>
						<p>가보지는 않아도 기분을 낼 수는 있지</p>
				</a></li>
				</ul>
			</section>
			<!-- Actions -->
			<section>
				<ul class="actions stacked">
					<%if(vo==null){ %>
						<li><a href="loginJoin.jsp" class="button large fit">로그인</a></li>
					<%}else{ %>
						<li><a href="LogOutCon.do" class="button large fit">로그아웃</a></li>
					<%} %>
				</ul>
			</section>
		</section>
		<!-- Main -->
		<div id="main">
			<!-- Post -->
			<article class="post">
				<header>
					<div class="title">
						<h2>
							<a href="Word.jsp">세계를 듣다</a>
						</h2>
						<p>가보지는 않아도 기분을 낼 수는 있지</p>
					</div>
					<div class="meta">
						<time class="published" datetime="datetime">2022. 08. 23.</time>
						<a href="#" class="author"><span class="name">DJ Ahpuh</span> </a>
					</div>
				</header>
				<div align="center" allowTransparency="true">
					<iframe width="52%" height="164" scrolling="no" frameborder="no"
						allow="autoplay" allowTransparency="true"
						src="https://mp3web.com/music/track/581/abcdefu/embed"></iframe>
					<iframe width="52%" height="164" scrolling="no" frameborder="no"
						allow="autoplay" allowTransparency="true"
						src="https://mp3web.com/music/track/5675/sunflower-spider-man-into-the-spider-verse/embed"></iframe>
					<iframe width="52%" height="164" scrolling="no" frameborder="no"
						allow="autoplay" allowTransparency="true"
						src="https://mp3web.com/music/track/1177400/wild-thoughts-feat-rihanna-and-bryson-tiller/embed"></iframe>
					<iframe width="52%" height="164" scrolling="no" frameborder="no"
						allow="autoplay" allowTransparency="true"
						src="https://mp3web.com/music/track/19675/2002/embed"></iframe>
					<iframe width="52%" height="164" scrolling="no" frameborder="no"
						allow="autoplay" allowTransparency="true"
						src="https://mp3web.com/music/track/67004/dont-start-now/embed"></iframe>
				</div>
			</article>
		</div>
		<!-- Footer -->
		<section id="footer">
			<p class="copyright">
				&copy; Untitled. Design: <a href="http://html5up.net">HTML5 UP</a>.
				Images: <a href="http://unsplash.com">Unsplash</a>.
			</p>
		</section>
	</div>
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>