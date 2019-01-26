<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
		<div class="row">
			<div class="topbar" id="topbar">
				<div class="col-xs-2 col-xs-offset-1">
				     <a class="logo" href="/fa" style="float:right">
	                <img alt="" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAABmJLR0QAOwBeAJXJ9VaZAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4QUcFAwZEBLpsAAAAO5JREFUSMdj2Hrw+v+///79pzb4++/f/60Hr/9n/Pvv338mRkYGWoB///8zMP7///8/Aw0BCyWaL99+wXDk7D2Gdx+/M3CwszDw8bAziAvxMfg5aVFuQe+Cgwzr91/FKodsARM5hu89cQen4eiALAs27LtC2zi4+eA1Cr8q2YnBzVqNgYWZiTo++PbzNwrf2UIFq+FkW4AO2NlYqBsHpACiM5pN/DSiDFzRGcUgIyFAOx9IiPLRLoj4eTgwIpuqFkgK85IfB/ji48jCrIFLRaMWjAQL/tGwSv73/z8D047DNxloYcm///8Zdhy+yQAAwrOldG/7uKoAAAAASUVORK5CYII=" />
	                </a>
                </div>
                <div class="search-box col-xs-4">
                    <div class="input-group">
                <form method="get" action="searchFriendAndPageAndBoard.do">
                    <input class="form-control" placeholder="검색" type="text" name="searchKeyword" id="searchKeywordInput" style="left:135px;"/>
                   	<button type="submit" class="fas fa-search absolute" id="searchFriendAndPageAndBoardButton"></button>
                </form>
                    </div>
                </div>
                <div class="right-group col-xs-5">
                    <div class="link-group">
                        <a href="profile.do?userNo=${LOGIN_USER.no }" class="link link-a">
                            <img src="resources/image/${LOGIN_USER.profile }">${LOGIN_USER.name }
                        </a>
                    </div>
                    <div class="link-group">
                        <a href="/fa" class="link link-a">홈</a>
                    </div>
                    <div class="link-group">
                        <a href="findFriend.do" class="link link-a">친구 찾기</a>
                    </div>
                    <div class="notification-group" id="Request-main">
                        <div class="link-group">
	                    	<a class="msgnotif link-a" href="javascript:void(0)" id="friendRequestClick">
	                        	<i class="fa fa-user-friends"></i>
	                        	<c:if test="${requestCount ne 0}">
                                	<span id="requestC"class="badge" style="background-color:red;position: absolute;left: 30px;top: -3px;">${requestCount}</span>
                                </c:if>
	                        </a>
	                        <div id="friendRequestArea" style="display:none; width:530px; left:-300px;border:1px solid gray;">
	                        <!-- ajax로 추가처리 -->
	                        	<div class="1-friend-request">
									<div class="1-friend-event" style="margin-left:10px; margin-top:5px;display: inline-block;font-weight: bold;">친구 요청에 답하기</div>
									<div style="margin-left:320px;display: inline-block;">
				                		<a href="findFriend.do" style="text-decoration:none;">상세보기</a>
				              		</div>
									<hr class="hr">						 
									<div id="1-friend-request">
									<ul id="friend-ul" style="list-style-type: none; padding-left:0;">
									<c:if test="${not empty events }">
										<c:forEach var="event" end="5" items="${events }">
											<li>
											<div class="1-friend-info row" id="1-request-friend-${event.user.no }">
												<div class="col-xs-1" style="margin-left:10px;">
													<img src="resources/image/${event.user.profile }" style="width:50px;height:50px;border-radius:50%">
												</div>
												<div class="col-xs-5" style="line-height:25px; padding:0; left:30px;font-size:12px;">
													<a href="profile.do?userNo=${event.user.no }" class="1-friend-name">${event.user.name }</a>
													<div class="1-friend-addr">${event.user.address eq null ? " " : event.user.address }</div>
												</div>
												<div id="1-friend-event-request" class="col-xs-5 request" style="line-height:40px; padding:0; left:60px;">
													<a id="1-btn-addFriend-${event.user.no }" class="btn btn-primary" href="javascript:void(0)" style="font-size:12px;">확인</a>
													<a class="btn btn-default" href="javascript:void(0)" style="font-size:12px;">요청 삭제</a>
												</div>
											</div>
											</li>
											<hr class="hr">
										</c:forEach>
									</c:if>
									<c:if test="${empty events }">
										<li>
											<div style="text-align: center;">
												<span>요청이 없습니다</span>
											</div>
										</li>
									</c:if>
									</ul>
									</div>
								</div>
								<hr class="hr">
								<div class="1-find-friend">
									<p class="1-friend-event" style="margin-left:10px; margin-top:5px;font-weight: bold;">알 수도 있는 사람</p>
									<hr class="hr">
									<ul style="list-style-type: none; padding-left:0;">
									<c:if test="${not empty recommands  }">
										<c:forEach var="friend" end="5" items="${recommands }">
											<!-- 이 부분이 반복 되어야 함 -->
											<li>
											<div class="1-friend-info row" id="1-friend_rec_${friend.USERNO }">
												<div class="col-xs-1" style="margin-left:10px;">
													<img src="resources/image/${friend.USERPROFILE }" style="width:50px;height:50px;border-radius:50%">
												</div>
												<div class="col-xs-5" style="line-height:15px; padding:0; left:30px;">
													<a href="profile.do?userNo=${friend.USERNO }" class="1-friend-name">${friend.USERNAME }</a>
													<p class="1-friend-addr" style="font-size:11px; margin-bottom:0px;">${friend.USERADDRESS eq null ? " " : friend.USERADDRESS }</p>
													<p class="1-event-friend" style="font-size:11px; margin-bottom:0px;">
														<a><img src="resources/image/${friend.FRIENDPROFILE }"></a><a href="profile.do?userNo=${friend.FRIENDNO }">${friend.FRIENDNAME }</a> 님을 함께
														알고 있습니다.
													</p>
												</div>
												<div class="col-xs-5 request" id="1-exf_friend_${friend.USERNO }" style="line-height: 50px;vertical-align: middle;text-align: center; padding:0;">
													<a class="btn btn-primary" id="1-btn-add-friend-${friend.USERNO }" style="font-size:12px;"><i class="fas fa-user-plus"></i> <span id="1-fri-Ment-${friend.USERNO }">친구 추가</span></a> 
													<a class="btn btn-default" id="1-btn_exf_friend_${friend.USERNO }" style="font-size:12px;">삭제</a>
												</div>
											</div>
											</li>
											<hr class="hr" >
											<!-- 반복 end -->
										</c:forEach>
									</c:if>
									<c:if test="${empty recommands}">
										<li>
											<div style="text-align: center;">
												<span>친구 추천이 없습니다</span>
											</div>
										</li>
									</c:if>
									</ul>
								</div>
								<!-- ajax 추가처리 끝 -->
	                        </div>
                        </div>
                        <div class="link-group">
                            <a class="notif link-a" href="receivemessage.do">
                                <i class="fab fa-facebook-messenger"></i>
                                <c:if test="${messageCount ne 0}">
                                	<span class="badge" style="background-color:red;;position: absolute;left: 22px;top: -3px;">${messageCount}</span>
                                </c:if>
                            </a>
                        </div>
                        <div class="link-group">
                            <a class="helpguide link-a" href="javascript:void(0)" id="allimRequestClick">
                                <i class="fa fa-bell"></i>
                                <c:if test="${allimCount ne 0}">
                                	<span id="alim_ajax_count" class="badge" style="background-color:red;position: absolute;left: 20px;top: -3px;">${allimCount}</span>
                                </c:if>
                            </a>
                            <div id="allimRequestArea" style="display:none; width:450px; left:-300px;padding-bottom:0px; border:1px solid gray;">
                            	<!-- ajax처리 -->
                            	<div class="1-allim" style="margin-left:10px; margin-top:5px;display: inline-block;font-weight: bold;">
				                    내 알림
				                </div>
				                <div style="margin-left:325px;display: inline-block;">
				                	<a href="allim" style="text-decoration:none;">상세보기</a>
				                </div>
				                <hr class="hr" style="margin-bottom:0px;">
				                <ul id="allim-ul" style="list-style-type: none; padding-left:0;margin-bottom:0;">
				                <c:if test="${not empty allims }">
					            	<c:forEach var="allim" end="4" items="${allims }">
					            	<input type="hidden" value="${allim.check }" id="top-check-${allim.no }">
					            		<li style="font-size:12px;"> 
								            <div class="row ">
								                <div class="col-lg-12 1-allim-row">
								                    <div id="1-event-allim-${allim.no }" class="row marginLR0" ${allim.check eq 'Y' ? 'style="background-color:white;"' : 'style="background-color:#edf2fa;"'} >
								                        <div class="col-lg-1 ">
								                            <img src="resources/image/${allim.user.profile}" style="width:50px;height:50px;border-radius:50%">       
								                        </div>
								                        <div id="1-user-allim-info" class="col-lg-9 col-lg-offset-1 allim-info-event">
								                            <div>
								                            	<c:choose>
								                            		<c:when test="${allim.event eq '공유'}">
								                            			<c:if test="${allim.user.no eq allim.subUser.no }">
								                            				<a href="profile.do?userNo=${allim.user.no }">${allim.user.name }</a>님이 자신의 게시글을 <a href="allimdetailview?allimNo=${allim.no }&eventNo=${allim.eventNo }&confirm=${allim.check eq 'Y' ? 'N' : 'Y'}" >공유</a>했습니다
								                            			</c:if>
								                            			<c:if test="${allim.user.no ne allim.subUser.no }">
								                            				<a href="profile.do?userNo=${allim.user.no }">${allim.user.name }</a>님이 <a href="profile.do?userNo=${allim.subUser.no }">${allim.subUser.name }</a>님의 게시글을 <a href="allimdetailview?allimNo=${allim.no }&eventNo=${allim.eventNo }&confirm=${allim.check eq 'Y' ? 'N' : 'Y'}" >공유</a>했습니다
								                            			</c:if>
								                            		</c:when>
								                            		<c:when test="${allim.event eq '친구요청' }">
								                            			<a href="profile.do?userNo=${allim.user.no }">${allim.user.name }</a>님이 회원님에게 <a href="friendAllimCheck?allimNo=${allim.no }&confirm=${allim.check eq 'Y' ? 'N' : 'Y'}">친구 신청</a>을 했습니다.
								                            		</c:when>
								                            		<c:when test="${allim.event eq '게시글좋아요' }">
								                            			<a href="profile.do?userNo=${allim.user.no }">${allim.user.name }</a>님이 <a href="profile.do?userNo=${allim.subUser.no }">${allim.subUser.name }</a>님의 게시글에 <a href="allimdetailview?allimNo=${allim.no }&eventNo=${allim.eventNo }&confirm=${allim.check eq 'Y' ? 'N' : 'Y'}" >좋아요</a>를 눌렀습니다.
								                            		</c:when>
								                            		<c:when test="${allim.event eq '댓글' }">
								                            			<c:if test="${allim.user.no eq allim.subUser.no}">
								                            				<a href="profile.do?userNo=${allim.user.no }">${allim.user.name }</a>님이 자신의 게시글에 <a href="allimdetailview?allimNo=${allim.no }&eventNo=${allim.eventNo }&confirm=${allim.check eq 'Y' ? 'N' : 'Y'}" >댓글</a>을 남겼습니다.
								                            			</c:if>
								                            			<c:if test="${allim.user.no ne allim.subUser.no }">
								                            				<a href="profile.do?userNo=${allim.user.no }">${allim.user.name }</a>님이 <a href="profile.do?userNo=${allim.subUser.no }">${allim.subUser.name }</a>님의 게시글에 <a href="allimdetailview?allimNo=${allim.no }&eventNo=${allim.eventNo }&confirm=${allim.check eq 'Y' ? 'N' : 'Y'}" >댓글</a>을 남겼습니다.
								                            			</c:if>
								                            			<c:if test="${allim.subUser.no eq allim.friend.no }">
								                            				<a href="profile.do?userNo=${allim.user.no }">${allim.user.name }</a>님이 회원님의 게시글에 <a href="allimdetailview?allimNo=${allim.no }&eventNo=${allim.eventNo }&confirm=${allim.check eq 'Y' ? 'N' : 'Y'}" >댓글</a>을 남겼습니다.
								                            			</c:if>
								                            		</c:when>
								                            		<c:when test="${allim.event eq '대댓글' }">
								                            				<a href="profile.do?userNo=${allim.user.no }">${allim.user.name }</a>님이 회원님의 댓글에 <a href="allimdetailview?allimNo=${allim.no }&eventNo=${allim.eventNo }&confirm=${allim.check eq 'Y' ? 'N' : 'Y'}" >댓글</a>을 남겼습니다.
								                            		</c:when>
								                            		<c:when test="${allim.event eq '게시글작성' }">
								                            				<a href="profile.do?userNo=${allim.user.no }">${allim.user.name }</a>님이 <a href="allimdetailview?allimNo=${allim.no }&eventNo=${allim.eventNo }&confirm=${allim.check eq 'Y' ? 'N' : 'Y'}" >게시글</a>을 작성했습니다.
								                            		</c:when>
								                            		<c:when test="${allim.event eq '태그' }">
								                            				<a href="profile.do?userNo=${allim.user.no }">${allim.user.name }</a>님이 회원님을 <a href="allimdetailview?allimNo=${allim.no }&eventNo=${allim.eventNo }&confirm=${allim.check eq 'Y' ? 'N' : 'Y'}" >태그</a>했습니다.
								                            		</c:when>
								                            	</c:choose>
								                            </div>
								                            <div>
								                                <i class="fas fa-comment-alt"></i>
								                                <span>${allim.passedTime }</span>
								                            </div>
								                        </div>
								                    </div>
								                </div>                
								            </div>
								            </li>
								            <hr class="allim-hr">
					            		</c:forEach>
				            		</c:if>
                            		<!-- ajax처리 끝 -->
                            		<c:if test="${empty allims }">
	                            		<li>
	                            			<div style="text-align: center;">
	                            				<span>알림이 없습니다</span>
	                            			</div>
	                            		</li>
                            		</c:if>
                            	</ul>
                            </div>
                        </div>
                        <div class="link-group">
                            <a class="helpguide link-a" href="logout.do">
                                <i class="fas fa-sign-out-alt"></i>
                            </a>
                        </div>
                    </div>
                </div>
                </div>
			</div>
		</div>
		
