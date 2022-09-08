<%@page import="com.VO.T_InformationVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.T_InformationDAO"%>
<%@page import="com.VO.T_memberVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<%
	T_memberVO vo = (T_memberVO)session.getAttribute("vo");

	int pageSize = 6; // 한 페이지에 출력할 레코드 수
	int count = 0;
	// 페이지 링크를 클릭한 번호 / 현재 페이지
	String pageNum = request.getParameter("pageNum");
	String locNum = request.getParameter("locNum");
	if (pageNum == null){ // 클릭한게 없으면 1번 페이지
		pageNum = "1";
	}
	if (locNum == null){ // 클릭한게 없으면 1번 페이지
		locNum = "36";
	}
	
	

	// 연산을 하기 위한 pageNum 형변환 / 현재 페이지
	int currentPage = Integer.parseInt(pageNum);
	int currentLocNum = Integer.parseInt(locNum);

	// 해당 페이지에서 시작할 레코드 / 마지막 레코드
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;

	
	T_InformationDAO dao = new T_InformationDAO();
	
	if(currentLocNum == 36){
		count = dao.getTotal(); // 데이터베이스에 저장된 총 갯수
	}
	else{
		count = dao.getCateTotal(currentLocNum);
	}
	System.out.println(count);

	ArrayList<T_InformationVO> list = null;
	if (count > 0) {
		// getList()메서드 호출 / 해당 레코드 반환
		list = dao.getInformationList(currentLocNum, startRow, endRow);
	}
%>
<%
	int totalInfo = 0;
		if(currentLocNum == 36){
			totalInfo = dao.getTotal();
			
		}else{
			totalInfo = dao.getCateTotal(currentLocNum);
		}
	
		int pageNation = (int)Math.ceil(totalInfo/6); //페이지수 1,2,3,4---
		if(pageNation==0){
			pageNation+=1;
		} 
		
		System.out.println(pageNation);
		System.out.println(list.size());
