<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
	integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet"
	href="resources/css/find-friend.css?ver=<%=new Date()%>" />
<link type="text/css" rel="stylesheet"
	href="resources/css/topbar.css?ver=<%=new Date()%>" />
<link type="text/css" rel="stylesheet"
	href="resources/css/right.css?ver=<%=new Date()%>" />
</head>
<script>
	$(function() {
		$("#sub_write").on('click', function() {
			$("#p-wrn1").addClass('hide');

			if ($("#contents_write").val().length == 0) {
				$("#p-wrn1").removeClass('hide');
				return false;
			}
		})

	});
</script>
<body>
	<%@ include file="/WEB-INF/views/topbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-lg-10"
				style="margin-top: 50px; background-color: white;">
				<!-- contents start -->


				<div class="row" style="margin-top: 30px;">
					<div class="col-xs-offset-1 col-xs-2" style="padding: 0px;">
						<img src="/fa/resources/admin/images.png"
							style="width: 50px; height: 50px;">
					</div>
					<div class="col-xs-8" style="padding: 0px;">
						<label id="rep_user_name">${board.user.name }</label>
						<hr style="margin-top: 2px; margin-bottom: 2px;">
						<span id="rep_date" style="color: grey; font-size: 13px;">
							<fmt:formatDate value="${board.createDate }"
								pattern="yyyy-MM-dd hh:mm" />
						</span>
					</div>
					<hr style="margin-top: 2px; margin-bottom: 2px;">
					<div class="row">
						<div class="col-xs-offset-1 col-xs-10"
							style="margin-top: 10px; margin-bottom: 10px;">
							<span id="rep_no" style="margin-right: 10px; color: orange;">${board.no }</span>
							<span id="rep_type" style="color: blue;">${board.type }</span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-offset-1 col-xs-10">
							<label id="rep_title">${board.title}</label>
						</div>

					</div>
					<!-- contents -->
					<div class="row">
						<div class="col-xs-offset-1 col-xs-10">
							<hr style="margin-top: 20px; margin-bottom: 20px;" />
							<p id="rep_content">${board.content }</p>
							<hr style="margin-top: 20px; margin-bottom: 20px;">
						</div>
					</div>

					<!-- attach File -->
					<div class="row">
						<div class="col-xs-offset-1 col-xs-10">
							<p style="color: green;">첨부파일</p>

						</div>
						<div class="col-xs-offset-2 col-xs-8" style="font-size: 12px;">
							<c:forEach var="files" items="${board.photos }">
								<div>
									<a href="download2?dir=repfile&name=${files.image }">${files.image }</a>
								</div>
							</c:forEach>
						</div>

					</div>

					<!-- sub -->
					<div class="row">
						<div class="col-xs-offset-1 col-xs-10">
							<hr />
							<p style="color: green;">댓글</p>

							<c:forEach var="sub" items="${board.subs }">
								<c:if test="${sub.repSubShow eq 'Y' }">
									<div id="reply_no_${sub.no }">
										<span style="color: brown; margin-right: 20px;"
											id="reply_user_${sub.user.no }">${sub.user.name }</span> <span
											style="color: red; font-size: 10px;" class="text-right"
											id="reply_date_${sub.no }"><fmt:formatDate
												value="${sub.createDate }" pattern="yyyy-MM-dd" /></span>

										<p id="reply_content_33">${sub.content }</p>
										<!-- 일치하는 사용자  or admin일때만 삭제 버튼을 보여줄것 -->
										<a class="btn btn-xs btn-default pull-right"
											href="/fa/subDel2?boardNo=${board.no }&subNo=${sub.no}">지우기</a>
										<hr style="margin-top: 40px;" />
									</div>
								</c:if>
							</c:forEach>

						</div>
					</div>

					<!-- sub write -->
					<div class="row">
						<div class="col-xs-offset-1 col-xs-10">
							<form action="subWrite2"
								method="post">
								<input type="hidden" name="boardNo" value="${board.no }">
								<input type="hidden" name="userNo" value="${LOGIN_USER.no }">
								<textarea name="sub_contents" id="contents_write" cols="50"
									rows="3" style="margin-bottom: 20px; border-style:solid; border-width:1px; border-color:lightgrey;"></textarea>
								<p style="color: red; font-size: 12px; margin-top: 10px;"
									id="p-wrn1" class="hide">내용은 필수 입력요소입니다.</p>
								<button class="btn btn-xs btn-primary pull-right"
									style="width: 50px; height: 30px;" id="sub_write">작성</button>
							</form>
						</div>
					</div>


				</div>


			</div>
			<!-- contents end -->
			<div class="right-content">
				<%@ include file="/WEB-INF/views/main/right-content.jsp"%>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/chat.jsp"%>
</body>
</html>
