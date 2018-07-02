<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
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
	href="${pageContext.request.contextPath}/css/freeboard.css">

<!-- 페이징저리 -->	
<script src="http://localhost:8080/coinweb/js/am-pagination.js"></script>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/coinweb/css/am-pagination.css">



	

<!-- 브라우저에 표시될 문서 제목 -->
<title>가상화폐 모의거래소 coinweb</title>
</head>


<body>



	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid text-center">
		<p>COINWEB</p>
	</div>
	</nav>




	<div class="container" style="margin-top: 40px;">
		<div class="row freeboard_header">
			<hr>
			<div class="col-xs-4"></div>
			<div class="col-xs-4 text-center">
				<div class="freeboard_header_title">
					<p style="font-weight: bold;">커뮤니티</p>
				</div>
			</div>
			<div class="col-xs-4 text-right">
				<a data-toggle="tooltip" type="button" id="freeboard_write_btn" title="글쓰기"> <i
					class="fa fa-pencil-square-o" style="font-size: 25px;"></i></a>
			</div>
		</div>
	</div>
	<hr>





<div class="container">

  <!-- 글목록 -->

 <c:forEach items="${list}" var="vo">
  <div class="media">
    <div class="media-left">
      	<h5>${vo.no}</h5>
    </div>
    <div class="media-body">
      <h4 class="media-heading"><a href="${pageContext.request.contextPath}/freeboard_content.do?no=${vo.no}">${vo.title}</a></h4>
      <div class="row">
      	<div class="col-xs-3">${vo.name}</div>
      	<div class="col-xs-3 text-right"><i class="fa fa-eye"></i> ${vo.hits}</div>
      	<div class="col-xs-4 text-right">${vo.fbdate}</div>
      	<div class="col-xs-2 text-right"><i class="fa fa-thumbs-up"></i> ${vo.likeit}</div>
      </div>
    </div>
  </div>
  <hr>
  </c:forEach>
  
 


  </div>















  <div class="container">
 <form action="/coinweb/freeboard_search.do?rpage=${rpage}" method="get">
    <div class="input-group form-group-sm">
      <input type="text" name="search"  class="form-control" placeholder="검색" name="search">
      <div class="input-group-btn">
        <button class="btn btn-default " type="submit">
        <i class="fa fa-search" style="font-size: 16px; float: left;" ></i></button>
      </div>
    </div>
    
    <div id="ampaginationsm" style="text-align: center; ">dd</div>
  </form>
  </div>




 <br><br><br><br><br><br>
 <br><br><br><br><br><br>



<jsp:include page="../footer_bar.jsp" />



<script>
	$(document).ready(function($) {
		
		
		var pager = $('#ampaginationsm').pagination({
			
		    maxSize: 7,	    		// max page size
		    totals: '${dbCount}',	// total pages	
		    page: '${rpage}',		// initial page		
		    pageSize: 10,			// max number items per page
		
		    // custom labels		
		    lastText: '&raquo;&raquo;', 		
		    firstText: '&laquo;&laquo;',		
		    prevText: '&laquo;',		
		    nextText: '&raquo;',
				     
		    btnSize:'sm'	// 'sm'  or 'lg'		
			});
		
		$('#ampaginationsm').on('am.pagination.change',function(e){
			   $('.showlabelsm').text('The selected page no: '+e.page);
	           $(location).attr('href', "/coinweb/freeboard.do?rpage="+e.page);         
	   		});
		});	
	
	$("#freeboard_write_btn").click(function($){
		
		
		var sid = '<c:out value="${sid}"/>';

		if(sid==""){
			alert("로그인 후 이용하실수 있습니다.");
		}else{
			location.href= '/coinweb/freeboard_write.do';			
		}
	});
</script>

</body>




</html>