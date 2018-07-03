<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<script>
var sid = ${sid};
function numberWithCommas(x) {
    return Math.round(x).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
function Floor(n, pos) {
	var digits = Math.pow(10, pos);
	var num = Math.floor(n * digits) / digits;
	return num.toFixed(pos);
}
function fShowData() {
	try {
		GetWalletList();
		GetOrderList();
		GetHistoryList();
	} catch(e){			
    } finally {
        setTimeout("fShowData()", 3000);
    }
}
function GetWalletList(){
	if(sid!=0){
		$.ajax({
			url : '${pageContext.request.contextPath}/wallet_list.do',
			type :'GET',	
			data : 'id='+sid,
			dataType : 'json',
			success : function(data){
					$("#krw").html(numberWithCommas(data[0].available)+"원");
					$("#total").html(numberWithCommas(data[0].tot)+"원");
					$("#tot").html(numberWithCommas(data[0].tot)+"원");
					if(data[0].tot == 30000000)
						$("#profit").html("0.00%");	
					else if(data[0].tot > 30000000)
						$("#profit").html("+"+Floor((data[0].tot/30000000)*100-100,2)+"%").css("color","#43A047");
					else if(data[0].tot < 30000000)
						$("#profit").html(Floor((data[0].tot/30000000)*100-100,2)+"%");		
					for(var i=0;i<data.length;i++){
						avail = (data[i].available).toFixed(4)
						if (avail == 0) avail = 0;
						$('#'+data[i].coin).html(avail+"&nbsp;"+data[i].coin);
					}
				}	
			});
	}
}	

</script>
	
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/wallet.css">
<title>Insert title here</title>
</head>
<body onload="fShowData()">

	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid text-center">
		<p>COINWEB</p>
	</div>
	</nav>

<div class="contatner" style="margin-top:60px; margin-bottom: 60px; ">
<hr>
<div class="col-xs-6">총 자산 : </div>
<div class="col-xs-6 text-right"><p id="total"></p><p id="profit"></p></div>

</div>

<hr>

	<session class="index_cointable">
	<c:if test="${sid eq vo.id}">
	<div class="login_check">
		<span>로그인 후에 조회가 가능합니다.
			<!-- <p><button type="button" class="btn btn-default">
			<a class="cd-main-nav__item cd-main-nav__item--signin" href="#0"
			data-signin="login" onclick="closeNav()">로그인</a>
			</button>
			</p> -->
		</span>
	</div>
	</c:if>
	<div class="container coinlist">
		<table class="table table-condensed">
			<thead>
				<tr>
					<td class="col-xs-1"><img src="${pageContext.request.contextPath}/img/KRW.png"></td>
					<td class="col-xs-4">KRW<p class="coin_name">원화</p></td>
					<td class="col-xs-7"><span id="krw"></span></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><img src="${pageContext.request.contextPath}/img/btc.png"></td>
					<td>BTC<p class="coin_name">비트코인</p></td>
					<td><span id="BTC"></span></td>
					
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/img/bch.png"></td>
					<td>BCH<p class="coin_name">비트코인 캐시</p></td>
					<td><span id="BCH"></span></td>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/img/eth.png"></td>
					<td>ETH<p class="coin_name">이더리움</p></td>
					<td><span id="ETH"></span></td>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/img/etc.png"></td>
					<td>ETC<p class="coin_name">이더리움 클래식</p></td>
					<td><span id="ETC"></span></td>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/img/ripple.png"></td>
					<td>XRP<p class="coin_name">리플</p></td>
					<td><span id="XRP"></span></td>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/img/dash.png"></td>
					<td>DASH<p class="coin_name">대시</p></td>
					<td><span id="DASH"></span></td>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/img/litecoin.png"></td>
					<td>LTC<p class="coin_name">라이트코인</p></td>
					<td><span id="LTC"></span></td>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/img/xmr.png"></td>
					<td>XMR<p class="coin_name">모네로</p></td>
					<td><span id="XMR"></span></td>
				</tr>			
				<tr>
					<td><img src="${pageContext.request.contextPath}/img/zec.png"></td>
					<td>ZEC<p class="coin_name">제트캐시</p></td>
					<td><span id="ZEC"></span></td>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/img/qtum.png"></td>
					<td>QTUM<p class="coin_name">퀀텀</p></td>
					<td><span id="QTUM"></span></td>
				</tr>

			</tbody>
		</table>
	</div>

	</session>
	<br><br><br><br><br>
	
	
	<jsp:include page="../footer_bar.jsp" />

</body>
</html>