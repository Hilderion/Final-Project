<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
$(function(){

	var fileAddCount = 2;
	$("#file_add").on('click',function(){
		
		var moreFile = "<input type='file' id='rep_file_ "
						+ fileAddCount + "' accept='image/*' name='upfiles'>"
		$("#file_more").append(moreFile);

		if (fileAddCount == 4) {
			$("#file_add").prop("disabled",true);
		}
		fileAddCount++;			
	});
	
	$("#file_form").on("change", 'input', function() {
		var fileName = $(this).val();
	
		fileName = fileName.slice(fileName.indexOf(".")+1).toLowerCase();
		
		if (fileName != "jpg" && fileName != "png" && fileName != "gif" && fileName != "bmp") {
			$(this).val("");
			
			return;
		}
	});	
	
	$("#rep_title").on("change",function(){
		if ($("#rep_title").val().length > 100) {
			
		}
	})
	
	$("#form_submit").on('click',function(){
		$("#p-wrn2").addClass('hide');
		$("#p-wrn3").addClass('hide');
		
		if ($("#rep_title").val().length > 100 || $("#rep_content").val().length > 3000) {
			$("#p-wrn2").removeClass('hide');
			return false;
		}
		
		if ($("#rep_title").val().length == 0 || $("#rep_content").val().length == 0) {
			
			$("#p-wrn3").removeClass('hide');
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
				<label style="margin-top: 10px;">유저 문의</label>
				<hr />
				<form action="reqwrite" method="post" enctype="multipart/form-data">
					<input type="hidden" name="user.no" value="${LOGIN_USER.no }">
					<div class="form-group">
						<label>문의 유형</label> <select name="type" id="rep_type">
							<option value="rep1">문의1</option>
							<option value="rep2">문의2</option>
							<option value="rep3">문의3</option>
						</select> 
					</div>
					<div class="form-group">
						<label for="" style="margin-right: 30px;">제목</label> <input
							type="text" style="width: 660px;" name="title" id="rep_title">
					</div>
					<div class="form-group">
						<textarea rows="150" cols="100" name="content" id="rep_content" style="border-style:solid; border-width:1px; border-color:lightgrey; height:300px;" ></textarea>
					</div>
					<div class="form-group" id="file_form">
						<label for="">파일첨부</label> <input type="file" id="rep_file_1"
							name="upfiles" accept="image/*">
						<p id="file_more"></p>
						<button class="btn btn-xs btn-success" style="margin-left: 200px;"
							id="file_add" type="button">추가첨부</button>
						<p style="color: lightgrey; font-size: 10px; margin-top: 10px;"
							id="p-wrn">첨부파일은 .jpg,.gif,.png형식으로만 업로드 가능합니다.</p>
						<p style="color: red; font-size: 12px; margin-top: 10px;"
							id="p-wrn2" class="hide">제목은 100글자, 내용은 3000글자 이내로 작성하셔야 합니다.</p>
						<p style="color: red; font-size: 12px; margin-top: 10px;"
							id="p-wrn3" class="hide">제목과 내용은 필수 입력요소입니다.</p>
					</div>
					<div class="form-group" style="margin-left: 600px;">
						<button class="btn btn-md btn-primary" id="form_submit"
							type="submit">작성</button>
						<a class="btn btn-md btn-danger" href="">취소</a>
					</div>
				</form>

			</div>

			<div class="col-lg-10"
				style="margin-top: 30px; background-color: white;">
				<label style="margin-top: 10px;">나의 문의 기록</label>
				<hr />
				<table class="table">
					<thead>
										<tr>
											<th>no</th>
											<th>유형</th>
											<th>제목</th>
											<th>작성자</th>
											<th>작성일</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="board" items="${boards }">
											<tr id="rep_no_${board.no }">
												<td>${board.no }</td>
												<td>${board.type }</td>
												<td style="width: 300px;"><a
													href="boardDetail?no=${board.no }">${board.title }</a></td>
												<td>${LOGIN_USER.name }</td>
												<td><fmt:formatDate value="${board.createDate }"
														pattern="yyyy-MM-dd" /></td>
											</tr>
										</c:forEach>
									</tbody>
				</table>

			</div>


		</div>
		<!-- contents end -->
		<div class="right-content">
			<%@ include file="/WEB-INF/views/main/right-content.jsp"%>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/chat.jsp"%>
</body>
</html>
