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
	href="http://localhost:8080/coinweb_mobile/css/freeboard.css">

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
	<div class="container" style="margin-top: 40px;">
		<hr>
		<div class="col-xs-12 text-center">
			<div class="freeboard_header_title">
				<p style="font-weight: bold;">커뮤니티</p>
			</div>
		</div>
	</div>
	<hr>




	<div class="container">

		<div class="freeboard_content_title">
			<p class="freeboard_content_title_text">제목</p>
			<p class="freeboard_content_title_date">2016.10.5</p>
		</div>
		<div class="freeboard_content_author">
			<p class="freeboard_content_author_name">사용자</p>
			<div class="freeboard_content_author_info">
				<p>
					조회수 <span class="author_info">0</span>
				</p>
				<p>
					좋아요 <span class="author_info like_count">0</span>
				</p>
				<p>
					댓글 <span class="author_info">0</span>
				</p>
			</div>

		</div>

		<!-- 게시판 내용 -->
		<div class="freeboard_content">
			<p>게시판내용</p>
		</div>

		
		<!-- 게시판 버튼 -->
		<div class="text-center">
			<button class="likeitBtn btn-like btn btn-xs" type="button"
				onclick="likeitBtnMain()">
				좋아요 <i class="fa fa-thumbs-up fa-lg"></i>
			</button>
			<button class="dislikeitBtn btn-dislike btn btn-xs" type="button"
				onclick="dislikeitBtnMain()">
				싫어요 <i class="fa fa-thumbs-down fa-lg"></i>
			</button>
		</div>
		<br>
		<div class="text-center">

			<a href="#"><button type="button" class="btn btn-comm-con btn-xs">이전
					페이지</button></a> <a
				href="http://localhost:8080/coinweb_mobile/freeboard/freeboard_update.jsp"><button
					type="button" class="btn btn-comm-con btn-xs">수정하기</button></a> <a
				href="#"><button type="button" class="btn btn-comm-con btn-xs">바로삭제</button></a>
			<a
				href="http://localhost:8080/coinweb_mobile/freeboard/freeboard.jsp"><button
					type="button" class="btn btn-xs">게시글</button></a>
		</div>

<br>
	<!-- 댓글 -->
		<div>
			<span class="reply-title" id="btnReWrite"><strong>Comments</strong></span>
		</div>
		<div class="reply-write">
			<textarea class="form-control" rows="3"></textarea>
		</div>
		<div class="text-right">
			<span id="sizeLimit">0</span> /300
			<button class="reply-write-button btn btn-xs">등록</button>
		</div>


	</div>
	<br><br><br><br><br><br>


	<jsp:include page="../footer_bar.jsp" />

</body>
</html>