<%@page import="com.VO.T_memberVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% T_memberVO vo = (T_memberVO)session.getAttribute("vo");  %>
<!DOCTYPE html>
<html>
<head>
	<title>MBTrIp - 로그인/회원가입</title>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="posting.css"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/main.css" />
	<link rel="stylesheet" href="assets/css/lojo.css" />

	<script type="text/javascript" src="./smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>	
	<meta content="BlendTrans(Duration=0.2)" http-equiv="Page-Enter">
	<meta content="BlendTrans(Duration=0.2)" http-equiv="Page-exit">
	<script type="text/javascript">
	
		// 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
		function checkValue() {
			if(!document.userInfo.id.value){
				alert("아이디를 입력하세요.");
				return false;
			}
			
			if(!document.userInfo.password.value){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			
			// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
			if(document.userInfo.password.value != document.userInfo.passwordcheck.value){
				alert("비밀번호를 동일하게 입력하세요.");
				return false;
			}
		}
	</script>
</head>
<body>
<!-- <body class="single is-preload">
	<div id="wrapper"> -->
		<!-- Header -->
		<header id="header">
						<h1 style="text-transform: none;"><a href="pageMain/intro.html">MBTrIp</a></h1>
						<nav class="links">
							<ul>
								<li><a href="#">여행 정보</a></li>
								<li><a href="blogPreview.jsp">너와 나, 우리의 이야기</a></li>
								<li><a href="Awesome.jsp">여행 플레이리스트</a></li>
								<li><a href="mbtiTest.jsp">MBTI 테스트</a></li>
								<li><a href="#">우리와 함께해요!</a></li>
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
										<a href="#">
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

<!-- 로그인-->
<section class="container">
<article class="half">
	<h1>MBTRIp</h1>
	<div class="tabs">
			<span class="tab signin active"><a href="#signin">로그인</a></span>
			<span class="tab signup"><a href="#signup">회원가입</a></span>
	</div>
	<div class="content">
			<div class="signin-cont cont">
					<form action="LoginCon.do" method="post">
							<input type="text" name="email" id="id" class="inpt" required="required" placeholder="아이디를 입력해주세요.">
							<label for="id">ID</label>
							<input type="password" name="pw" id="user_pw" class="inpt" required="required" placeholder="비밀번호를 입력해주세요.">
							<label for="password">password</label>
							<div class="submit-wrap">
									<input type="submit" value="로그인" class="submit">
									<a href="#" class="more" id="more">비밀번호를 잊어버리셨나요?</a>
							</div>
					</form>
			</div>
			<div class="signup-cont cont">
					<form action="JoinCon.do" method="post" onsubmit="checkValue()">
							<input type="text" name="id" id="id" class="inpt" required="required" placeholder="아이디를 입력해주세요.(*)">
							<label for="id">ID</label>
							<input type="password" name="password" id="pw" class="inpt" required="required" placeholder="비밀번호를 입력해주세요.">
							<input type="password" name="passwordcheck" id="pw" class="inpt" required="required" placeholder="비밀번호를 재입력해주세요.">
							<label for="pw">PW</label>
							<input type="text" name="name" id="name" class="inpt" required="required" placeholder="닉네임을 입력해주세요.(*)">
							<label for="nick">NICK</label>
							<input type="text" name="birthyy" id="birthyy" class="inpt" required="required" placeholder="생년월일을 입력해주세요.">
							
							
							<select class="inpt" name="mbti" style= text-transform:uppercase >
								<option value="">MBTI를 선택하세요.</option>
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
							<div class="submit-wrap">
									<input type="submit" value="회원가입 완료" class="submit" id="we-button">
									<a href="#" class="more">환영합니다!</a>
									
									
							</div>
					</form>
							<em style="font-size: 10px">(*)표시는 추후 수정이 불가하니 신중히 결정해주세요!</em>
    		</div>
	</div>
		    </article>
		    <div class="half bg"></div>
	</section>

	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
	

</body>



<script type="text/javascript">
	// 로그인 회원가입 왔다갔다 하는 
	$('.tabs .tab').click(function(){
		if ($(this).hasClass('signin')) {
			$('.tabs .tab').removeClass('active');
			$(this).addClass('active');
			$('.cont').hide();
			$('.signin-cont').show();
		} 
		if ($(this).hasClass('signup')) {
			$('.tabs .tab').removeClass('active');
			$(this).addClass('active');
			$('.cont').hide();
			$('.signup-cont').show();
		}
	}); 

	//  $('.container .bg').mousemove(function(e){
	//  	var amountMovedX = (e.pageX * -1 / 30);
	// 	var amountMovedY = (e.pageY * -1 / 9);
	//  	$(this).css('background-position', amountMovedX + 'px ' + amountMovedY + 'px');
	//  });


</script>
</html>