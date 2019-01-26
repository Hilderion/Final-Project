<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row">
	<div class="col-lg-10">
		<div class="header" style="background-image: url(resources/image/${page.cover})">
			<input type="hidden" id="hidden-no" value=${page.no }>
			<form method="post" id="form" action="addcover" enctype="multipart/form-data">
					<div>
					<c:if test="${LOGIN_USER.no == page.parentNo }">
						<img id="blah">
						<input type="file" id="img" name="photofile">
						<label id="img-label" for="img" ><img src="https://static.thenounproject.com/png/817238-200.png" style="width: 20px; height: 20px;"> 커버 변경하기</label>
					</c:if>
					</div>
				<button type="submit"  id="cover-send" class="btn btn-success btn-sm" >등록</button>
				<button type="button"  id="cover-cancel" class="btn btn-danger btn-sm">취소</button>
			</form>
			<form method="post" id="form2" action="addprofile" enctype="multipart/form-data">
				<div class="image-profile">
					<img src="resources/image/${page.profile}" id="profile" ${LOGIN_USER.no == page.parentNo ? '':'style="margin-top:50px;'}">
				</div>
				<c:if test="${user.no == page.parentNo }">
					<input type="file" id="imgprofile"  name="profilephoto" style="opacity: 0;">
					<label id="profile-label" for="imgprofile" >프로필 변경</label>
				</c:if>
				<div id="name" class="header-name" >
					<span style="font-size: 20px; color: black;">${page.pageName}</span>
				</div>
				<button id="profile-send" type="submit" class="btn btn-success btn-xs" style="position:relative; margin-left:76px; bottom: 80px; z-index: 80px; display: none;">프로필 변경</button>
				<div class="pull-right right-button">
						<c:choose>
							<c:when test="${not empty friend }">
								<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
							      친구 
							    	<span class="caret"></span>
								</button>
								<ul id="friend-menu" class="dropdown-menu" role="menu">
									<li id="allim-area"><a id="btn-allim-${friend.anoCheck }">
										<c:if test="${friend.anoCheck eq 'Y' }">
											<i class="fas fa-check"></i>
										</c:if>
										 알림받기</a></li>
									<li><a id="btn-friend">친구 끊기</a></li>
								</ul>					
							</c:when>
							<c:when test="${empty friend && loginUser.no != checkNo}">
								<button type="button" id="addFri" class="btn btn-default"><i class="fas fa-user-plus"></i><span id="fri-Ment"> 친구 추가</span></button>					
							</c:when>
						</c:choose>
							<c:if test="${page.parentNo != checkNo}">
								<span id="follow-area">
									<a id="btn-follow" class="btn btn-default" >${not empty followCheck ? '팔로잉' : '팔로우'}</a>
								</span>
								<c:if test="${user.available eq 'Y' }">
									<c:choose>
										<c:when test="${prevCase eq null }">
											<span>
												<button type="button" class="btn btn-default btn-md" id="btn_report_${checkNo }">신고하기</button>
												<button type="button" class="btn btn-default btn-md disabled hidden" id="btn_report_result">접수완료</button>
											</span>
										</c:when>
										<c:when test="${prevCase ne null }">
											<span>
												<button type="button" class="btn btn-default btn-md disabled" id="btn_report_result2">접수완료</button>
											</span>
										</c:when>
									</c:choose>
									
								</c:if>
							</c:if>
							
					</div>				
			</form>
			<c:if test="${page.available eq 'N' }">
				<div class="text-right">
					<p style="font-size:15px; color:red; margin-right:150px;"> 이 사용자는 정지된 사용자 입니다.</p>
				</div>
			</c:if>
			
			
		</div>
				<div class="header-menu">
			<ul>
				<li><a href="profileOpen.do">공개범위설정</a></li>
				<li><a href="profileInfo.do?userNo=${user.no }">정보</a></li>
				<li><a href="profileFriend.do?userNo=${user.no }">친구</a></li>
				<li><a href="profilePicture.do?userNo=${user.no }">사진</a></li>
				<li><a href="">더보기</a></li>
			</ul>
		</div>
	</div>
</div>

