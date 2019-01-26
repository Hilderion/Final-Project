<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="chat-main-area" style="position: fixed; bottom:0px; display:inline-block;left:7%">
<div id="chat-main" class="panel panel-default" style="display:inline-block;position:relative; width:230px;" >
	<div id="chat-area" class="panel-heading" >
		<a style="text-decoration:none;cursor:pointer;font-size:13px;">채팅</a>
	</div>
	<div id ="chat-friendInfo" class="panel-body link" style="display:none">
		<ul class="list-group">
			<c:forEach var="friend" items="${loginFriends }">
				<li class="list-group-item" id="chat-friend-${friend.no }" style="font-size:13px;">
				<div style="display:inline-block">
					<img src="resources/image/${friend.profile }" style="width:20px;height:20px;">
						<div style="display:inline-block; margin-left:5px">
							${friend.name }
						</div>
				</div>
				</li>
				
			</c:forEach>
		</ul>
	</div>
</div>
</div>
<script type="text/javascript">
	$(function(){
		var ws = new WebSocket("ws://www.fabook.com/fa/friend");
		ws.onmessage = function(event) {
			var data = event.data;
			console.log('서버 응답 메시지', data);
			
			var items = data.split(":");
			var command = items[0];
			if ("ON_USERS" == command) {
				var users = items[1].split(",");
				$.each(users, function(index, userno){
					if (userno != '${LOGIN_USER.no}'){
						$('#ws-friend-' + userno).css('color', 'green');
					}
				});
				
			} else if ("OFF_USERS" == command) {
				var userno = items[1];
				$('#ws-friend-' + userno).css('color', 'gray');
			} else if("ON_CHAT" == command){
				var userno = items[1];
				
			} else if ("ON_MSG" == command){
				var userno = items[1];
				var sendUserno = items[2];
				var message = items[3];
				var row = "";
				
				var chatFriend = $('#chat-friend-'+userno).text();
				var span = "<span id = 'badge-" + userno + "' class='badge badge-info'><span class='far fa-comment-dots' aria-hidden='true'></span></span>"
				var css = $('#chat-friendInfo').css('display');
				//수신자의 메시지창이 열려있을때
				if($('#friend-chat-'+userno).html()){
					$.ajax({
						url: "getMessage",
						data: {sendUser: '${LOGIN_USER.no}',receiveUser:userno},
						dataType: 'json',
						success: function(result) {
								row += '<div class="panel-body" style="padding:8px;">';
								row += '<div>';
								if('${LOGIN_USER.no}' == result[result.length-1].sendUser.no) {
									row += '<div style="float:right;font-size:13px; text-align:right;background-color:#c1d9ff;border-radius: 12px;padding: 8px;">';
									row += '<span stlye="color: white;font-weight: bold;">';
									row +=  result[result.length-1].contents;
									row += '</span>';
									row += '</div>';
								} else {
									row += '<img src="resources/image/'+result[result.length-1].sendUser.profile+'" style="width:30px;height:30px;border-radius: 50%;float:left;">'; 
									row += '<div style="float:left;font-size:13px; background-color:#bbb6b6;border-radius: 12px;padding: 8px;margin-left:5px;">';
									row += '<span stlye="color: white;font-weight: bold;">';
									row += result[result.length-1].contents;
									row += '</span>';
									row += '</div>';
								}
								row += '</div>';	
								row += '</div>';
							
							if('none' == css){
								$('#chat-area').click();	
							}
						$("#message-append-" + userno).append(row);
						$('#message-append-' + userno).scrollTop($("#message-append-"+userno)[0].scrollHeight);
						}
					})
					//수신자의 메시지 창이 닫혀있을때
				} else if (!$('#friend-chat-'+userno).html()) {
					$.ajax({
						url: "getMessage",
						data: {sendUser: '${LOGIN_USER.no}',receiveUser:userno},
						dataType: 'json',
						success: function(result) {
							var row = "";
							row += '<div id="friend-chat-'+userno+'" class="panel panel-default" style="position:relative; display:inline-block;width:260px;margin-right:5px;">';
							row += '<div class="panel-heading" >';
							row += '<a style="font-size:13px;">'+chatFriend+'</a>';
							row += '<button class="btn btn-danger btn-xs" id="btn-close-'+userno+'" style="float:right">닫기';
							row += '</div>';
							row += '<div id="message-append-'+userno+'" style="overflow-y:scroll; height:250px;">'
							$.each(result , function(index, message){
								row += '<div class="panel-body" style="padding:8px;">';
								row += '<div>';
								if('${LOGIN_USER.no}' == message.sendUser.no) {
									row += '<div style="float:right;font-size:13px; text-align:right;background-color:#c1d9ff;border-radius: 12px;padding: 8px;">';
									row += '<span stlye="color: white;font-weight: bold;">';
									row += message.contents;
									row += '</span>';
									row += '</div>';
								} else {
									row += '<img src="resources/image/'+message.sendUser.profile+'" style="width:30px;height:30px;border-radius: 50%;float:left;">'; 
									row += '<div style="float:left;font-size:13px; background-color:#bbb6b6;border-radius: 12px;padding: 8px;margin-left:5px;">';
									row += '<span stlye="color: white;font-weight: bold;">';
									row += message.contents;
									row += '</span>';
									row += '</div>';
								}
								row += '</div>';	
								row += '</div>';
							})
							
							row += '</div>';
							row += '<div>';
							row += '<textarea class="form-control" placeholder="메시지를 입력하세요" id="messagearea-' + userno + '" name="messagearea" style="font-size:13px"></textarea>'
							row += '</div>';
							row += '<div>';
							row += '<input type="button" value="메시지 보내기" id="submit-'+userno+'" style="display:none">';
							row += '</div>';
							row += '</div>';
							
							if('none' == css){
								$('#chat-area').click();	
							}
							$('#chat-friend-'+userno).append(span);
							$('#chat-main-area').append(row);
							$('#message-append-'+userno).scrollTop($("#message-append-"+userno)[0].scrollHeight);
							
						}
					})
				}
			} else if ("OFF_CHAT" == command) {
				var userno = items[1];
				$('#friend-chat-' + userno).remove();
			}
		}
		
		$('#chat-main').on('click','#chat-area',function(){
			var css = $('#chat-friendInfo').css('display');
			if ('none' == css) {
				$('#chat-friendInfo').css('display','');
				$('#chat-area').css('background-color','#c1d9ff');
			} else {
				$('#chat-friendInfo').css('display','none');
				$('#chat-area').css('background-color','');
				$('[id^=friend-chat]').remove();
				$('.badge-info').remove();
			}
		});
		$('#chat-main').on('click','[id^=chat-friend-]',function(){
			var chatFriendNo = $(this).attr('id').replace('chat-friend-','');
			var $chatFriend = $(this);
			if ($(this).children('span').length == 0) {
				var span = "<span id = 'badge-" + chatFriendNo + "' class='badge badge-info' style='margin:-4px;'><span class='far fa-comment-dots' aria-hidden='true'></span></span>"
				$chatFriend.append(span);	
				$.ajax({
					url: "getMessage",
					data: {sendUser: '${LOGIN_USER.no}',receiveUser:chatFriendNo},
					dataType: 'json',
					success: function(result) {
						var row = "";
						row += '<div id="friend-chat-'+chatFriendNo+'" class="panel panel-default" style="position:relative; display:inline-block;width:260px;margin-right:5px;">';
						row += '<div class="panel-heading" >';
						row += '<a style="font-size:13px;">'+$chatFriend.text()+'</a>';
						row += '<button class="btn btn-danger btn-xs" id="btn-close-'+chatFriendNo+'" style="float:right">닫기';
						row += '</div>';
						row += '<div id="message-append-'+chatFriendNo+'" style="overflow-y:scroll; height:250px;">'
						$.each(result , function(index, message){
							row += '<div class="panel-body" style="padding:8px;">';
							row += '<div>';
							if('${LOGIN_USER.no}' == message.sendUser.no) {
								row += '<div style="float:right;font-size:13px; text-align:right;background-color:#c1d9ff;border-radius: 12px;padding: 8px;">';
								row += '<span stlye="color: white;font-weight: bold;">';
								row += message.contents;
								row += '</span>';
								row += '</div>';
							} else {
								row += '<img src="resources/image/'+message.sendUser.profile+'" style="width:30px;height:30px;border-radius: 50%;float:left;">'; 
								row += '<div style="float:left;font-size:13px; background-color:#bbb6b6;border-radius: 12px;padding: 8px;margin-left:5px;">';
								row += '<span stlye="color: white;font-weight: bold;">';
								row += message.contents;
								row += '</span>';
								row += '</div>';
							}
							row += '</div>';	
							row += '</div>';
						})
						row += '</div>';
						row += '<div>';
						row += '<textarea class="form-control" placeholder="메시지를 입력하세요" id="messagearea-' + chatFriendNo + '" name="messagearea" style="font-size:13px"></textarea>'
						row += '</div>';
						row += '<div>';
						row += '<input type="button" value="메시지 보내기" id="submit-'+chatFriendNo+'"  style="display:none">';
						row += '</div>';
						row += '</div>';
						$('#chat-main-area').append(row);
						$('#message-append-'+chatFriendNo).scrollTop($("#message-append-"+chatFriendNo)[0].scrollHeight);
					}
				})
			} else {
				$('#friend-chat-' + chatFriendNo).remove();
				$('#badge-' + chatFriendNo).remove();
				return false;
			}
		})
		$('#chat-main-area').on('click','[id^=submit]',function(){
			var receiveUserNo = $(this).attr('id').replace('submit-','');
			var messageContents = $('#messagearea-'+ receiveUserNo).val();
			var row = "";
			if (messageContents != ''){
				ws.send("MSG:" + receiveUserNo + ':' + messageContents);
				$('#messagearea-' + receiveUserNo).val('');
				row += '<div class="panel-body" style="padding:8px;">';
				row += '<div>';
				row += '<div style="float:right;font-size:13px; text-align:right;background-color:#c1d9ff;border-radius: 12px;padding: 8px;">';
				row += '<span stlye="color: white;font-weight: bold;">';
				row += messageContents;
				row += '</span>';
				row += '</div>';
				row += '</div>';	
				row += '</div>';
				$('#message-append-'+receiveUserNo).append(row);
				$('#message-append-'+receiveUserNo).scrollTop($("#message-append-"+receiveUserNo)[0].scrollHeight);
			}
		})
		$('#chat-main-area').on('click','[id^=btn-close]',function(){
			var receiveUserno = $(this).attr('id').replace('btn-close-','');
			//ws.send("CLOSE:" + receiveUserno);
			$('#friend-chat-' + receiveUserno).remove();
			$('#badge-' + receiveUserno).remove();
		})
		$('#chat-main-area').on('keypress','[id^=messagearea]',function(event){
			var userno = $(this).attr('id').replace('messagearea-','');
			if (event.which == 13){
				$('#submit-'+userno).click();
				return false;
			}
		})
		$('#chat-main-area').on('click','[id^=messagearea]',function(event){
			var userno = $(this).attr('id').replace('messagearea-','');
			$.ajax({
				url: "messageCheck",
				data:{receiveUserNo:userno},
				success:function(){
					
				}
			})
		})
	})
	
</script>