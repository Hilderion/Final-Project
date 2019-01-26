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

tr th {
	text-align: center;
}

.pagination li a {
	font-size: 10px;
}
</style>
</head>
<script>
$(function(){
	
	$("[id^=btn_ad_start_]").on('click',function(){
		var id = $(this).attr('id').substring(13);
		
		$.ajax({
			type:"GET",
			url:"repad/start",
			data:{no:id},
			success:function(){
				$("#btn_ad_cancel_"+id).removeClass('hide');
				$("#btn_ad_start_"+id).addClass('hide');
				
				
			}
			
		});
		
	});
	
	$("[id^=btn_ad_cancel_]").on('click',function(){
		var id = $(this).attr('id').substring(14);
		
		$.ajax({
			type:"GET",
			url:"repad/cancel",
			data:{no:id},
			success:function(){
				$("#btn_ad_start_"+id).removeClass('hide');
				$("#btn_ad_cancel_"+id).addClass('hide');
				
				
			}
			
		});
		
	});
	
	$("[id^=btn_ad_permit_]").on('click',function(){
		var id = $(this).attr('id').substring(14);
		
		$.ajax({
			type:"GET",
			url:"repad/accept",
			data:{no:id},
			success:function(){
				$("#btn_ad_start_"+id).removeClass('hide');
				$("#label_wait_"+id).addClass('hide');
				$("#btn_ad_permit_"+id).addClass('disabled').attr('id','');
				$("#btn_ad_reject_"+id).addClass('disabled').attr('id','');
				
			}
			
			
		})
		
		
	});
	
	$("[id^=btn_ad_reject_]").on('click',function(){
		var id = $(this).attr('id').substring(14);
		
		$.ajax({
			type:"GET",
			url:"repad/reject",
			data:{no:id},
			success:function(){
				$("#label_rejcet_"+id).removeClass('hide');
				$("#label_wait_"+id).addClass('hide');
				$("#btn_ad_permit_"+id).addClass('disabled').attr('id','');
				$("#btn_ad_reject_"+id).addClass('disabled').attr('id','');
				
			}
			
			
		})
		
		
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
					<form action="">


						<div class="col-xs-offset-1 col-xs-10">
							<div class="panel panel-info">
								<div class="panel-heading">
									<h3>광고 현황</h3>
								</div>
								<div class="panel-body">

									<table class="table">
										<thead>
											<tr style="font-size: 14px; text-align: center;">
												<th>접수번호</th>
												<th style="width: 18%; text-align: center;">유저명</th>
												<th>시작일</th>
												<th>종료일</th>
												<th style="text-align: center;">접수일</th>
												<th>광고여부</th>
												<th>광고결제</th>
												<th></th>
											</tr>
										</thead>
										<tbody style="text-align: center;">
											<!-- 티알 -->
											<c:if test="${ads ne null }">
												<c:forEach var="ad" items="${ads }">
													<tr>
														<td>${ad.no }</td>
														<td>${ad.adUser.name }</td>
														<td><fmt:formatDate pattern="yyyy-MM-dd" value="${ad.startDate }"/></td>
														<td><fmt:formatDate pattern="yyyy-MM-dd" value="${ad.endDate }"/></td>
														<td><fmt:formatDate pattern="yyyy-MM-dd" value="${ad.rcvDate }"/></td>
														<td>${ad.show }</td>
														<c:choose>
															<c:when test="${ad.permit eq 'T' }">
																<td>
																	<button class="btn btn-xs btn-success" type="button" id="btn_ad_permit_${ad.no }">승인</button>
																	<button class="btn btn-xs btn-danger" type="button" id="btn_ad_reject_${ad.no }">거부</button>
																	<button class="btn btn-xs btn-primary disabled hide" type="button" id="btn_ad_result_${ad.no }">완료</button>
																</td>
															</c:when>
															<c:when test="${ad.permit eq 'Y' }">
																<td>
																	<button class="btn btn-xs btn-primary disabled" type="button" >완료</button>
																</td>
															</c:when>
															<c:when test="${ad.permit eq 'N' }">
																<td>
																	<button class="btn btn-xs btn-info disabled" type="button" >거부</button>
																</td>
															</c:when>
														</c:choose>
														<c:choose>
															<c:when test="${ad.show eq 'N' }">
																<c:choose>
																	<c:when test="${ad.permit eq 'T' }">
																		<td>
																			<label id="label_wait_${ad.no }">결제대기</label>
																			<label class="hide" id="label_rejcet_${ad.no }">광고거부</label>
																			<button class="btn btn-xs btn-success hide" type="button" id="btn_ad_start_${ad.no }">광고시작</button>
																			<button class="btn btn-xs btn-danger hide" type="button" id="btn_ad_cancel_${ad.no }">광고중지</button>
																		</td>
																	</c:when>
																	<c:when test="${ad.permit eq 'N' }">
																		<td>
																			<label>광고거부</label>
																		</td>
																	</c:when>
																	<c:when test="${ad.permit eq 'Y' }">
																		<td>
																			<button class="btn btn-xs btn-success" type="button" id="btn_ad_start_${ad.no }">광고시작</button>
																			<button class="btn btn-xs btn-danger hide" type="button" id="btn_ad_cancel_${ad.no }">광고중지</button>
																		</td>
																	</c:when>
																</c:choose>
															</c:when>
															<c:when test="${ad.show eq 'Y' }">
																<td>
																	<button class="btn btn-xs btn-success hide" type="button" id="btn_ad_start_${ad.no }">광고시작</button>
																	<button class="btn btn-xs btn-danger" type="button" id="btn_ad_cancel_${ad.no }">광고중지</button>
																</td>
															</c:when>
														</c:choose>
													</tr>
												</c:forEach>

											</c:if>


										</tbody>
									</table>

									<div class="row">
										<div class="col-xs-offset-3 col-xs-8">

											<!-- 검색자리 -->

										</div>
									</div>
									<div class="row">
										<div class="col-xs-offset-4 col-xs-8">
											<ul class="pagination">

												<li><a>&laquo;</a></li>
												<li class="active"><a>1</a></li>
												<li><a>&raquo;</a></li>

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
	</div>
</body>
</html>
