<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

        <div class="row">
            <div class="col-lg-10 cont-tab">
                    <div class="row border margin20 marginLR0">
                        <div class="col-lg-8 lg-8">
                            <div class="detail-info">
                                <i class="fa fa-user-friends"></i> 친구
                                <div class="friends-menu">
               						<ul>
                                        <li>
                                            <a href="profileFriend.do?userNo=${user.no }" id="allFriendOfUser">모든 친구</a>
                                            <input type="hidden" id="nowUserNo" value="${user.no }"/>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0)" id="friendsBirthday">생일</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0)" id="followerOfUser">팔로워</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0)" id="followingOfUser">팔로잉</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0)" id="likePageOfUser">좋아요페이지</a>
                                        </li>
                                    </ul>
                                </div>
                             </div>
                        </div>    
                        <div class="col-lg-4 lg-4 friend-right">
                            <div class="friend-right-cont">
                                <a class="btn btn-default btn-sm" href="">친구요청</a>
                                <a id="last-a" class="btn btn-default btn-sm" href="">친구검색</a>
                                <div class="input-group" id="findFreindKeywordDiv">
                                    <input class="form-control" id="findFreindKeyword" placeholder="친구검색" type="text" />
                                    <button class="fas fa-search reset-button">
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                <div class="row">
                    <div class="col-lg-12">
                       <div class="row border marginLR0 cont-box padding10" id="friendListDiv">
                       <c:if test="${not empty friends }">
	                       <c:forEach items="${friends }" var="friend">
	                           <div class="col-lg-6">
	                                <div class="friend-info">
	                                    <div class="row">
	                                       <div class="col-lg-4 friend-info-img">
	                                            <a href="profile.do?userNo=${friend.no }">
	                                                <img src="resources/image/${friend.profile }">
	                                            </a>   
	                                        </div>
	                                        <div class="col-lg-4 friend-info-name">
	                                            <a href="profile.do?userNo=${friend.no }">${friend.name }</a>
	                                            <p>${friend.friendCount }명</p>
	                                        </div>
	                                        <div class="col-lg-5 friend-info-button">
	                                            <a class="btn btn-default btn-sm" href=""><i class="fas fa-check"></i> 친구</a>
	                                        </div>
	                                    </div>
	                               </div>
	                           </div>
	                           </c:forEach>
                           </c:if>
                           <c:if test="${empty friends }">
                           	<div>
                           		<span>친구가 없습니다</span>
                           	</div>
                           </c:if>
                       </div>
                    </div>
                </div>
            </div>
        </div>
