<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

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
	.panel-body form div {margin:20px; margin-left:100px;}
</style>
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
</head>
<body style="background-color: #282828;">
	<div class="container" style="margin-top: 100px;">
		<%@ include file="header-jih.jsp"%>


		<div class="row">

			<%@ include file="sidebar-jih.jsp"%>
			<div class="col-xs-10">
				<div class="row" style="background-color: white;">
					<div class="col-xs-offset-1 col-xs-9">

						<div class="panel panel-success">
							<div class="panel-heading">
								<h3>글 쓰기</h3>
							</div>
							<div class="panel-body">
								<form action="repWrite" method="post" enctype="multipart/form-data">
									<div class="form-group">
										<label for="" style="margin-right: 30px;">유형</label> <select
											name="type" id="rep_type">
											<option value="rep1">문의1</option>
											<option value="rep2">문의2</option>
											<option value="rep3">문의3</option>
										</select>
									</div>
									<div class="form-group">
										<label for="" style="margin-right: 30px;">제목</label> <input
											type="text" style="width: 460px;" name="title" id="rep_title">
									</div>
									<div class="form-group">
										<textarea rows="20" cols="70" name="content" id="rep_content"></textarea>
									</div>
									<div class="form-group" id="file_form">
										<label for="">파일첨부</label> <input type="file" id="rep_file_1" name="upfiles" accept="image/*">
										<p id="file_more"> </p>
										<button class="btn btn-xs btn-success"
											style="margin-left: 200px;" id="file_add" type="button">추가첨부</button>
										<p style="color:lightgrey; font-size:10px; margin-top:10px;" id="p-wrn">첨부파일은 .jpg,.gif,.png형식으로만 업로드 가능합니다.</p>	
										<p style="color:red; font-size:12px; margin-top:10px;" id="p-wrn2" class="hide">제목은 100글자, 내용은 3000글자 이내로 작성하셔야 합니다.</p>
										<p style="color:red; font-size:12px; margin-top:10px;" id="p-wrn3" class="hide">제목과 내용은 필수 입력요소입니다.</p>
									</div>
									<div class="form-group" style="margin-left: 510px;">
										<button class="btn btn-md btn-primary" id="form_submit" type="submit">작성</button>
										<a class="btn btn-md btn-danger" href="">취소</a>
									</div>

								</form>
							</div>
						</div>
					</div>

				</div>



			</div>
		</div>
	</div>

</body>
</html>
