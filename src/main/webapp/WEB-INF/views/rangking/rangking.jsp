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

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/rangking.css">
<title>Insert title here</title>
</head>
<body>


	
	<!-- 랭킹  -->
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid text-center">
		<p>COINWEB</p>
	</div>
	</nav>
	
	
	<hr style="margin-top: 60px;">
	<div class="container">
		<div class="col-xs-12 text-center">
			<div class="freeboard_header_title">
				<p style="font-weight: bold;">랭킹</p>
			</div>
		</div>
	</div>
	<hr>

		<!-- 순위 -->
	
		<div class="rangking_main ">
	
	
		<!-- 123위 -->
			<div class="rangking_1">
				<img src="${pageContext.request.contextPath}/img/rank1.png" style="width: 130px; height: 130px;">
					<h2>1위</h2></br>
					<p>닉네임</p>
					<p class="p1">총자산: 999,999,999원</p>
					<p class="p1">수익률: 500%</p></div>
					</br>
					
			<div class="rangk_top2 rangking_2">
				<img src="${pageContext.request.contextPath}/img/rank2.png" style="width: 130px; height: 130px;">
					<h2>2위</h2></br>
					<p>닉네임</p>
						<p class="p1">총자산:  999,999,999</p>
					<p class="p1">수익률: 500%</p></div>
			<div class="rangk_top2 rangking_3">
				<img src="${pageContext.request.contextPath}/img/rank3.png" style="width: 130px; height:130px;">
					<h2>3위</h2></br>
					<p>닉네임</p>
							<p class="p1">총자산: 999,999,999</p>
					<p class="p1">수익률: 500%</p></div>
		

		<!-- 나머지20위 -->	
			<div class="container">
   
			    <!--  <div class="table-responsive">-->
		
			  	<table class=" table table-striped rangking_4_20">
			  	
			  	<thead>
			  
			  <tr>
			      <th id="col-xs-3">순위</th>
			    <th id="col-xs-4">닉네임</th>
			    <th id="col-xs-4">총자산</th>
			    <th id="col-xs-3">수익률</th>
			  </tr>
			  </thead>
			  
			<tbody>
			  <tr class="active">
			    <td>4위</td>
			    <td>Griffin</td>
			    <td>999,999,999</td>
			    <td>100%</td>
			  </tr>
			  <tr>
			  <td>5위</td>
			    <td>Griffin</td>
			    <td>999,999,999</td>
			    <td>100%</td>
			  </tr>
			  <tr>
			   <td>6위</td>
			    <td>Griffin</td>
			    <td>999,999,999</td>
			    <td>100%</td>
			  </tr>
			  	  <tr>
			   <td>7위</td>
			    <td>Griffin</td>
			    <td>999,999,999</td>
			    <td>100%</td>
			  </tr>
			  <tr>
				 <td>8위</td>
			    <td>Griffin</td>
			    <td>999,999,999</td>
			    <td>100%</td>
			  </tr>
			  <tr>
		 <td>9위</td>
			    <td>Griffin</td>
			    <td>999,999,999</td>
			    <td>100%</td>
			  </tr>
			  <tr>
			 <td>10위</td>
			    <td>Griffin</td>
			    <td>999,999,999</td>
			    <td>100%</td>
			  </tr>
			  	  <tr>
			 	    <td>11위</td>
			    <td>Griffin</td>
			    <td>999,999,999</td>
			    <td>100%</td>
			  </tr>
			  <tr>
			   	  <td>12위</td>
			    <td>Griffin</td>
			    <td>999,999,999</td>
			    <td>100%</td>
			  </tr>
			  <tr>
			  	 <td>13위</td>
			    <td>Griffin</td>
			    <td>999,999,999</td>
			    <td>100%</td>
			  </tr>
			  <tr>
			    	 <td>14위</td>
			    <td>Griffin</td>
			    <td>999,999,999</td>
			    <td>100%</td>
			  </tr>
			  	  <tr>
		 	   <td>15위</td>
			    <td>Griffin</td>
			    <td>999,999,999</td>
			    <td>100%</td>
			  </tr>
			  <tr>
			    <td>16위</td>
			    <td>Griffin</td>
			    <td>999,999,999</td>
			    <td>100%</td>
			  </tr>
			  <tr>
		     <td>17위</td>
			    <td>Griffin</td>
			    <td>999,999,999</td>
			    <td>100%</td>
			  </tr>
			  <tr>
	    <td>18위</td>
			    <td>Griffin</td>
			    <td>999,999,999</td>
			    <td>100%</td>
			  </tr>
			   <tr>
	    <td>19위</td>
			    <td>Griffin</td>
			   <td >999,999,999</td>
			    <td>100%</td>
			  </tr>
			     <tr>
	    <td >20위</td>
			    <td>Griffin</td>
			    <td>999,999,999</td>
			    <td>100%</td>
			  </tr>
			 
		
			  </tbody>
			  </table>

			  		</div>
			</div>
		
		
		
		
		

	<!-- 랭킹끝 -->
	
	
	
<jsp:include page="../footer_bar.jsp" />
</body>
</html>