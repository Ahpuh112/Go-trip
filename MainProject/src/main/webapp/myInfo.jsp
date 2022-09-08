<%@page import="com.VO.T_memberVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<% T_memberVO vo = (T_memberVO)session.getAttribute("vo"); %>
<html>

<head>
	<title>MBTrIp - 내 정보/수정</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	<link rel ="stylesheet" href="assets/css/myInfo.css"/>
</head>

<body class="single is-preload">
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<h1 style="text-transform: none;"><a href="pageMain/intro.html">MBTrIp</a></h1>
			<nav class="links">
				<ul>
					<li><a href="tripInfo.jsp">여행 정보</a></li>
					<li><a href="blogPreview.jsp">너와 나, 우리의 이야기</a></li>
					<li><a href="Awesome.jsp">여행 플레이리스트</a></li>
					<li><a href="mbtiTest.jsp">MBTI 테스트</a></li>
					<li><a href="pageMain/intro.html#three">우리와 함께해요!</a></li>
				</ul>
			</nav>
			<nav class="main">
				<ul>
					<li class="search">
						<a class="fa-search" href="#search">Search</a>
						<form id="search" method="get" action="#">
							<input type="text" name="query" placeholder="무엇을 찾으시나요?" />
						</form>
					</li>
					<li class="menu">
						<a class="fa-bars" href="#menu">Menu</a>
					</li>
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
					<%if(vo!=null){ %>
					<li><p><strong><%=vo.getNick() %></strong>님  환영합니다🎉</p></li>
					<%} %>
					<li>
						<a href="tripInfo.jsp">
							<h3>여행 정보</h3>
							<p>전라권의 여행 정보를 한눈에!</p>
						</a>
					</li>
					<li>
						<a href="blogPreview.jsp">
							<h3>너와 나, 우리의 이야기</h3>
							<p>서로 다른 우리의 좌충우돌 여행기</p>
						</a>
					</li>
					<li>
						<a href="Awesome.jsp">
							<h3>여행 플레이 리스트</h3>
							<p>떠나요~ 전라도~ 어깨가 들썩! 여행의 동반자 뮤직!</p>
						</a>
					</li>
					<li>
						<a href="mbtiTest.jsp">
							<h3>MBTI 테스트</h3>
							<p>아직도 갈팡질팡하는 당신을 위한! 테스트!</p>
						</a>
					</li>
				</ul>
			</section>

			<!-- Actions -->
			<section>
				<ul class="actions stacked"></ul>
				<%if(vo==null){ %>
					<li><a href="login.html" class="button large fit">로그인</a></li>
				<%}else{ %>
					<li><a href="LogOutCon.do" class="button large fit">로그아웃</a></li>
				<%} %>
			</section>
		</section>

		<!-- Main  (메인, 프리뷰)-->
		<section class ="container5">
			<article class ="half2">
				<h1>내 정보 및 수정</h1>
				<div class = "gobox">
					<form action="UpdateCon.do?id=<%=vo.getId() %>" method="post">
							<div class =e-box>
							<label for="email">EMAIL</label>
							<p><%=vo.getId() %></p>
							</div>
							<div class=p-box>
							<label for="password">PW</label>
							<input type="password" name="newPw" id="newPw" class="newPw" required="required" placeholder="새 비밀번호를 입력해주세요.">
							</div>
							<div class=pp-box>
							<label for="pw">PW/Check</label>
							<input type="password" name="pw" id="pw" class="inpt" required="required" placeholder="비밀번호를 재입력해주세요.">
							</div>
							<div class=n-box>
							<label for="nick">NICK</label>
							<p><%=vo.getNick() %></p>
							</div>
							<div class=n-box>
							<label for="year">생년</label>
							<p><%=vo.getBirth() %></p>
							</div>
							<div class=n-box>
							<label for="mbti">MBTI</label>
							<select name="newMbti" style=text-transform:uppercase>
								<option value="">당신의 현재 MBTI=<%=vo.getMbti() %></option>
								<option value="infp">infp</option>
								<option value="infj">infj</option>
								<option value="intp">intp</option>
								<option value="intj">intj</option>
								<option value="isfp">isfp</option>
								<option value="isfj">isfj</option>
								<option value="istp">istp</option>
								<option value="istj">istj</option>
								<option value="enfp">enfp</option>
								<option value="enfj">enfj</option>
								<option value="entp">entp</option>
								<option value="entj">entj</option>
								<option value="esfp">esfp</option>
								<option value="esfj">esfj</option>
								<option value="estp">estp</option>
								<option value="estj">estj</option>
							</select>
							</div>
							
							
							<div class="submit-new">
							</div>
							<input type="submit" value="내 정보 수정" class= "new-submit"></input>
					</form>
				</div>
			</article>
		</section>

		<section id="footer" class="footer1">
			<div class="footersecond">

				<ul class="icons">
					<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
					<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
					<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
					<li><a href="#" class="icon solid fa-rss"><span class="label">RSS</span></a></li>
					<li><a href="#" class="icon solid fa-envelope"><span class="label">Email</span></a></li>
				</ul>

				<p class="copyright">&copy; Untitled. Design: <a href="http://html5up.net">HTML5 UP</a>. Images: <a
						href="http://unsplash.com">Unsplash</a>.</p>
			</div>
		</section>




	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script src="assets/js/infiniteScroll.js"></script>





</body>

</html>