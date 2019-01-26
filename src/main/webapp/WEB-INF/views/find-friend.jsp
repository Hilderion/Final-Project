<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<body>
	<%@ include file="topbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-lg-10">
				<div class="friend-request">
					<p class="friend-event">친구 요청에 답하기</p>
					<a id="request-change" href="javascript:void(0)">전송한 요청 보기</a>
					<hr>						 
					<div id="friend-request">
					<c:forEach var="event" items="${events }">
						<div class="friend-info row" id="request-friend-${event.user.no }">
							<div class="col-xs-1">
								<img src="resources/image/${event.user.profile }">
							</div>
							<div class="col-xs-8">
								<a href="profile.do?userNo=${event.user.no }" class="friend-name">${event.user.name }</a>
								<p class="friend-addr">${event.user.address eq null ? " " : event.user.address }</p>
							</div>
							<div id="friend-event-request" class="col-xs-3 request">
								<a id="btn-addFriend-${event.user.no }" class="btn btn-primary"
									href="javascript:void(0)">확인</a> <a class="btn btn-default" href="javascript:void(0)">요청 삭제</a>
							</div>
						</div>
					</c:forEach>
					</div>
				</div>
				
				<div class="find-friend">
					<p class="friend-event">알 수도 있는 사람</p>
					<hr>
					<c:if test="${recommands ne null }">
						<c:forEach var="friend" items="${recommands }">
							<!-- 이 부분이 반복 되어야 함 -->
							<div class="friend-info row" id="friend_rec_${friend.USERNO }">
								<div class="col-xs-1">
									<img src="resources/image/${friend.USERPROFILE }">
								</div>
								<div class="col-xs-8">
									<a href="profile.do?userNo=${friend.USERNO }" class="friend-name">${friend.USERNAME }</a>
									<p class="friend-addr">${friend.USERADDRESS eq null ? " " : friend.USERADDRESS }</p>
									<p class="event-friend">
										<a><img src="resources/image/${friend.FRIENDPROFILE }" style="border-radius:50%"></a><a href="profile.do?userNo=${friend.FRIENDNO }">${friend.FRIENDNAME }</a> 님을 함께
										알고 있습니다.
									</p>
								</div>
								<div class="col-xs-3 request" id="exf_friend_${friend.USERNO }">
									<a class="btn btn-primary" id="btn-add-friend-${friend.USERNO }"><i class="fas fa-user-plus"></i> <span id="fri-Ment-${friend.USERNO }">친구 추가</span></a> 
									<a class="btn btn-default" id="btn_exf_friend_${friend.USERNO }">삭제</a>
								</div>
							</div>
							<hr />
							<!-- 반복 end -->
						</c:forEach>
					</c:if>
					<c:if test="${recommands eq '' }">
						<p style="font-color:light-grey; size:1#px;">페이지 로딩 중 오류가 발생하였습니다.</p>
						<p style="font-color:light-grey; size:1#px;">server:404-125 error do request$submaping$dummy$error$page</p>
					</c:if>

				</div>
			</div>
			<div class="right-content" style="width:160px;padding-bottom:0px;border-radius:15px">
				<%@ include file="main/right-content.jsp"%>
			</div>
		</div>
	</div>
	<%@ include file="chat.jsp"%>
	
<script type="text/javascript">
	$(function() {
		$('.friend-request').on('click','#request-change',function(){
			var text = $(this).text();
			var event = "";
			var row = "";
			if("전송한 요청 보기" == text){
				event = "전송";
				$(this).text("수신한 요청 보기");
			} else {
				event = "수신";
				$(this).text("전송한 요청 보기");
			}
			$.ajax({
				type : "GET",
				url : "friendRequest",
				data : {event:event},
				dataType : 'json',
				success : function(requests) {
					if("전송" == event) {
						$.each(requests, function(index, request){
							if(null != request){
								row += '<div class="friend-info row" id="request-friend-'+request.friend.no+'">';
								row += '<div class="col-xs-1">';
								row += '<a href="profile.do?userNo='+request.friend.no+'">';
								row += '<img src="resources/image/'+request.friend.profile+'">';
								row += '</a>';
								row += '</div>';	
								row += '<div class="col-xs-8">';
								row += '<a href="profile.do?userNo='+request.friend.no+'" class="friend-name">'+request.friend.name+'</a>';
								row += '<p class="friend-addr">';
								if(null != request.friend.address){
									row += request.friend.address;
								}
								row += '</p>';
								row += '</div>';
								row += '<div id="friend-event-request" class="col-xs-3 request">';
								row += '<a class="btn btn-primary" id="btn-add-friend-'+request.friend.no+'">';
								row += '<i class="fas fa-user-plus"></i> <span id="fri-Ment-'+request.friend.no+'">친구 요청 전송됨</span></a>';
								row += '</div>';
								row += '</div>';
							} else {
								row += '<div class="friend-info row">';
								row += '<span>요청중인 친구신청이 없습니다</span>';
								row += '<div>';
							}
						})
					} else if ("수신" == event) {
						$.each(requests, function(index, request){
							if(null != request){
								row += '<div class="friend-info row" id="request-friend-'+request.user.no+'">';
								row += '<div class="col-xs-1">';
								row += '<a href="profile.do?userNo='+request.user.no+'" >';
								row += '<img src="resources/image/'+request.user.profile+'">';
								row += '</a>';
								row += '</div>';	
								row += '<div class="col-xs-8">';
								row += '<a href="profile.do?userNo='+request.user.no+'" class="friend-name">'+request.user.name+'</a>';
								row += '<p class="friend-addr">';
								if(null != request.user.address){
									row += request.user.address;
								}
								row += '</p>';
								row += '</div>';
								row += '<div id="friend-event-request" class="col-xs-3 request">';
								row += '<a class="btn btn-primary" id="btn-add-friend-'+request.user.no+'">';
								row += '<i class="fas fa-user-plus"></i> <span id="fri-Ment-'+request.user.no+'">친구 추가</span></a>';
								row += '</div>';
								row += '</div>';
							} else {
								row += '<div class="friend-info row">';
								row += '<span>요청받은 친구신청이 없습니다</span>';
								row += '<div>';
							}
						})
					}
					$('#friend-request').empty();
					$('#friend-request').append(row);
				}
			})
		})
		$('[id^=friend_rec_]').on(
				'click',
				'[id^=btn-add-friend]',
				function() {
					var no = $(this).attr('id').replace(
							'btn-add-friend-', '');
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
								$('#fri-Ment-'+no).text("친구 요청 전송됨");
							} else if (result == "del"){
								alert("친구신청을 취소했습니다");
								$('#fri-Ment-'+no).text("친구 추가");
							}
						}
					})
				})
	
		$("[id^=exf_friend_]").on('click','[id^=btn_exf_friend_]',function(){
			var id= $(this).attr('id').replace('btn_exf_friend_','');
			
			$.ajax({
				type:"GET",
				url :"excFriend",
				data: { excNo : id},
				success: function(data) {
					$("#friend_rec_"+id).remove();
				}
			});
		});
		
		$("[id^=request-friend-]").on('click',"[id^=btn-addFriend-]",function(){
			var id= $(this).attr('id').replace('btn-addFriend-','');
			
			$.ajax({
				type:"GET",
				url :"addFriend.do",
				data: { addFriendNum : id},
				success: function(data) {
					$("#request-friend-"+id).remove();
					window.location.href = "/fa/findFriend.do";
				}
			});
		})
	});
</script>	
</body>
</html>