<script type="text/javascript">
$(function(){
	$(".right-button").on('click','#addFri',function(){
		var friResult = $(this).text();
		$.ajax({
			type:"GET",
			url:"addFriendEvent.do",
			data:{friResult:friResult,friendNo:'${user.no}'},
			dataType:"text",
			success:function(result){
				if(result == "add"){
					alert("친구신청을 했습니다");
					$('#fri-Ment').text("친구 요청 전송됨");
				} else if (result == "del"){
					alert("친구신청을 취소했습니다");
					$('#fri-Ment').text("친구 추가");
				}
			}
		})
	});
	$("#btn-friend").click(function(){
		$.ajax({
			type:"GET",
			url:"delFriend.do",
			data:{friendNo:'${user.no}'},
			dataType:"text",
			success:function(result){
				alert("친구를 끊었습니다.");
				window.location.href = "/fa/profile.do?userNo=" + ${user.no};
			}
		})
	})
	
	//allim 버튼을 클릭 햇을때 상태변화
	$("#friend-menu").on("click", "[id^=btn-allim]", function(){
		var allimResult = $(this).attr('id').replace('btn-allim-','');
		var clickedLabel = $(this);
		$.ajax({
			type:"GET",
			url:"updateAllim.do",
			data:{friendNo:'${user.no}', allim:allimResult},
			dataType:"json",
			success:function(result) {
				var row =""
				if (result.anoCheck == "Y") {
					alert ("알림을 받습니다.");
					$('clickedLabel').css("font-weight", "bolder").css("background-color","blue");
					row += "<a id='btn-allim-Y'>";
					row += "<i class='fas fa-check'></i>";
					row += " 알림받기</a>";
					$('#allim-area').children().remove();
					$('#allim-area').prepend(row);
				} else if (result.anoCheck == "N") {
					alert ("알림을 받지않습니다.");
					$('clickedLabel').css("font-weight", "" ).css("background-color","");
					row += "<a id='btn-allim-N'>";
					row += " 알림받기</a>";
					$('#allim-area').children().remove();
					$('#allim-area').prepend(row);
				}
			}
		})
	})
	
	//팔로우 버튼을 클릭햇을떄 상태변화
	$("#follow-area").on("click", "#btn-follow", function(){
		var followResult = $("#btn-follow").text();
		$.ajax({
			type:"GET",
			url:"updateFollow.do",
			data:{follow:followResult, friendNo:'${user.no}'},
			dataType:"text",
			success:function(result) {
				var row = "";
				if (result == "del") {
					alert ("팔로우를 취소했습니다.")
					row = "<a id='btn-follow' class='btn btn-default' >팔로우</a>";
					$('#follow-area').children().remove();
					$('#follow-area').prepend(row);
				} else if (result == "add") {
					alert ("팔로우 했습니다")
					row = "<a id='btn-follow' class='btn btn-default' >팔로잉</a>";
					$('#follow-area').children().remove()
						.end().prepend(row);
				}
			}
		})
	});
	// 커버 사진 변경 하기
	function readURL(input) {
		if(input.files && input.files[0]) {
			var reader = new FileReader();
			
			
			// 파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
			reader.onload = function(e) {
				$('.header').css('background-image', "url("+ e.target.result+")");
				
			}
			
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	// File 선택(값 변경) Event 함수
	// 커버 사진 변경할때 
	$("#img").change(function() {
		readURL(this);
		$('.header').css('background-size', '945px 200px');
		$('#img').show();
		$('#img-label').hide();
		$("#profile-label").hide();
		$('#blah').css('z-index', 50);
		
		$('#cover-send').show();
		$('#cover-cancel').show();
		$('#profile').css('bottom', 0);
		$('#name').css('bottom', 70);
		$('#profile-send').hide();
		
		
	})
	
	
	// 프로필 사진 변경하기
	function readProfile(profile) {
		if(profile.files && profile.files[0]) {
			var profileReader = new FileReader();
			
			profileReader.onload = function(e) {
				
				$('#profile').attr('src', e.target.result);
				
			}
			
			profileReader.readAsDataURL(profile.files[0]);
			
		}
	}
	
	
	// 프로필 사진 변동할때
	$('#imgprofile').change(function() {
		readProfile(this);
	
		$("#profile").off();
		$("#profile-label").hide();
		$("#profile-send").show();
		
	});
	

	$("#cover-send").click(function(){
		$("#form").submit();
	});
	
	$("#cover-cancel").click(function(){
		window.location.href = "/fa/profile.do?userNo=" + ${loginUser.no}
	});
	
	$("#profile-send").click(function(){
		$("#form2").submit();
		$("#profile-label").hide();
	});
	
	
	// 프로필 변경 버튼 show, hide 
	// 프로필 이미지 위에 마우스를 올려놓을시 show 빠지면 hide
	var btnStatus = 'hide';
	
	$("#profile").mouseenter(function(){
		var no = $('#hidden-no').val();
		if('${LOGIN_USER.no}' == no) {
			if (btnStatus == 'show') {
				//$("#profile-label").hide();
				btnStatus = 'hide';
				return;
			}
			$("#profile-label").show();
			btnStatus = 'show';
			$('#name').css('bottom', 100);
		}
	});
	
	$("#profile").mouseleave(function(){
		var no = $('#hidden-no').val();
		if('${LOGIN_USER.no}' == no) {
			if (btnStatus == 'show') {
				return;
			} else {
				$("#profile-label").hide();
			}
			$('#name').css('bottom', 70);
		}
	});
	
	$("[id^=btn_report_]").on('click',function(){
		var id = $(this).attr('id').substring(11);
		var acuNo = ${loginUser.no};

		$.ajax({
			type:"POST",
			url:"profile.do/report",
			data:{ihrNo:id, type:"user", acuNo:acuNo},
			success:function(data){
				$("#btn_report_"+id).addClass('hidden');
				$("#btn_report_result").removeClass('hidden');
				
			}
			
		});
	
		
		
		
	});
	
	
});

</script>
