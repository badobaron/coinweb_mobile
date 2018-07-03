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
 <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
 <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
 <link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/header_footer_bar.css">
	
  <link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/freeboard.css">
	
<!-- include summernote css/js -->

<!-- 브라우저에 표시될 문서 제목 -->
<title>가상화폐 모의거래소 coinweb</title>



</head>
<script type="text/javascript">
$(document).ready(function(){
	

		
	

	/*reset*/
	$("#contentBtnReset").click(function(){
		$("#summernote").summernote("reset");
	});
	/*컨탠츠 버튼 클릭시*/
	$("#contentBtn").click(function(){
		
		if($("#title").val()==""){
			alert("제목을 입력하세요");
			$("#title").focus();
			return false;	
		/*content 없을때*/				
		}else if($('#summernote').summernote('isEmpty')) {
			  alert('내용을 입력하세요');
			  $('#summernote').summernote('focus');
			  return false;
		/*등록 ajax*/	  
		}else {
			var htmlContent = $('#summernote').summernote('code');
			//alert(htmlContent);
		/*
			$(".summernote").html(htmlContent);
			freeboard_form.submit;			
		*/
		}
			
	});	
	
});	

</script>
<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid text-center">
	<p>COINWEB</p>
	</div>
	</nav>



<!-- 게시판 헤더 -->
	<div class="container" style="margin-top: 40px;">
		<hr>
		<div class="col-xs-12 text-center">
			<div class="freeboard_header_title">
				<p style="font-weight: bold;">글쓰기</p>
			</div>
		</div>
	</div>
	<hr>




	<div class="container" style="margin-top: 20px;">
		
		<form id="freeboard_form" class="freeboard_form" action="/coinweb/freeboard_write_controller.do" method="post">
			<!-- 작성자 -->
			<div class="form-group">
			<input type="text" class="title form-control" id="title" name="title" placeholder="제목을 입력하세요">
			<input class="name form-control" id="name" name="name" type="hidden" value="${name}">
			<input class="id form-control" id="id" name="id" type="hidden" value="${sid}">	
			</div>
			
			
	
	
		

			<textarea id="summernote"  name="content" class="content"></textarea>
			
			<div class="text-center">	
				<button id="contentBtn" type="submit" class="btn btn-comm-con">등록</button>
				<button id="contentBtnReset"type="reset" class="btn btn-comm-con">취소</button>
				<a href="${pageContext.request.contextPath}/freeboard.do"><button type="button" class="btn btn-comm-con">게시글</button></a>
			</div>
		</form>

	</div>
<br><br><br><br><br>








<!-- foooter 부분.. --> 
	<!--더보기 -->
	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()"
			style="font-size: 40px;">&times;</a> <a
			href="${pageContext.request.contextPath}/freeboard.do">자유게시판</a>
		<hr>
		<a href="#">랭킹</a>
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
		<a class="" href="${pageContext.request.contextPath}/index.do"><i class="fa fa-home"></i><br>
		<p>홈</p></a> 
		<a href="${pageContext.request.contextPath}/market_price.do"><i class="fa fa-line-chart"></i><br>
		<p>시세</p></a> 
		<a href="${pageContext.request.contextPath}/business.do"><i class="fa fa-exchange"></i><br>
		<p>거래</p></a> 
		<a href="${pageContext.request.contextPath}/wallet.do"><i class="fa fa-credit-card-alt"></i><br>
		<p>내지갑</p></a> 
		<span onclick="openNav()"><i class="fa fa-bars"></i><br>
		<p>더보기</p></span>
	</div>
	</nav>


<script>
function openNav() {
    document.getElementById("mySidenav").style.width = "200px";
}


function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}

</script>







</body>

<script>
/*summernote form*/


		$('#summernote').summernote({
		 height: 300,                 // set editor height
		 minHeight: 300,            // set minimum height of editor
		 maxHeight: 500,            // set maximum height of editor
	     focus: true,
	     placeholder: '내용을 입력하세요.',	  
		});		

  		
		
	
</script>

</html>