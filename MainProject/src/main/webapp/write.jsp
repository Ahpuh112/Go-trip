<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.VO.T_memberVO"%>
<%@page import="com.VO.T_contentsVO"%>
<%@page import="com.DAO.T_contentsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
%>

<html>

<head>
	<title>MBTrIp - write</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	<link rel="stylesheet" href="assets/css/newposting.css" />
	<script type="text/javascript" src="./smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>	

	
	
	
	
	
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

		<!-- Main -->
		<div id="main">

			<!-- Post -->
			<article class="post">
				<header>
					<div class="title">

						<h2>
							<a><href="#" id = "Magna">제목을 입력하세요.</a>
						</h2>
						<p id="Lorem">#MBTI를 입력하세요.</p>
						<!-- <span id="mbti_click"></span> -->
					</div>
					<div class="meta">
						<%  
							DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
						 	LocalDate now = LocalDate.now();
						%>
						<time class="published" datetime="<%=LocalDate.now()%>"><%=now.format(formatter)%></time>
						<%if(vo!=null){ %>
						<a href="#" class="author"><span class="name"><%=vo.getNick() %></span></a>
						<%} %>
					</div>
				</header>
				<section class="container2">
					<article class="half">
							<h1>Posting</h1>
						<form id="frm" action="writeInsertCon.do" method="post" enctype="multipart/form-data">
							<div class="content">
									<input type="text" name="title" id="title" class="inpt" required="required"	placeholder="제목입력">
									<input type="hidden" name="mbti" id="mbti" class="mbti" required="required"	value="">
						<!-- 제목 입력 -->
									<article class="MBTI" >
										<div class =mbti-i>
											<button type="button" class = "btn-2" value="#ISTJ">ISTJ</button>
											<button type="button" class = "btn-2" value="#ISFJ">ISFJ</button>
											<button type="button" class = "btn-2" value="#INFJ">INFJ</button>
											<button type="button" class = "btn-2" value="#INTJ">INTJ</button>
											<button type="button" class = "btn-2" value="#ISTP">ISTP</button>
											<button type="button" class = "btn-2" value="#ISFP">ISFP</button>
											<button type="button" class = "btn-2" value="#INFP">INFP</button>
											<button type="button" class = "btn-2" value="#INTP">INTP</button><br>
										</div>
										<div class = mbti-e>
											<button type="button" class = "btn-2" value="#ESTP">ESTP</button>
											<button type="button" class = "btn-2" value="#ESFP">ESFP</button>
											<button type="button" class = "btn-2" value="#ENFP">ENFP</button>
											<button type="button" class = "btn-2" value="#ENTP">ENTP</button>
											<button type="button" class = "btn-2" value="#ESTJ">ESTJ</button>
											<button type="button" class = "btn-2" value="#ESFJ">ESFJ</button>
											<button type="button" class = "btn-2" value="#ENFJ">ENFJ</button>
											<button type="button" class = "btn-2" value="#ENTJ">ENTJ</button>	
										</div>
									</article>
									<div class = "s-button">
										<button class = "r-button" type="button">MBTI reset</button>
										<button class="p-button" type="button" onclick="onclick=document.all.image.click()">Add picture</button>
									</div>
										<div class="image_div">
	   										<div id="image_container"></div>										
	   									 	<input type="file" id="image" name="image" accept="image/*" onchange="setThumbnail(event);" style="display:none"/>
										</div>
									<div class="tabs" id="newtabs">
										<span class="tab signin active"><a href="#signin">게시물 작성</a></span>
									</div>
									<!-- 스마트에디터 구간-->
									<textarea id="txtContent" name="content" rows="10" cols="100" style="width: 100%;"></textarea>
									<div class="bt_wrap">
										<div id="sub" style=" text-align: center;">
											<input id="save" type="submit" style=" display: inline-block;" value="게시">
											<button type="button" style=" display: inline-block;"><a href="blogPreview.jsp">취소</a></button>
										</div>
									</div>
								</div>
							</form>
						</article>
					</section>			
				<br>
				<!-- <footer>
					<ul class="stats">
						<li><a href="#">General</a></li>
						<li><a href="#" class="icon solid fa-heart">28</a></li>
						<li><a href="#" class="icon solid fa-comment">128</a></li>
					</ul>
				</footer> -->
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
		<p class="copyright">&copy; Untitled. Design: <a href="http://html5up.net">HTML5 UP</a>. Images: <a
				href="http://unsplash.com">Unsplash</a>.</p>
	</section>

	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	
	<!-- 스마트에디터 연동  -->
	<script>
		var oEditors = [];
			nhn.husky.EZCreator.createInIFrame({
				oAppRef: oEditors,
				elPlaceHolder: 'txtContent',
				sSkinURI: './smarteditor2/SmartEditor2Skin.html',
				fCreator: 'createSEditor2'
			});
			
		$("#save").click(function(){
			oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []);
			$("#frm").submit();
		})
	</script>
	
	<script>
		$(document).ready(function(){
			$("#title").keyup(function name(params) {
				$("#Magna").text($("#title").val());
			});
		});
	
		// $(document).ready(function(){
		// 	$("#sidetitle").keyup(function name(params) {
		// 		$("#Lorem").text($("#sidetitle").val());
		// 	});
		// });
	
		$('.btn-2').click(function(){
			var value = $('#Lorem').text();
			var mbtiValue = document.getElementById('mbti');
			var valueNow = this.value;
			mbtiValue.value += this.value;
			$('#Lorem').text(value+" "+  this.value+ " / ");
			alert(mbtiValue.value);
		});
		
		$('.r-button').click(function(){
			var mbtiValue = document.getElementById('mbti');
			$('#Lorem').text("#MBTI를 입력하세요 ");
			mbtiValue.value = "";
			
		});
		
		/*  */
			function setThumbnail(event) {
	        var reader = new FileReader();
	        $("div#image_container").empty()	
	        reader.onload = function(event) {
	          var img = document.createElement("img");
	          img.setAttribute("src", event.target.result);
	          img.setAttribute("width", "300px");
	          document.querySelector("div#image_container").appendChild(img);
	        };
			
	        reader.readAsDataURL(event.target.files[0]);
	      }

		
	</script>
</body>

</html>