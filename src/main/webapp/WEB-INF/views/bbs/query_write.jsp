<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
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
	
 <script>
$(document).ready(function(){
	
	
	$("#contentBtn").click(function(){
			
		if($("#bbsTitle").val() == ""){
			alert("제목을 입력하세요");
			$("#bbsTitle").focus();
			return false;
		}else if($('#summernote').summernote('isEmpty')) {
			  alert('내용을 입력하세요');
			  $('#summernote').summernote('focus');
			  return false;
		}
		writeform.submit();
		
	});
	
	$("#reset").click(function(){
		$("#summernote").summernote("reset");
	});
});
	</script>
 
<!-- include summernote css/js -->



<!-- 브라우저에 표시될 문서 제목 -->
<title>가상화폐 모의거래소 coinweb</title>



</head>
<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid text-center">
	<p>COINWEB</p>
	</div>
	</nav>
	
		<!-- 게시판헤더 -->
	



	<div id="box11">
	<form name="writeform" method="post" action="${pageContext.request.contextPath}/writeAction.do">
	<div class="container">
	<hr style="margin-top: 60px">
		<div class="col-xs-12 text-center">
			<div class="freeboard_header_title">
				<p style="font-weight: bold;">문의하기</p>
					<div class="text-center" style="margin-top: 15px">	
				<button id="contentBtn" type="submit" class="btn btn-comm-con">등록</button>
				<button id="contentBtnReset"type="reset" class="btn btn-comm-con">취소</button>
				<a href="${pageContext.request.contextPath}/query_list.do"><button type="button" class="btn btn-comm-con">게시글</button></a>
			</div>
			</div>
		</div>
	</div>
	<hr>
		<div class="bbsboard_table1">
				<div class="form-group1">
				<input type="text" class="title form-control" id="bbsTitle" name="bbsTitle" placeholder="제목을 입력하세요">
				</div>
				 <input type="hidden" name="userID" id="userID" value="${sid} "> 
				<input type="hidden" name="email" id="email" value="${email}">

				<textarea class="content" name="bbsContent" id="summernote"></textarea>
		</div>
	
		</form>
	</div>








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