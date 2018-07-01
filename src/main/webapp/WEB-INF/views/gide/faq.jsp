<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
	<!-- 페이지 설정 부분  -->
<head>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--  저장시에 사용된 인코딩 (파일의 저장 형식) 값을 웹 브라우저에게 알려준다 -->
<style >
.bs-example{margin-top: 70px;}
</style>

<meta charset="utf-8" />
<!-- IE의 호환성 보기 모드 금지 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<!-- 스마트 장치에서 해상도 균일화 처리 -->
<meta name ="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0
, maximum-scale=1.0 , user-scalable=no">
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
	
	
		<hr style="margin-top: 60px;">
	<div class="container">
		<div class="col-xs-12 text-center">
			<div class="freeboard_header_title">
				<p style="font-weight: bold;">FAQ</p>
			</div>
		</div>
	</div>
	<hr>
	
	

<div class="container">
    <div class="panel-group" id="accordion">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#faq1">Q.모의트레이딩 시 어떤 데이터를 보고하나요?</a>
                </h4>
            </div>
            <div id="faq1" class="panel-collapse collapse in">
                <div class="panel-body">
                    <p>   국내 3개의 거래소 빗썸, 코인원, 코빗의 실제 데이터를 실시간으로 적용하고 있습니다. 각 거래소의 코인의 가격, 호가, 주문량을 보시면서 트레이딩 할 수 있습니다</p>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#faq2">Q.원하는 거래소에서 모의 트레이딩 하는 건가요?</a>
                </h4>
            </div>
            <div id="faq2" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>빗썸, 코인원, 코빗 중 실제 거래하는 거래소나, 원하시는 거래소를 
                                                                          선택하셔서 해당 거래소에 모의트레이딩을 할 수 있습니다.</p>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#faq3">Q.  어떤 코인을 가지고 모의트레이딩을 할 수 있나요?</a>
                </h4>
            </div>
            <div id="faq3" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>빗썸, 코인원, 코빗 별로 상장된 코인이 다릅니다. 거래소를 먼저 선택하신 후 각 거래소에서 취급하는 코인을 선택하여 모의 트레이딩 하실 수 있습니다.</p>
                </div>
            </div>
        </div>
          <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#faq4">Q.실제 거래소에서 트레이딩 하는 방식과 똑같나요?</a>
                </h4>
            </div>
            <div id="faq4" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>네, 각 거래소에서 실제 트레이딩 하는 방식과 같습니다. 실제 트레이딩이라 생각하시고 실전처럼 모의트레이딩을 하실길 권장해드립니다.</p>
                </div>
            </div>
        </div>
        
         <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#faq5">Q.모의 트레이딩한 결과는 어디서 확인 하나요?</a>
                </h4>
            </div>
            <div id="faq5" class="panel-collapse collapse">
                <div class="panel-body">
                    <p><거래하기> 화면에서 각 거래소별, 코인별 현재 보유한 코인의 자산 현황을 확인 할 수 있습니다. 또한, 상단 네비게이션의
                                        <자산현황> 카테고리에서 거래소별 자산을 비롯한 총 자산현황을 한눈에 확인 하실 수 있습니다.</p>
                </div>
            </div>
        </div>
         <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#faq6">Q.모의트레이딩한 거래내역을 확인 할 수 있나요??</a>
                </h4>
            </div>
            <div id="faq6" class="panel-collapse collapse">
                <div class="panel-body">
                    <p> 네, 상단 네비게이션의
                                        <자산현황> 카테고리에서 거래소별, 코인별 모의트레이딩 하신 거래내역( 매수/매도 )을 확인 할 수 있습니다.</p>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#faq7">Q.랭킹의 순위 기준은 무엇인가요?</a>
                </h4>
            </div>
            <div id="faq7" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>랭킹에서 순위의 기준은 '수익률'로 하고 있습니다. 초기 투자비용 대비 수익률이 가장 높은 회원이 1위에 랭크됩니다.</p>
                </div>
            </div>
        </div>
                <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#faq8">Q.모의트레이딩한 초기 모의트레이딩 투자금은 어떻게 되나요?</a>
                </h4>
            </div>
            <div id="faq8" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>최초 회원가입 후 30,000,000(삼천만)원의 투자금을 지급하고 있습니다. 해당 투자금으로 실제 트레이딩이라는 생각으로 실전에 들어가기 전 트레이닝을 하시면 됩니다.</p>
                </div>
            </div>
        </div>
                <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#faq9">Q.코인탭을 이용하면서 문의 및 건의사항을 전달 하고싶은데 어떻게 하나요??</a>
                </h4>
            </div>
            <div id="faq9" class="panel-collapse collapse">
                <div class="panel-body">
                    <p> 상단 네비게이션 메뉴에서
                    <문의&건의하기>를 선택하셔서 하고싶은 내용을 전달해 주시면 됩니다.</p>
                </div>
            </div>
        </div>
                <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#faq10">Q.랭킹은 반영의 기준은 언제인가요?</a>
                </h4>
            </div>
            <div id="faq10" class="panel-collapse collapse">
                <div class="panel-body">
                    <p> 랭킹은 매일 낮 12:00에 새롭게 반영되어 랭킹이 매겨집니다.</p>
                </div>
            </div>
        </div>
    </div>
    
	
</div>
	 
	 

	<jsp:include page="../footer_bar.jsp" />
</body>
</html>