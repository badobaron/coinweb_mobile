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
	href="${pageContext.request.contextPath}/css/wallet.css">
<title>Insert title here</title>
</head>
<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid text-center">
		<p>COINWEB</p>
	</div>
	</nav>





<div class="contatner" style="margin-top:60px; margin-bottom: 60px; ">
<hr>
<div class="col-xs-6">총 자산 : </div>
<div class="col-xs-6 text-right">30,000,000 원</div>

</div>

<hr>


	<session class="index_cointable">
	<div class="container coinlist">
		<table class="table table-condensed">
			<thead>
				<tr>
					<td class="col-xs-1"><img src="${pageContext.request.contextPath}/img/KRW.png"></td>
					<td class="col-xs-4">KRW<p class="coin_name">원화</p></td>
					<td class="col-xs-7"><span>0 KRW</span></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><img src="${pageContext.request.contextPath}/img/bch.png"></td>
					<td>BCH<p class="coin_name">비트코인 캐시</p></td>
					<td><span>0 BCH</span></td>
					
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/img/bch.png"></td>
					<td>BCH<p class="coin_name">비트코인 캐시</p></td>
					<td><span>0 BCH</span></td>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/img/eth.png"></td>
					<td>ETH<p class="coin_name">이더리움</p></td>
					<td><span>0 BTC</span></td>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/img/etc.png"></td>
					<td>ETC<p class="coin_name">이더리움 클래식</p></td>
					<td><span>0 ETC</span></td>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/img/ripple.png"></td>
					<td>XRP<p class="coin_name">리플</p></td>
					<td><span>0 XRP</span></td>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/img/qtum.png"></td>
					<td>QTUM<p class="coin_name">퀀텀</p></td>
					<td><span>0 QTUM</span></td>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/img/litecoin.png"></td>
					<td>LTC<p class="coin_name">라이트코인</p></td>
					<td><span>0 LTC</span></td>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/img/xmr.png"></td>
					<td>XMR<p class="coin_name">모네로</p></td>
					<td><span>0 XMR</span></td>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/img/btg.png"></td>
					<td>BTG<p class="coin_name">비트코인 골드</p></td>
					<td><span>0 BTG</span></td>
				</tr>
			
					<tr>
					<td><img src="${pageContext.request.contextPath}/img/zec.png"></td>
					<td>ZEC<p class="coin_name">제트캐시</p></td>
					<td><span>0 ZEC</span></td>
				</tr>

			</tbody>
		</table>
	</div>

	</session>
	<br><br><br><br><br>
	
	
	<jsp:include page="../footer_bar.jsp" />

</body>
</html>