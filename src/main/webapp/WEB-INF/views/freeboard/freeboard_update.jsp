<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
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


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- font-awesome 4.7.0 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- bootstrap css 3.3.7 -->	
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">	
<!-- bootstrap js 3.3.7 -->	
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
 <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
 <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
  <script>var newJquery = $.noConflict(true);</script>
 <link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/header_footer_bar.css">
	
 
<!-- include summernote css/js -->

<!-- 브라우저에 표시될 문서 제목 -->
<title>가상화폐 모의거래소 coinweb</title>



</head>
<script type="text/javascript">

/*CONTENT EMPTY&RESET*/
$(document).ready(function(){
	/*modal-background 수정함. 이것 수정하면 그림 영상 첨부할때 나오는 modal 값 수정 가능 */
	$(".note-btn").click(function(){
		$(".modal-backdrop").css("z-index","0").css("background-color","#000");
		$(".note-toolbar").css("z-index","0");
		
	});
	/*reset*/
	$("#contentBtnReset").click(function(){
		$("#summernote").summernote("reset");
	});
	/*컨탠츠 버튼 클릭시*/
	$("#contentBtn").click(function(){
		
		if($("#title").val()==""){
			alert("제목을 입력하세요");
			$("#title").focus();
			return false;	
		/*content 없을때*/				
		}else if($('#summernote').summernote('isEmpty')) {
			  alert('내용을 입력하세요');
			  $('#summernote').summernote('focus');
			  return false;
		/*등록 ajax*/	  
		}else {
			var htmlContent = $('#summernote').summernote('code');
			alert(htmlContent);
		/*
			$(".summernote").html(htmlContent);
			freeboard_form.submit;			
		*/
		}
			
	});		
});
</script>



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
				<p style="font-weight: bold;">수정하기</p>
			</div>
		</div>
	</div>
	<hr>



	<div class="container">
		
		<form id="boardForm" class="board_update freeboard_form" action="freeboard_update_controller.do" method="post">
			<!-- 작성자 -->
			<div class="form-group">
			
			<input type="hidden" name="no" value="${no}">
		    <input type="hidden" name="content" id="content">
			
			<input type="text" id="title" name="title" value="${vo.title}" class="title form-control">
			</div>
		

			<textarea id="summernote" id="content" name="content">${vo.content}</textarea>
			
			<div class="text-center">	
				<button type="submit" class="btn btn-comm-con">수정완료</button>
				<button type="reset" class="btn btn-comm-con">취소</button>
				<a href="${pageContext.request.contextPath}/freeboard.do"><button type="button" class="btn btn-comm-con">게시글</button></a>
			</div>
		</form>

	</div>
<br><br><br><br><br>






<!-- foooter 부분.. --> 
<jsp:include page="../footer_bar.jsp" />





</body>

<script>
/*summernote form*/


		newJquery('#summernote').summernote({
		 height: 300,                 // set editor height
		 minHeight: 300,            // set minimum height of editor
		 maxHeight: 500,            // set maximum height of editor
	     focus: true,
	     placeholder: '내용을 입력하세요.',	  
		});		

  		
		
	
</script>

</html>