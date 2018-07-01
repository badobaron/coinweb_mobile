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
				<p style="font-weight: bold;">이용가이드</p>
			</div>
		</div>
	</div>
	<hr>

<div class="container">
    <div class="panel-group" id="accordion">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#guide1">[이용가이드]-회원가입</a>
                </h4>
            </div>
            <div id="guide1" class="panel-collapse collapse in">
                <div class="panel-body">
                <p>코인웹의 모의트레이딩을 이용하기 위해서는 우선, 회원가입이 필요합니다.</p>
                            <br/>
                            <p>상단 네비게이션의 회원가입 메뉴를 클릭하셔서 회원가입을 해주셔야 합니다.</p>
                                                            <!-- 추후 모바일용 이미지 첨부예정 -->
                       <!--      <img   src="http://localhost:8080/coinweb/img/cow.jpg" alt="" class="guide_img" > -->
                            <br/>
                            <p>회원가입 시 작성한 이메일에서 '가입인증 메일'을 확인하셔서 해당링크로 접속하셔야 합니다.</p>
                            <br/>
                            <br/>
                            <p>이제 회원가입을 마무리 하였습니다. 코인웹의 회원이 되어주셔서 감사합니다.!</p>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#giude2">[이용가이드]-거래하기1</a>
                </h4>
            </div>
            <div id="giude2" class="panel-collapse collapse">
                <div class="panel-body">
                   <p>안녕하세요 코인웹을 방문해 주셔서 감사합니다.^^</p>
			<p style="color: #F08235;">- 코인웹은 빗썸 거래소의 실시간
				데이터를 이용하여 모의 트레이딩을 진행합니다.</p>
			<br /> <br />
			<p>사용자가 원하는 모의트레이딩의 코인을 선택 할 수 있습니다. (코인은 각 거래소의 상장된 코인을 적용합니다.)</p>
			<!-- <img src="img/guide_3.png" alt="" class="guide_1_img" width="1000" height="80"> <br /> -->
			<p>선택한 거래소와 코인의 현재 상황(데이터)을 확인 할 수 있습니다.</p>
			<!-- <img src="img/guide_4.png" alt="" class="guide_1_img" width="1000" height="100"> <br /> <br /> -->
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#giude3"> [이용가이드]-거래하기2</a>
                </h4>
            </div>
            <div id="giude3" class="panel-collapse collapse">
                <div class="panel-body">
                    		<p>안녕하세요 코인웹을 방문해 주셔서 감사합니다.^^</p>
		<p style="color: #F08235;">- 코인웹은 빗썸 거래소의 실시간
				데이터를 이용하여 모의 트레이딩을 진행합니다.</p>
		<br /> <br />
		<p>선택한 코인의 24시간 동안의 시세, 거래량 변화를 확인 할 수 있습니다.</p>
		<img src="img/guide_5.png" alt="" class="guide_2_img" > <br /> <br />
		<p>선택한 코인의 현재 호가 내역을 확인 할 수 있습니다.</p>
		<img src="img/guide_6.png" alt="" class="guide_2_img"  > <br /> <br />
		<p>원하는 가격의 매수 주문을 실행 합니다. (실제 코인을 실제 거래소 거래하는 것과 같습니다.)</p>
		<img src="img/guide_7.png" alt="" class="guide_3_img"  > <br /> <br />
		<p>원하는 가격의 매도 주문을 실행 합니다. (실제 코인을 실제 거래소 거래하는 것과 같습니다.)</p>
		<img src="img/guide_8.png" alt="" class="guide_3_img"  > <br /> <br />
                </div>
            </div>
        </div>
          <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#giude4">[이용가이드]-거래하기3</a>
                </h4>
            </div>
            <div id="giude4" class="panel-collapse collapse">
                <div class="panel-body">
                  
				<p>안녕하세요 코인웹을 방문해 주셔서 감사합니다.^^</p>
		<p style="color: #F08235;">- 코인웹은 빗썸 거래소의 실시간
				데이터를 이용하여 모의 트레이딩을 진행합니다.</p>
		<br /> <br />
		<p>모의 트레이딩의 대기 주문 내역을 확인 할 수 있습니다.</p>
		<img src="img/guide_9.png" alt="" class="guide_4_img"> <br /> <br />
		<p>선택한 거래소 - 선택한 코인의 현재 자산현황을 요약해서 보실 수 있습니다.</p>
		<img src="img/guide_10.png" alt="" class="guide_4_img"> <br />
		<br />
		<p>모의 트레이딩의 주문 내역을 확인 할 수 있습니다.</p>
		<img src="img/guide_11.png" alt="" class="guide_1_img" width="1000"> <br />
		<br />
                </div>
            </div>
        </div>
        
         <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#giude5">[이용가이드]-랭킹</a>
                </h4>
            </div>
            <div id="giude5" class="panel-collapse collapse">
                <div class="panel-body">
                 	<p>안녕하세요 코인웹을 방문해 주셔서 감사합니다.^^</p>
		<p>랭킹게시판은 코인웹의 총 사용자들을 대상으로 진행합니다.</p>
		<p>랭킹의 기준은 모의 투자금액을 바탕으로 총 수익율을 기준으로 순위를 선정합니다.</p>
		<br />
		<p>지금 바로 Rangking 1위에 도전 해보세요!</p>
		<img src="img/guide_15.png" alt="" class="guide_1_img">	<br />
                </div>
            </div>
        </div>

        </div>
    </div>
    
	

	 

	<jsp:include page="../footer_bar.jsp" />
</body>
</html>