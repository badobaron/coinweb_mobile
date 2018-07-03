<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="coinweb.vo.BoardVO, coinweb.dao.BoardDAO, java.util.ArrayList"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<!-- 페이지 설정 부분  -->
<head>

<!-- 저장시에 사용된 인코딩 (파일의 저장 형식) 값을 웹 브라우저에게 알려준다
	ANSI(euc-kr), utf-8 -->
<meta charset="UTF-8" />
<!-- IE의 호환성 보기 모드 금지 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- 스마트 장치에서 해상도 균일화 처리 -->
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0
, maximum-scale=1.0 , user-scalable=no">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/freeboard.css">

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
<!-- 리플 -->
<script src="http://localhost:8080/coinweb/js/MyAjax.js"></script>


</head>


<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid text-center">
		<p>COINWEB</p>
	</div>
	</nav>


	<!-- 게시판헤더 -->
	<div class="container" style="margin-top: 40px;">
		<hr>
		<div class="col-xs-12 text-center">
			<div class="freeboard_header_title">
				<p style="font-weight: bold;">문의하기</p>
			</div>
		</div>
	</div>
	<hr>




	<div class="container">

		<div class="freeboard_content_title">
		<p>${vo.bbsTitle}</p>
					<p align="right" id="c_date">${vo.fdate}</p>
					<div id="c_id">
							<input type="hidden" name="email" id="email" value="${email}">
				</div>
				</div>
				
				<div id="c_content">
					<tr>
					<hr>
						<td style="margin-top: 15px" id="bc">${vo.bbsContent}</td>
					</tr>
					<hr>
		</div>


		<br>
		<div class="text-center">

			
		<a
					href="${pageContext.request.contextPath}/update.do?bbsID=${vo.bbsID}"><button
						type="button" class="btn btn-comm-con btn-xs">수정하기</button></a>
				
				<a href="${pageContext.request.contextPath}/deleteAction.do?bbsID=${vo.bbsID }"><button type="button"
						class="btn btn-comm-con btn-xs">바로삭제</button></a>
		
			<a href="${pageContext.request.contextPath}/query_list.do"><button
					type="button" class="btn btn-xs">목록으로</button></a>
		</div>

		<br>
	<!-- start of reply -->
			<div class="container">
			
							
				
						
							
			
			
				
				</div>
				<!-- end of reply -->	


	</div>
	<br><br><br><br><br><br>


<jsp:include page="../footer_bar.jsp" />

<script>
var sid = '<c:out value="${sid}"/>';

(function($){
	
	$.fn.indexSearch = function(data){	
		return $(this).attr("id").slice($(this).attr("class").length);
	};	
})(jQuery);

	$(function(){		
		
		$(".reply-write-content").click(function(){
			if(sid==""){
				alert("로그인 후 이용하실수 있습니다.");
				$(".reply-write-content").css('cursor', 'default');
				$(".reply-write-content").blur();
			}
		});
		

	


</script>

</body>
</html>