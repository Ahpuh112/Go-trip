<%@page import="com.DAO.T_commentDAO"%>
<%@page import="com.VO.T_contentsVO"%>
<%@page import="com.DAO.T_contentsDAO"%>
<%@page import="com.VO.T_memberVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>MBTrIp - blog</title>
<link rel="stylesheet" href="assets/css/main.css" />
	<%
		String article = request.getParameter("article");
		int ch_article = Integer.parseInt(article);
		T_memberVO vo = (T_memberVO)session.getAttribute("vo");
		T_contentsDAO dao = new T_contentsDAO();
		/* 카운트 기능 수정 */
		int ch_view = 0;
		String view = request.getParameter("view");	
		
		if(view != null) {
			ch_view = Integer.parseInt(view);
		}
		
	
		T_contentsVO voc = dao.getArticle(ch_article);
		/* session.setAttribute("articleNum", voc.getArticleNum()); */
		T_commentDAO cmtDao = new T_commentDAO();
		int pageNum = voc.getArticleNum();
		
		if(ch_view==voc.getArticleViewCnt()) {
			dao.viewCnt(ch_article);
		}
	%>
	<script type="text/javascript">
	    if (self.name != 'reload') {
	        self.name = 'reload';
	        self.location.reload(true);
	    }
	    else self.name = ''; 
	</script>
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

				<!-- Main  (메인, 프리뷰)-->
					<div id="main">

						<!-- Post -->
							<article class="post">
								<header>
									<div class="title">
										<h2><a href="#"><%= voc.getArticleTitle() %></a></h2>
										<p><%= voc.getMbtiName() %></p>
									</div>									
									<div class="meta">
										<time class="published" datetime="2015-11-01"><%= voc.getArticleDate() %></time>
										<a href="myInfo.jsp" class="author"><span class="name"><%= voc.getArticleNick() %></span></a>
									</div>
								</header>
								<div class="articleCont" style="text-align: center;">
									<%=voc.getArticleContent() %>
								</div>
								<br>
								<div id="sub" style=" text-align: center; font-size: 1.4rem;">
									<button type="button" onclick="history.go(-1)" style=" display: inline-block;">모든 글보기</button>
								</div>
								<footer>
									<!-- 좋아요  -->
									<ul class="stats" style="font-size: 1.6rem;">
										<li><a href="myInfo.jsp"><%=voc.getArticleNick() %></a></li>
										<li>👁<%=voc.getArticleViewCnt() %></li>
										<li>
											<a href="likesCon2.do?articleNum=<%=voc.getArticleNum() %>&article=<%=ch_article%>" class="icon solid fa-heart" style="margin: 0;"></a>
											<%=voc.getLikes() %>
											<a href="notLikesCon2.do?articleNum=<%=voc.getArticleNum() %>&article=<%=ch_article%>" class="fas fa-heart-broken"></a>	
										</li>
										<li><a href="#" class="icon solid fa-comment"><%=cmtDao.getTotal(pageNum) %></a></li>
									</ul>
								</footer>
								<br>
							<iframe id="inlineFrameExample" title="Inline Frame Example" onload="calcHeight();" name="WrittenPublic"
								frameborder="0"
								scrolling="no"
							    src="comment.jsp?pageNum=<%=voc.getArticleNum()%>"
							    style="background: white;
							    overflow-x:hidden; overflow:auto; width:100%; min-height:500px;">
							</iframe>
							</article>


					</div>

				<!-- Footer -->
					<section id="footer">
						
					
					</section>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
			
			<script type="text/javascript"> 
				//<![CDATA[
				function calcHeight(){
				 //find the height of the internal page
				
				 var the_height=
				 document.getElementById('inlineFrameExample').contentWindow.
				 document.body.scrollHeight;
				
				 //change the height of the iframe
				 document.getElementById('inlineFrameExample').height=
				 the_height;
				
				 //document.getElementById('the_iframe').scrolling = "no";
				 document.getElementById('inlineFrameExample').style.overflow = "hidden";
				}
				//
			</script>


	</body>
</html>