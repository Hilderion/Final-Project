<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<style>
tr th{
	text-align:center;
	}
tr td {
	text-align:center;
	}
</style>
<script>
$(function(){
	$("#ad_permit_button").on('click',function(){
		$("#warn_upload").addClass('hide');
		if ($("#ad_photo").val() == "") {
			$("#warn_upload").removeClass('hide');
			return false;
		}
		if ($("#ad_date").val() == "") {
			$("#warn_upload").removeClass('hide');
			return false;
		}
		
	});
	
	$("#ad_photo").on("change", function() {
		var fileName = $(this).val();
	
		fileName = fileName.slice(fileName.indexOf(".")+1).toLowerCase();
		
		if (fileName != "jpg" && fileName != "png" && fileName != "gif" && fileName != "bmp") {
			$(this).val("");
			
			return;
		}
	});	
	
	
})



</script>
<body>
	<%@ include file="/WEB-INF/views/topbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-lg-10" style="margin-top:60px; background-color:white;"> <!-- contents start -->
				<label style="margin-top:10px;">광고가 필요해요</label>
				<hr />
				<div class="form-group row">
					<form class="form-horizontal" action="adPermit" id="adPermit" method="post" enctype="multipart/form-data">
						<input type="hidden" value="${LOGIN_USER.no }" name="userNo">
						<label class="col-sm-offset-2 col-sm-2" style="width:120px; margin-top:3px;">광고신청</label>
						<input type="file" class="col-sm-3" name="file" id="ad_photo" accept="image/*" />
						<input type="date" class="col-sm-2" name="startDate" id="ad_date"/>
						<button type="submit" class="btn btn-xs btn-info col-sm-1" style="margin-left:10px;" id="ad_permit_button">신청</button>
					</form>
				</div>
				<p id="warn_upload" class="hide" style="color:red; font-size:12px;">파일 혹은 날짜는 필수 입력사항입니다.</p>
				<p style="color:lightgrey; font-size:12px; margin-top:10px;">광고는 운영자와 상의 후 등록해주시길 바랍니다.</p>				
				<p style="color:lightgrey; font-size:12px;">광고 승인 시 신청한 날짜로부터 일주일간 게시됩니다.</p>				
				<p style="color:lightgrey; font-size:12px; margin-bottom:10px;">적용 이미지 포맷  : 250px / 400px , .bmp, .jpg, .png, .gif 파일만 업로드 가능합니다.</p>		
				
			</div><!-- contents end -->
			<div class="col-lg-10" style="margin-top:30px; background-color:white;"> <!-- contents start -->
				<label style="margin-top:10px;">나의 신청 기록</label>
				<hr/>
				<div class="col-lg-12">
					<table class="table" style="">
					<thead>
						<tr>
							<th style="width:10%;">신청번호</th>
							<th>신청일</th>
							<th>시작기간</th>
							<th>종료기간</th>
							<th>승인여부</th>
							<th>광고여부</th>
							<th style="width:300px;">비고</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${ads ne null }">
							<c:forEach var="ad" items="${ads }">
								<tr>
									<td>${ad.no }</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd" value="${ad.rcvDate }" /></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd" value="${ad.startDate }" /></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd" value="${ad.endDate }" /></td>
									<td>${ad.permit }</td>
									<td>${ad.show }</td>
									<td>${ad.adReject }</td>
								</tr>
							</c:forEach>
						</c:if>
						
					</tbody>
				</table>
				</div>
				
			</div>
			<div class="right-content">
				<%@ include file="/WEB-INF/views/main/right-content.jsp"%>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/chat.jsp"%>
</body>
</html>