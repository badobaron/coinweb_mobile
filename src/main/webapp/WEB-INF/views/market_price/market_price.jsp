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

<link rel="stylesheet"	href="http://localhost:8080/coinweb_mobile/css/market_price.css">
<!-- 브라우저에 표시될 문서 제목 -->
<title>가상화폐 모의거래소 coinweb</title>

<script>

function numberWithCommas(x) {
    return Math.round(x).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
function Floor(n, pos) {
	var digits = Math.pow(10, pos);
	var num = Math.floor(n * digits) / digits;
	return num.toFixed(pos);
}

var now_price = 0;
var coin = "BTC";


	
function GetCoinData(){
	$.get('https://api.bithumb.com/public/ticker/'+coin, function(data) {
		var opening_price = data['data']['opening_price'];
		var closing_price = data['data']['closing_price'];
		var bithumb_krw = parseInt(closing_price);
		var cpYesterday = closing_price - opening_price;
		var percent = (cpYesterday / opening_price) * 100.0;
		now_price = data['data']['sell_price'];
		$('.max_price').html(numberWithCommas(data['data']['max_price']));
		$('.min_price').html(numberWithCommas(data['data']['min_price']));
		$('.buy_price').html(numberWithCommas(data['data']['buy_price']));
		$('.sell_price').html(numberWithCommas(data['data']['sell_price']));
		$('.volume').html(numberWithCommas(parseInt(data['data']['volume_1day']))+coin);
		$('.now_price').html(numberWithCommas(data['data']['sell_price']));
		$('.opening_price').html(numberWithCommas(opening_price));
		if(percent > 0){
			$('.percent').html(Floor(percent,2)+'%').css("color","#43A047").css("font-size","10pt");
			$('.cpYesterday').html('+'+numberWithCommas(cpYesterday)).css("color","#43A047").css("font-size","10pt");
		}else if(percent<0){
			$('.percent').html(Floor(percent,2)+'%').css("color","#E53935").css("font-size","10pt");
			$('.cpYesterday').html(numberWithCommas(cpYesterday)).css("color","#E53935").css("font-size","10pt");
		}else{
			$('.percent').html(Floor(percent,2)+'%').css("font-size","9pt");
			$('.cpYesterday').html(numberWithCommas(cpYesterday)).css("color","#43A047").css("font-size","10pt");
		}
		//setLastPrice();
	});
}        
function GetHoga(){
	$.get('https://api.bithumb.com/public/orderbook/'+coin, function(data) {
		asks = data['data']['asks'];
		bids = data['data']['bids'];
		for(i=0;i<10;i++){
			$('#ask_quantity'+i).html(Floor(data['data']['asks'][i]['quantity'],4));
			$('#ask_price'+i).html(numberWithCommas(data['data']['asks'][i]['price']));
			$('#bid_quantity'+i).html(Floor(data['data']['bids'][i]['quantity'],4));
			$('#bid_price'+i).html(numberWithCommas(data['data']['bids'][i]['price']));
		}
		//i + ') td:eq(1) .per_bar').attr('style', 'width:' + (iCoin / maxCoin) * 100 + '%')
		//fSetHogaBg();
		setTimeout(	"fResetHogaBg()", 10000);
	});
}

function GetTransactions(){
	$.get('https://api.bithumb.com/public/transaction_history/'+coin, function(data) {
		for(var i=0;i<10;i++){$('#trans_price'+i).html(numberWithCommas(data['data'][i]['price']));}
		for(var i=0;i<10;i++){$('#trans_total'+i).html(Floor(data['data'][i]['units_traded'],4));}
	});
}

function fShowData() {
	try {
		GetHoga();
		GetTransactions();
		GetCoinData();
	} catch(e){			
    } finally {
        setTimeout("fShowData()", 3000);
    }
}
</script>

</head>



<body onload="fShowData()">
	
	<!-- 코인웹의 헤더
	폐이지마다 이름이 변경됩니다
	 -->
	 
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="dropdown clearfix no-gutters">
		<a id="dropdownMenu1" href="#" role="button" class="dropdown-toggle text-center" data-toggle="dropdown">
			<p id="coin_name">BTC 비트코인 <b class="fa fa-angle-down"></b></p>
		</a>
		<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
			<li role="presentation col-xs-12"><a role="menuitem" tabindex="-1" href="#"><jsp:include page="../coin_list.jsp" /></a></li>
		</ul>
	</div>
	</nav>
	
	<div class="no-gutters nav2 ">
		<ul class="nav nav-tabs" role="tablist">
			<li class="active"><a href="#hoga" data-toggle="tab">호가</a></li>
			<li><a href="#chart" data-toggle="tab">차트</a></li>
			<li><a href="#orderlist" data-toggle="tab">주문내역</a></li>
		</ul>
		
		<div class="tab-content">
			<div class="tab-pane fade in active" id="hoga">
					<table class="table1" border="1" style="border-color: #fe3e3e3;">
					<thead>
						<tr>
							<td class="col-xs-4" style="color: blue;">매도잔량</td>
							<td class="col-xs-4">가격</td>
							<td class="col-xs-4" style="color: red;">매수잔량</td>
						</tr>
					</thead>
					<tbody>
						<tr class="asks">
							<td><p><span id="ask_quantity9"></span><span class="ask_per_bar"></span></p></td>
							<td class="ask_price" id="ask_price9" onclick="ask_priceSet(9)"></td>
							<td style="background-color: #FFFFFF" rowspan="10">
								<table class="sub table2">
									<tr> 
										<td>현재</td>
										<td class=now_price></td>
									</tr>
									<tr> 
										<td>전일</td>
										<td class=opening_price></td>
									</tr>
									<tr> 
										<td></td>
										<td>
										<span class=cpYesterday></span>
										<span class=percent></span>
										</td>
									</tr>
									<tr id="max_price"> 
										<td>고가</td>
										<td class=max_price></td>
									</tr>
									<tr id="min_price"> 
										<td>저가</td>
										<td class=min_price></td>
									</tr>
									<tr> 
										<td>거래량</td>
										<td class=volume></td>
									</tr>
								</table>
							</td>
						</tr>
						
						<tr class="asks">
							<td><p><span id="ask_quantity8"></span><span class="ask_per_bar"></span></p></td>
							<td class="ask_price" id="ask_price8" onclick="ask_priceSet(8)"></td>	
						</tr>
						<tr class="asks">
							<td><p><span id="ask_quantity7"></span><span class="ask_per_bar"></span></p></td>
							<td class="ask_price" id="ask_price7" onclick="ask_priceSet(7)"></td>
						</tr>
						<tr class="asks">
							<td><p><span id="ask_quantity6"></span><span class="ask_per_bar"></span></p></td>
							<td class="ask_price" id="ask_price6" onclick="ask_priceSet(6)"></td>
						</tr>
						<tr class="asks">
							<td><p><span id="ask_quantity5"></span><span class="ask_per_bar"></span></p></td>
							<td class="ask_price" id="ask_price5" onclick="ask_priceSet(5)"></td>
						</tr>
						<tr class="asks">
							<td><p><span id="ask_quantity4"></span><span class="ask_per_bar"></span></p></td>
							<td class="ask_price" id="ask_price4" onclick="ask_priceSet(4)"></td>
						</tr>
						<tr class="asks">
							<td><p><span id="ask_quantity3"></span><span class="ask_per_bar"></span></p></td>
							<td class="ask_price" id="ask_price3" onclick="ask_priceSet(3)"></td>
						</tr>
						<tr class="asks">
							<td><p><span id="ask_quantity2"></span><span class="ask_per_bar"></span></p></td>
							<td class="ask_price" id="ask_price2" onclick="ask_priceSet(2)"></td>
						</tr>
						<tr class="asks">
							<td><p><span id="ask_quantity1"></span><span class="ask_per_bar"></span></p></td>
							<td class="ask_price" id="ask_price1" onclick="ask_priceSet(1)"></td>
						</tr>
						<tr class="asks">
							<td><p><span id="ask_quantity0"></span><span class="ask_per_bar"></span></p></td>
							<td class="ask_price" id="ask_price0" onclick="ask_priceSet(0)"></td>
						</tr>
					
						<tr class="bids" id="table_line">
							<td style="background-color: #FFFFFF" rowspan="10">
								<table class="sub2 table2">
									<tr> 
										<td>체결가</td>
										<td>거래량</td>
									</tr>
									<tr> 
										<td id="trans_price0"></td>
										<td id="trans_total0"></td>
									</tr>
									<tr> 
										<td id="trans_price1"></td>
										<td id="trans_total1"></td>
									</tr>
									<tr> 
										<td id="trans_price2"></td>
										<td id="trans_total2"></td>
									</tr>
									<tr> 
										<td id="trans_price3"></td>
										<td id="trans_total3"></td>
									</tr>
									<tr> 
										<td id="trans_price4"></td>
										<td id="trans_total4"></td>
									</tr>
									<tr> 
										<td id="trans_price5"></td>
										<td id="trans_total5"></td>
									</tr>
									<tr> 
										<td id="trans_price6"></td>
										<td id="trans_total6"></td>
									</tr>
									<tr> 
										<td id="trans_price7"></td>
										<td id="trans_total7"></td>
									</tr>
									<tr> 
										<td id="trans_price8"></td>
										<td id="trans_total8"></td>
									</tr>
									<tr> 
										<td id="trans_price9"></td>
										<td id="trans_total9"></td>
									</tr>
								</table>
							</td>						
							<td class="bid_price" id="bid_price0" onclick="bid_priceSet(0)"></td>
							<td><p><span id="bid_quantity0"></span><span class="bid_per_bar"></span></p></td>
						</tr>
						<tr class="bids">
							<td class="bid_price" id="bid_price1" onclick="bid_priceSet(1)"></td>
							<td><p><span id="bid_quantity1"></span><span class="bid_per_bar"></span></p></td>
						</tr>
						<tr class="bids">
							<td class="bid_price" id="bid_price2" onclick="bid_priceSet(2)"></td>
							<td><p><span id="bid_quantity2"></span><span class="bid_per_bar"></span></p></td>
						</tr>
						<tr class="bids">
							<td class="bid_price" id="bid_price3" onclick="bid_priceSet(3)"></td>
							<td><p><span id="bid_quantity3"></span><span class="bid_per_bar"></span></p></td>
						</tr>
						<tr class="bids">
							<td class="bid_price" id="bid_price4" onclick="bid_priceSet(4)"></td>
							<td><p><span id="bid_quantity4"></span><span class="bid_per_bar"></span></p></td>
						</tr>
						<tr class="bids">
							<td class="bid_price" id="bid_price5" onclick="bid_priceSet(5)"></td>
							<td><p><span id="bid_quantity5"></span><span class="bid_per_bar"></span></p></td>
						</tr>
						<tr class="bids">
							<td class="bid_price" id="bid_price6" onclick="bid_priceSet(6)"></td>
							<td><p><span id="bid_quantity6"></span><span class="bid_per_bar"></span></p></td>
						</tr>
						<tr class="bids">
							<td class="bid_price" id="bid_price7" onclick="bid_priceSet(7)"></td>
							<td><p><span id="bid_quantity7"></span><span class="bid_per_bar"></span></p></td>
						</tr>
						<tr class="bids">
							<td class="bid_price" id="bid_price8" onclick="bid_priceSet(8)"></td>
							<td><p><span id="bid_quantity8"></span><span class="bid_per_bar"></span></p></td>
						</tr>
						<tr class="bids">
							<td class="bid_price" id="bid_price9" onclick="bid_priceSet(9)"></td>
							<td><p><span id="bid_quantity9"></span><span class="bid_per_bar"></span></p></td>
						</tr>
					</tbody>
				</table>
 			</div>
			<div class="tab-pane fade" id="chart">
				<div id="container" ></div>
			</div>
			<div class="tab-pane fade" id="orderlist">
				<div class="button">
					<ul class="nav nav-pills">
						<li class="active"><a href="#order_wait" data-toggle="pill">대기주문</a></li>
						<li><a href="#history" data-toggle="pill">거래내역</a></li>
					</ul>
				</div>
				<div class="tab-content">
					<div class="tab-pane in active" id="order_wait">
						<table class="coinWallet col-xs-12" id="order_table">
					     	<thead>
					     		<tr>
					     			<th class="col-xs-2">구분</th>
					     			<th class="col-xs-3">가격</th>
					     			<th class="col-xs-5">주문수량/체결수량</th>
					     			<th class="col-xs-2">취소</th>
					     		</tr>
					     		<tr id="order_wait">
					     			<td class="coinWallet_2" colspan="4" style="text-align: center; font-size: 18px;">대기주문 내역이 없습니다.</td>
					     		</tr>
					     	</thead>
					     	<tbody>
					     	</tbody>
					     </table>
					</div>
					<div class="tab-pane" id="history">
						<table class="coinWallet col-xs-12"  id="history_table">
					      	<thead>
					     		<tr>
					     			<th class="col-xs-3">구분</th>
					     			<th class="col-xs-3">가격</th>
					     			<th class="col-xs-3">거래량</th>
									<th class="col-xs-3">시간</th>
					     		</tr>
					     		<tr id="history_wait">
					     			<td class="coinWallet_2" colspan="4" style="text-align: center; font-size: 18px;">거래내역이 없습니다.</td>
					     		</tr>
					     	</thead>
					     	<tbody>
					     	</tbody>
					     </table>
					</div>
				</div>			
			</div>
		</div>
	</div>
	

	<jsp:include page="../footer_bar.jsp" />
</body>
</html>