<script type="text/javascript">
$(function() {
	
	$("#searchKeywordInput").keyup(function(event) {
		if ($('#searchKeywordInput').val() == "") {
			$('#searchFriendAndPageAndBoardButton').attr("disabled", 'disabled');
		} else {
			$('#searchFriendAndPageAndBoardButton').removeAttr('disabled');
		}
	});
	//상단바 친구요청 클릭시 드롭다운
	$('#Request-main').on('click','#friendRequestClick',function(){
		var friendCss = $('#friendRequestArea').css('display');
		var allimCss = $('#allimRequestArea').css('display');
		if('none' != allimCss) {
			$('#allimRequestArea').css('display','none');
		}
		if('none' == friendCss){
			$('#friendRequestArea').css('display','block');	
		} else {
			$('#friendRequestArea').css('display','none');
		}
	})
	
	$('[id^=1-friend_rec_]').on(
				'click',
				'[id^=1-btn-add-friend]',
				function() {
					var no = $(this).attr('id').replace(
							'1-btn-add-friend-', '');
					var friResult = $(this).text();
					$.ajax({
						type : "GET",
						url : "addFriendEvent.do",
						data : {
							friendNo : no,
							friResult : friResult
						},
						dataType:"text",
						success : function(result) {
							if(result == "add"){
								alert("친구신청을 했습니다");
								$('#1-fri-Ment-'+no).text("친구 요청 전송됨");
							} else if (result == "del"){
								alert("친구신청을 취소했습니다");
								$('#1-fri-Ment-'+no).text("친구 추가");
							}
						}
					})
				})
	
		$("[id^=1-exf_friend_]").on('click','[id^=1-btn_exf_friend_]',function(){
			var id= $(this).attr('id').replace('1-btn_exf_friend_','');
			$.ajax({
				type:"GET",
				url :"excFriend",
				data: { excNo : id},
				success: function(data) {
					$("#1-friend_rec_"+id).remove();
				}
			});
		});
		
		$("[id^=1-request-friend-]").on('click',"[id^=1-btn-addFriend-]",function(){
			var id= $(this).attr('id').replace('1-btn-addFriend-','');
			var count = $('#requestC').text();
			$.ajax({
				type:"GET",
				url :"addFriend.do",
				data: { addFriendNum : id},
				success: function(data) {
					$("#1-request-friend-"+id).remove();
					if(1 == count ){
						$('#requestC').remove();	
					} else {
						$('#requestC').text(count-1);
					}
					
				}
			});
		})
	
	//상단바 알림 클릭시 드롭다운
	$('#Request-main').on('click','#allimRequestClick',function(){
		var allimCss = $('#allimRequestArea').css('display');
		var friendCss = $('#friendRequestArea').css('display');
		if('none' != friendCss) {
			$('#friendRequestArea').css('display','none');
		}
		if('none' == allimCss){
			$('#allimRequestArea').css('display','block');	
		} else {
			$('#allimRequestArea').css('display','none');
		}
	})
	$('#allim-ul').on('mouseenter','[id^=1-event-allim-]',function(){
		var no = $(this).attr('id').replace('1-event-allim-','');
		var check = $('#top-check-'+no).val();
		if('N' == check){
			$(this).css('background-color','white');
		}
	})
	$('#allim-ul').on('mouseleave','[id^=1-event-allim-]',function(){
		var no = $(this).attr('id').replace('1-event-allim-','');
		var check = $('#top-check-'+no).val();
		if ('N' == check){
			$(this).css('background-color','#edf2fa');
		}
	})
	
})
</script>