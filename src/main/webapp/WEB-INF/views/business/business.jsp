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
	href="http://localhost:8080/coinweb_mobile/css/business.css">
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


function fShowData() {
	try {
		GetHoga();
	} catch(e){			
    } finally {
        setTimeout("fShowData()", 3000);
    }
}

/* $(function(){

	// 퍼센트 버튼 클릭시
	$('.btn_buy_percent').click(function (e) {
		if($('#buy_price').val() > 0) {
			var pct_buy_coin = ((avail_won * ($(this).data('pct')) / 100)) / $('#buy_price').val());
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
				url : 'http://localhost:8080/coinweb/order.do',
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
				url:"http://localhost:8080/coinweb/order.do",
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
			url:'http://localhost:8080/coinweb/order_cancel.do',
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
}); */


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
	<div class="nav2 navbar-fixed-top">
		<div class="nav2-content">
			<span style="font-weight:bold;">가능/보유</span> 
			<span id="avail_won"></span> / 
			<span id="won_tot"></span> KRW
			<span id="avile_coin"></span> / 
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
				<li class="active"><a href="#order_wait" data-toggle="pill">대기주문</a></li>
				<li class="div">|</li>
				<li><a href="#history" data-toggle="pill">거래내역</a></li>
			</ul>
			<span><a href="javascript:void(0)" class="close" onclick="closeNav2()"
				style="font-size: 40px;">&times;</a></span>
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
	
	<div class="bscontent no-gutters">
		<table class="table0 col-xs-12">
			<thead>
				<tr>
					<td class="col-xs-6 no-gutters">
					</td>
					<td class="col-xs-6 no-gutters"></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><table class="table1">
						<tr class="asks">
							<td class="ask_price col-xs-3" id="ask_price9" onclick="ask_priceSet(9)"></td>
							<td class="col-xs-3"><p><span id="ask_quantity9"></span><span class="ask_per_bar"></span></p></td>
						</tr>
						<tr class="asks">
							<td class="ask_price" id="ask_price8" onclick="ask_priceSet(8)"></td>	
							<td><p><span id="ask_quantity8"></span><span class="ask_per_bar"></span></p></td>
						</tr>
						<tr class="asks">
							<td class="ask_price" id="ask_price7" onclick="ask_priceSet(7)"></td>
							<td><p><span id="ask_quantity7"></span><span class="ask_per_bar"></span></p></td>
						</tr>
						<tr class="asks">
							<td class="ask_price" id="ask_price6" onclick="ask_priceSet(6)"></td>
							<td><p><span id="ask_quantity6"></span><span class="ask_per_bar"></span></p></td>
						</tr>
						<tr class="asks">
							<td class="ask_price" id="ask_price5" onclick="ask_priceSet(5)"></td>
							<td><p><span id="ask_quantity5"></span><span class="ask_per_bar"></span></p></td>
						</tr>
						<tr class="asks">
							<td class="ask_price" id="ask_price4" onclick="ask_priceSet(4)"></td>
							<td><p><span id="ask_quantity4"></span><span class="ask_per_bar"></span></p></td>
						</tr>
						<tr class="asks">
							<td class="ask_price" id="ask_price3" onclick="ask_priceSet(3)"></td>
							<td><p><span id="ask_quantity3"></span><span class="ask_per_bar"></span></p></td>
						</tr>
						<tr class="asks">
							<td class="ask_price" id="ask_price2" onclick="ask_priceSet(2)"></td>
							<td><p><span id="ask_quantity2"></span><span class="ask_per_bar"></span></p></td>
						</tr>
						<tr class="asks">
							<td class="ask_price" id="ask_price1" onclick="ask_priceSet(1)"></td>
							<td><p><span id="ask_quantity1"></span><span class="ask_per_bar"></span></p></td>
						</tr>
						<tr class="asks">
							<td class="ask_price" id="ask_price0" onclick="ask_priceSet(0)"></td>
							<td><p><span id="ask_quantity0"></span><span class="ask_per_bar"></span></p></td>
						</tr>
						<tr class="bids" id="table_line">					
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
												<td colspan="2"><button type="button" class="btn" id="btn_buy">매수하기</button></td>
											</tr>
											<tr>
												<td class="td_left">매수금액</td>
												<td class="td_right">0 원</td>
											</tr>
											<tr>
												<td class="td_left">총 매수량</td>
												<td class="td_right">0 BTC</td>
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
												<td colspan="2"><button type="button" class="btn" id="btn_sell">매도하기</button></td>
											</tr>
											<tr>
												<td class="td_left">매수금액</td>
												<td class="td_right">0 원</td>
											</tr>
											<tr>
												<td class="td_left">총 매수량</td>
												<td class="td_right">0 BTC</td>
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
		function wrapWindowByMask(){
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
			wrapWindowByMask();
		}
	
		function closeNav2() {
			document.getElementById("history").style.height = "0";
			$('#mask').hide();  
		}
	</script>
</body>
</html>