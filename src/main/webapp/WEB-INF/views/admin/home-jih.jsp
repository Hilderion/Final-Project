<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<script>
	$(function() {
		$("li").hover(function() {
			$(this).css("background-color", "green");
		}, function() {
			$(this).css("background-color", "#282828")
		});
	})
</script>
<style>
li {
	margin: 10px;
}

.panel {
	margin-top: 50px;
}

.panel-body p {
	font-size: 13px;
}
</style>
<body style="background-color: #282828;">
	<div class="container" style="margin-top: 100px;">

		<%@ include file="header-jih.jsp"%>

		<div class="row">

			<%@ include file="sidebar-jih.jsp"%>

			<div class="col-xs-10" style="height: 500px;">
				<div class="row" style="background-color: white;">
					<div class="col-xs-6"
						style="height: 500px; background-color: white;">

						<div class="panel" style="border: 1px solid grey;">
							<div class="panel-heading" style="background-color: #282828;">
								<span style="color: #e1e1e1">신고현황</span> <span
									style="color: #e1e1e1; margin-left: 10px;"
									class="glyphicon glyphicon-th pull-right"></span> <span
									style="color: #e1e1e1"
									class="glyphicon glyphicon-chevron-up pull-right"></span>

							</div>
							<div class="panel-body">
								<c:choose>
									<c:when test="${caseCount gt 0}">
										<p>
											새로운 신고가 <span style="color: red;">${caseCount }</span>건 있습니다
										
										<p>
									</c:when>
									<c:otherwise>
										<p style="color: lightgrey;">새로 접수 된 신고가 없습니다.</p>
									</c:otherwise>
								</c:choose>
							</div>
						</div>

						<div class="panel" style="border: 1px solid grey;">
							<div class="panel-heading" style="background-color: #282828;">
								<span style="color: #e1e1e1">문의현황</span> <span
									style="color: #e1e1e1; margin-left: 10px;"
									class="glyphicon glyphicon-th pull-right"></span> <span
									style="color: #e1e1e1"
									class="glyphicon glyphicon-chevron-up pull-right"></span>

							</div>
							<div class="panel-body">
								<c:forEach var="board" items="${boards }">
									<a href="admin/repBoard/boardDetail?no=${board.no }"><p>${board.title }</p></a>
								</c:forEach>
							</div>
						</div>


					</div>

					<div class="col-xs-6"
						style="height: 500px; background-color: white;">

						<div class="panel" style="border: 1px solid grey;">
							<div class="panel-heading" style="background-color: #282828;">
								<span style="color: #e1e1e1">신규 가입 현황</span> <span
									style="color: #e1e1e1; margin-left: 10px;"
									class="glyphicon glyphicon-th pull-right"></span> <span
									style="color: #e1e1e1"
									class="glyphicon glyphicon-chevron-up pull-right"></span>

							</div>
							<div class="panel-body">
								<c:choose>
									<c:when test="${userCount gt 0}">
										<p>
											새로운 회원 가입이 <span style="color: red;">${userCount }</span>건
											있습니다
										<p>
									</c:when>
									<c:otherwise>
										<p style="color: lightgrey;">신규 가입 회원이 없습니다.</p>
									</c:otherwise>
								</c:choose>
							</div>
						</div>

						<div class="panel" style="border: 1px solid grey;">
							<div class="panel-heading" style="background-color: #282828;">
								<span style="color: #e1e1e1">광고 신청 현황</span> <span
									style="color: #e1e1e1; margin-left: 10px;"
									class="glyphicon glyphicon-th pull-right"></span> <span
									style="color: #e1e1e1"
									class="glyphicon glyphicon-chevron-up pull-right"></span>

							</div>
							<div class="panel-body">
								<c:choose>
									<c:when test="${adCount gt 0}">
										<p>
											신규 광고 요청이 <span style="color: red">${adCount }</span>건 있습니다.
										</p>
									</c:when>
									<c:otherwise>
										<p style="color:lightgrey;">신규 광고 요청이 없습니다.</p>
									</c:otherwise>
								</c:choose>
								
							</div>
						</div>




					</div>

				</div>

			</div>
		</div>
	</div>

</body>
</html>
