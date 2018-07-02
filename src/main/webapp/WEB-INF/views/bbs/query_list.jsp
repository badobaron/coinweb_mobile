<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<!-- 페이지 설정 부분  -->
<head>

<!-- 저장시에 사용된 인코딩 (파일의 저장 형식) 값을 웹 브라우저에게 알려준다
	ANSI(euc-kr), utf-8 -->
<meta charset="UTF-8" />
<!-- IE의 호환성 보기 모드 금지 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- 스마트 장치에서 해상도 균일화 처리 -->
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0
, maximum-scale=1.0 , user-scalable=no">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/freeboard.css">

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
	<hr style="margin-top: 60px;">
	<div class="container">
		<div class="col-xs-12 text-center">
			<div class="freeboard_header_title">
				<p style="font-weight: bold;">문의하기</p>
			</div>
		</div>
	</div>
	<hr>



	<!-- 문의내역 -->

	<div class="container">
		<!-- 글목록 -->

		<div class="media">
			<div class="media-body">
				<h4 class="media-heading">
					<a
						href="${pageContext.request.contextPath}/freeboard_content.do">질문
						제목입니다.</a>
				</h4>
				<div class="row">
					<div class="col-xs-6">userID</div>
					<div class="col-xs-6 text-right">2016.11.02</div>
				</div>
			</div>
		</div>
		<hr>


		<div class="media">
			<div class="media-body">
				<h4 class="media-heading">
					<a
						href="${pageContext.request.contextPath}/freeboard_content.do">질문
						제목입니다.</a>
				</h4>
				<div class="row">
					<div class="col-xs-6">userID</div>
					<div class="col-xs-6 text-right">2016.11.02</div>
				</div>
			</div>
		</div>
		<hr>


		<div class="media">
			<div class="media-body">
				<h4 class="media-heading">
					<a
						href="${pageContext.request.contextPath}/freeboard_content.do">질문
						제목입니다.</a>
				</h4>
				<div class="row">
					<div class="col-xs-6">userID</div>
					<div class="col-xs-6 text-right">2016.11.02</div>
				</div>
			</div>
		</div>
		<hr>

		<div class="media">
			<div class="media-body">
				<h4 class="media-heading">
					<a
						href="${pageContext.request.contextPath}/freeboard_content.do">질문
						제목입니다.</a>
				</h4>
				<div class="row">
					<div class="col-xs-6">userID</div>
					<div class="col-xs-6 text-right">2016.11.02</div>
				</div>
			</div>
		</div>
		<hr>

		<div class="media">
			<div class="media-body">
				<h4 class="media-heading">
					<a
						href="${pageContext.request.contextPath}/freeboard_content.do">질문
						제목입니다.</a>
				</h4>
				<div class="row">
					<div class="col-xs-6">userID</div>
					<div class="col-xs-6 text-right">2016.11.02</div>
				</div>
			</div>
		</div>
		<hr>


	</div>

	<div class="container text-center">

		<ul class="pagination">
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
		</ul>
	</div>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>


	<jsp:include page="../footer_bar.jsp" />


</body>
</html>