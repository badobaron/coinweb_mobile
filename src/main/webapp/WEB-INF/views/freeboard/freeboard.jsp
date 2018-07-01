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

<link rel="stylesheet"
	href="http://localhost:8080/coinweb_mobile/css/freeboard.css">

<!-- 브라우저에 표시될 문서 제목 -->
<title>가상화폐 모의거래소 coinweb</title>
</head>
<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
});
</script>
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
				<a
					href="http://localhost:8080/coinweb_mobile/freeboard/freeboard_write.jsp"
					data-toggle="tooltip" title="글쓰기"> <i
					class="fa fa-pencil-square-o" style="font-size: 25px;"></i></a>
			</div>
		</div>
	</div>
	<hr>



	<jsp:include page="freeboard_list.jsp" />

  <div class="container">
 <form action="*">
    <div class="input-group form-group-sm">
      <input type="text" class="form-control" placeholder="검색" name="search">
      <div class="input-group-btn">
        <button class="btn btn-default " type="button">
        <i class="fa fa-search" style="font-size: 16px; float: left;" ></i></button>
      </div>
    </div>
  </form>
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
 
 <br><br><br><br><br><br>



<jsp:include page="../footer_bar.jsp" />

</body>
</html>