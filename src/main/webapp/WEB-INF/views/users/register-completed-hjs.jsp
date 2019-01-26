<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>페이스북 만들자</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<header style="background-color: #66CDAA; width:100%; height: 82px;">
  <div class="row">
  	<div class="col-xs-12">
  		<p style="font-size: 35px; color:white; margin-top: 15px; text-align: center;"><img src="https://static.thenounproject.com/png/1970135-200.png" style="width: 50px; height: 50px;"> F.A(프리 에이전트 아님)</a></p>
  	</div>
  </div>
</header>
<body style="background-color: seashell;">
	<div class="row">
		<div class="col-xs-offset-4 col-xs-4">
			<p id="title" style="text-align: center; margin-top: 75px; font-size: 20px;">F.A에서 친구들과 소통해보세요</p>
			<div class="panel panel-info" style="margin-top: 65px;">
				<div class="panel-heading" style="text-align: center; background-color: #66CDAA;"><span style="color: white;">F.A에 로그인</span></div>
				<div class="panel-body">
					<form method="post" action="login">
						<img src="https://static.thenounproject.com/png/659889-200.png" style="margin-left: 185px;">
						<input type="text" name="mailid" placeholder="E-mail을 입력해주세요" style="width: 250px; height: 30px; margin-left: 165px; margin-top: 20px;">
						<input type="password" name="pwd" placeholder="비밀번호를 입력해주세요" style="width: 250px; height: 30px; margin-top: 20px; margin-left: 165px;">
						<button type="submit" class="btn btn-success" style="width: 250px; margin-top: 20px; margin-left: 165px;">로그인</button>
					</form>
				</div>
			</div>		
		</div>
	</div>
</body>
<footer style="background-color: white;">
	
</footer>

</html>