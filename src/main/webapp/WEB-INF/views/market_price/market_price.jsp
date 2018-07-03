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

<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/market_price.css">
<!-- 브라우저에 표시될 문서 제목 -->
<title>가상화폐 모의거래소 coinweb</title>
<script src="https://code.highcharts.com/stock/highstock.js"></script>
<script src="https://code.highcharts.com/stock/modules/drag-panes.js"></script>
<script src="https://code.highcharts.com/stock/modules/exporting.js"></script>
<script src="https://code.highcharts.com/maps/modules/map.js"></script>
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

function ask_priceSet(i){
	price = asks[i]['price'];
	$('#buy_price').val(price);
 	$('#sell_price').val(price);
}
function bid_priceSet(i){
	price = bids[i]['price'];
	$('#buy_price').val(price);
 	$('#sell_price').val(price);
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
		$('#max_buy_coin').text(Math.floor(max_buy_coin * 10000)/10000);
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
		$('#max_sell_price').text(numberWithCommas(max_sell_price));
	}
	// 2. 총 매도금액 계산하기
	if($('#sell_unit').val() > 0) {
		if( avail_coin < $('#sell_unit').val() * 1.0 ) {
			$('#sell_unit').val(avail_coin);
		}
		// 총 매도금액 계산하기
		total_sell_price = $('#sell_price').val() * $('#sell_unit').val();
	}else{
		total_sell_price = 0;
	}
	$('#total_sell_price').html(numberWithCommas(total_sell_price) + " <span>원</span>");
	$('#total_sell_coin').html(($('#sell_unit').val()*1.0) + " <span>" + coin + "</span>");


}
function GetChart(){
	$.get('proxy.do',{
			csurl:'https://www.bithumb.com/resources/chart/'+coin+'_xcoinTrade_10M.json'
		}, function (data) {
		    // split the data set into ohlc and volume
		    var price = [],
		        volume = [],
		        dataLength = data.length,
		
		        i = 0;
		
		    for (i; i < dataLength; i += 1) {
		        price.push([
		            data[i][0], // the date
		            data[i][1], // open
		            data[i][3], // high
		            data[i][4], // low
		            data[i][2] // close
		        ]);
		
		        volume.push([
		            data[i][0], // the date
		            data[i][5] // the volume
		        ]);
		    }
		
		
		    // create the chart
		    Highcharts.stockChart('container', {
		      	chart: {
		            type: 'line',
		            marginRight: 60,
		            height: 130+'%'
		        },
		        rangeSelector: {
		        	buttons: [ 
								{type: 'day',count: 1,text: '1d'},
								{type: 'week',count: 1,text: '1w'},
								{type: 'all',count: 1, text: 'All'}
							],
							selected: 0,
							inputEnabled: true
		        },
		        navigator: {
		            enabled: false
		        },
		        scrollbar: {
		            enabled: false
		        },
		        mapNavigation: {
		            enabled: true,
		            enableButtons: false
		        },
		        plotOptions: {
					candlestick: {
						color: 'blue',
						lineColor: 'blue',
						upColor: 'red',
						upLineColor: 'red'
					}
				},
				xAxis: {
		            gridLineWidth: 1,
		        },
		        yAxis: [{
		            labels: {
		            	textAlign: 'left',
		                align: 'right',
		                x: 60,
		                y: 5,
		                format: '{value:.0f}'
		            },
		            height: '70%',
		            lineWidth: 2,
		           
		            resize: {
		                enabled: true
		            },
		            tickLength: 5,
		            tickPosition: "outside",
		            tickWidth: 1,
		            tickColor: "black",
		            showLastLabel: true,            
		        }, {
		            labels: {
		            	textAlign: 'left',
		                align: 'right',
		                x: 60,
		                y: 5,
		                format: '{value:.0f}'
		            },
		            top: '70%',
		            height: '30%',
		            offset: 0,
		            lineWidth: 2,
		            tickLength: 5,
		            tickPosition: "outside",
		            tickWidth: 1,
		            tickColor: "black"
		        }],
		
		        tooltip: {
		            split: true
		        },
		
		        series: [{
		            type: 'candlestick',
		            name: 'Price',
		            data: price
		
		        }, {
		            type: 'column',
		            name: 'Volume',
		            data: volume,
		            yAxis: 1
		
		        }]
		    });
		    Highcharts.setOptions({
		        global: {
		            useUTC: false
		        }
		    });
		});
	}

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
		var maxCoin = 0;	
		
		for(i=0;i<10;i++){
			var temp = data['data']['asks'][i]['quantity']
			if(maxCoin < temp){ 
				maxCoin = Floor(data['data']['asks'][i]['quantity'],4);
			}
			console.log("asks : "+Floor(data['data']['asks'][i]['quantity'],4));
			console.log("max : "+maxCoin);
			if(maxCoin < data['data']['asks'][i]['quantity']) console.log("true"); else console.log("flase");
		}
		for(i=0;i<10;i++){
			var temp = data['data']['bids'][i]['quantity']
			if(maxCoin < temp){
				maxCoin = Floor(data['data']['bids'][i]['quantity'],4);
			}
			console.log("bids : "+Floor(data['data']['bids'][i]['quantity'],4));
			console.log("max : "+maxCoin);
			if(maxCoin < data['data']['bids'][i]['quantity']) console.log("true"); else console.log("flase");
		}
		console.log("-------------");
		for(i=0;i<10;i++){
			$('#ask_quantity'+i).html(Floor(data['data']['asks'][i]['quantity'],4));
			$('#ask_price'+i).html(numberWithCommas(data['data']['asks'][i]['price']));
			$('#ask_per_bar'+i).attr('style', 'width:' + (Floor(data['data']['asks'][i]['quantity'],4) / maxCoin) * 33.4 + '%')
			$('#bid_quantity'+i).html(Floor(data['data']['bids'][i]['quantity'],4));
			$('#bid_price'+i).html(numberWithCommas(data['data']['bids'][i]['price']));
			$('#bid_per_bar'+i).attr('style', 'width:' + (Floor(data['data']['bids'][i]['quantity'],4) / maxCoin) * 33.4 + '%')
		}
		$('.test').html(maxCoin);
	});
}

