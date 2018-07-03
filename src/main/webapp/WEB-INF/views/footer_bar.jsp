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

<%-- <script src="${pageContext.request.contextPath}/js/setInterval.js"></script> --%>

<script>
jQuery(document).ready(function(){
	
	jQuery("#btnLogin").click(function(){
		if(jQuery("#signin-email").val()==""){
			alert("아이디를 입력하세요.");
			jQuery("#signin-email").focus();
			return false;
		}else if(jQuery("#signin-password").val()==""){
			alert("패스워드를 입력하세요.");
			jQuery("#signin-password").focus();
			return false;
		}
		
		loginForm.submit();
		
		saveid();
	});
	
	$(function(){
		getid();
	}); //function(){
		  
	function saveid() {
		var expdate = new Date();
		
		// 기본적으로 30일동안 기억하게 함. 일수를 조절하려면 * 30에서 숫자를 조절하면 됨
		if($("#remember-me").is(":checked") == true){
			if(getCookie("saveid") != $("#signin-email").val())
				expdate.setTime(expdate.getTime() - 1);
			expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30); // 30일
		}else{
		   expdate.setTime(expdate.getTime() - 1);
		}
	   setCookie("saveid", $("#signin-email").val(), expdate);
	 } //saveid()
	 
	 function setCookie (name, value, expires) {
	    document.cookie = name + "=" + escape (value) +"; path=/; expires=" + expires.toGMTString();
	  } //setCookie(name,value,expires)

	  function getCookie(Name) {
	    var search = Name + "=";
	    if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면
	      offset = document.cookie.indexOf(search);
	      if (offset != -1) { // 쿠키가 존재하면
	        offset += search.length;
	        // set index of beginning of value
	        end = document.cookie.indexOf(";", offset);
	        // 쿠키 값의 마지막 위치 인덱스 번호 설정
	        if (end == -1)
	          end = document.cookie.length;
	        return unescape(document.cookie.substring(offset, end));
	      }
	    }
	    return "";
	  } //getCookie(Name)

	 function getid() {
	  var saveId = getCookie("saveid");
	  if(saveId != "") {
	   $("#signin-email").val(saveId);
	   $("#remember-me").prop("checked",true);
	  }
	 } //getid()

//아이디 저장 끝 

	
});
</script>

