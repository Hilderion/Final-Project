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
td {
	font-size: 12px;
}

.pagination li a {
	font-size: 10px;
}

p label {
	width: 90px;
}

.user_info label {
	width: 60px;
}

.user_info span {
	margin-right: 20px;
	margin-left: 30px;
}
</style>
</head>
<script>
	$(function() {
		$("li").on('click', function() {

			$("#cp_box").val($(this).val());
			$("#criteria_form").submit();
		})

		$("#type_check").on('change', function() {

			$("#criteria_form").submit();
		})
		$("#status_check").on('change', function() {

			$("#criteria_form").submit();
		})

		$("[id^=user_modal_]").on('click',function(){
			var id = $(this).attr('id').substring(11,20);
			$.ajax({
				type:"GET",
				url:"repuser/ajax",
				data:{no:id},
				success:function(data){
					$("#modal_title_name").text(data.name);
					$("#modal_user_no").text(data.no);
					$("#modal_user_email").text(data.email);
					$("#modal_user_name").text(data.name);
					
					$("#modal_user_profile").attr('src', data.profile);
					
					$("#modal_user_sex").text(data.koreanSex);
					$("#modal_user_birth").text(data.birth);
					$("#modal_user_createDate").text(data.simpleCreateDate);
					// c:if
					$("#modal_user_state").text(data.available);
					
					$("[id^=modal_state_]").prop('disabled',false).css('opacity','1');
					$("[id^=modal_state_active_]").attr('id','modal_state_active_'+data.no);
					$("[id^=modal_state_deactive_]").attr('id','modal_state_deactive_'+data.no);
					
					var available = data.available;
					if (available == 'Y') {
						$("#modal_state_active_"+data.no).prop('disabled',true).css('opacity','0.5');
						
					} else if (available == 'N') {
						$("#modal_state_deactive_"+data.no).prop('disabled',true).css('opacity','0.5');
					}
					
					$("#modal_user_address").text(data.address);
					$("#modal_user_educate").text(data.education);
					$("#modal_user_phone").text(data.tel);
					$("#modal_user_page_name").text(data.pageName);
					$("#modal_user_page_category").text(data.category);
					
				}
				
			});
		});
		
		$("[id^=modal_state_active_]").on('click',function(){
			var no = $(this).attr('id').substring(19);
			$.ajax({
				type:"GET",
				url:"repuser/switch",
				data:{no:no, access:"active"},
				success:function(data){
					$("#modal_state_deactive_"+no).prop('disabled',false).css('opacity','1');
					$("#modal_state_active_"+no).prop('disabled',true).css('opacity','0.5');
					
				}
			});

			
		});
		
		$("[id^=modal_state_deactive_]").on('click',function(){
			var no = $(this).attr('id').substring(21);
			$.ajax({
				type:"GET",
				url:"repuser/switch",
				data:{no:no, access:"deactive"},
				success:function(data){
					$("#modal_state_active_"+no).prop('disabled',false).css('opacity','1');
					$("#modal_state_deactive_"+no).prop('disabled',true).css('opacity','0.5');
				}
			});
		});
		

	});
