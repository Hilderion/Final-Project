<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<style>
</style>
</head>
<script>
	
</script>

<body style="background-color: #282828;">
	<div class="container" style="margin-top: 100px;">
		<%@ include file="header-jih.jsp"%>

		<div class="row">

			<%@ include file="sidebar-jih.jsp"%>
			<div class="col-xs-10">
				<div class="row" style="background-color: white;">

					<div class="col-xs-offset-2 col-xs-8">
						<div class="panel panel-danger">
							<form action="test-submit" method="post">
								<div class="panel-heading">
									<h3>신고하기 ver test</h3>
								</div>
								<div class="panel-body form-group">

									<select name="type">
										<option>유형</option>
										<option value="user">유저</option>
										<option value="page">페이지</option>
										<option value="board">게시글</option>
										<option value="sub">댓글</option>
									</select> <input type="text" name="ihrNo" />
									<button type="submit">제출</button>
								</div>

							</form>
						</div>
					</div>



				</div>
			</div>
		</div>
	</div>
</body>
</html>
