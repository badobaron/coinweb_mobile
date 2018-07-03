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
>
<title>Coinweb - 가상화폐 모의투자</title>

<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<!-- 페이징처리 -->
<script src="http://localhost:8080/coinweb/js/am-pagination.js"></script>
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/coinweb/css/am-pagination.css">
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


</head>

<body>



	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid text-center">
		<p>COINWEB</p>
	</div>
	</nav>




	<div class="container" style="margin-top: 40px;">
		<div class="row freeboard_header">
			<hr>
			<div class="col-xs-4"></div>
			<div class="col-xs-4 text-center">
				<div class="freeboard_header_title">
					<p style="font-weight: bold;">커뮤니티</p>
				</div>
			</div>
			<div class="col-xs-4 text-right">
				<a data-toggle="tooltip" type="button" id="freeboard_write_btn"
					title="글쓰기"> <i class="fa fa-pencil-square-o"
					style="font-size: 25px;"></i></a>
			</div>
		</div>
	</div>
	<hr>





<jsp:include page="freeboard_list.jsp"></jsp:include>













	<div class="container">
		<form action="/coinweb/freeboard_search.do?rpage=${rpage}"
			method="get">
			
			<div class="col-xs-4">
				<select name="findValue" class="form-control input-sm" style=" float: left;">
						<option value=title>제목</option>
						<option value=content>내용</select>
			</div>

			<div class="input-group form-group-sm col-xs-8">
				<input name="search" type="text" class="form-control"
					placeholder="검색" " style="float: left;">
				<div class="input-group-btn">
					<button class="btn btn-default " type="submit">
						<i class="fa fa-search" style="font-size: 16px; float: left;"></i>
					</button>
				</div>

			</div>





		</form>
	</div>

	<div id="ampaginationsm" style="text-align: center;"></div>


	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
	



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
		<a class="" href="${pageContext.request.contextPath}/index.do"><i
			class="fa fa-home"></i><br>
			<p>홈</p></a> <a href="${pageContext.request.contextPath}/market_price.do"><i
			class="fa fa-line-chart"></i><br>
			<p>시세</p></a> <a href="${pageContext.request.contextPath}/business.do"><i
			class="fa fa-exchange"></i><br>
			<p>거래</p></a> <a href="${pageContext.request.contextPath}/wallet.do"><i
			class="fa fa-credit-card-alt"></i><br>
			<p>내지갑</p></a> <span onclick="openNav()"><i class="fa fa-bars"></i><br>
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
	$(document).ready(function($) {
		var pager = $('#ampaginationsm').pagination({
			
		    maxSize: 7,	    		// max page size
		    totals: '${dbCount}',	// total pages	
		    page: '${rpage}',		// initial page		
		    pageSize: 10,			// max number items per page
		
		    // custom labels		
		    lastText: '&raquo;&raquo;', 		
		    firstText: '&laquo;&laquo;',		
		    prevText: '&laquo;',		
		    nextText: '&raquo;',
				     
		    btnSize:'sm'	// 'sm'  or 'lg'		
			});
		
		$('#ampaginationsm').on('am.pagination.change',function(e){
			   $('.showlabelsm').text('The selected page no: '+e.page);
	           $(location).attr('href', "/coinweb/freeboard.do?rpage="+e.page);         
	   		});
		});	
	
	$("#freeboard_write_btn").click(function($){
		var sid = '<c:out value="${sid}"/>';

		if(sid==""){
			alert("로그인 후 이용하실수 있습니다.");
		}else{
			location.href= '/coinweb/freeboard_write.do';			
		}
	});
</script>

</html>