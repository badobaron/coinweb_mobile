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



<!-- bootstrap css js 3.3.7 / font-awesome 4.7.0 / jquery 3.3.1
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">	
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->	
	
	
	
	
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/coin_list.css">
<!-- 브라우저에 표시될 문서 제목 -->
<title>가상화폐 모의거래소 coinweb</title>

<script type="text/javascript">


function bithumb (){
	$.get('https://api.bithumb.com/public/ticker/ALL', function(data) {
		var bithumb_array = ['BTC','ETH','DASH','LTC','ETC','XRP','BCH','XMR','QTUM','ZEC','BTG','EOS'];
		for (var key in bithumb_array){
			var bithumb_now = bithumb_array[key];
			var opening_price = data['data'][bithumb_now]['opening_price'];
			var closing_price = data['data'][bithumb_now]['closing_price'];
			var bithumb_krw = parseInt(closing_price);
			var cpYesterday = closing_price - opening_price
			var percent = (cpYesterday / opening_price) * 100.0;
			
			if(percent > 0)
				$('#'+bithumb_now).html(bithumb_krw.toLocaleString()+' &nbsp; <i class="fa fa-caret-up"></i> ').css("color","#43A047");
			else if(percent<0)
				$('#'+bithumb_now).html(bithumb_krw.toLocaleString()+' &nbsp; <i class="fa fa-caret-down"></i> ').css("color","#E53935");
			else
				$('#'+bithumb_now).html(bithumb_krw.toLocaleString()+' &nbsp; - ').css("color","#00");
			
			if(percent > 0)
				$('#p_'+bithumb_now).html('&nbsp;'+percent.toFixed(2)+"%").css("color","#43A047");
			else if(percent<0)
				$('#p_'+bithumb_now).html(percent.toFixed(2)+"%").css("color","#E53935");
			else
				$('#p_'+bithumb_now).html(percent.toFixed(2)+"%").css("color","#00");
		}
	});
}
function proc() {
	try {
		bithumb();
	} catch(e){			
    } finally {
        setTimeout("proc()", 3000);
    }
}


</script>

</head>

<body>
	


	<session class="index_cointable">
	<div class="container coinlist">
		<table class="table table-condensed">
			<thead>
				<tr>
					<td class="col-xs-1"><img src="${pageContext.request.contextPath}/img/btc.png"></td>
					<td class="col-xs-4">BTC<p class="coin_name">비트코인</p></td>
					<td class="col-xs-5"><p id="BTC"></p></td>
					<td class="col-xs-2"><span id="p_BTC" style="color: rgb(67, 160, 71);"></span></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><img src="${pageContext.request.contextPath}/img/bch.png"></td>
					<td>BCH<p class="coin_name">비트코인 캐시</p></td>
					<td><p id="BCH"></p></td>
					<td><span id="p_BCH" style="color: rgb(67, 160, 71);"></span></td>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/img/eth.png"></td>
					<td>ETH<p class="coin_name">이더리움</p></td>
					<td><p id="ETH"></p></td>
					<td><span id="p_ETH" style="color: rgb(67, 160, 71);"></span></td>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/img/etc.png"></td>
					<td>ETC<p class="coin_name">이더리움 클래식</p></td>
					<td><p id="ETC"></p></td>
					<td><span id="p_ETC" style="color: rgb(67, 160, 71);"></span></td>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/img/ripple.png"></td>
					<td>XRP<p class="coin_name">리플</p></td>
					<td><p id="XRP"></p></td>
					<td><span id="p_XRP" style="color: rgb(67, 160, 71);"></span></td>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/img/qtum.png"></td>
					<td>QTUM<p class="coin_name">퀀텀</p></td>
					<td><p id="QTUM"></p></td>
					<td><span id="p_QTUM" style="color: rgb(67, 160, 71);"></span></td>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/img/litecoin.png"></td>
					<td>LTC<p class="coin_name">라이트코인</p></td>
					<td><p id="LTC"></p></td>
					<td><span id="p_LTC" style="color: rgb(67, 160, 71);"></span></td>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/img/xmr.png"></td>
					<td>XMR<p class="coin_name">모네로</p></td>
					<td><p id="XMR"></p></td>
					<td><span id="p_XMR" style="color: rgb(67, 160, 71);"></span></td>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/img/btg.png"></td>
					<td>BTG<p class="coin_name">비트코인 골드</p></td>
					<td><p id="BTG"></p></td>
					<td><span id="p_BTG"></span></td>
				</tr>
			
					<tr>
					<td><img src="${pageContext.request.contextPath}/img/zec.png"></td>
					<td>ZEC<p class="coin_name">제트캐시</p></td>
					<td><p id="ZEC"></p></td>
					<td><span id="p_ZEC"></span></td>
				</tr>

			</tbody>
		</table>
	</div>

	</session>
	
	





</body>
</html>