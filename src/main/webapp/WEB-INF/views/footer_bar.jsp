<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
	<!-- 페이지 설정 부분  -->
<head>
<!-- 저장시에 사용된 인코딩 (파일의 저장 형식) 값을 웹 브라우저에게 알려준다
	ANSI(euc-kr), utf-8 -->
<meta charset="UTF-8"/>
<!-- IE의 호환성 보기 모드 금지 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<!-- 스마트 장치에서 해상도 균일화 처리 -->
<meta name ="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0
, maximum-scale=1.0 , user-scalable=no">

<!-- jquery 3.3.1 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- font-awesome 4.7.0 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- bootstrap css 3.3.7 -->	
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">	

<!-- bootstrap js 3.3.7 -->	
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/header_footer_bar.css">
	
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/login_join_passupdate.css">


<!-- 브라우저에 표시될 문서 제목 -->
<title>Insert title here</title>
</head>
<body>

	<!--더보기 -->
	<!-- 로그인 회원가입 div -->
	<div class="cd-main-nav__list js-signin-modal-trigger">

		<div id="mySidenav" class="sidenav">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()"
				style="font-size: 40px;">&times;</a> 
			<a class="cd-main-nav__item cd-main-nav__item--signin" href="#0"
				data-signin="login" onclick="closeNav()">로그인</a>
			<hr>
			<a class="cd-main-nav__item cd-main-nav__item--signup" href="#0"
				data-signin="signup" onclick="closeNav()">회원가입</a>
			<hr>
			<a href="${pageContext.request.contextPath}/freeboard.do">자유게시판</a>
			<hr>
			<a href="${pageContext.request.contextPath}/rangking.do">랭킹</a>
			<hr>
			<a href="${pageContext.request.contextPath}/guide.do">이용가이드</a>
			<hr>
			<a href="${pageContext.request.contextPath}/faq.do">FAQ</a>
			<hr>
			<a href="${pageContext.request.contextPath}/mypage.do">마이페이지</a>
			<hr>
		</div>



		<nav class="navbar-fixed-bottom footer_nav">
		<div class="container-fluid footer_container">
			<a class="" href="${pageContext.request.contextPath}/index.do"><i
				class="fa fa-home"></i><br>
				<p>홈</p></a> <a
				href="${pageContext.request.contextPath}/market_price.do"><i
				class="fa fa-line-chart"></i><br>
				<p>시세</p></a> <a href="${pageContext.request.contextPath}/business.do"><i class="fa fa-exchange"></i><br>
				<p>거래</p></a> <a href="${pageContext.request.contextPath}/wallet.do"><i class="fa fa-credit-card-alt"></i><br>
				<p>내지갑</p></a> <span onclick="openNav()"><i class="fa fa-bars"></i><br>
				<p>더보기</p></span>
		</div>
		</nav>


		<div class="cd-signin-modal js-signin-modal">
			<!-- this is the entire modal form, including the background -->
			<div class="cd-signin-modal__container">
				<!-- this is the container wrapper -->
				<ul
					class="cd-signin-modal__switcher js-signin-modal-switcher js-signin-modal-trigger">
					<li><a href="#0" data-signin="login" data-type="login"
						class="fa fa-share">로그인</a></li>
					<li><a href="#0" data-signin="signup" data-type="signup"
						class="fa fa-user-plus">회원가입</a></li>
				</ul>

				<div class="cd-signin-modal__block js-signin-modal-block"
					data-type="login">
					<!-- log in form -->
					<form name="loginForm"
						action="${pageContext.request.contextPath}/login_controller.do"
						method="post" class="cd-signin-modal__form">
						<p class="cd-signin-modal__fieldset">


							<label
								class="cd-signin-modal__label cd-signin-modal__label--email cd-signin-modal__label--image-replace"
								for="signin-email">E-mail</label> <input
								class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border"
								name="id" id="signin-email" placeholder="E-mail">

						</p>

						<p class="cd-signin-modal__fieldset">
							<label
								class="cd-signin-modal__label cd-signin-modal__label--password cd-signin-modal__label--image-replace"
								for="signin-password">Password</label> <input
								class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border"
								name="pass" id="signin-password" type="password"
								placeholder="Password">

						</p>

						<p class="cd-signin-modal__fieldset">
							<input type="checkbox" id="remember-me" checked
								class="cd-signin-modal__input "> <label
								for="remember-me">저장</label>
						</p>

						<p class="cd-signin-modal__fieldset">
							<button
								class="cd-signin-modal__input cd-signin-modal__input--full-width"
								id="btnLogin" type="submit">로그인</button>
						</p>
					</form>


				</div>
				<!-- cd-signin-modal__block -->

				<div class="cd-signin-modal__block js-signin-modal-block"
					data-type="signup">
					<!-- sign up form -->
					<form name="joinForm"
						action="${pageContext.request.contextPath}/join_controller.do"
						method="post" class="cd-signin-modal__form">

						<p class="cd-signin-modal__fieldset">
							<label
								class="cd-signin-modal__label cd-signin-modal__label--email cd-signin-modal__label--image-replace"
								for="signup-email">E-mail</label> <input
								class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border"
								id="signup-email" name="id" type="email" placeholder="이메일 입력">
							<span id="id_msg"></span>
						</p>


						<p class="cd-signin-modal__fieldset">
							<label
								class="cd-signin-modal__label cd-signin-modal__label--username cd-signin-modal__label--image-replace"
								for="signup-username">Username</label> <input
								class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border"
								id="signup-username" name="name" type="text" placeholder="이름 입력">
							<span id="name_msg"></span>
						</p>



						<p class="cd-signin-modal__fieldset">
							<label
								class="cd-signin-modal__label cd-signin-modal__label--password cd-signin-modal__label--image-replace"
								for="signup-password">Password</label> <input
								class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border"
								id="pass" name="pass" type="password" placeholder="비밀번호 8자 이상입력">
							<span id="msg"></span>
						</p>
						<p class="cd-signin-modal__fieldset">
							<label
								class="cd-signin-modal__label cd-signin-modal__label--password cd-signin-modal__label--image-replace"
								for="signup-password">Password</label> <input
								class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border"
								id="cpass" type="password" placeholder="비밀번호 재입력">

						</p>

						<p class="cd-signin-modal__fieldset">
							<input type="checkbox" id="agree" name="agree"
								class="cd-signin-modal__input "> <label
								for="accept-terms">이용약관 및 개인정보 동의</a></label>
						</p>

						<p class="cd-signin-modal__fieldset">
							<button
								class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding"
								id="btnJoin" type="submit">회원가입</button>
						</p>

					</form>
				</div>
				<!-- cd-signin-modal__block -->

			</div>
			<!-- cd-signin-modal__container -->
		</div>
		<!-- cd-signin-modal -->

		<!-- 로그인 회원가입 모달 끝  -->
		
		<div id="footer_mask" onclick="closeNav()"></div>




		<script>
			function wrapWindowByMask(){
			    //화면의 높이와 너비를 구한다.
			    var maskHeight = $(document).height();  
			    var maskWidth = $(window).width();  
	
			    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
			    $('#footer_mask').css({'width':maskWidth,'height':maskHeight});  
	
			    //애니메이션 효과
			 
			    $('#footer_mask').fadeTo("fast",0.6);    
			}
			
			function openNav() {
				document.getElementById("mySidenav").style.width = "200px";
				wrapWindowByMask();
			}

			function closeNav() {
				document.getElementById("mySidenav").style.width = "0";
				$('#footer_mask').hide();  
			}
		</script>
		<script src="${pageContext.request.contextPath}/js/main.js"></script>
		<script src="${pageContext.request.contextPath}/js/test2.js"></script>
</body>
</html>