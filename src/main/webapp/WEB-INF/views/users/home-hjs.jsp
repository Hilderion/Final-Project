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
  	<div class="col-xs-6">
  		<p style="font-size: 35px; color:white; margin-top: 15px; margin-left: 170px;"><img src="https://static.thenounproject.com/png/1970135-200.png" style="width: 50px; height: 50px;">  페 북</p>
  	</div>
  	<c:choose>
  	<c:when test="${empty LOGIN_USER }">
  	<form method="post" action="login">
	  	<div class="col-xs-6">
	  		<div class="mail" style="position:relatvie; margin-top: 15px;">
	  			<label style="color:white;">e-mail 주소</label><br>
	  			<input type="email" name="mailid"> 
	  		</div>
	  			<div class="pwd" style="position:relative; bottom:51px; margin-left: 190px;">
	  			 	<label style="color:white;">비밀번호</label><br>
	  				<input type="password" name="pwd">  			
	  			</div>
	  		<button type="submit" class="btn btn-success btn-sm" style="position:relative; margin-left:380px; bottom:80px; box-shadow: inset 0 1px 1px #a4e388; border-color: #3b6e22 #3b6e22 #2c5115;">로그인</button>
	  	</div>
  	</form>
  	</c:when>
  	<c:otherwise>
  		<p>${LOGIN_USER.name }님 환영합니다.<p>
  	</c:otherwise>
  	</c:choose>
  </div>
</header>
<body style="background-color: seashell;">
	<div class="row">
		<div class="col-xs-6">
			<p style="color:black; font-size: 18px; text-align: center; margin-top: 30px; margin-left: 10px;">페북에서 다양한 친구들과 소통해보세요</p>
			<img src="resources/image/mainimage.png" style="position: relative; margin-left: 75px; margin-top: 10px;">
		</div>
		<div class="col-xs-6">
			<p style="font-size: 40px; margin-top: 20px;"><strong>가입하기</strong></p>
			<form method="post" action="register" class="form">
				<input id="username" type="text" name="name" placeholder="이름을 입력 해주세요" style="width: 285px; height: 35px; margin-top: 40px;"><label class="name_check" style="margin-left: 10px;"></label><br />
				<input id="usermail" type="text" name="email" placeholder="e-mail 주소를 입력 해주세요" style="width: 285px; height: 35px; margin-top: 40px;"><label class="mail_check" style="margin-left: 10px;"></label><br />
				<input id="userpwd" type="password" name="pwd" placeholder="비밀번호: 영문 + 숫자로 입력 해주세요" style="width: 285px; height: 35px; margin-top: 40px;"><label class="pwd_check" style="margin-left: 10px;"></label><br />
				
				<p style="font-size: 15px; margin-top: 40px;">생일</p>
				<select name="year" style="width: 65px; height: 30px;">
					<option>선택</option>
					<option value="2018">2018</option>
					<option value="2017">2017</option>
					<option value="2016">2016</option>
					<option value="2015">2015</option>
					<option value="2014">2014</option>
					<option value="2013">2013</option>
					<option value="2012">2012</option>
					<option value="2011">2011</option>
					<option value="2010">2010</option>
					<option value="2009">2009</option>
					<option value="2008">2008</option>
					<option value="2007">2007</option>
					<option value="2006">2006</option>
					<option value="2005">2005</option>
					<option value="2004">2004</option>
					<option value="2003">2003</option>
					<option value="2002">2002</option>
					<option value="2001">2001</option>
					<option value="2000">2000</option>
					<option value="1999">1999</option>
					<option value="1998">1998</option>
					<option value="1997">1997</option>
					<option value="1996">1996</option>
					<option value="1995">1995</option>
					<option value="1994">1994</option>
					<option value="1993">1993</option>
					<option value="1992">1992</option>
					<option value="1991">1991</option>
					<option value="1990">1990</option>
					<option value="1989">1989</option>
					<option value="1988">1988</option>
				</select>
				<select name="month" style="width: 65px; height: 30px;">
					<option>선택</option>
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select>
				<select name="day" style="width: 65px; height: 30px;">
					<option>선택</option>
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					<option value="26">26</option>
					<option value="27">27</option>
					<option value="28">28</option>
					<option value="29">29</option>
					<option value="30">30</option>
					<option value="31">31</option>
				</select>
				<p style="font-size: 15px; margin-top: 40px;">성별</p>
				<div id="gender-div" style="margin-top: 10px; width: 125px;">
					<input class = "usergender" type="radio" name="gender" value="M"><span style="font-size: 18px;">남성</span>
					<input class = "usergender" type="radio" name="gender" value="F" style="margin-left: 15px;"><span style="font-size: 18px;">여성</span>
				</div>
				<button type="submit" class="btn btn-success btn-lg" style="width: 200px; height: 45px; margin-top: 50px; box-shadow: inset 0 1px 1px #a4e388; border-color: #3b6e22 #3b6e22 #2c5115;"><strong>가입하기</strong></button><br />
			</form>
		</div>
	</div>
