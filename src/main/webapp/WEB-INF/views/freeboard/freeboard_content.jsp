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
<script src="${pageContext.request.contextPath}/js/MyAjax.js"></script>


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
				<p style="font-weight: bold;">커뮤니티</p>
			</div>
		</div>
	</div>
	<hr>




	<div class="container">

		<div class="freeboard_content_title">
			<p class="freeboard_content_title_text">${vo.title}</p>
			<p class="freeboard_content_title_date">${vo.fbdate}</p>
		</div>
		<div class="freeboard_content_author">
			<p class="freeboard_content_author_name">${vo.name}</p>
			<div class="freeboard_content_author_info">
				<p>
					조회수 <span class="author_info">${vo.hits}</span>
				</p>
				<p>
					좋아요 <span class="author_info like_count">${vo.likeit}</span>
				</p>
				<p>
					댓글 <span class="author_info">0</span>
				</p>
			</div>

		</div>

		<!-- 게시판 내용 -->
		<div class="freeboard_content">
			<p>
                        	${vo.content}
                        </p> 
		</div>

		
		<!-- 게시판 버튼 -->
		<div class="text-center">
			<button class="likeitBtn btn-like btn btn-xs" type="button"
				onclick="likeitBtnMain()">
				좋아요 <i class="fa fa-thumbs-up fa-lg"></i>
			</button>
			<button class="dislikeitBtn btn-dislike btn btn-xs" type="button"
				onclick="dislikeitBtnMain()">
				싫어요 <i class="fa fa-thumbs-down fa-lg"></i>
			</button>
		</div>
		<br>
		<div class="text-center">

			
			<c:if test="${sid eq vo.id or sid eq 1001}">
				<a
					href="${pageContext.request.contextPath}/freeboard_update.do?no=${no}"><button
						type="button" class="btn btn-comm-con btn-xs">수정하기</button></a>
				<a href="${pageContext.request.contextPath}/freeboard_delete.do?no=${no}"><button type="button"
						class="btn btn-comm-con btn-xs">바로삭제</button></a>
			</c:if>
			<a href="${pageContext.request.contextPath}/freeboard.do"><button
					type="button" class="btn btn-xs">목록으로</button></a>
		</div>

		<br>
	<!-- start of reply -->
			<div class="container">
			
							
						<br>
						<div>
						<span class="reply-title" id="btnReWrite"><strong>Comments</strong></span>		
						
						 </div>
							
							
							<div class="reply-write">
								<label id="reply-write-title" class="reply-write-title">
											댓글을 남겨주세요.
									</label>
								<div style="width: 100%; "  contenteditable="true" class="reply-write-content" id="content"  
								name="content" ></div>
							</div>	
								<div style="text-align: right; margin-top: 10px;">
								
									<span id="sizeLimit">0</span> /300 
									<button class="reply-write-button btn">등록</button>
								
								</div>
								
								<input type="hidden" id="reply-write-check" value="hide">
								<input type="hidden" name="no" value="${vo.no }">
							
			
																			
				
						<!-- 리플 리스트 -->				
						<div class="reply-content">	
						<input type="hidden" id="reply-content-check" value="hide">										
						</div>							
				
				
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
		
		
		//댓글쓰기 안내 사라지게 하기
		$(".reply-write-content").keyup(function(){
			var index =$(this).indexSearch();
		    
			if($(".reply-write-content"+index).text().length>0){
				$(".reply-write-title"+index).fadeOut(100);
				
			}if($(".reply-write-content"+index).text().length==0){
				$(".reply-write-title"+index).fadeIn(100);
				
			}				
		});
		
		
		//댓글숫자 체크
		$(".reply-write-content").keyup(function(){	
			var index =$(this).indexSearch();
	
			$("#sizeLimit"+index).text($(".reply-write-content"+index).text().length);
						
				if($(".reply-write-content"+index).text().length>300){
					alert("글자수 300자까지\n입력할 수 있습니다.");
					var data =$(".reply-write-content"+index).text().substring(0,300);
					$(".reply-write-content"+index).text(data);
					$("#sizeLimit"+index).text($(".reply-write-content"+index).text().length);
				}
		});
	});

