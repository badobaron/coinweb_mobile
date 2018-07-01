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
	href="http://localhost:8080/coinweb_mobile/css/mypage.css">

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
	

<div class="mypage">

<div class="container" style="margin-top: 60px;">
  <div class="media">
    <div class="media-left">
     <i class="fa fa-user-circle-o" style="font-size: 60px;"></i>
    </div>
    <div class="media-body">
      <h4 class="media-heading">UserID</h4>
      <br>
      <p>나의 총 자산 : 30,000,000 원</p>
    </div>
  </div>
  <hr>
 </div>
 
 
<ul class="list-group">
   <li class="list-group-item"><a  onclick="document.getElementById('id02').style.display='block'" style="width:auto; cursor: pointer;">패스워드 변경 <span class="next">></span></a></li>
   <li class="list-group-item"><a href="http://localhost:8080/coinweb_mobile/bbs/query_write.jsp">1:1 문의하기 <span class="next">></span></a></li>
   <li class="list-group-item"><a href="http://localhost:8080/coinweb_mobile/bbs/query_list.jsp">나의 문의내역<span class="next">></span></a></li>
  </ul>

</div>
	<!-- 비번변경 모달 시작-->
      <div id="id02" class="modal">
		<form class="modal-content animate" name="passUpdate"
			action="#"
			method="post">
			<div class="imgcontainer">
				<span onclick="document.getElementById('id02').style.display='none'"
					class="close" title="Close Modal">&times;</span>
			</div>
			<h1 id="pc"> 비밀번호 변경</h1>
			<div class="ps_container">
				<input type="text" value="# " id="uid" disabled> 
				<input type="hidden" name="email" value="#" /> 
				<input type="password" placeholder="현재 비밀번호" id="upass"> 
				<span id="upw_msg"></span> 
				<input type="password" name="pass" placeholder="새 비밀번호" id="npass">
				<span id="nupw_msg"></span>
				<input type="password" placeholder="새 비밀번호 재입력" id="ncpass">
				
				<p id="p1">이메일 변경을 원하시는 경우 1:1 문의하기를 이용해 주세요.</p>
			
				<button type="submit" id="pcbtn">변경하기</button>
			</div>
		</form>
		
	</div>
	<!-- 비밀번호 변경 끝 -->








	<jsp:include page="../footer_bar.jsp" />
</body>
</html>