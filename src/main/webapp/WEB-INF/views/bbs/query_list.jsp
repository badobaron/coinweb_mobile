<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<!-- 페이징 처리 코드 시작 -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bbs.css">
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css"
	rel="stylesheet">
<!-- 페이징처리 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/freeboard.css">
<!-- 페이징처리 -->
<script src="${pageContext.request.contextPath}/js/am-pagination.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/am-pagination.css">

<script>
	$(document).ready(function($) {

		var pager = $('#ampaginationsm').pagination({

			maxSize : 7, // max page size
			totals : '${dbCount}', // total pages	
			page : '${rpage}', // initial page		
			pageSize : 10, // max number items per page

			// custom labels		
			lastText : '&raquo;&raquo;',
			firstText : '&laquo;&laquo;',
			prevText : '&laquo;',
			nextText : '&raquo;',

			btnSize : 'sm' // 'sm'  or 'lg'		
		});

		$('#ampaginationsm').on('am.pagination.change', function(e) {
			$('.showlabelsm').text('The selected page no: ' + e.page);
			$(location).attr('href', "/coinweb/bbs.do?rpage=" + e.page);
		});
	});
	$("#boxbtn").click(function($) {
		var sid = '<c:out value="${sid}"/>';

		if (sid == "") {
			alert("로그인 후 이용하실수 있습니다.");
		} else {
			location.href = '${pageContext.request.contextPath}/write.do';
		}
	});
</script>
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
		<div class="row freeboard_header">
			<hr>
			<div class="col-xs-4"></div>
			<div class="col-xs-4 text-center">
				<div class="freeboard_header_title">
					<p style="font-weight: bold;">문의글</p>
				</div>
			</div>
			<div class="col-xs-4 text-right">
				<a href="${pageContext.request.contextPath}/query_write.do"
					data-toggle="tooltip" type="button" id="freeboard_write_btn"
					title="글쓰기"> <i class="fa fa-pencil-square-o"
					style="font-size: 25px;"></i></a>
			</div>
		</div>
	</div>
	<hr>





	
		<div class="container">

			<!-- 글목록 -->

			<c:forEach items="${list}" var="vo">
				<div class="media">
					<div class="media-left">
						<h5>${vo.bbsID}</h5>
					</div>
					<div class="media-body">
                       <div class="datedate">
						<h4 class="media-heading">
							<a href="query_view.do?bbsID=${vo.bbsID}">${vo.bbsTitle}</a>
						</h4>
						</div>
						<div class="row">
							<div class="col-xs-8">${vo.email}</div>
							<br>
							<div class="col-xs-8 text-right">${vo.fdate}</div>
							<br>
						</div>
					</div>
				</div>
				<hr>
			</c:forEach>






		</div>




	<jsp:include page="../footer_bar.jsp" />


</body>
</html>