$(document).ready(function(){			
	
		
		
		//댓글 등록버튼
		$(".reply-write-button").click(function(){
			
			/* 댓글 등록 시작 */
			var content = $(".reply-write-content").text();
			var rname = "${name}";
			var no = "${vo.no}";
			
			if(sid==""){
				alert("로그인 후 이용하실수 있습니다.");
			}else{
				if(content == ""){
					alert("댓글 내용을 입력해주세요.");
				}else{
				$.ajax({
					url : '${pageContext.request.contextPath}/reply_write_check.do',
					type :'GET',
					data : 'id='+sid+'&rname='+rname+'&content='+content+'&no='+no,
					dataType : 'json',
					contentType : 'application/x-www-form-urlencoded;charset=utf-8',
					success : function(data){				
			
						if(data.length != 0){	
										
							 location.reload();
						}						
					}
				});	
				}
			}
		});	

		
		//댓글보기			
		$(function(){	
			var no = "${vo.no}";
			
			$.ajax({
				url : '${pageContext.request.contextPath}/reply_list.do',
				method :'GET',	
				data : 'no='+no,
				dataType : 'json',
				success : function(data){
					$(".view1, .view2, .view3").remove();				
					for(i=0;i<data.length;i++){
						code = 	"<div class='replyDiv'>"+
						  "<div class='row'> "+
					      "<input id='rid"+i+"' value='"+data[i].rid+"' name='rid' type='hidden'>"+
					      "<span class='view1 col-xs-6'>"+data[i].rname +"</span>&nbsp;&nbsp;&nbsp;"+						
						  "<button id='replyBtnLikeit"+i+"' data-id='"+i+"' type='button' class='replyBtnLikeit replyBtn'><i class='fa fa-thumbs-up'></i> "+ data[i].likeit+"</button>"+	
						  "<button id='replyBtnLikeit"+i+"' data-id='"+i+"' type='button' class='replyBtnDislikeit replyBtn'><i class='fa fa-thumbs-down'></i> "+ data[i].dislikeit+"</button>"+							
					      "</div>"+
					      
					      "<div class='row'>"+
					      
					      "<span class='view3 replyRdate col-xs-6'>"+data[i].rdate +"</span></div>"+
					      "<div class='row'>"+
					      "<div class='col-xs-12 view2'>"+data[i].content+"</div></div>"+
					  		
						  "</div>";				
						
						$(".reply-content").append(code);
					}
						
					reply_likeit();
					reply_dislikeit();
				}
			});
		});	
});

function reply_likeit(){
	$(".replyBtnLikeit").click(function(){
		if(sid==""){
			alert("로그인 후 이용하실수 있습니다.");
		}else{
			var index = $(this).data("id");
			var rid = $("#rid"+index).val();
			var param ={'bid' : '${no}' , 'rid' :rid , 'id' : sid };
			MyAjax.excute('${pageContext.request.contextPath}/freeboardreply_likeit.json', param, 'POST').done(function(response){
				if(response == 1){
					alert("${vo.name}님의 댓글을 추천합니다");
				}else{
					alert("이미 추천을 눌렀습니다.");
				}		
			});
		}
	});
};
	
function reply_dislikeit(){
	$(".replyBtnDislikeit").click(function(){
		if(sid==""){
			alert("로그인 후 이용하실수 있습니다.");
		}else{
			var index = $(this).data("id");
			var rid = $("#rid"+index).val();
			var param ={'bid' : '${no}', 'rid' :rid, 'id' : sid};
			MyAjax.excute('${pageContext.request.contextPath}/freeboardreply_dislikeit.json', param, 'POST').done(function(response){
				if(response == 1){
					alert("${vo.name}님의 댓글을 반대합니다");
				}else{
					alert("이미 반대를 눌렀습니다.");
				}		
			});
		}
	});
};


function likeitBtnMain(){
	if(sid==""){
		alert("로그인 후 이용하실수 있습니다.");
	}else{
		var param ={'no' : '${no}', 'id' : sid};
		MyAjax.excute('${pageContext.request.contextPath}/freeboard_likeit.json', param, 'POST').done(function(response){
			if(response == 1){
				alert("${vo.name}님의 게시물에 좋아요를 눌렀습니다.");
			}else{
				alert("이미 좋아요를 눌렀습니다.");
			}
		});
	}
} 

function dislikeitBtnMain(){
	if(sid==""){
		alert("로그인 후 이용하실수 있습니다.");
	}else{
		var param ={'no' : '${no}', 'id' : sid};
		MyAjax.excute('${pageContext.request.contextPath}/freeboard_dislikeit.json', param, 'POST').done(function(response){
			if(response == 1){
				alert("${vo.name}님의 게시물에 싫어요를 눌렀습니다.");
			}else{
				alert("이미 싫어요를 눌렀습니다.");
			}
		});
	}
}

</script>

</body>
</html>