%>
<head>
	<title>MBTrIp - tripInfo</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	<link rel="stylesheet" href="assets/css/menu.css" />


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
				<header id="t-header">
					<div id="ss-menu" >
						<ul>
							<li><button class="custom-btn btn-1">전라남도-1</button>
								<ul>
									<li><a href="tripInfo.jsp?locNum=4&pageNum=1">광양</a></li>
									<li><a href="tripInfo.jsp?locNum=6&pageNum=1">구례</a></li>
									<li><a href="tripInfo.jsp?locNum=2&pageNum=1">고흥</a></li>
									<li><a href="tripInfo.jsp?locNum=0&pageNum=1">강진</a></li>
									<li><a href="tripInfo.jsp?locNum=3&pageNum=1">곡성</a></li>
									<li><a href="tripInfo.jsp?locNum=9&pageNum=1">나주</a></li>
									<li><a href="tripInfo.jsp?locNum=11&pageNum=1">담양</a></li>
									<li><a href="tripInfo.jsp?locNum=12&pageNum=1">목포</a></li>
									<li><a href="tripInfo.jsp?locNum=13&pageNum=1">무안</a></li>
									<li><a href="tripInfo.jsp?locNum=15&pageNum=1">보성</a></li>
									<li><a href="tripInfo.jsp?locNum=18&pageNum=1">순천</a></li>
								</ul>
							</li>
							<li><button class="custom-btn btn-1">전라남도-2</button>
								<ul>
									<li><a href="#">신안</a></li>
									<li><a href="tripInfo.jsp?locNum=19&pageNum=1">여수</a></li>
									<li><a href="tripInfo.jsp?locNum=22&pageNum=1">완도</a></li>
									<li><a href="tripInfo.jsp?locNum=21&pageNum=1">영암</a></li>
									<li><a href="tripInfo.jsp?locNum=20&pageNum=1">영광</a></li>
									<li><a href="tripInfo.jsp?locNum=31&pageNum=1">진도</a></li>
									<li><a href="tripInfo.jsp?locNum=28&pageNum=1">장흥</a></li>
									<li><a href="tripInfo.jsp?locNum=26&pageNum=1">장성</a></li>
									<li><a href="tripInfo.jsp?locNum=35&pageNum=1">화순</a></li>
									<li><a href="tripInfo.jsp?locNum=34&pageNum=1">해남</a></li>
									<li><a href="tripInfo.jsp?locNum=33&pageNum=1">함평</a></li>
								</ul>
							</li>
							<li>
								<button class="custom-btn btn-1">전라북도</button>
								<ul>
									<li><a href="tripInfo.jsp?locNum=29&pageNum=1">전주</a></li>
									<li><a href="tripInfo.jsp?locNum=7&pageNum=1">군산</a></li>
									<li><a href="tripInfo.jsp?locNum=24&pageNum=1">익산</a></li>
									<li><a href="tripInfo.jsp?locNum=30&pageNum=1">정읍</a></li>
									<li><a href="tripInfo.jsp?locNum=10&pageNum=1">남원</a></li>
									<li><a href="tripInfo.jsp?locNum=8&pageNum=1">김제</a></li>
									<li><a href="tripInfo.jsp?locNum=23&pageNum=1">완주</a></li>
									<li><a href="tripInfo.jsp?locNum=32&pageNum=1">진안</a></li>
									<li><a href="tripInfo.jsp?locNum=14&pageNum=1">무주</a></li>
									<li><a href="tripInfo.jsp?locNum=27&pageNum=1">장수</a></li>
									<li><a href="tripInfo.jsp?locNum=25&pageNum=1">임실</a></li>
									<li><a href="tripInfo.jsp?locNum=17&pageNum=1">순창</a></li>
									<li><a href="tripInfo.jsp?locNum=1&pageNum=1">고창</a></li>
									<li><a href="tripInfo.jsp?locNum=16&pageNum=1">부안</a></li>
								</ul>
							</li>
							<li><button class="custom-btn btn-1"><a href="tripInfo.jsp?locNum=5&pageNum=1">광주</a></button></li>
							<li><button class="custom-btn btn-1"><a href="tripInfo.jsp?locNum=36&pageNum=1">전체보기</a></button></li>
						</ul>
					</div>
				</header>

				<section class="serv_list">
					<div class="container">
						<!-- 1 -->
						<%for(int i=0; i < list.size(); i++){ %>
						<div class="item_list">
							<div class="card">
								<div class="img">
									<a href="<%=list.get(i).getPlaceUrl()%>"><img src="<%=list.get(i).getImgUrl()%>"></a>
									<div>
									<div style="font-weight: bold;"><a href="tripInfo.jsp?locNum=<%=list.get(i).getLocationNum()%>&pageNum=1"><%=list.get(i).getLocation() %></a></div>
										<h3 style="text-align: center;"><%=list.get(i).getPlaceName() %></h3>
										<button class="v-button"><a href="<%=list.get(i).getPlaceUrl()%>"><i class="fas fa-check">보러가기</i></a></button>
									</div>
								</div>
							</div>
						</div>
						<% } %>
					</div>
				</section>

				<footer id="t-footer">			
							<ul class="pagination pagination-sm" style="display: inline-flex;">
								<% for(int j = 1; j<=pageNation; j++){ %>
									<li class= "pagenationSon">
									<a href="tripInfo.jsp?locNum=<%=locNum %>&pageNum=<%=j %>"><%=j %></a></li>
								<% } %>
							</ul>
				</footer>
			</article>

		</div>

		<!-- Footer -->
		<section id="footer">
			<ul class="icons">
				<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
				<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
				<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
				<li><a href="#" class="icon solid fa-rss"><span class="label">RSS</span></a></li>
				<li><a href="#" class="icon solid fa-envelope"><span class="label">Email</span></a></li>
			</ul>
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