<script>
jQuery(document).ready(function(){
	

	jQuery("#btnJoin").click(function(){
		if(jQuery("#signup-email").val()==""){
			alert("이메일을 입력하세요.");
			jQuery("#signup-email").focus();
			return false;
		}else if(jQuery("#signup-username").val()==""){
				alert("닉네임을 입력하세요");
				jQuery("#signup-username").focus();
				return false;
			}else if(jQuery("#pass").val()==""){
			alert("비밀번호를 입력하세요.");
			jQuery("#pass").focus();
			return false;	
			
			}else if(jQuery("#cpass").val()==""){
				alert("비밀번호를 재입력 하세요.");
				jQuery("#cpass").focus();
				return false;
		}else if(jQuery("#agree").is(":checked") == false){
			alert("이용약관 및 개인정보 동의를 체크하세요.");
			jQuery("#agree").focus();
			return false;
		}
		
		//서버전송
		joinForm.submit();
		
		//비밀번호&비밀번호 확인 체크
	});
	jQuery("#cpass").focusout(function(){
		// 1.패스워드 입력폼이 비어있는지 확인  비어있지 않은 상태에서만 비교
		// 2. 1번의 결과중 비밀번호 확인폼이 비어있지 않은 상태에서만 비교를 진행 
		var minimum = 8;
		var pass = jQuery("#pass").val().length;
		
		
		
		if(jQuery("#pass").val()=="" ){
			alert("패스워드를 입력하세요")
			jQuery("#pass").focus;
			return false;
			
		}else if(pass <minimum){
			alert("패스워드를 8자리 이상 입력하세요")
			jQuery("#pass").focus;
			jQuery("#pass").val("");
			jQuery("#cpass").val("");
			return false;
		
			
		
		}else{
			if(jQuery("#cpass").val()!=""){
			
			
				//비밀번호 & 비밀번호 확인 체크
				if(jQuery("#pass").val()== jQuery("#cpass").val()){
				jQuery("#msg").css("font-size","12pt").css("color","blue").css("display","block");
				jQuery("#msg").text("비밀번호가 동일합니다").css("padding","3px 0px 0px 0px");
				return false;
			}else{
				jQuery("#msg").css("font-size","12pt").css("color","red").css("display","block").css("padding","3px 0px 0px 0px");
				jQuery("#msg").text("비밀번호가 다릅니다. 다시 입력해주세요");
				jQuery("#pass").val("").focus();
				jQuery("#cpass").val("");
					return false;
		    }
				
		 }
			
	  }
		
			
	
});
	//아이디 중복체크 및 이메일 유효성검사 
	jQuery("#signup-email").focusout(function(){
		//alert("아이디 중복");
		var email = jQuery("#signup-email").val();
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		//alert(id);
		
		jQuery.ajax({
			url : '${pageContext.request.contextPath}/id_check.do',
			type :'POST',
			data : 'email='+email, 
			dataType : "json",
			success : function(data){
				if(data.length != 0){	
					//alert("있음"+data);
					
					if(jQuery("#signup-email").val()==""){
						jQuery("#id_msg").css("display","block").css("font-size","12pt")
							.css("color","red").css("padding","3px 0px 0px 0px");
						jQuery("#id_msg").text("이메일을 입력하세요.");
						jQuery("#signup-email").focus();
					}else if(exptext.test(email)==false){
						jQuery("#id_msg").css("display","block").css("font-size","12pt")
							.css("color","red").css("padding","3px 0px 0px 0px");
						jQuery("#id_msg").text("이메일 형식이 올바르지 않습니다.");
						//jQuery("#signup-email").focus();
						jQuery("#signup-email").val("");
					}else if(data == 1){
						jQuery("#id_msg").css("display","block").css("font-size","12pt")
						.css("color","red").css("padding","3px 0px 0px 0px");
						jQuery("#id_msg").text("중복된 이메일입니다.");
						//jQuery("#signup-email").focus();		
						jQuery("#signup-email").val("");
					}else{
						jQuery("#id_msg").css("display","block").css("font-size","12pt")
							.css("color","blue").css("padding","3px 0px 0px 0px");
						jQuery("#id_msg").text("사용가능한 이메일 입니다.");
						jQuery("#signup-username").focus();
						
					}
			
				}
			}
		});			
	});	//end of id_check	
	
	jQuery("#signup-username").focusout(function(){
		//alert("닉네임 중복 체크");
		var name = jQuery("#signup-username").val();
		//alert(name);
		
		$.ajax({
			url : '${pageContext.request.contextPath}/name_check.do',
			type :'GET',
			data : 'name='+name,
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded;charset=utf-8',
			success : function(data){
				if(data.length != 0){	
					//alert("있음"+data);
					//alert(name);
	
					 if(data == 1){
						 jQuery("#name_msg").css("display","block").css("font-size","12pt")
						.css("color","red").css("padding","3px 0px 0px 0px");
						 jQuery("#name_msg").text("중복된 닉네임입니다.");
						 jQuery("#signup-username").val("").focus();
		
					
						
					}else{
					
						if(jQuery("#signup-username").val()==""){
							jQuery("#name_msg").css("display","block").css("font-size","12pt")
							.css("color","red").css("padding","3px 0px 0px 0px");
							jQuery("#name_msg").text("닉네임을 입력하세요.");
							//$("#signup-username").val("").focus();
						}else{
							jQuery("#name_msg").css("display","block").css("font-size","12pt")
							.css("color","blue").css("padding","3px 0px 0px 0px");
							jQuery("#name_msg").text("사용가능한 닉네임 입니다.");
							//jQuery("#pass").focus();
						}
						return false;
					}
			
				}
			}
		});			
	});	//end of id_check	
	
	/*비밀번호 자릿수 유효성검사 */
	
  /*  jQuery("#pass").focusout(function(){
		var minimum = 8;
		var pass = jQuery("#pass").val().length;
	
		if(pass < minimum){
			jQuery("#msg")	.css("color","red").css("padding","3px 0px 0px 0px");
			jQuery("#msg").text("8자 이상 입력 하세요.");
			jQuery("#pass").focus();
			
		return false;
			
		}else{
			jQuery("#msg")	.css("color","red").css("padding","3px 0px 0px 0px");
			jQuery("#msg").text("");
			jQuery("#cpass").focus();
		}

		return false;
	});*/
	
});  
</script>



