<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

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
<body style="background-color: #282828;">
	<div class="container" style="margin-top: 100px;">
		<%@ include file="header-jih.jsp"%>


		<div class="row">

			<%@ include file="sidebar-jih.jsp"%>
			<div class="col-xs-10" style="height: 1080px;">
				<div class="row" style="background-color: white; height: 800px;">

					<%@ include file="new-admin-jih.jsp"%>



				</div>
			</div>
		</div>
	</div>
</body>
</html>
