<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  	
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
	href="${pageContext.request.contextPath}/css/index.css">

<!-- 브라우저에 표시될 문서 제목 -->
<title>가상화폐 모의거래소 coinweb</title>

</head>



<body>

	<!-- 코인웹의 헤더
	폐이지마다 이름이 변경됩니다
	 -->
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid text-center">
		<p>COINWEB</p>
	</div>
	</nav>

	<div class="index_header text-center">
		
		<div class="index_header_text">
		<p>도전! 암호화폐 모의거래!</p>
		<i class="fa fa-rocket" aria-hidden="true"></i>
		<br>
		<div class="index_headerp">
		<p>실제 거래소의 실시간 데이터에 기반하여</p> <p>모의 거래를 해보세요!
		</p>
		</div>
		</div>
	</div>


	<div class="coinlist">
		<jsp:include page="coin_list.jsp" />
	</div>
	<br>


	<!-- 랭킹 -->
	<div class="index_freeboard_list container">
		<a href="${pageContext.request.contextPath}/rangking.do"><h2>랭킹 ></h2></a>
	</div>
	<br>


	<!-- 게시판 -->
	<div class="index_freeboard_list container">
		<a href="${pageContext.request.contextPath}/freeboard.do"><h2>자유게시판 ></h2></a>
	</div>
	<br>
	
	<!-- 게시판 -->
	<div class="index_freeboard_list container">
		<a href="${pageContext.request.contextPath}/guide.do"><h2>이용가이드 ></h2></a>
	</div>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>


	<jsp:include page="footer_bar.jsp" />
</body>




</html>