<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="coinweb.dao.*, coinweb.vo.*"%>
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

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/mypage.css">

<!-- 브라우저에 표시될 문서 제목 -->
<title>가상화폐 모의거래소 coinweb</title>

</head>


<script>                              
jQuery(document).ready(function(){



	var result = 0;

	jQuery("#pcbtn").click(function(){
		if(jQuery("#upass").val()==""){
			alert("현재 비밀번호를 입력하세요")
			return false;

		}else if(jQuery("#npass").val()==""){
			alert("새비밀번호를 입력하세요.");

			return false;

			}else if(jQuery("#ncpass").val()==""){
				alert("비밀번호를 재입력 하세요.");

				return false;

			}

		if(result==1)

			passUpdate.submit();

		else{

			alert("현재 비밀번호를 다시 입력해주세요");

			return false;

		}

	}); //end


	 jQuery("#upass").focusout(function(){
		 var email = jQuery("#uid").val();
		 var pass = jQuery("#upass").val();
		// alert(email+","+pass);

		 jQuery.ajax({

			 url : 'http://localhost:8080/coinweb/password_check.do',
			 type :'GET',
			 data : 'email='+email+'&pass='+pass,
			 dateType : "json",
			 success: function(data){
				 //alert(data);

					if(data != 1){
						jQuery("#upw_msg").css("display","block").css("font-size","12pt")
						.css("color","red").css("padding","3px 0px 0px 0px");
					jQuery("#upw_msg").text("불일치!");
					jQuery("#upass").val("");
					

					
					return false; 

					

					}else if (data == 1){

						jQuery("#upw_msg").css("display","block").css("font-size","12pt")
						.css("color","blue").css("padding","3px 0px 0px 0px");
					jQuery("#upw_msg").text("일치!");
					result = 1;
					return result; 

					}		

			

				 }

		

		

  		});

	});

   

	 jQuery("#ncpass").focusout(function(){
			// 1.패스워드 입력폼이 비어있는지 확인  비어있지 않은 상태에서만 비교
			// 2. 1번의 결과중 비밀번호 확인폼이 비어있지 않은 상태에서만 비교를 진행 
			
				var minimum = 8;
			var pass = jQuery("#npass").val().length;
			
			
			if(jQuery("#npass").val()=="" ){
				alert("패스워드를 입력하세요")

				return false;

			}else if (pass <minimum){
				alert("패스워드를 8자리 이상 입력해주세요.")
				jQuery("#ncpass").val("");
				jQuery("#npass").val("");
				return false;
			
			}else{

				if(jQuery("#ncpass").val()!=""){

					//비밀번호 & 비밀번호 확인 체크

					if(jQuery("#npass").val()== jQuery("#ncpass").val()){
					jQuery("#nupw_msg").css("font-size","12pt").css("color","blue").css("display","block");
					jQuery("#nupw_msg").text("비밀번호가 동일합니다.").css("padding","3px 0px 0px 0px");

					return false;

				}else{

					jQuery("#nupw_msg").css("font-size","12pt").css("color","red").css("display","block").css("padding","3px 0px 0px 0px");
					jQuery("#nupw_msg").text("비밀번호가 다릅니다. 다시 입력해주세요");
					jQuery("#pass").val("").focus();

					jQuery("#ncpass").val("");

						return false;

			    }
			 }
		  }
	});

	 


	

});

</script>
<body>
	
	<!-- 코인웹의 헤더
	폐이지마다 이름이 변경됩니다
	 -->
	  
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid text-center">
		<p>COINWEB</p>
	</div>
	</nav>
	

<div class="mypage">

<div class="container" style="margin-top: 60px;">
  <div class="media">
    <div class="media-left">
     <i class="fa fa-user-circle-o" style="font-size: 60px;"></i>
    </div>
    
    <div class="media-body">

      <h4 class="media-heading">${vo.name} </h4>
      <br>
    
      <p>나의 자산 :<font color=red> ${vo.money}</font>원 </p>
		<p> 나의 수익률: <font color=red> ${vo.profit}</font>% </p>
    </div>
  </div>
  <hr>
 </div>
   
 
<ul class="list-group">
   <li class="list-group-item"><a  onclick="document.getElementById('id02').style.display='block'" style="width:auto; cursor: pointer;">패스워드 변경 <span class="next"></span></a></li>
   <li class="list-group-item"><a href="${pageContext.request.contextPath}/query_write.do">1:1 문의하기 <span class="next"></span></a></li>
   <li class="list-group-item"><a href="${pageContext.request.contextPath}/query_list.do">나의 문의내역<span class="next"></span></a></li>
  </ul>

</div>
	<!-- 비번변경 모달 시작-->
      <div id="id02" class="modal">
		<form class="modal-content animate" name="passUpdate"
			action="http://localhost:8080/coinweb/password_update_c.do"
			method="post">
			<div class="imgcontainer">
				<span onclick="document.getElementById('id02').style.display='none'"
					class="close" title="Close Modal">&times;</span>
			</div>
			<h1 id="pc"> 비밀번호 변경</h1>
			<div class="ps_container">
				<input type="text" value="${email} " id="uid" disabled> 
				<input type="hidden" name="email" value="${email}" /> 
				<input type="password" placeholder="현재 비밀번호" id="upass"> 
				<span id="upw_msg"></span> 
				<input type="password" name="pass" placeholder="새 비밀번호" id="npass">
				<span id="nupw_msg"></span>
				<input type="password" placeholder="새 비밀번호 재입력" id="ncpass">
				
				<p id="p1">이메일 변경을 원하시는 경우 1:1 문의하기를 이용해 주세요.</p>
			
				<button type="submit" id="pcbtn">변경하기</button>
			</div>
		</form>
		
	</div>
	<!-- 비밀번호 변경 끝 -->








	<jsp:include page="../footer_bar.jsp" />
</body>
</html>
