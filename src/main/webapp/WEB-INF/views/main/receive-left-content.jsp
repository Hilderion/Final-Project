<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="chat-main-area" style="display:inline-block;">
<div id="chat-main" class="panel panel-default" style="display:inline-block;position:relative; width:230px;" >
	<div id="chat-area" class="panel-heading" >
		<span style="font-size:13px;">유저 목록</span>
	</div>
	<div id ="chat-friendInfo" class="panel-body link">
		<ul class="list-group">
			<c:forEach var="receiveMessage" items="${receiveMessages }">
				<li class="list-group-item" id="chat-friend-${receiveMessage.sendUser.no }" style="font-size:13px;background-color:white;">
				<div class="test1" style="display:inline-block">
					<img src="resources/image/${receiveMessage.sendUser.profile }" style="width:40px;height:40px;border-radius:50%;">
					<div style="display:inline-block; margin-left:5px">
						${receiveMessage.sendUser.name }
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
									row += '<span>';
									row +=  result[result.length-1].contents;
									row += '</span>';
									row += '</div>';
								} else {
									row += '<img src="resources/image/'+result[result.length-1].sendUser.profile+'" style="width:30px;height:30px;border-radius: 50%;float:left;">'; 
									row += '<div style="float:left;font-size:13px; background-color:#bbb6b6;border-radius: 12px;padding: 8px;margin-left:5px;">';
									row += '<span>';
									row += result[result.length-1].contents;
									row += '</span>';
									row += '</div>';
								}
								row += '</div>';	
								row += '</div>';
							$('#message-append-' + userno).append(row);
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
							row += '<div id="friend-chat-'+userno+'" class="panel panel-default"">';
							row += '<div id="message-append-'+userno+'" style="overflow-y:scroll; height:250px;">'
							$.each(result , function(index, message){
								row += '<div class="panel-body" style="padding:8px;">';
								row += '<div>';
								if('${LOGIN_USER.no}' == message.sendUser.no) {
									row += '<div style="float:right;font-size:13px; text-align:right;background-color:#c1d9ff;border-radius: 12px;padding: 8px;">';
									row += '<span>';
									row += message.contents;
									row += '</span>';
									row += '</div>';
								} else {
									row += '<img src="resources/image/'+message.sendUser.profile+'" style="width:30px;height:30px;border-radius: 50%;float:left;">'; 
									row += '<div style="float:left;font-size:13px; background-color:#bbb6b6;border-radius: 12px;padding: 8px;margin-left:5px;">';
									row += '<span>';
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
							
							$('.postcontent').append(row);
							$('#chat-friend-'+userno).css('background-color', 'aqua');
							$('#message-append-'+userno).scrollTop($("#message-append-"+userno)[0].scrollHeight);
						}
					})
				}
			} else if ("OFF_CHAT" == command) {
				var userno = items[1];
				$('#friend-chat-' + userno).remove();
			}
		}
		
		$('#chat-main').on('click','[id^=chat-friend-]',function(){
			var chatFriendNo = $(this).attr('id').replace('chat-friend-','');
			var $chatFriend = $(this);
			var css = $(this).css('background-color');
			if ('rgb(255, 255, 255)' == css) {
				$.ajax({
					url: "getMessage",
					data: {sendUser: '${LOGIN_USER.no}',receiveUser:chatFriendNo},
					dataType: 'json',
					success: function(result) {
						var row = "";
						row += '<div id="friend-chat-'+chatFriendNo+'" class="panel panel-default">';
						row += '<div id="message-append-'+chatFriendNo+'" style="overflow-y:scroll; height:250px;">'
						$.each(result , function(index, message){
							row += '<div class="panel-body" style="padding:8px;">';
							row += '<div>';
							if('${LOGIN_USER.no}' == message.sendUser.no) {
								row += '<div style="float:right;font-size:13px; text-align:right;background-color:#c1d9ff;border-radius: 12px;padding: 8px;">';
								row += '<span>';
								row += message.contents;
								row += '</span>';
								row += '</div>';
							} else {
								row += '<img src="resources/image/'+message.sendUser.profile+'" style="width:30px;height:30px;border-radius: 50%;float:left;">'; 
								row += '<div style="float:left;font-size:13px; background-color:#bbb6b6;border-radius: 12px;padding: 8px;margin-left:5px;">';
								row += '<span>';
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
						$('.postcontent').empty();
						$('.postcontent').append(row);
						
						$('.list-group').children().css('background-color','white');
						$('#chat-friend-'+chatFriendNo).css('background-color', 'aqua');
						$('#message-append-'+chatFriendNo).scrollTop($("#message-append-"+chatFriendNo)[0].scrollHeight);
					}
				})
			} else {
				$('.postcontent').empty();
				$('#chat-friend-'+chatFriendNo).css('background-color', 'white');
				return false;
			}
			
		})
		$('.postcontent').on('click','[id^=submit]',function(){
			var receiveUserNo = $(this).attr('id').replace('submit-','');
			var messageContents = $('#messagearea-'+ receiveUserNo).val();
			var row = "";
			if (messageContents != ''){
				ws.send("MSG:" + receiveUserNo + ':' + messageContents);
				$('#messagearea-' + receiveUserNo).val('');
				row += '<div class="panel-body" style="padding:8px;">';
				row += '<div>';
				row += '<div style="float:right;font-size:13px; text-align:right;background-color:#c1d9ff;border-radius: 12px;padding: 8px;">';
				row += '<span>';
				row += messageContents;
				row += '</span>';
				row += '</div>';
				row += '</div>';	
				row += '</div>';
				$('#message-append-'+receiveUserNo).append(row);
				$('#message-append-'+receiveUserNo).scrollTop($("#message-append-"+receiveUserNo)[0].scrollHeight);
			}
		});
		$('.postcontent').on('keypress','[id^=messagearea]',function(event){
			var userno = $(this).attr('id').replace('messagearea-','');
			if (event.which == 13){
				$('#submit-'+userno).click();
				return false;
			}
		});
		$('.postcontent').on('click','[id^=messagearea-]',function(event){
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