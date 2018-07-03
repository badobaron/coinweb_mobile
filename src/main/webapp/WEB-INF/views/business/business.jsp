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
	href="${pageContext.request.contextPath}/css/business.css">
<!-- 브라우저에 표시될 문서 제목 -->
<title>가상화폐 모의거래소 coinweb</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script>

var now_price = 0;
var coin = "BTC";

var avail_won = 0;
var avail_coin = 0;
var last_price = 0;
var cancel_idx = 0;
var total_buy_price = 0;
var total_sell_price = 0;

var sid = '${sid}';


function numberWithCommas(x) {
    return Math.round(x).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
function Floor(n, pos) {
	var digits = Math.pow(10, pos);
	var num = Math.floor(n * digits) / digits;
	return num.toFixed(pos);
}

function setLastPrice() {
 	if($('#buy_price').val()*1.0 <= 0) $('#buy_price').val(now_price);
 	if($('#sell_price').val()*1.0 <= 0) $('#sell_price').val(now_price);
 	fCalcData();
 }
function ask_priceSet(i){
	price = asks[i]['price'];
	$('#buy_price').val(price);
 	$('#sell_price').val(price);
 	fCalcData();
}
function bid_priceSet(i){
	price = bids[i]['price'];
	$('#buy_price').val(price);
 	$('#sell_price').val(price);
 	fCalcData();
}

function setHogaPrice(prc) {
	$('#buy_price').val(prc);
	$('#sell_price').val(prc);
	fCalcData();
}
function fCalcData() {
	// 금액-수량 계산하기
	// 매수 데이터 계산
	// 1. 최대 구매가능 코인수
	if($('#buy_price').val() > 0) {
		var max_buy_coin = avail_won / $('#buy_price').val();
		$('#max_buy_coin').text(Math.floor(max_buy_coin * 10000)/10000+"원");
	}
	// 2. 총 매수금액 계산하기
	if($('#buy_unit').val() > 0) {
		if( $('#buy_unit').val() * 1.0 > $('#max_buy_coin').text() * 1.0 ) {
			$('#buy_unit').val($('#max_buy_coin').text());
		}
		// 총 매수금액 계산하기
		total_buy_price = $('#buy_price').val() * $('#buy_unit').val();
	}else{
		total_buy_price = 0;
	}
	$('#total_buy_price').html(numberWithCommas(total_buy_price) + " <span>원</span>");
	$('#total_buy_coin').html(($('#buy_unit').val() * 1.0) + " <span>" + coin + "</span>");

	// 매도 데이터 계산
	// 1. 최대 매도가능 금액
	if($('#sell_price').val() > 0) {
		var max_sell_price = avail_coin * $('#sell_price').val();
		$('#max_sell_price').text(numberWithCommas(max_sell_price)+"원");
	}
	// 2. 총 매도금액 계산하기
	if($('#sell_unit').val() > 0) {
		if( avail_coin < $('#sell_unit').val() * 1.0 ) {
			$('#sell_unit').val(Math.floor(avail_coin * 10000)/10000);
		}
		// 총 매도금액 계산하기
		total_sell_price = $('#sell_price').val() * $('#sell_unit').val();
	}else{
		total_sell_price = 0;
	}
	$('#total_sell_price').html(numberWithCommas(total_sell_price) + " <span>원</span>");
	$('#total_sell_coin').html(($('#sell_unit').val()*1.0) + " <span>" + coin + "</span>");


}
function GetHoga(){
	$.get('https://api.bithumb.com/public/orderbook/'+coin, function(data) {
		asks = data['data']['asks'];
		bids = data['data']['bids'];
		
		maxCoin = 0;	
		
		for(i=0;i<10;i++){
			if(maxCoin < data['data']['asks'][i]['quantity']){ 
				maxCoin = Floor(data['data']['asks'][i]['quantity'],4);
			}
		}
		for(i=0;i<10;i++){
			if(maxCoin < data['data']['bids'][i]['quantity']){
				maxCoin = Floor(data['data']['bids'][i]['quantity'],4);
			}
		}
		for(i=0;i<10;i++){
			
			$('#ask_quantity'+i).html(Floor(data['data']['asks'][i]['quantity'],4));
			$('#ask_price'+i).html(numberWithCommas(data['data']['asks'][i]['price']));
			$('#ask_per_bar'+i).attr('style', 'width:' + (Floor(data['data']['asks'][i]['quantity'],4) / maxCoin) * 25 + '%')
			$('#bid_quantity'+i).html(Floor(data['data']['bids'][i]['quantity'],4));
			$('#bid_price'+i).html(numberWithCommas(data['data']['bids'][i]['price']));
			$('#bid_per_bar'+i).attr('style', 'width:' + (Floor(data['data']['bids'][i]['quantity'],4) / maxCoin) * 25 + '%')
		}
		now_price = data['data']['asks'][0]['price'];
		
		setLastPrice();
	});
}

function GetMyData(){
	if(sid!=0){
		$.ajax({
			url : '${pageContext.request.contextPath}/wallet_result.do',
			type :'GET',	
			data : 'id='+sid+'&coin='+coin,
			dataType : 'json',
			success : function(data){
					$("#avail_won").html(numberWithCommas(data.available-data.using));
					$("#avile_coin").html((data.coin_avail-data.coin_using).toFixed(4));
					$("#won_tot").html(numberWithCommas(data.available));
					$("#coin_tot").html((data.coin_tot).toFixed(4)+coin);
					avail_won = data.available-data.using;
					avail_coin = data.coin_avail-data.coin_using;
				}	
			});
	}
}	

//주문내역
function GetOrderList(){
	$.ajax({
		url : '${pageContext.request.contextPath}/order_list.do',
		type :'GET',	
		data : 'id='+sid+'&coin='+coin,
		dataType : 'json',
		success : function(data){
			if(data.length != 0) $("#order_wait").hide();
			else if(data.length == 0) $("#order_wait").show();
			$('#order_table > tbody').empty();
			for(var i=0;i<data.length;i++){
				var type = data[i].type;
				if(type == 'B')	type = "<td>"+data[i].coin+"/<span style='color:red;'>매수</span></td>"; else type = "<td>"+data[i].coin+"/<span style='color:blue;'>매도</span></td>";
				code = "<tr>"+type+"<td>"+numberWithCommas(data[i].price)+"</td><td>"
					+ Floor(data[i].amount,4)+"/"+Floor(data[i].amount_c,4)+"</td><td><a style='cursor:pointer;' data-toggle='modal' data-target='#order_cancel_Modal' onclick='closeNav2()' data-idx="+data[i].idx+" data-type="+data[i].type+">취소</a></td></tr>";
				$('#order_table > tbody:last').append(code);
			}
		}
	});
}
//거래내역
function GetHistoryList(){
	$.ajax({
		url : '${pageContext.request.contextPath}/history_list.do',
		type :'GET',	
		data : 'id='+sid+'&coin='+coin,
		dataType : 'json',
		success : function(data){
			if(data.length != 0) $("#history_wait").hide();
			else if(data.length == 0) $("#history_wait").show();
			$('#history_table > tbody').empty();
			var length = 0;
			if(data.length < 5) lenght = data.length; else length = 5;
			for(var i=0;i<length;i++){
				var type = data[i].type;
				if(type == 'B')	type = "<td>"+data[i].coin+"/<span style='color:red;'>매수</span></td>"; else type = "<td>"+data[i].coin+"/<span style='color:blue;'>매도</span></td>";
				code = "<tr>"+type+"<td>"+numberWithCommas(data[i].price)+"</td><td>"
					+Floor(data[i].amount,4)+"</td><td>"+data[i].date+"</td>";
				$('#history_table > tbody:last').append(code);
			}
		}
	});
}


$(function(){
	// 퍼센트 버튼 클릭시
	$('.btn_buy_percent').click(function (e) {
		if($('#buy_price').val() > 0) {
			var pct = (avail_won * $(this).data('pct') / 100);
			var pct_buy_coin =  pct / $('#buy_price').val();
			$('#buy_unit').val(Floor(pct_buy_coin,4));
			fCalcData();
		}
	});
	
	$('.btn_sell_percent').click(function (e) {
		if(avail_coin > 0) {
			var pct_sell_coin = (avail_coin * $(this).data('pct') / 100);
			$('#sell_unit').val(Floor(pct_sell_coin,4));
			fCalcData();
		}
	});
	
	// 구매하기
	$('#btn_buy').click(function () {
		if(total_buy_price > 0 && avail_won>=total_buy_price) {
			$('#modal_buy_price').text(numberWithCommas(total_buy_price));
			$('#order_buy_Modal').modal('show');
		}
	});
	
	$('#btn_order_buy').click(function() {
			$('#order_buy_Modal').modal('hide');
			
			var buy_price = $('#buy_price').val();
			var buy_unit = $('#buy_unit').val();
			$.ajax({
				url : '${pageContext.request.contextPath}/order.do',
				type : 'GET',
				data : 'id='+sid+'&coin='+coin+'&price='+buy_price+'&amount='+buy_unit+'&type=B',
				dataType: 'json',
				success:function(data){
					if(data.length != 0){
						GetMyData();
						GetOrderList();
						GetHistoryList();
						$('#buy_unit').val(0);
						fCalcData();
					}
				}
			});
	});

	// 판매하기
	$('#btn_sell').click(function (e) {
		if($('#sell_unit').val() * 1.0 > 0 && avail_coin >= $('#sell_unit').val() * 1.0 ) {
			$('#modal_sell_unit').text($('#sell_unit').val());
			$('#order_sell_Modal').modal('show');
		}
	});
	
	$('#btn_order_sell').click(function() {
		$('#order_sell_Modal').modal('hide');
			$.ajax({
				type:"GET",
				url:"${pageContext.request.contextPath}/order.do",
				data:"id="+sid+"&coin="+coin+"&price="+$('#sell_price').val()+"&amount="+$('#sell_unit').val()+"&type=S",
				dataType: 'json',
				success:function(data){
					if(data.length != 0){
						GetOrderList();
						GetHistoryList();
						GetMyData();
						$('#sell_unit').val(0);
						fCalcData();
					}
				}
			});
	});
	
	// 주문 취소 다이얼로그 뜰때 값 셋팅
	$('#order_cancel_Modal').on('show.bs.modal', function (event){
		cancel_idx = $(event.relatedTarget).data('idx');
		type = $(event.relatedTarget).data('type');
	});

	$('#btn_order_cancel').click(function() {
		$('#order_cancel_Modal').modal('hide');
		$.ajax({
			type:'POST',
			url:'${pageContext.request.contextPath}/order_cancel.do',
			data:'id='+sid+'&coin='+coin+'&idx='+cancel_idx+'&type='+type,
			success:function(data){
					GetOrderList();
					GetHistoryList();
					GetMyData();
			},
			error:function(e){
				// alert(e.responseText);
			}
		});
	});
});

function initPage() {
	GetOrderList();
	GetHistoryList();
	GetMyData();
	
	$("#coin_name").html(coin+' '+$('.coin_sec').data('cname')+" <b class='fa fa-angle-down'></b>");
	$('.coin_btn').click(function (e) {
		$(".coin_btn").removeClass('coin_sec');
		$(this).addClass('coin_sec');
		coin = $(this).data('coin');
		$("#coin_name").html(coin+" "+$(this).data('cname')+" <b class='fa fa-angle-down'></b>");
		$('#buy_price').val("");
		$('#sell_price').val("");
		$('#buy_unit').val("");
		$('#sell_unit').val("");
		//fShowData();
		GetHoga();
		GetMyData();
		GetOrderList();
		GetHistoryList();
	});
}

function fShowData() {
	try {
		GetHoga();
		GetMyData();
		GetOrderList();
		GetHistoryList();
	} catch(e){			
    } finally {
        setTimeout("fShowData()", 3000);
    }
}

if(window.addEventListener){
	window.addEventListener("load", initPage, false);
	window.addEventListener("load", proc, false);
	window.addEventListener("load", fShowData, false);
} else{
	window.attachEvent("load", initPage);
	window.attachEvent("load", proc);
	window.attachEvent("load", fShowData);
}

</script>

</head>



<body>
	
	<!-- 코인웹의 헤더
	폐이지마다 이름이 변경됩니다
	 -->
	 
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="dropdown clearfix no-gutters">
		<a id="dropdownMenu1" href="#" role="button" class="dropdown-toggle text-center" data-toggle="dropdown">
			<p id="coin_name">BTC 비트코인 </p>
		</a>
		<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
			<li role="presentation col-xs-12"><a role="menuitem" tabindex="-1" href="#"><jsp:include page="../coin_list.jsp" /></a></li>
		</ul>
	</div>
	</nav>
	<div class="nav2 navbar-fixed-top">
		<div class="nav2-content">
			<span style="font-weight:bold;">가능/보유</span> 
			<span id="avail_won" style="color: red; font-weight:bold"></span> /
			<span id="won_tot"></span>KRW
			<span id="avile_coin" style="color: blue; font-weight:bold"></span> /
			<span id="coin_tot"></span>
		</div>
	</div>
	<div class="nav3 navbar-fixed-bottom">
		<div class="col-xs-6 nav3_1" onclick="openNav2()"><p>미체결 내역</p></div>
		<div class="col-xs-6" onclick="openNav2()"><p>체결 내역</p></div>
	</div>
	
	<div class="history navbar-fixed-bottom" id="history">
		<div class="button">
			<ul class="nav nav-pills">
				<li class="active"><a href="#order" data-toggle="pill">대기주문</a></li>
				<li class="div">|</li>
				<li><a href="#history_tab" data-toggle="pill">거래내역</a></li>
			</ul>
			<span><a href="javascript:void(0)" class="close" onclick="closeNav2()"
				style="font-size: 40px;">&times;</a></span>
		</div>
		<div class="tab-content">
			<div class="tab-pane in active" id="order">
				<table class="coinWallet col-xs-12" id="order_table">
			     	<thead>
			     		<tr>
			     			<td class="col-xs-2">구분</th>
			     			<td class="col-xs-3">가격</th>
			     			<td class="col-xs-5">주문수량/체결수량</th>
			     			<td class="col-xs-2">취소</th>
			     		</tr>
			     		<tr id="order_wait">
			     			<td class="coinWallet_2" colspan="4" style="text-align: center; font-size: 18px;">대기주문 내역이 없습니다.</td>
			     		</tr>
			     	</thead>
			     	<tbody>
			     	</tbody>
			     </table>
			</div>
			<div class="tab-pane" id="history_tab">
				<table class="coinWallet col-xs-12"  id="history_table">
			      	<thead>
			     		<tr>
			     			<td class="col-xs-3">구분</th>
			     			<td class="col-xs-3">가격</th>
			     			<td class="col-xs-3">거래량</th>
							<td class="col-xs-3">시간</th>
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
	
	<div class="bscontent no-gutters">
		<table class="table0 col-xs-12">
			<thead>
				<tr>
					<td class="col-xs-6 no-gutters"></td>
					<td class="col-xs-6 no-gutters"></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><table class="table1">
						<thead>
						<tr class="asks">
							<td class="ask_price table1_head" id="ask_price9" onclick="ask_priceSet(9)"></td>
							<td class="td_bar table1_head"><p><span id="ask_quantity9"></span><span id="ask_per_bar9" class="ask_per_bar"></span></p></td>
						</tr>
						</thead>
						<tr class="asks">
							<td class="ask_price" id="ask_price8" onclick="ask_priceSet(8)"></td>	
							<td class="td_bar"><p><span id="ask_quantity8"></span><span id="ask_per_bar8" class="ask_per_bar"></span></p></td>
						</tr>
						<tr class="asks">
							<td class="ask_price" id="ask_price7" onclick="ask_priceSet(7)"></td>
							<td class="td_bar"><p><span id="ask_quantity7"></span><span id="ask_per_bar7" class="ask_per_bar"></span></p></td>
						</tr>
						<tr class="asks">
							<td class="ask_price" id="ask_price6" onclick="ask_priceSet(6)"></td>
							<td class="td_bar"><p><span id="ask_quantity6"></span><span id="ask_per_bar6" class="ask_per_bar"></span></p></td>
						</tr>
						<tr class="asks">
							<td class="ask_price" id="ask_price5" onclick="ask_priceSet(5)"></td>
							<td class="td_bar"><p><span id="ask_quantity5"></span><span id="ask_per_bar5" class="ask_per_bar"></span></p></td>
						</tr>
						<tr class="asks">
							<td class="ask_price" id="ask_price4" onclick="ask_priceSet(4)"></td>
							<td class="td_bar"><p><span id="ask_quantity4"></span><span id="ask_per_bar4" class="ask_per_bar"></span></p></td>
						</tr>
						<tr class="asks">
							<td class="ask_price" id="ask_price3" onclick="ask_priceSet(3)"></td>
							<td class="td_bar"><p><span id="ask_quantity3"></span><span id="ask_per_bar3" class="ask_per_bar"></span></p></td>
						</tr>
						<tr class="asks">
							<td class="ask_price" id="ask_price2" onclick="ask_priceSet(2)"></td>
							<td class="td_bar"><p><span id="ask_quantity2"></span><span id="ask_per_bar2" class="ask_per_bar"></span></p></td>
						</tr>
						<tr class="asks">
							<td class="ask_price" id="ask_price1" onclick="ask_priceSet(1)"></td>
							<td class="td_bar"><p><span id="ask_quantity1"></span><span id="ask_per_bar1" class="ask_per_bar"></span></p></td>
						</tr>
						<tr class="asks">
							<td class="ask_price" id="ask_price0" onclick="ask_priceSet(0)"></td>
							<td class="td_bar"><p><span id="ask_quantity0"></span><span id="ask_per_bar0" class="ask_per_bar"></span></p></td>
						</tr>
						<tr class="bids" id="table_line">					
							<td class="bid_price" id="bid_price0" onclick="bid_priceSet(0)"></td>
							<td class="td_bar"><p><span id="bid_quantity0"></span><span id="bid_per_bar0" class="bid_per_bar"></span></p></td>
						</tr>
						<tr class="bids">
							<td class="bid_price" id="bid_price1" onclick="bid_priceSet(1)"></td>
							<td class="td_bar"><p><span id="bid_quantity1"></span><span id="bid_per_bar1" class="bid_per_bar"></span></p></td>
						</tr>
						<tr class="bids">
							<td class="bid_price" id="bid_price2" onclick="bid_priceSet(2)"></td>
							<td class="td_bar"><p><span id="bid_quantity2"></span><span id="bid_per_bar2" class="bid_per_bar"></span></p></td>
						</tr>
						<tr class="bids">
							<td class="bid_price" id="bid_price3" onclick="bid_priceSet(3)"></td>
							<td class="td_bar"><p><span id="bid_quantity3"></span><span id="bid_per_bar3" class="bid_per_bar"></span></p></td>
						</tr>
						<tr class="bids">
							<td class="bid_price" id="bid_price4" onclick="bid_priceSet(4)"></td>
							<td class="td_bar"><p><span id="bid_quantity4"></span><span id="bid_per_bar4" class="bid_per_bar"></span></p></td>
						</tr>
						<tr class="bids">
							<td class="bid_price" id="bid_price5" onclick="bid_priceSet(5)"></td>
							<td class="td_bar"><p><span id="bid_quantity5"></span><span id="bid_per_bar5" class="bid_per_bar"></span></p></td>
						</tr>
						<tr class="bids">
							<td class="bid_price" id="bid_price6" onclick="bid_priceSet(6)"></td>
							<td class="td_bar"><p><span id="bid_quantity6"></span><span id="bid_per_bar6" class="bid_per_bar"></span></p></td>
						</tr>
						<tr class="bids">
							<td class="bid_price" id="bid_price7" onclick="bid_priceSet(7)"></td>
							<td class="td_bar"><p><span id="bid_quantity7"></span><span id="bid_per_bar7" class="bid_per_bar"></span></p></td>
						</tr>
						<tr class="bids">
							<td class="bid_price" id="bid_price8" onclick="bid_priceSet(8)"></td>
							<td class="td_bar"><p><span id="bid_quantity8"></span><span id="bid_per_bar8" class="bid_per_bar"></span></p></td>
						</tr>
						<tr class="bids">
							<td class="bid_price" id="bid_price9" onclick="bid_priceSet(9)"></td>
							<td class="td_bar"><p><span id="bid_quantity9"></span><span id="bid_per_bar9" class="bid_per_bar"></span></p></td>
						</tr>
					</table></td>
					<td class="fix">
						<div class="tabs">
							<ul class="nav nav-tabs" role="tablist">
								<li class="active buy"><a href="#buy" data-toggle="tab"  style="color: red;">매수</a></li>
								<li class="sell"><a href="#sell" data-toggle="tab" style="color: blue;">매도</a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane fade in active" id="buy">
									<div class="trade">
										<table class="trade_table">
											<tr>
												<td colspan="2">지정가 주문</td>
											</tr>
											<tr>
												<td colspan="2"><input type="number" class="form-control order_price" id="buy_price" placeholder="주문가격" value="0" onkeyup="fCalcData()" onblur="fCalcData()" onChange="fCalcData()"></td>
											</tr>
											<tr>
												<td colspan="2"><input type="text" class="form-control order_amount" id="buy_unit" placeholder="매수수량" onkeyup="fCalcData()" onblur="fCalcData()"></td>
											</tr>
											<tr>
												<td class="percent" colspan="2">
													<button class="btn btn-sm btn-default btn_buy_percent" data-pct="30" type="button">
	                                                    30%
	                                                </button>
	                                                <button class="btn btn-sm btn-default btn_buy_percent" data-pct="50" type="button">
	                                                    50%
	                                                </button>
	                                                <button class="btn btn-sm btn-default max_btn btn_buy_percent" data-pct="100" type="button">
	                                                 	최대
	                                                </button>
	                                  			</td>
											</tr>
											<tr>
												<td class="sell_price_text" colspan="2">
													<p>최대 구매 가능 수량 <span id="max_buy_coin">0</span></p>
												</td>
											</tr>
											<tr>
												<td colspan="2"><button type="button" class="btn" id="btn_buy">매수하기</button></td>
											</tr>
											<tr>
												<td class="td_left">매수금액</td>
												<td class="td_right"><span id="total_buy_price"></span></td>
											</tr>
											<tr>
												<td class="td_left">총 매수량</td>
												<td class="td_right"><span id="total_buy_coin"></span></td>
											</tr>
										</table>
									</div>
								</div>
								<div class="tab-pane fade" id="sell">
									<div class="trade">
										<table class="trade_table">
											<tr>
												<td colspan="2">지정가 주문</td>
											</tr>
											<tr>
												<td colspan="2"><input type="number" class="form-control order_price" id="sell_price" placeholder="주문가격" value="0" onkeyup="fCalcData()" onblur="fCalcData()" onChange="fCalcData()"></td>
											</tr>
											<tr>
												<td colspan="2"><input type="text" class="form-control order_amount" id="sell_unit" placeholder="매수수량" onkeyup="fCalcData()" onblur="fCalcData()"></td>
											</tr>
											<tr>
												<td class="percent" colspan="2">
													<button class="btn btn-sm btn-default btn_sell_percent" data-pct="30" type="button">
	                                                    30%
	                                                </button>
	                                                <button class="btn btn-sm btn-default btn_sell_percent" data-pct="50" type="button">
	                                                    50%
	                                                </button>
	                                                <button class="btn btn-sm btn-default max_btn btn_sell_percent" data-pct="100" type="button">
	                                                 	최대
	                                                </button>
	                                  			</td>
											</tr>
											<tr>
												<td class="buy_price_text" colspan="2">
													<p>최대 판매 가능 금액 <span id="max_sell_price">0</span></p>
												</td>
											</tr>
											<tr>
												<td colspan="2"><button type="button" class="btn" id="btn_sell">매도하기</button></td>
											</tr>
											<tr>
												<td class="td_left" >매도금액</td>
												<td class="td_right"><span id="total_sell_price"></span></td>
											</tr>
											<tr>
												<td class="td_left">총 매도량</td>
												<td class="td_right"><span id="total_sell_coin"></span></td>
											</tr>
										</table>
									</div>
								</div>
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<!-- 모달 매수 -->
	<div id="order_buy_Modal" class="modal fade cointap_modal">
	      <div class="modal-dialog">
	        <!-- Modal content-->
	        <div class="modal-content">
	          <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal">×</button>
	            <h4 class="modal-title">매수 주문</h4>
	          </div>
	          <div class="modal-body">
	            <p><span id="modal_buy_price">0</span> 원을 매수 하시겠습니까?</p>
	          </div>
	          <div class="modal-footer">
	            <button type="button" class="btn-sm btn-primary1" id="btn_order_buy">확인</button>
	            <button type="button" class="btn-sm btn-danger1" data-dismiss="modal">닫기</button>
	          </div>
	        </div>
	      </div>
	    </div>
	<!-- 모달 매도 -->	    
    <div id="order_sell_Modal" class="modal fade cointap_modal">
      <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h4 class="modal-title">매도 주문</h4>
          </div>
          <div class="modal-body">
            <p><span id="modal_sell_unit">0</span> 코인을 매도 하시겠습니까?</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn-sm btn-primary1" id="btn_order_sell">확인</button>
            <button type="button" class="btn-sm btn-danger1" data-dismiss="modal">닫기</button>
          </div>
        </div>
      </div>
    </div>

	<!-- 모달 취소 -->	
	<div id="order_cancel_Modal" class="modal fade cointap_modal" aria-hidden="true" style="display: none;">
      <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h4 class="modal-title">대기주문 취소</h4>
          </div>
          <div class="modal-body">
            <p>해당 주문을 취소 하시겠습니까?</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn-sm btn-primary1" id="btn_order_cancel">확인</button>
            <button type="button" class="btn-sm btn-danger1" data-dismiss="modal">닫기</button>
          </div>
        </div>
      </div>
    </div>
	<div id="mask" onclick="closeNav2()"></div>
	
	<jsp:include page="../footer_bar.jsp" />
	
	<script>
		function wrapWindowByMask2(){
		    //화면의 높이와 너비를 구한다.
		    var maskHeight = $(document).height();  
		    var maskWidth = $(window).width();  
	
		    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
		    $('#mask').css({'width':maskWidth,'height':maskHeight});  
	
		    //애니메이션 효과
		 
		    $('#mask').fadeTo("fast",0.6);    
		}
	
		function openNav2() {
			document.getElementById("history").style.height = "40%";
			wrapWindowByMask2();
		}
	
		function closeNav2() {
			document.getElementById("mask").style.display = 'none';
			document.getElementById("history").style.height = "0";
		}
	</script>
</body>
</html>