function GetTransactions(){
	$.get('https://api.bithumb.com/public/transaction_history/'+coin, function(data) {
		for(var i=0;i<10;i++){$('#trans_price'+i).html(numberWithCommas(data['data'][i]['price']));}
		for(var i=0;i<10;i++){$('#trans_total'+i).html(Floor(data['data'][i]['units_traded'],4));}
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
					$("#avail_using_won").html(numberWithCommas(data.available-data.using)+"원");
					$("#avail_coin").html((data.coin_avail-data.coin_using).toFixed(4)+coin);
					$("#avail_won").html(numberWithCommas(data.available)+"원");
					$("#coin_tot").html((data.coin_tot).toFixed(4)+coin);
					$("#avile_using").html((data.coin_avail-data.coin_using).toFixed(4)+coin+" / "+(data.coin_using).toFixed(4)+coin);
					$("#won_tot").html(numberWithCommas(data.tot)+"원");
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

//초기 화면띄우기
function initPage() {
	GetChart();
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
		GetCoinData();
		GetHoga();
		GetChart();
		GetMyData();
		GetOrderList();
		GetHistoryList();
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
}

function fShowData() {
	try {
		GetHoga();
		GetTransactions();
		GetCoinData();
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
							<td class="col-xs-4" style="color: blue;">매도잔량<div class="test"></div></td>
							<td class="col-xs-4">가격</td>
							<td class="col-xs-4" style="color: red;">매수잔량</td>
						</tr>
					</thead>
					<tbody>
						<tr class="asks">
							<td class="td_bar"><p><span id="ask_quantity9"></span><span id="ask_per_bar9" class="ask_per_bar"></span></p></td>
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
							<td class="td_bar"><p><span id="ask_quantity8"></span><span id="ask_per_bar8" class="ask_per_bar"></span></p></td>
							<td class="ask_price" id="ask_price8" onclick="ask_priceSet(8)"></td>	
						</tr>
						<tr class="asks">
							<td class="td_bar"><p><span id="ask_quantity7"></span><span id="ask_per_bar7" class="ask_per_bar"></span></p></td>
							<td class="ask_price" id="ask_price7" onclick="ask_priceSet(7)"></td>
						</tr>
						<tr class="asks">
							<td class="td_bar"><p><span id="ask_quantity6"></span><span id="ask_per_bar6" class="ask_per_bar"></span></p></td>
							<td class="ask_price" id="ask_price6" onclick="ask_priceSet(6)"></td>
						</tr>
						<tr class="asks">
							<td class="td_bar"><p><span id="ask_quantity5"></span><span id="ask_per_bar5" class="ask_per_bar"></span></p></td>
							<td class="ask_price" id="ask_price5" onclick="ask_priceSet(5)"></td>
						</tr>
						<tr class="asks">
							<td class="td_bar"><p><span id="ask_quantity4"></span><span id="ask_per_bar4" class="ask_per_bar"></span></p></td>
							<td class="ask_price" id="ask_price4" onclick="ask_priceSet(4)"></td>
						</tr>
						<tr class="asks">
							<td class="td_bar"><p><span id="ask_quantity3"></span><span id="ask_per_bar3" class="ask_per_bar"></span></p></td>
							<td class="ask_price" id="ask_price3" onclick="ask_priceSet(3)"></td>
						</tr>
						<tr class="asks">
							<td class="td_bar"><p><span id="ask_quantity2"></span><span id="ask_per_bar2" class="ask_per_bar"></span></p></td>
							<td class="ask_price" id="ask_price2" onclick="ask_priceSet(2)"></td>
						</tr>
						<tr class="asks">
							<td class="td_bar"><p><span id="ask_quantity1"></span><span id="ask_per_bar1" class="ask_per_bar"></span></p></td>
							<td class="ask_price" id="ask_price1" onclick="ask_priceSet(1)"></td>
						</tr>
						<tr class="asks">
							<td class="td_bar"><p><span id="ask_quantity0"></span><span id="ask_per_bar0" class="ask_per_bar"></span></p></td>
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
							<td class="td_bar"><p><span id="bid_quantity3" class="bid_quantity"></span><span id="bid_per_bar3" class="bid_per_bar"></span></p></td>
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
					</tbody>
				</table>
 			</div>
			<div class="tab-pane fade" id="chart">
				<div id="container"></div>
			</div>
			<div class="tab-pane fade" id="orderlist">
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
				<div class="orderlist">
				<div class="button">
					<ul class="nav nav-pills">
						<li class="active"><a href="#order" data-toggle="pill">대기주문</a></li>
						<li><a href="#history" data-toggle="pill">거래내역</a></li>
					</ul>
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
					<div class="tab-pane" id="history">
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
	<jsp:include page="../footer_bar.jsp" />
</body>
</html>