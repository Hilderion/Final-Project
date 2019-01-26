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
<script>
$(function(){
	$("#opt_change").on('change',function(){
		$("#criteria_form").submit();
	});
	
	$("li").on('click',function(){
		
		$("#cp_box").val($(this).val());
		$("#criteria_form").submit();
	});
	
})
</script>
</head>
<body style="background-color: #282828;">
	<div class="container" style="margin-top: 100px;">
		<%@ include file="header-jih.jsp"%>


		<div class="row">

			<%@ include file="sidebar-jih.jsp"%>
			<div class="col-xs-10">
				<div class="row" style="background-color: white;">
				<form method="get" action="boardList" id="criteria_form">
				<input type="hidden" name="cp" value="1" id="cp_box">
				
					<div class="col-xs-offset-1 col-xs-10">
						<div class="panel panel-success">
							<div class="panel-heading">
								<h3>게시판</h3>
							</div>
							<div class="panel-body">
							
								<select name="opt" id="opt_change">
									<option>유형</option>
									<option value="rep1" ${param.opt eq 'rep1' ? 'selected' : '' }>rep1</option>
									<option value="rep2" ${param.opt eq 'rep2' ? 'selected' : '' }>rep2</option>
									<option value="rep3" ${param.opt eq 'rep3' ? 'selected' : '' }>rep3</option>
								</select>

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
												<td><a href="">${board.user.name }</a></td>
												<td><fmt:formatDate value="${board.createDate }"
														pattern="yyyy-MM-dd" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div class="row">
									<div class="col-xs-offset-3 col-xs-8">
										<div class="form-group">
											<select name="searchOpt" id="search_box" style="height: 26px;">
												<option value="writer" ${param.searchOpt eq 'writer' ? 'selected' : '' }>작성자</option>
												<option value="title" ${param.searchOpt eq 'title' ? 'selected' : '' }>제목</option>
											</select> 
											<input type="text" name="keyword" value="${param.keyword }">
											<button type="submit" class="btn-default">검색</button>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-offset-4 col-xs-8">
										<ul class="pagination">
											<li value="${pagination.cp-1 }"><a>&lt;</a></li>
											
								
												<c:forEach var="num" begin="${pagination.beginPageIndex lt 0 ? 1 : pagination.beginPageIndex}"
													end="${pagination.endPageIndex eq 0 ? 1 : pagination.endPageIndex}">
													<c:choose>
														<c:when test="${num eq pagination.cp }">
															<li class="active" value=${num }><a>${num }</a></li>
														</c:when>
														<c:otherwise>
															<li value=${num }><a>${num }</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>

											<li value="${pagination.cp+1 }"><a>&gt;</a></li>
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
