<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<body>


	<div class="container">

		<!-- 글목록 -->

		<c:forEach items="${list}" var="vo">
			<div class="media">
				<div class="media-left">
					<h5>${vo.no}</h5>
				</div>
				<div class="media-body">
					<h4 class="media-heading">
						<a
							href="${pageContext.request.contextPath}/freeboard_content.do?no=${vo.no}">${vo.title}</a>
					</h4>
					<div class="row">
						<div class="col-xs-3">${vo.name}</div>
						<div class="col-xs-3 text-right">
							<i class="fa fa-eye"></i> ${vo.hits}
						</div>
						<div class="col-xs-4 text-right">${vo.fbdate}</div>
						<div class="col-xs-2 text-right">
							<i class="fa fa-thumbs-up"></i> ${vo.likeit}
						</div>
					</div>
				</div>
			</div>
			<hr>
		</c:forEach>




	</div>





</body>
