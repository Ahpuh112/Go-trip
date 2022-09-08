<%@page import="com.DAO.T_commentDAO"%>
<%@page import="com.VO.T_memberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.T_contentsDAO"%>
<%@page import="com.VO.T_contentsVO"%>
<%@page import="com.DAO.T_memberDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 


<!DOCTYPE html>
<%
	T_memberVO vo = (T_memberVO)session.getAttribute("vo");

	int pageSize = 4; // 한 페이지에 출력할 레코드 수
	int count = 0;
	// 페이지 링크를 클릭한 번호 / 현재 페이지
	String pageNum = request.getParameter("pageNum");
	String mbti = request.getParameter("mbti");
	if (pageNum == null){ // 클릭한게 없으면 1번 페이지
		pageNum = "1";
	}
	

	// 연산을 하기 위한 pageNum 형변환 / 현재 페이지
	int currentPage = Integer.parseInt(pageNum);

	// 해당 페이지에서 시작할 레코드 / 마지막 레코드
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;

	
	T_contentsDAO dao = new T_contentsDAO();
	if(mbti == null||mbti.equals("all")){
		mbti = "all";
		count = dao.getTotal(); // 데이터베이스에 저장된 총 갯수
	}else{
		count = dao.getCateTotal(mbti);
	}
	System.out.println(count);

	ArrayList<T_contentsVO> list = null;
	if (count > 0) {
		// getList()메서드 호출 / 해당 레코드 반환
		list = dao.getContentList(mbti, startRow, endRow);
	}
	T_commentDAO cmtDao = new T_commentDAO();
	
	int[] article = {};
%>

<html>
	<head>
		<title>MBTrIp - blogPreview</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<style type="text/css">
			a {
				padding-right: 8px;
			}
			
		
		</style>
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

						<div class="container5" >
							<!-- category(왼쪽 카테고리) -->

							<div class="category" >
								<a href="blogPreview.jsp">✈ 전체글 보기</a><br>
								
								<span class="catecolumn"><a href="blogPreview.jsp?mbti=INFP&pageNum=1">🧡INFP</a></span>
								<span class="catecolumn"><a href="blogPreview.jsp?mbti=INFJ&pageNum=1">💛INFJ</a></span>
								<span class="catecolumn"><a href="blogPreview.jsp?mbti=ISFP&pageNum=1">💚ISFP</a></span>
								<span class="catecolumn"><a href="blogPreview.jsp?mbti=ISFJ&pageNum=1">💙ISFJ</a></span>
								<span class="catecolumn"><a href="blogPreview.jsp?mbti=INTP&pageNum=1">💜INTP</a></span>
								<span class="catecolumn"><a href="blogPreview.jsp?mbti=INTJ&pageNum=1">🤎INTJ</a></span>
								<span class="catecolumn"><a href="blogPreview.jsp?mbti=ISTP&pageNum=1">🖤ISTP</a></span>
								<span class="catecolumn"><a href="blogPreview.jsp?mbti=ISTJ&pageNum=1">🤍ISTJ</a></span>
								<span class="catecolumn">
									<a href="blogPreview.jsp?mbti=ENFP&pageNum=1">🧡ENFP</a>
									<a href="blogPreview.jsp?mbti=ENFJ&pageNum=1">💛ENFJ</a>
									<a href="blogPreview.jsp?mbti=ESFP&pageNum=1">💚ESFP</a>
									<a href="blogPreview.jsp?mbti=ESFJ&pageNum=1">💙ESFJ</a>
									<a href="blogPreview.jsp?mbti=ENTP&pageNum=1">💜ENTP</a>
									<a href="blogPreview.jsp?mbti=ENTJ&pageNum=1">🤎ENTJ</a>
									<a href="blogPreview.jsp?mbti=ESTP&pageNum=1">🖤ESTP</a>
									<a href="blogPreview.jsp?mbti=ESTJ&pageNum=1">🤍ESTJ</a>
								</span>
								
							</div>
								<%
								int totalPost = 0;
									if(mbti.equals("all")||mbti.equals("'%all%")){
										totalPost = dao.getTotal();
										
									}else{
										totalPost = dao.getCateTotal(mbti);
									}
							
									int pageNation = (int)Math.ceil(totalPost/4); //페이지수 1,2,3,4---
									if(pageNation==0){
										pageNation+=1;
									} 
									
									System.out.println(pageNation);
									System.out.println(list.size());
								%>
							<div class="tiles" >
								<%for(int i=0; i < list.size(); i++){ %>
								<span class="previewR">
									<a class="tile" href="blog.jsp?article=<%=list.get(i).getArticleNum() %>&view=<%=list.get(i).getArticleViewCnt()%>">
										<img src="<%=list.get(i).getArticlePrePic()%>" width="650px" height="400">
										<div class="details">
											<span class="title"><%=list.get(i).getArticleTitle() %></span>
											<span class="info"><%=list.get(i).getArticleNick() %></span>
										</div>
									</a>
								
									<footer>
										<ul class="stats">
											<li><a href="#"><%=list.get(i).getMbtiName() %></a></li>
											<li>👁<%=list.get(i).getArticleViewCnt()%></li>
											<li>
												<a href="likesCon.do?articleNum=<%=list.get(i).getArticleNum() %>" class="icon solid fa-heart"><%=list.get(i).getLikes() %></a>
												<a href="notLikesCon.do?articleNum=<%=list.get(i).getArticleNum() %>" class="fas fa-heart-broken"></a>	
											</li>
											<li><a href="blog.jsp?article=<%=list.get(i).getArticleNum() %>#inlineFrameExample" class="icon solid fa-comment"><%=cmtDao.getTotal(list.get(i).getArticleNum()) %></a></li>
										</ul>
									</footer>
								</span>
								<% } %>												
							</div>	
						</div>
					</div>
					<section id="footer" class="footer1">	
						<div class="footernav">
							<table>
								<tr>									
									<td colspan="5" align="center">
										<ul class="pagination pagination-sm">
											<% for(int j = 1; j<=pageNation; j++){ %>
											<li class= "pagenationSon" style="padding: 0;">
											<a href="blogPreview.jsp?mbti=<%=mbti %>&pageNum=<%=j %>"><%=j %></a></li>			
											<% } %>
										</ul>										
									</td>
								</tr>
								<tr>									
									<td colspan="5" align="center">
										<input type="button" value="✈여행후기 작성" class="btn btn-default pull-right" onclick="location.href='write.jsp'" style="font-size: 0.9rem; border-radius: 20px;">										
									</td>
								</tr>
							</table>	
						</div>
						
                        <div class="footersecond">
                        	
							<ul class="icons">
								<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
								<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
								<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
								<li><a href="#" class="icon solid fa-rss"><span class="label">RSS</span></a></li>
								<li><a href="#" class="icon solid fa-envelope"><span class="label">Email</span></a></li>
							</ul>
						
							<p class="copyright">&copy; Untitled. Design: <a href="http://html5up.net">HTML5 UP</a>. Images: <a href="http://unsplash.com">Unsplash</a>.</p>
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