</script>
<body style="background-color: #282828;">
	<div class="container" style="margin-top: 100px;">
		<%@ include file="header-jih.jsp"%>

		<div class="row">

			<%@ include file="sidebar-jih.jsp"%>
			<div class="col-xs-10">
				<div class="row" style="background-color: white;">
					<form method="get" action="repuser" id="criteria_form">
						<input type="hidden" value="1" name="cp" id="cp_box">

						<div class="col-xs-offset-1 col-xs-10">
							<div class="panel panel-success">
								<div class="panel-heading">
									<h3>유저 리스트</h3>
								</div>
								<div class="panel-body">

									<select name="opt" id="type_check">
										<option>성별</option>
										<option value="male" ${param.opt eq 'male' ? 'selected' : '' }>남자</option>
										<option value="female"
											${param.opt eq 'female' ? 'selected' : '' }>여자</option>
									</select> <select name="status" id="status_check">
										<option>정지여부</option>
										<option value="Y" ${param.status eq 'Y' ? 'selected' : '' }>Y</option>
										<option value="N" ${param.status eq 'N' ? 'selected' : '' }>N</option>
									</select>

									<table class="table">
										<thead>
											<tr style="font-size: 13px; text-align: center;">
												<th style="">번호</th>
												<th style="text-align: center;">ID</th>
												<th style="text-align: center;"">유저명</th>
												<th style="text-align: center;"">성별</th>
												<th style="text-align: center;">가입일</th>
												<th style="text-align: center;">생일</th>
												<th>활동여부</th>

											</tr>
										</thead>
										<tbody style="text-align: center;">
											<c:forEach var="user" items="${users }">
												<tr id="user_${user.no }">
													<td>${user.no }</td>
													<td>${user.email }</td>
													<td><a id="user_modal_${user.no }" data-toggle="modal" data-target="#modal_state">${user.name }</a></td>
													<c:choose>
														<c:when test="${user.sex eq 'M' }">
															<td>남</td>
														</c:when>
														<c:when test="${user.sex eq 'F' }">
															<td>여</td>
														</c:when>
													</c:choose>
													<td><fmt:formatDate value="${user.createDate }"
															pattern="yyyy.MM.dd" /></td>
													<td>${user.birth }</td>
													<td>${user.available }</td>
												</tr>
											</c:forEach>

										</tbody>
									</table>

									<div class="row">
										<div class="col-xs-offset-4 col-xs-8">
											<div class="form-group">
												<select name="searchOpt" style="height: 26px;">
													<option value="name"
														${param.searchOpt eq 'name' ? 'selected' : '' }>유저명</option>
													<option value="id"
														${param.searchOpt eq 'id' ? 'selected' : '' }>아이디</option>
												</select> <input type="text" name="keyword" value="${param.keyword }">
												<button type="submit" class="btn-default" id="">검색</button>
											</div>


										</div>
									</div>
									<div class="row">
										<div class="col-xs-offset-5 col-xs-7">
											<ul class="pagination">

												<li value=${pagination.cp-1 }><a>&laquo;</a></li>
												<c:forEach var="num"
													begin="${pagination.beginPageIndex lt 0 ? 1: pagination.beginPageIndex}"
													end="${pagination.endPageIndex eq 0? 1 : pagination.endPageIndex}">
													<c:choose>
														<c:when test="${pagination.cp eq num }">
															<li value="${num }" class="active"><a>${num }</a></li>
														</c:when>
														<c:otherwise>
															<li value="${num }"><a>${num }</a></li>
														</c:otherwise>
													</c:choose>

												</c:forEach>
												<li value=${pagination.cp+1 }><a>&raquo;</a></li>

											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>

					</form>
				</div>
			</div>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="modal_state" role="dialog">
			<div class="modal-dialog modal-lg">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h3 class="modal-title" id="modal_title_name">유저이름</h3>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-xs-2" style="width: 150px; height: 160px;">
								<img src="" style="width: 100px; height: 120px;" id="modal_user_profile"/>
							</div>
							<div class="col-xs-7" style="width: 520px; height: 160px;">
								<div class="panel" style="height: 190px; margin-top:0px;">
									<p>
										<label for="">회원번호</label> <span id="modal_user_no">37</span>
									</p>
									<p>
										<label for="">ID</label> <span id="modal_user_email">teset@webmaster.com</span>
									</p>
									<p class="user_info">
										<label for="">이름</label> <span id="modal_user_name">김춘배</span> 
									</p>
									<p class="user_info">
										<label for="">성별</label>
										<span style="margin-left: 30px;" id="modal_user_sex">남</span> 
										<label for="" style="margin-left:100px;">생년월일</label>
										<span id="modal_user_birth">92.01.06</span>
									</p>
									<p>
										<label for="">가입일</label> <span id="modal_user_createDate">19.01.04</span>
									</p>

								</div>
							</div>
							<div class="col-xs-3" style="width: 220px; height: 160px;">
								<div class="panel" style="text-align: center; height: 140px;">
									<div class="panel-header">
										<label>활동여부</label>
									</div>
									<div class="panel-body">
									<input type="hidden" value="" id="modal_user_state">
										<button class="btn-btn-xs btn-success" style="width: 45%;" id="modal_state_active_" type="button">활성화</button>
										<button class="btn-btn-xs btn-danger " style="width: 45%;" id="modal_state_deactive_" type="button">정지</button>
									</div>
								</div>

							</div>
						</div>

						<div class="row">
							<div class="col-xs-6" style="width: 450px; height: 200px;">
								<div class="panel">
									<div class="panel-header" style="text-align: center">
										<label>추가정보</label>
									</div>
									<div class="panel-body" style="height: 140px;">
										<p>
											<label for="">주소</label> 
											<span id="modal_user_address">경기도 경기시</span>
										</p>
										<p>
											<label for="">교육여부</label> 
											<span id="modal_user_educate">uneducated</span>
										</p>
										<p>
											<label for="">전화번호</label> 
											<span id="modal_user_phone">010-3433-3421</span>
										</p>
									</div>
								</div>
							</div>
							<div class="col-xs-6" style="width: 440px; height: 200px;">
								<div class="panel">
									<div class="panel-header" style="text-align: center">
										<label>페이지</label>
									</div>
									<div class="panel-body" style="height: 140px;">
										<p>
											<label for="">페이지 이름</label> 
											<span id="modal_user_page_name">테스터페이지</span>
										</p>
										<p>
											<label for="">카테고리</label> 
											<span id="modal_user_page_category">개발</span>
										</p>
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div> <!-- modal end  -->
	</div>
	<!-- container end -->
</body>
</html>
