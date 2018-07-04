<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/freeboard.css">

<body>


	<div class="container">

		<!-- 글목록 -->

		<c:forEach items="${list}" var="vo">
			<div class="media">

				<input type="hidden" value="${vo.no}">

				<div class="media-body">
					<h4 class="media-heading list_title">
						<a
							href="${pageContext.request.contextPath}/freeboard_content.do?no=${vo.no}">${vo.title}</a>
					</h4>
					<div class="row">
						<div class="col-xs-4 list_name">${vo.name}</div>
						<div class="col-xs-8 text-right">
							<i class="fa fa-eye"></i> ${vo.hits}&nbsp; <i class="fa fa-heart"></i>
							${vo.likeit}&nbsp; ${vo.fbdate}

						</div>
					</div>
				</div>
				<hr>
			</div>
		</c:forEach>




	</div>





</body>