<script type="text/javascript">
$(function() {
	$("#findFreindKeyword").keyup(function(event) {
		var userNo = $('#nowUserNo').val();
		$.ajax({
			url: "searchFriend.do",
			data: {keyword: $('#findFreindKeyword').val(), event:"friend", userNo: userNo},
			dataType: 'json',
			success: function(friends) {
				var html = "";
				$.each(friends, function(index) {
					html += "<div class='col-lg-6'>";
					html += "<div class='friend-info'>";
					html += "<div class='row'>";
					html += "<div class='col-lg-4 friend-info-img'>";
					html += "<a href='profile.do?userNo="+friends[index].no+"'>";
					html += "<img src='resources/image/"+friends[index].profile+"'>";
					html += "</a>";
					html += "</div>";
					html += "<div class='col-lg-4 friend-info-name'>";
					html += "<a href='profile.do?userNo="+friends[index].no+"'>"+friends[index].name+"</a>";
					html += "<a href='javascript:void(0)'>"+friends[index].friendCount+"명</a>";
					html += "</div>";
					html += "<div class='col-lg-5 friend-info-button'>";
					html += "<a class='btn btn-default btn-sm' href=''><i class='fas fa-check'></i> 친구</a>";
					html += "</div>";
					html += "</div>";
					html += "</div>";	
					html += "</div>";
				});
				
				$("#friendListDiv").children().remove();
				$("#friendListDiv").prepend(html);
				$("#findFreindKeywordDiv").show();
			}
		});	
	});
	
	$('#allFriend').click(function (event) {
		$.ajax({
			url: "profileAllFriend.do",
			dataType: 'json',
			success: function(result){
				
			}
		})
	});
	
	$('#followerOfUser').click(function (event) {
		var userNo = $('#nowUserNo').val();
		$.ajax({
			url: "profileFollower.do",
			data: {userNo: userNo},
			dataType: 'json',
			success: function(followerOfUser){
				var html = "";
				
				$.each(followerOfUser, function(index) {
					html += "<div class='col-lg-6'>";
					html += "<div class='friend-info'>";
					html += "<div class='row'>";
					html += "<div class='col-lg-4 friend-info-img'>";
					html += "<a href='profile.do?userNo="+followerOfUser[index].no+"'>";
					html += "<img src='resources/image/"+followerOfUser[index].profile+"'>";
					html += "</a>";
					html += "</div>";
					html += "<div class='col-lg-4 friend-info-name'>";
					html += "<a href='profile.do?userNo="+followerOfUser[index].no+"'>"+followerOfUser[index].name+"</a>";
					html += "<a href='javascript:void(0)'>"+followerOfUser[index].friendCount+"명</a>";
					html += "</div>";
					html += "<div class='col-lg-5 friend-info-button'>";
					html += "</div>";
					html += "</div>";
					html += "</div>";	
					html += "</div>";
				});
				$("#friendListDiv").children().remove();
				$("#friendListDiv").prepend(html);	
				$("#findFreindKeywordDiv").hide();
			}
		})
	});
	
	$('#followingOfUser').click(function (event) {
		var userNo = $('#nowUserNo').val();
		$.ajax({
			url: "profileFollowing.do",
			data: {userNo: userNo},
			dataType: 'json',
			success: function(followingOfUser){
				var html = "";
				
				$.each(followingOfUser, function(index) {
					html += "<div class='col-lg-6'>";
					html += "<div class='friend-info'>";
					html += "<div class='row'>";
					html += "<div class='col-lg-4 friend-info-img'>";
					html += "<a href='profile.do?userNo="+followingOfUser[index].no+"'>";
					html += "<img src='resources/image/"+followingOfUser[index].profile+"'>";
					html += "</a>";
					html += "</div>";
					html += "<div class='col-lg-4 friend-info-name'>";
					html += "<a href='profile.do?userNo="+followingOfUser[index].no+"'>"+followingOfUser[index].name+"</a>";
					html += "<a href='javascript:void(0)'>"+followingOfUser[index].friendCount+"명</a>";
					html += "</div>";
					html += "<div class='col-lg-5 friend-info-button'>";
					html += "</div>";
					html += "</div>";
					html += "</div>";	
					html += "</div>";
				});
				$("#friendListDiv").children().remove();
				$("#friendListDiv").prepend(html);
				$("#findFreindKeywordDiv").hide();
			}
		})
	});
	
	$('#likePageOfUser').click(function (event) {
		var userNo = $('#nowUserNo').val();
		$.ajax({
			url: "likePageOfUser.do",
			data: {userNo: userNo},
			dataType: 'json',
			success: function(likePages){
				var html = "";
				
				$.each(likePages, function(index, likepage) {
					html += "<div class='col-lg-6'>";
					html += "<div class='friend-info'>";
					html += "<div class='row'>";
					html += "<div class='col-lg-4 friend-info-img'>";
					html += "<a href=''>";
					html += "<img src='resources/image/"+likepage.profile+"'>";
					html += "</a>";
					html += "</div>";
					html += "<div class='col-lg-4 friend-info-name'>";
					html += "<a href='.do'>"+likepage.pageName+"</a>";
					html += "<a href='javascript:void(0)'>"+likepage.category+"</a>";
					html += "</div>";
					html += "<div class='col-lg-5 friend-info-button'>";
					html += "</div>";
					html += "</div>";
					html += "</div>";	
					html += "</div>";
				});
				$("#friendListDiv").children().remove();
				$("#friendListDiv").prepend(html);
				$("#findFreindKeywordDiv").hide();
			}
		})
	});
	
	$('#friendsBirthday').click(function (event) {
		var userNo = $('#nowUserNo').val();
		var html = "";
		$.ajax({
			url: "getFriendsBirthdayOfUser.do",
			data: {userNo: userNo},
			dataType: 'json',
			success: function(birthInfoOfFriends){
				console.log(birthInfoOfFriends);
				if (birthInfoOfFriends.length === 0) {
					html += '<div class="text-center" role="alert" style="height: 50px">';
					html += '<span>7일 이내의 생일인 친구가 없습니다.</span>';
					html += '</div>';				
				} else {
					$.each(birthInfoOfFriends, function(index, birthInfoOfFriend) {
						html += "<div class='col-lg-6'>";
						html += "<div class='friend-info'>";
						html += "<div class='row'>";
						html += "<div class='col-lg-4 friend-info-img'>";
						html += "<a href='profile.do?userNo="+birthInfoOfFriend.no+"'>";
						html += "<img src='resources/image/"+birthInfoOfFriend.profile+"'>";
						html += "</a>";
						html += "</div>";
						html += "<div class='col-lg-4 friend-info-name'>";
						html += "<a href='profile.do?userNo="+birthInfoOfFriend.no+"'>"+birthInfoOfFriend.name+"</a>";
						if ((birthInfoOfFriend.userBirthday - birthInfoOfFriend.nowday) == 7) {
							html += '7일전';
						} else if ((birthInfoOfFriend.userBirthday - birthInfoOfFriend.nowday) == 6) {
							html += '6일전';
						} else if ((birthInfoOfFriend.userBirthday - birthInfoOfFriend.nowday) == 5) {
							html += '5일전';
						} else if ((birthInfoOfFriend.userBirthday - birthInfoOfFriend.nowday) == 4) {
							html += '4일전';
						} else if ((birthInfoOfFriend.userBirthday - birthInfoOfFriend.nowday) == 3) {
							html += '3일전';
						} else if ((birthInfoOfFriend.userBirthday - birthInfoOfFriend.nowday) == 2) {
							html += '2일전';
						} else if ((birthInfoOfFriend.userBirthday - birthInfoOfFriend.nowday) == 1) {
							html += '1일전';
						} else {
							html += '<p class="text-success">';
							html += '오늘 생일입니다.';
							html += '</p>';
						}
						html += "</div>";
						html += "<div class='col-lg-5 friend-info-button'>";
						html += "</div>";
						html += "</div>";
						html += "</div>";	
						html += "</div>";
					});
				}
				$("#friendListDiv").children().remove();
				$('#friendListDiv').prepend(html);
				$("#findFreindKeywordDiv").hide();
			}
		});
	});
})
</script>