</body>
<footer style="background-color: white;">
	
</footer>
<script type="text/javascript">

	$(function(){
		
		var re_name = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,5}$/;
		var re_mail = /^[0-9a-z]([-_\.]?[0-9a-z])*@[0-9a-z]([-_\.]?[0-9a-z])*\.[a-z]{3}$/i;	
		var re_pwd = /^[a-z0-9_-]{8,12}$/;
		
		var form = $('.form');
		var name = $('#username');
		var mail = $('#usermail');
		var pwd = $('#userpwd');
		var gender = $('.usergender');
		
		form.submit(function() {
			
			if(re_name.test(name.val()) != true) {
				alert("이름 입력 오류 :: 형식에 맞게 이름을 입력해주세요");
				$("#username").css("border","solid 3px red");
				return false;
			} else {
				$("#username").css("border","");
			}
			
			if (re_mail.test(mail.val()) != true) {
				alert("이메일 주소 입력 오류 :: 이메일 주소를 반드시 입력하세요");
				$("#usermail").css("border","solid 3px red");
				return false;
			} else {
				$("#usermail").css("border","");
			}
			
			if (re_pwd.test(pwd.val()) != true) {
				alert("비밀번호 입력 오류 :: 조건에 맞는 비밀번호를 입력해주세요");
				$("#userpwd").css("border","solid 3px red");
				return false;
			} else {
				$("#userpwd").css("border","");
			}
			
			if (gender.is(":checked") == "") {
				alert("성별 선택 오류 :: 성별은 선택하셔야죠?");
				$("#gender-div").css("border","solid 3px red");
				return false;
			} else {
				$("#gender-div").css("border","");
			}
			
			
		});
		
		
		name.keyup(function() {
			if(name.val().length < 2) {
				$(".name_check").text("이름은 한 글자 이상으로 입력하세요");
				$(".name_check").css("color","red");
			} else if(name.val().length > 5) {
				$(".name_check").text("이름은 다섯 글자 이하로 입력하세요");
				$(".name_check").css("color","red");
			} else {
				$(".name_check").text("올바른 이름입니다.");
				$(".name_check").css("color","green");
			}
		});
		
		mail.keyup(function() {
			if(mail.val() == "") {
				$(".mail_check").text("이메일 주소를 입력해주세요");
				$(".mail_check").css("color","red");
			} else if(!re_mail.test(mail.val())) {
				$(".mail_check").text("유효한 이메일 주소를 입력해주세요");
				$(".mail_check").css("color","red");
			} else {
				$(".mail_check").text("유효한 이메일 주소입니다.");
				$(".mail_check").css("color","green");
			}
		});
			
		pwd.keyup(function() {
			if(pwd.val().length < 8) {
				$(".pwd_check").text("비밀번호는 8글자 이상으로 입력하세요");
				$(".pwd_check").css("color","red");
			} else if(pwd.val().length > 12) {
				$(".pwd_check").text("비밀번호는 12글자 이상으로 입력할 수 없습니다.");
				$(".pwd_check").css("color","red");
			} else {
				$(".pwd_check").text("올바른 비밀번호입니다.");
				$(".pwd_check").css("color","green");
			}
		});		
		
		
	});
</script>
</html>

