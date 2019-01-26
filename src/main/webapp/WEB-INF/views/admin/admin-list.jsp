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
</style>
</head>
<script>
$(function(){
	
	$("[id^=btn_level_]").on('click',function(){
		var secLevel = $("#login_admin_seclevel").val(); 
		var id =$(this).attr('id').substring(12);

		var bef_level =$("#bef_level_"+id).val();
		var new_level =$(this).attr('id').substring(10,11);
		
		var result = accessPossible(bef_level, new_level, secLevel);
		
		if (result) {
			ajax(id, bef_level, new_level, secLevel);
		}
	});
	
	$("#criteria_select").on('change',function(){
		$("#criteria_form").submit();
	})
	
});

var accessPossible = function (bef_level, new_level, secLevel) {
	
	if (secLevel < new_level ) {
		alert("자기 권한 보다 높은 권한은 부여할 수 없습니다.");
		return false;
	} else if (bef_level > secLevel) {
		alert("상위 권한자의 권한을 변경할 수 없습니다.");
		return false;
	} else if (secLevel >= new_level) {
		return true;		
	} 
}

var ajax =  function(id, bef_level, new_level, secLevel){
	$.ajax({
		type:"GET",
		url:"adminList/ajax",
		data:{no:id, level:new_level, hiddenLevel:secLevel},
		success:function(result){
			
			if (result == "success") {
				$("#btn_level_0_"+id).removeClass('btn-xs btn-primary').addClass('btn-xs btn-default');
				$("#btn_level_1_"+id).removeClass('btn-xs btn-primary').addClass('btn-xs btn-default');
				$("#btn_level_2_"+id).removeClass('btn-xs btn-primary').addClass('btn-xs btn-default');
				$("#btn_level_3_"+id).removeClass('btn-xs btn-primary').addClass('btn-xs btn-default');
				
				$("#btn_level_"+new_level+"_"+id).addClass('btn-xs btn-primary');
				
			} else if (result == "exile") {
				alert("보안 레벨 조작 의심 발생. 해당 관리자의 권한을 박탈합니다.");
				location.reload();
				
			}
			
		}
		
	});
}

</script>


<body style="background-color: #282828;">
	<div class="container" style="margin-top: 100px;">
		<%@ include file="header-jih.jsp"%>


		<div class="row">

			<%@ include file="sidebar-jih.jsp"%>
			<div class="col-xs-10">
				<div class="row" style="background-color: white;">
					
					<form action="adminList" id="criteria_form">

						<div class="col-xs-offset-1 col-xs-10">
							<div class="panel panel-info">
								<div class="panel-heading">
									<h3>관리자 목록</h3>
								</div>
								<div class="panel-body">
									
									<select name="opt" style="width: 100px;" id="criteria_select">
										<option>보안레벨</option>
										<option value="level0">level 0</option>
										<option value="level1">level 1</option>
										<option value="level2">level 2</option>
										<option value="level3">level 3</option>
									</select>

									<table class="table">
										<thead>
											<tr>
												<th>no</th>
												<th>ID</th>
												<th>이름</th>
												<th>등록일</th>
												<th style="width:150px;">보안레벨</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="admin" items="${admins }">
												<!-- tr -->
												<tr>
													<td>${admin.no }</td>
													<td>${admin.id }</td>
													<td>${admin.name }</td>
													<td><fmt:formatDate pattern="yyyy.MM.dd" value="${admin.createDate }"/></td>
													<td>
													<c:choose>
														<c:when test="${admin.secLevel eq 0}">
															<button class="btn-xs btn-primary" type="button" id="btn_level_0_${admin.no }">0</button>
														</c:when>
														<c:otherwise>
															<button class="btn-xs btn-default" type="button" id="btn_level_0_${admin.no }">0</button>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${admin.secLevel eq 1}">
															<button class="btn-xs btn-primary" type="button" id="btn_level_1_${admin.no }">1</button>
														</c:when>
														<c:otherwise>
															<button class="btn-xs btn-default" type="button" id="btn_level_1_${admin.no }">1</button>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${admin.secLevel eq 2}">
															<button class="btn-xs btn-primary" type="button" id="btn_level_2_${admin.no }">2</button>
														</c:when>
														<c:otherwise>
															<button class="btn-xs btn-default" type="button" id="btn_level_2_${admin.no }">2</button>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${admin.secLevel eq 3}">
															<button class="btn-xs btn-primary" type="button" id="btn_level_3_${admin.no }">3</button>
														</c:when>
														<c:otherwise>
															<button class="btn-xs btn-default" type="button" id="btn_level_3_${admin.no }">3</button>
														</c:otherwise>
													</c:choose>
													<input type="hidden" value="${admin.secLevel }" id="bef_level_${admin.no }">
													</td>
												</tr>
											
											</c:forEach>

										</tbody>
									</table>

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