<script>                              
jQuery(document).ready(function(){



	var result = 0;

	jQuery("#pcbtn").click(function(){
		if(jQuery("#upass").val()==""){
			alert("현재 비밀번호를 입력하세요")
			return false;

		}else if(jQuery("#npass").val()==""){
			alert("새비밀번호를 입력하세요.");

			return false;

			}else if(jQuery("#ncpass").val()==""){
				alert("비밀번호를 재입력 하세요.");

				return false;

			}

		if(result==1)

			passUpdate.submit();

		else{

			alert("현재 비밀번호를 다시 입력해주세요");

			return false;

		}

	}); //end


	 jQuery("#upass").focusout(function(){
		 var email = jQuery("#uid").val();
		 var pass = jQuery("#upass").val();
		// alert(email+","+pass);

		 jQuery.ajax({

			 url : '${pageContext.request.contextPath}/password_check.do',
			 type :'GET',
			 data : 'email='+email+'&pass='+pass,
			 dateType : "json",
			 success: function(data){
				 //alert(data);

					if(data != 1){
						jQuery("#upw_msg").css("display","block").css("font-size","12pt")
						.css("color","red").css("padding","3px 0px 0px 0px");
					jQuery("#upw_msg").text("불일치!");
					jQuery("#upass").val("");
					

					
					return false; 

					

					}else if (data == 1){

						jQuery("#upw_msg").css("display","block").css("font-size","12pt")
						.css("color","blue").css("padding","3px 0px 0px 0px");
					jQuery("#upw_msg").text("일치!");
					result = 1;
					return result; 

					}		

			

				 }

		

		

  		});

	});

   

	 jQuery("#ncpass").focusout(function(){
			// 1.패스워드 입력폼이 비어있는지 확인  비어있지 않은 상태에서만 비교
			// 2. 1번의 결과중 비밀번호 확인폼이 비어있지 않은 상태에서만 비교를 진행 
			
				var minimum = 8;
			var pass = jQuery("#npass").val().length;
			
			
			if(jQuery("#npass").val()=="" ){
				alert("패스워드를 입력하세요")

				return false;

			}else if (pass <minimum){
				alert("패스워드를 8자리 이상 입력해주세요.")
				jQuery("#ncpass").val("");
				jQuery("#npass").val("");
				return false;
			
			}else{

				if(jQuery("#ncpass").val()!=""){

					//비밀번호 & 비밀번호 확인 체크

					if(jQuery("#npass").val()== jQuery("#ncpass").val()){
					jQuery("#nupw_msg").css("font-size","12pt").css("color","blue").css("display","block");
					jQuery("#nupw_msg").text("비밀번호가 동일합니다.").css("padding","3px 0px 0px 0px");

					return false;

				}else{

					jQuery("#nupw_msg").css("font-size","12pt").css("color","red").css("display","block").css("padding","3px 0px 0px 0px");
					jQuery("#nupw_msg").text("비밀번호가 다릅니다. 다시 입력해주세요");
					jQuery("#pass").val("").focus();

					jQuery("#ncpass").val("");

						return false;

			    }
			 }
		  }
	});

	 

	 /*비밀번호 자릿수 유효성검사 */
	/*	jQuery("#npass").focusout(function(){

			var minimum = 8;
			var pass = jQuery("#npass").val().length;

		
			if(pass < minimum){
				jQuery("#nupw_msg")	.css("color","red").css("padding","3px 0px 0px 0px");
				jQuery("#nupw_msg").text("8자 이상 입력 하세요.");
				jQuery("#npass").focus();
				return false;

			}else{

				jQuery("#nupw_msg")	.css("color","red").css("padding","3px 0px 0px 0px");
				jQuery("#nupw_msg").text("");
				jQuery("#ncpass").focus();
				return false;

			}

		});*/

	

});

</script>
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
						action="${pageContext.request.contextPath}/login.do"
						method="post" class="cd-signin-modal__form">
						<p class="cd-signin-modal__fieldset">


							<label
								class="cd-signin-modal__label cd-signin-modal__label--email cd-signin-modal__label--image-replace"
								for="signin-email">E-mail</label> <input
								class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border"
								name="email" id="signin-email" placeholder="E-mail">

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
						action="${pageContext.request.contextPath}/join.do"
						method="post" class="cd-signin-modal__form">

						<p class="cd-signin-modal__fieldset">
							<label
								class="cd-signin-modal__label cd-signin-modal__label--email cd-signin-modal__label--image-replace"
								for="signup-email">E-mail</label> <input
								class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border"
								id="signup-email" name="email" type="email" placeholder="이메일 입력">
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
				document.getElementById("footer_mask").style.display = 'none';
				document.getElementById("mySidenav").style.width = "0";
			}
		</script>
		<script src="${pageContext.request.contextPath}/js/main.js"></script>
		<script src="${pageContext.request.contextPath}/js/test2.js"></script>
</body>
</html>