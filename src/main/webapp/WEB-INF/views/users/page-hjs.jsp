<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>페이스북 만들자</title>
  	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">  	
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
  	
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<link type="text/css" rel="stylesheet" href="resources/css/topbar.css?ver=<%=new Date()%>" />
  	<link type="text/css" rel="stylesheet" href="resources/css/main-content.css?ver=<%=new Date()%>" />
  	<link type="text/css" rel="stylesheet" href="resources/css/left.css?ver=<%=new Date()%>" />
  	<link type="text/css" rel="stylesheet" href="resources/css/thirdcol.css?ver=<%=new Date()%>" />
  	<link type="text/css" rel="stylesheet" href="resources/css/right.css?ver=<%=new Date()%>"/>
</head>
<!-- <header style="background-color: #3b5998; width:100%; height: 82px;">
   <div class="row">
  	<div class="col-xs-6">
  		<p style="font-size: 35px; color:white; margin-top: 15px; text-align: center;">facebook</p>
  		
  	</div>
  	<form>
  	<div class="col-xs-4">
  		
  	</div>
  	</form>
  </div> 
</header> -->
<%@ include file="../topbar.jsp" %>
<body style="background-color: seashell;">
	<div class="row">
		<div class="col-xs-offset-4 col-xs-4">
			<p style="margin-top: 70px; text-align: center; font-size: 30px;">페이지 만들기</p>
			<p style="margin-top: 20px;">페이지를 만들어 다른 사람들과 소통해보세요. 시작하려면 페이지 이름, 카테고리를 입력해주세요.</p>
			<div id="page-default1" class="thumbnail" style="margin-top: 60px; height: 500px;">
				<img src="https://www.facebook.com/images/pages/create/community_illustration.png" style="margin-top: 20px;">
				<div class="caption">
					<p style="text-align: center; font-size: 20px; margin-top: 20px;"><strong>커뮤니티 또는 공인</strong></p>
					<span class="help-block" style="margin-top: 20px; text-align: center;">커뮤니티, 단체, 팀, 그룹 또는 클럽의 사람들과 교류하고 공유해보세요.</span>
					<button type="button"  id="page-start1" class="btn btn-info btn-sm" style="margin-left: 250px; margin-top: 35px;">시작하기</button>
				</div>
			</div>
			<div id="page-detail1" class="thumbnail" style="margin-top: 75px; height: 500px; display: none;">
				<img src="https://www.facebook.com/images/pages/create/community_illustration.png" style="margin-top: 20px;">
				<div class="caption">
					<p style="text-align: center; font-size: 20px; margin-top: 20px;"><strong>커뮤니티 또는 공인</strong></p>
					<span class="help-block" style="margin-top: 20px; text-align: center;">무료 Facebook 페이지로 커뮤니티 사람들과 교류하고 중요한 소식을 공유해보세요.</span>
						<form method="post" action= "makePage.do" id="makePageForm">
							<label style="margin-left: 36px;">페이지 이름 :</label><input type="text" placeholder="페이지의 이름을 지정하세요" style="margin-left: 15px; width: 400px;" name="pageName"><br />
							<!-- <label style="margin-left: 36px; margin-top: 15px;">카테고리 :</label><input type="text" placeholder="페이지를 설명하는 카테고리를 추가하세요" style="margin-left: 32px; width: 400px;"> -->
							<div class="form-group" style="margin-left: 36px;">
							  <label for="categorySelect">카테고리를 선택하세요</label>
							  <select class="form-control form-control-sm" id="categorySelect" name="pageCategory">
							    <option value="game">게임</option>
							    <option value="sprots">스포츠</option>
							    <option value="fashion">패션</option>
							    <option value="community">커뮤니티</option>
							  </select>
							</div>
							<button type="submit" class="btn btn-primary btn-sm" style="margin-left: 275px; margin-top: 35px;" id="makePageForm">만들기</button>
						</form>
				</div>
			</div>
		</div>
	</div>
</body>
<footer style="background-color: white;">
	
</footer>
<script type="text/javascript">
$(function(){
		$("#page-start1").click(function(){
			$("#page-default1").hide();
			$("#page-detail1").show();
		});
		$('')
	
	$('#makePageForm').onclick = function() {
		var message = confirm("페이지를 만드시겠습니까?");
		if (message == true) {
			alert("페이지 만들기 완료");
		}
		else {
			return false;
		}
	}

	$('#myCrasel').on('shown.bs.modal', function () {
		  $('#myInput').focus()
		});
});
</script>
</html>