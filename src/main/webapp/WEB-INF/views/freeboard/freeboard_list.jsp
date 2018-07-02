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

<!-- 브라우저에 표시될 문서 제목 -->
<title>가상화폐 모의거래소 coinweb</title>
</head>
<script>






</script>
<body>



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
  
  



</body>
</html>