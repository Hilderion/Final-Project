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
	font-size: 13px;
}

.pagination li a {
	font-size: 10px;
}

tr th {
	text-align: center;
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

tbody tr {
	font-size: 13px; 
	text-align: center;
}
</style>
</head>
<script>
	$(function() {

		var status = $("#all_check").prop('checked');

		$("[id^=check_no_]").on('change', function() {
			$("#all_check").prop('checked', status);

		});

		$("#all_check").on('change', function() {
			if ($("[id^=check_no_]").prop('checked')) {
				$("[id^=check_no_]").prop('checked', false);
			} else {
				$("[id^=check_no_]").prop('checked', true);
			}
		});

		$("[id^=status_change]").on('click', function() {
			var id = $(this).attr('id');
			id = id.substring(14, 30);
			var val = $("#check_no_" + id).val();
			var caseType = $("#type_" + id).text();

			process(id, val, caseType);

		});

		$("[id^=rollback_]").on('click', function() {
			var id = $(this).attr('id');
			id = id.substring(9, 30);
			var val = $("#check_no_" + id).val();
			var caseType = $("#type_" + id).text();

			rollback(id, val, caseType);

		});

		$("#change_all").on('click', function() {
			$("[id^=check_no_]:checked").each(function() {
				var id = $(this).attr('id');
				id = id.substring(9, 30);
				var val = $("#check_no_" + id).val();
				var caseType = $("#type_" + id).text();

				process(id, val, caseType);

			})

		});

		$("#roll_back_all").on('click', function() {
			$("[id^=check_no_]:checked").each(function() {
				var id = $(this).attr('id');
				id = id.substring(9, 30);
				var val = $("#check_no_" + id).val();
				var caseType = $("#type_" + id).text();

				rollback(id, val, caseType);

			})

		});

		$("#opt_check").on('change', function() {
			$("#criteria_form").submit();
		});

		$("#status_check").on('change', function() {
			$("#criteria_form").submit();
		});

		$("li").on('click', function() {

			$("#cp_box").val($(this).val());
			$("#criteria_form").submit();
		});
		
		$("[id^=case_modal_]").on('click',function(){
			var id = $(this).attr('id').substring(11);
			
			$("#modal_tbody tr").remove();
			
			$.ajax({
				type:"GET",
				url:"case/case-ajax",
				data:{no:id},
				success: function(data){
					$("#modal_title_name").text(data.contents);
					$("#modal_user_profile").attr('src', data.indvUser.profile);
					$("#modal_user_no").text(data.ihrNo);
					$("#modal_user_email").text(data.indvUser.email);
					$("#modal_user_name").text(data.contents);
					$("#modal_user_sex").text(data.indvUser.koreanSex);
					$("#modal_user_birth").text(data.indvUser.birth);
					$("#modal_user_createDate").text(data.indvUser.simpleCreateDate);
					
					for (var i=0; i<data.manyCases.length; i++) {
						var date = data.manyCases[i].simpleRcvDate;
						
						var row = "<tr><td>" + i+1 + "</td><td>" + date + "</td><td>" + data.manyCases[i].acUser.name  +"</td></tr>";
						$("#modal_tbody").append(row);
						
					}
					
				}
			});
				
		});
		
		

	});

	var process = function(id, val, caseType) {
		$.ajax({
			type : "GET",
			url : "case/case-process",
			data : {
				no : id,
				ihrNo : val,
				status : "NO",
				type : caseType
			},
			dataType : "json",
			success : function(result) {
				$.ajax({

				})
			}
		});
		$("#case_status_" + id).text("N");
		$("#rollback_" + id).removeClass('hide');
		$("#status_change_" + id).addClass('hide');
		$("#check_no_" + id).prop('checked', false);

	}

	var rollback = function(id, val, caseType) {
		$.ajax({
			type : "GET",
			url : "case/case-rollback",
			data : {
				no : id,
				ihrNo : val,
				status : "YES",
				type : caseType
			},
			dataType : "json",
			success : function(result) {

			}
		});

		$("#case_status_" + id).text("Y");
		$("#rollback_" + id).addClass('hide');
		$("#status_change_" + id).removeClass('hide');
		$("#check_no_" + id).prop('checked', false);

	}

	
</script>


<body style="background-color: #282828;">
	<div class="container" style="margin-top: 100px;">
		<%@ include file="header-jih.jsp"%>


		<div class="row">

			<%@ include file="sidebar-jih.jsp"%>
			<div class="col-xs-10">
				<div class="row" style="background-color: white;">
					<form id="criteria_form" action="case">
						<input type="hidden" name="cp" value="${param.cp }" id="cp_box">


						<div class="col-xs-offset-1 col-xs-10">
							<div class="panel panel-danger">
								<div class="panel-heading">
									<h3>신고현황</h3>
								</div>
								<div class="panel-body">

									<select name="opt" id="opt_check">
										<option>유형</option>
										<option value="user" ${param.opt eq 'user' ? 'selected' : '' }>유저</option>
										<option value="page" ${param.opt eq 'page' ? 'selected' : '' }>페이지</option>
										<option value="board"
											${param.opt eq 'board' ? 'selected' : '' }>게시글</option>
										<option value="sub" ${param.opt eq 'sub' ? 'selected' : '' }>댓글</option>
									</select> <select name="status" id="status_check">
										<option>활동가능</option>
										<option value="Y" ${param.status eq 'Y' ? 'selected' : '' }>Y</option>
										<option value="N" ${param.status eq 'N' ? 'selected' : '' }>N</option>
									</select>

									<table class="table">
										<thead>
											<tr style="text-align: center;">
												<th><input type="checkbox" id="all_check"></th>
												<th>번호</th>
												<th>유형</th>
												<th>no</th>
												<th>내용</th>
												<th>활동가능</th>
												<th>신고자</th>
												<th></th>
												<th>접수일</th>
											</tr>
										</thead>
										<tbody style="text-align: center;">
											<!-- 티알 -->
											<c:forEach var="rep_case" items="${cases }">
												<tr>
													<td><input type="checkbox"
														id="check_no_${rep_case.no }" value="${rep_case.ihrNo }"></td>
													<td>${rep_case.no }</td>
													<td id="type_${rep_case.no }" value="${rep_case.ihrNo }">${rep_case.type }</td>
													<td>${rep_case.ihrNo }</td>
													<td>
													<c:choose>
														<c:when test="${rep_case.type eq 'user' }">
															<a id="case_modal_${rep_case.no }" data-toggle="modal" data-target="#modal_state">${rep_case.contents }</a>
														</c:when>
														<c:when test="${rep_case.type eq 'page' }">
															${rep_case.contents }
														</c:when>
														<c:when test="${rep_case.type eq 'board' }">
															${rep_case.contents }
														</c:when>
														<c:when test="${rep_case.type eq 'reply' }">
															${rep_case.contents }
														</c:when>

													</c:choose>
													
													</td>
													
													<td id="case_status_${rep_case.no }">${rep_case.status }</td>
													<td>${rep_case.acuUser[0].name }</td>
													<td><c:choose>
															<c:when test="${rep_case.status eq 'Y' }">
																<button class="btn-xs btn-danger"
																	id="status_change_${rep_case.no }" type="button">처리</button>
																<button class="btn-xs btn-success hide"
																	id="rollback_${rep_case.no}" type="button">복구</button>
															</c:when>
															<c:when test="${rep_case.status eq 'N' }">
																<button class="btn-xs btn-danger hide"
																	id="status_change_${rep_case.no}" type="button">처리</button>
																<button class="btn-xs btn-success"
																	id="rollback_${rep_case.no }" type="button">복구</button>
															</c:when>
														</c:choose></td>

													<td><fmt:formatDate value="${rep_case.rcvDate }"
															pattern="yy-MM-dd" /></td>
												</tr>
											</c:forEach>

										</tbody>
									</table>
									<div>
										<button class="btn-xs btn-danger" id="change_all"
											type="button">일괄처리</button>
										<button class="btn-xs btn-info" id="roll_back_all"
											type="button">정지해제</button>
									</div>
									<div class="row">
										<div class="col-xs-offset-3 col-xs-8">
											<div class="form-group">
												<select name="searchOpt" id="searchOpt_check"
													style="height: 26px;">
													<option value="user"
														${param.searchOpt eq 'user' ? 'selected' : '' }>유저</option>
													<option value="page"
														${param.searchOpt eq 'page' ? 'selected' : '' }>페이지</option>
													<option value="board"
														${param.searchOpt eq 'board' ? 'selected' : '' }>게시글</option>
													<option value="reply"
														${param.searchOpt eq 'reply' ? 'selected' : '' }>댓글</option>
												</select> <input type="text" name="keyword" value="${param.keyword }">
												<button type="submit" class="btn-default">검색</button>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-offset-4 col-xs-8">
											<ul class="pagination">

												<li value="${pagination.cp-1 }"><a>&laquo;</a></li>
												<c:forEach var="num"
													begin="${pagination.beginPageIndex lt 0 ? 1 : pagination.beginPageIndex}"
													end="${pagination.endPageIndex eq 0 ? 1: pagination.endPageIndex}">
													<c:choose>
														<c:when test="${num eq pagination.cp }">
															<li class="active" value="${num }"><a>${num }</a></li>
														</c:when>
														<c:otherwise>
															<li value="${num }"><a>${num }</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>

												<li value="${pagination.cp+1 }"><a>&raquo;</a></li>

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
			<div class="modal-dialog modal-md">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h3 class="modal-title" id="modal_title_name">유저이름</h3>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-xs-2" style="width: 150px; height: 160px;">
								<img src="" style="width: 100px; height: 120px;"
									id="modal_user_profile" />
							</div>
							<div class="col-xs-5" style="width: 400px; height: 160px;">
								<div class="panel" style="height: 250px; margin-top: 0px;">
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
										 <span style="margin-left: 30px;"
											id="modal_user_sex">남</span> 
										
									</p>
									<p class="user_info">
										<label for="">생년월일</label> 
										<span id="modal_user_birth">92.01.06</span>
									</p>
									<p>
										<label for="">가입일</label> <span id="modal_user_createDate">19.01.04</span>
									</p>

								</div>
							</div>

						</div>

						<div class="row" style="margin-top: 60px;">
							<div class="col-xs-offset-2 col-xs-6"
								style="width: 400px; height: 200px;">
								<div class="panel">
									<div class="panel-header" style="text-align: center">
										<label>신고기록</label>
									</div>
									<div class="panel-body" style="height: 140px;">

										<table class="table">
											<thead>
												<tr class="danger">
													<th style="text-align: center;">순서</th>
													<th style="text-align: center;">발생일</th>
													<th style="text-align: center;">신고자</th>
												</tr>
											</thead>
											<tbody id ="modal_tbody">
												
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="col-xs-6" style="width: 440px; height: 200px;">

							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
		<!-- modal end  -->
	</div>
	<!-- container end -->
</body>
</html>
