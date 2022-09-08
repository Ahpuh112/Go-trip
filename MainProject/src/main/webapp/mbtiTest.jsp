<%@page import="com.VO.T_memberVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% T_memberVO vo = (T_memberVO)session.getAttribute("vo"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/mbtiTest.css" />
    <title>MBTrIp - TestIntro</title>
</head>
<body class="single is-preload">

    <!-- Wrapper -->
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
									<a href="myInfo.jsp"><li><p><strong><%=vo.getNick() %></strong>님  환영합니다🎉</p></li></a>
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
                                    <h2><a href="#">mbti테스트</a></h2>
                                    <p></p>
                                </div>
                               
                            </header>
                            <span class="image featured"><img src="" alt="" /></span>
                                
                                <div class='tengah'>
                                <h1>MBTrIp</h1></div>

                                <div class='note'><a href="https://www.arealme.com/16-personality-test-radar-version/ko/"> MBTI 테스트</a></div>
                                <div class='note orange'><a href="./10-things-test-master/test.html">여행지 추천 테스트</a></div>
                                <div class='note river'><a href="https://www.simcong.com/quiz/393">연애유형 테스트</a></div>
                                <div class='note crusta'><a href="https://www.simcong.com/quiz/359">이상형 테스트</a></div>

                                <div class='credit'></div>
                            <footer>
                                <ul class="stats">
                                    <li><a href="#"></a></li>    
                                </ul>
                            </footer>
                        </article>

                </div>

            <!-- Footer -->
                <section id="footer">
                  
                    <p class="copyright">&copy; Untitled. Design: <a href="http://html5up.net">HTML5 UP</a>. Images: <a href="http://unsplash.com">Unsplash</a>.</p>
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