<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

		<div class="row margin20">
            <div class="col-xs-4">
                <div class="information" style="padding-bottom:10px;">
                    <p style="font-size: 18px;font-weight: bold;margin-left:10px;padding-top:10px;"><i class="fas fa-child" style="color:forestgreen;"></i>소개</p>
						<div style="margin-bottom:10px;margin-left:10px;font-weight:bole;">이메일: <span style="font-weight:100;">${user.email }</span></div>
						<c:if test="${user.email ne null}">
							<div style="margin-bottom:10px;margin-left:10px;font-weight:bole;">학력: <span style="font-weight:100;">${user.education }</span></div>                   
						</c:if>
						<c:if test="${user.email eq null}">
							<div style="margin-bottom:10px;margin-left:10px;font-weight:bole;">학력 입력 없음.</div>                   
						</c:if>
						<c:if test="${user.address ne null }">
							<div style="margin-bottom:10px;margin-left:10px;font-weight:bole;">주소: <span style="font-weight:100;">${user.address }</span></div>                   
						</c:if>
						<c:if test="${user.address eq null }">
							<div style="margin-bottom:10px;margin-left:10px;font-weight:bole;">주소 입력 없음</div>                   
						</c:if>
                 
                </div>
                <div class="picture" style="padding:0px 10px 10px 10px">
                	<div style="font-size: 18px;font-weight: bold; margin-left:10px;padding-top:10px;">
                    	<i class="fa fa-image" style="color:deeppink;"></i> 사진
                    </div>
                    <c:forEach var="media" items="${medias }">
	                    <span class="picture-img">
	                        <a href="">
	                            <img src="resources/image/${media.name }" class="border">
	                        </a>   
	                    </span>
                    </c:forEach>
                </div>
                <div class="friend" style="padding:0px 10px 10px 10px">
                   <div style="font-size: 18px;font-weight: bold;margin-left:10px;padding-top:10px;">
                   		<i class="fas fa-user-tag" style="color:teal;"></i> 친구
                   </div>
                    <c:forEach var="friend" items="${friendsOfUser }">
	                    <span class="picture-img">
	                        <a href="profile.do?userNo=${friend.no }">
	                            <img src="resources/image/${friend.profile }" class="border">
	                        </a>   
	                    </span>
                    </c:forEach>
                </div>
            </div>
            <div class="col-xs-6">
                <div class="recentcontainer">
                    <div class="newpost">
                      <textarea placeholder="게시글 영역" id="boardArea" data-toggle="modal" data-target="#boardModal"></textarea>
                    </div>
                    <div class="newpostfooter">
                         <a href="javascript:void(0)">
                          <label id="image-label"><i class="fa fa-image"></i>사진/동영상</label>
                        </a>
                         <a href="javascript:void(0)">
                          <label id="tag-label"><i class="fas fa-user-tag"></i>친구 태그하기</label>
                        </a>
                        <a href="javascript:void(0)">
                          <i class="fa fa-ellipsis-h"></i>
                        </a>
                    </div>
                  </div>
                  <c:forEach var="profileBoard" items="${boards }">
		                  <div class="recentcontainer">
		                    <div class="newpostheader">
			                      <a href="javascript:void(0)">
			                        <img src="resources/image/${profileBoard.user.profile }"  style="border-radius:50%"/>
			                        <span class="name">${profileBoard.user.name }
			                        </span>
			                      </a>
				                    <c:if test="${profileBoard.share.no ne null}">
								         <span>님이
								         <a href="#">게시물</a>
					                 	을 공유했습니다.</span>
				                    </c:if>
		                      <p>
		                        <a class="date" href="javascript:void(0)">${profileBoard.passedTime }</a>
		                        <a href="javascript:void(0)">
		                          <i class="fa fa-globe"></i>
		                        </a>
		                      <div class="rightsideofpost">
		                        <a class="personpostmenu" href="javascript:void(0)">
		                          <i class="fa fa-caret-down"></i>
		                        </a>
		                      </div>
		                  </div>
		                    <div class="newpost">
		                      <div class="postcontent">
		                      	<div style="margin-left:10px;margin-top:10px;">
			                       ${profileBoard.contents }
			                    </div> 
			                    <div style="height:40px;">
	                        	<div style="margin-left:10px;margin-top:10px;">
	                        	<c:forEach var="tag" items="${profileBoard.tags }">
	                        		<c:if test="${tag.contents ne null}">
		                        		<a href="profile.do?userNo=${tag.user.no }" style="text-decoration: none;">${tag.contents }</a>
	                        		</c:if>
	                        	</c:forEach>
	                        	<c:if test="${not empty profileBoard.tags }">
	                        		과 함께
	                        	</c:if>
	                        	</div>
	                        </div>  
			                    <div>
			                        	<c:if test="${not empty profileBoard.boardMedias}">
			                        		<c:forEach var="profileBoardMedia" items="${profileBoard.boardMedias }">
				                        		<img src="resources/image/${profileBoardMedia.name }" style="width:535px; height:350px;">
			                        		</c:forEach>
			                        	</c:if>
			                    </div>
		                      </div>
		                        <c:if test="${profileBoard.share.no ne null }">
		                      		<div class="postcontent">
		                      		<%@ include file="profile-share-content.jsp" %>
		                      		</div>
		                        </c:if>
		                    </div>
		                     <div class="community-counter">
		                        <a href="javascript:void(0)" id="likeCount-${profileBoard.no }"data-toggle='tooltip' data-placement='top' data-html=true;>
		                          <i class="fa fa-thumbs-up"></i>
		                          <span id="likeCountInfo-${profileBoard.no }">${profileBoard.like }</span>
		                        </a>
		                        <a href="javascript:void(0)" id="replyCount-${profileBoard.no }"data-toggle='tooltip' data-placement='top' data-html=true;>
		                          <i class="far fa-comment-alt"></i>
		                          <span id="boardRepCount-${profileBoard.no }">${profileBoard.repCount }</span>
		                        </a>
		                    </div>
		                    <div class="newpostfooter">
		                       <div class="newpostfooter-contents">
		                       <!-- 좋아요를 눌렀는지아닌지에대한 choose -->
		                       	<c:if test="${empty profileBoard.event}">
			                        <a href="javascript:void(0)" id="likeBoardButton-${profileBoard.no }" class="board-label">
			                          <i class="fa fa-thumbs-up"></i>
			                          <span>좋아요</span>
			                        </a>
			                    </c:if>
		                       	<c:if test="${not empty profileBoard.event}">
			                        <a href="javascript:void(0)" style="color:Dodgerblue" id="likeBoardButton-${profileBoard.no }" class="board-label">
			                          <i class="fa fa-thumbs-up"></i>
			                          <span>좋아요</span>
			                        </a>
			                    </c:if>		                       	
		                        <a href="javascript:void(0)" title="Leave a comment" id="replyButton-${profileBoard.no }" class="board-label">
		                          <i class="far fa-comment-alt"></i>
		                          <span>댓글달기</span>
		                        </a>
		                        <a id="shareButton-${profileBoard.no }" href="#" class="board-label" data-toggle="modal" data-target="#shareModal">
		                          <i class="fa fa-share"></i>
		                          <span>공유하기</span>
		                        </a>
		                        </div>
		                      </div>
		                      
		                      <div id="commentListDiv-${profileBoard.no }">
		                      
		                      </div>
		                      
								<div class="commentpost" id="commentTextareaDiv-${profileBoard.no }" style="display:none">
								     <div class="input-group" style="width:100%">
								     	<div style="display:inline-block">
									       <a href="profileOpen.do?userNo=${profileBoard.user.no }">
									         <img src="resources/image/${loginUser.profile }" style="width:40px;height:40px;border-radius:50%"/>
									       </a>
								       </div>
								       <div style="display:inline-block; vertical-align:middle; width:75%;">
								       <textarea class="form-control" placeholder="댓글을 입력해주세요" id="replyContents-${profileBoard.no}" style="height:35px;"></textarea>
								       </div>
								       <div style="display:inline-block; vertical-align:middle;">
								       <a class="btn btn-primary btn-sm pull-right" id="addReply-${profileBoard.no }">등록</a>
								       </div>
								      </div>
								</div>
		                  </div>
                  </c:forEach>
            </div>
        </div>
        
				<!-- 공유하기 Modal -->
				<div class="modal fade" id="shareModal" role="dialog">
					<div class="modal-dialog">
				    	<!-- Modal content-->
				      	<div class="modal-content">
				        	<div class="modal-header">
				          		<button type="button" class="close" data-dismiss="modal">&times;</button>
				          		<select id="open-range">
				          			<option value="onlyme"> 나만보기</option>
				          			<option value="all"> 모두</option>
				          			<option value="onlyfriend"> 친구만</option>
				          		</select>
							<!--  	<h4 class="board-title">공유하기 헤더</h4> -->
				        	</div>
				        		<input type="hidden" id="clicked-board-no" />
						        <div class="modal-body">
	                      			<div class="postcontent" id="modal-board-content">
										<textarea class="form-control" rows="5" id="share-textarea" placeholder="하고싶은 말을 남겨주세요...." name="user-contents"></textarea>
	                      			</div>
	                      			
						        </div>
						        <div class="modal-footer">
						          <button type="button" class="btn btn-warning" data-dismiss="modal">취소</button>
						          <a class="btn btn-default" id="share-board-add-button">게시</a>
						        </div>
				    	</div>
				    </div>
				</div>
		<!-- 글쓰기 모달 -->
			<div class="modal modal-center fade" id="boardModal" role="dialog">
			<div class="modal-dialog modal-center modal-overall">
				<div class="modal-content">
					<form method="post" id="board-form" action="addBoard.do" enctype="multipart/form-data">
					<div class="modal-header">
						<div class="link-group">
	                        <a href="profile.do?userNo=${loginUser.no }" class="link">
	                            <img src="resources/image/${loginUser.profile }">
	                        </a>
	                        <button type="button" class="close" data-dismiss="modal">×</button>
	                    </div>
					</div>
					<div class="modal-body">
						<div class="row text-row">
							<div class="postcontent" id="modal-board-content2">
								<div class="recentcontainer">
				                    <div class="newpost mBottom10">
				                    	<textarea class="form-control" placeholder="게시글 영역" id="textArea" name="textArea"></textarea>
				                    </div>
				                    <div class="img-space mBottom10">
				                    	<img id="board-img">
				                    </div>
				                    <div class="tag-space mBottom10">
				                    	
				                    </div>
	                  			</div>
                  			</div>
						</div>
					</div>

					<div class="modal-footer">
						<div class="newpostfooter">
				        	<a href="javascript:void(0)">
				               	<input type="file" id="image-board" name="boardimgfile" >
				               	<label id="image-board-label" for="image-board"><i class="fa fa-image"></i>사진 / 동영상</label>
				            </a>
			                <a id="btnFriendTag" href="javascript:void(0)" style="float:left; font-size:14px">
			                   	<label id="tag-board-label"><i class="fas fa-user-tag"></i>친구 태그하기</label>
				       		</a>
				       		<span id="modal-foot"></span>
						<select id="board-open-range" name="openRange">
				        	<option value="all"> 모두</option>
				        	<option value="onlyfriend"> 친구만</option>
				        	<option value="onlyme"> 나만보기</option>
				        </select>
						<button type="button" class="btn btn-default" data-dismiss="modal" id="board-add-button">글쓰기</button>
				        </div>
					</div>
					</form>
				</div>
			</div>
		</div>	
<script type="text/javascript">
$(function() {
	$('[data-toggle="tooltip"]').tooltip();
	$('.recentcontainer').on('mouseenter','[id^=likeCountInfo-]',function(){
		var boardNo = $(this).attr('id').replace('likeCountInfo-','');
		var $addTooltip = $(this); 
		var userInfo = "";
		$.ajax({
			url: "getLikeInfoByBoardNo",
			data: {boardNo:boardNo},
			dataType: 'json',
			success: function(result){
				$.each(result, function(index, info){
					userInfo += info.user.name + "<br>";
				});
				$addTooltip.attr('title',userInfo).attr('data-html',true).tooltip('toggle')
			}
		})
	})
	$('.recentcontainer').on('mouseleave','[id^=likeCountInfo-]',function(){
		$(this).attr('title',''); 
	})
	//댓글 카운트에 작성자 정보 툴팁
	$('.recentcontainer').on('mouseenter','[id^=boardRepCount-]',function(){
		var boardNo = $(this).attr('id').replace('boardRepCount-','');
		var $addTooltip = $(this); 
		var userInfo = "";
		$.ajax({
			url: "getReplyInfoByBoardNo",
			data: {boardNo:boardNo},
			dataType: 'json',
			success: function(result){
				$.each(result, function(index, info){
					userInfo += info.user.name + "<br>";
				});
				$addTooltip.attr('title',userInfo).attr('data-html',true).tooltip('toggle')
			}
		})
	})
	$('.recentcontainer').on('mouseleave','[id^=boardRepCount-]',function(){
		$(this).attr('title',''); 
	})
	$('#tag-label').click(function(){
		$('#boardArea').click();
		$('#btnFriendTag').click();
	})
	$('#image-label').click(function(){
		$('#boardArea').click();
		$('#image-board').click();
	})
	//친구 태그하기 버튼 클릭시 친구 검색창 추가
	$('.modal-footer').on('click','#btnFriendTag',function(){
		var row = "";
		if(!$('#tag-check').html()){
			row += "<div id='tag-check' style='border:1px solid gray;'>";
			row += "<div style='display:inline-block; border-right:1px solid gray'>";
			row += "<label class='tag-friend'>함께한 친구</label>";
			row += "</div>";
			row += "<div id='tagFriendSpace' style='display:inline-block;'>";
			row += "<div id='tagFriendArea' style='display:inline-block;'>";
			row += "<div id='tag-test' data-toggle='dropdown' aria-haspopup='true' role='button' >"
			row +=	'<input id="tagFriendSearchKeywordInput" placeholder="누구와 함께 했나요?" type="text" aria-autocomplete="list" aria-label="누구와 계신가요?" aria-expanded="false" role="combobox" autocomplete="off" autocorrect="off"  style="width: auto; border:none;">';
			row += "</div>"; 
			row += "</div>"; 
			row += "</div>"; 
			row += "</div>";
			$(".tag-space").html(row);
		} else {
			$("#tag-check").remove();
		}
	});
	//친구 검색창에 검색어 입력시 친구 드롭다운 추가
	$(".recentcontainer").on('keyup','#tagFriendSearchKeywordInput',function(event) {
		$.ajax({
			url: "searchFriend.do",
			data: {keyword: $('#tagFriendSearchKeywordInput').val(),event:"tag",userNo:'${LOGIN_USER.no}'},
			dataType: 'json',
			success: function(friends) {
				var row = "";
				row += '<ul id="tag-friend" class="dropdown-menu" style="top:auto; left:auto">';
				$.each(friends, function(index, friend) {
					row += '<li id="tag-friend-area-' + friend.no + '">';
					row += '<a href="javascript:void(0)">';
					row += '<img src="resources/image/' + friend.profile + '" style="width:20px;height:20px;">';
					row += friend.name + '</a></li>';
				});
				row +=	'<ul>';
				$('#tagFriendArea').children('ul').remove();
				$("#tagFriendArea").append(row);
			}
		});	
	});
	//친구 검색후 친구정보 클릭시 친구정보 검색창옆에 추가
	 $(".recentcontainer").on('click','[id^=tag-friend-area]',function(){
		 var tagNo = $(this).attr('id').replace('tag-friend-area-','');
		 row = "";
		 hidden = "";
		 $.ajax({
			 url: "getFriendInfo.do",
			 data: {tagNo:tagNo},
			 dataType: 'json',
			 success:function(result){
			 	 row += '<div style="display:inline-block">';
			 	 row += '<label class="tag-friendinfo">';
				 row += '<img src="resources/image/'+result.profile +'"style="width:20px;height:20px;">';
				 row += result.name ;
				 row += '<a id="tag-friend-'+result.no+'" class="close" href="javascript:void(0)" rele="button" title="'+result.name+' 삭제" aria-label="'+result.name+' 삭제" style="text-decoration:none float:none; font-size:16px;"> x </a>'
				 row += '</label>';
				 row += '</div >';
				 
				 hidden = '<input type="hidden" name="tag-friend-info" value="'+result.no+'">';
				 
				 $('#tagFriendSpace').prepend(row);
				 $('#board-form').append(hidden);
				 $('#tagFriendSearchKeywordInput').val("");
			 }
		 })
	 })
	 //친구 정보에서 x 버튼 클릭시 친구 정보 삭제
	$(".recentcontainer").on('click','[id^=tag-friend]', function(){
		$(this).parent().remove();
	})
	
	$("#image-board").change(function(){
		readImgURL(this);
	})
	
	function readImgURL(input) {
		if(input.files && input.files[0]){
			var reader = new FileReader();
			
			reader.onload = function(e) {
				$('#board-img').attr('src',e.target.result).css('width','200px').css('height','200px');
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	$(".newpostfooter-contents").on('click', "[id^=likeBoardButton]", function() {
		var boardNo = $(this).attr("id").replace('likeBoardButton-', '');
		var methodName = "";
		var html = "";
		
		if ("color:Dodgerblue" == $('#likeBoardButton-'+boardNo).attr('style')) {
			methodName = "delete";
			$('#likeBoardButton-'+boardNo).attr('style', '');
		} else {
			methodName = "insert";
			$('#likeBoardButton-'+boardNo).attr('style', 'color:Dodgerblue');
		}
		
		$.ajax({
			url: "clickLike.do",
			data: {boardNo: boardNo, methodName: methodName},
			dataType: 'json',
			success: function(result) {
				$("#likeCount-"+boardNo+" :last-child").remove();
				html += "<span>"+result.like+"</span>";
				$("#likeCount-"+boardNo).append(html);
			}
		});
	});

	$(".recentcontainer").on('click', "[id^=shareButton]", function() {
		var mainBoardNo = $(this).attr("id").replace('shareButton-', '');
		$('#clicked-board-no').val(mainBoardNo);
		
		// modal 안쪽 초기화
		$(":input#share-textarea").height(50);
		$(":input#share-textarea").val("");
		$("#modal-board-content :not(#share-textarea)").remove();
		
		var boardContentHtml = $("#post-board-content-" + mainBoardNo).html();
		$("#share-textarea").after(boardContentHtml);
	});
	
	$("#shareModal").on('click', "[id^=share-board-add-button]", function(event) {
		$.ajax({
			url: "addShareBoard.do",
			data: {boardNo: $('#clicked-board-no').val(), userContents: $('#share-textarea').val(), openRange: $('#open-range').val()},
			dataType: 'text',
			success: function(result) {
				if (result == 'success') {
					$('#shareModal').modal('hide');
					alert('공유하기가 완료되었습니다.');
				} else {
					alert('공유하기가 실패했습니다.');
				}
			}
		});
	});
	
	$(".newpostfooter-contents").on('click', "[id^=replyButton-]", function() {
		 var boardNo = $(this).attr('id').replace('replyButton-','');
		 var html = "";
		 if ($('#commentTextareaDiv-'+boardNo).attr('style') == '') {
			 $('#commentTextareaDiv-'+boardNo).attr('style', 'display:none');
			 $('#commentListDiv-'+boardNo).children().remove();
		 } else {
		 $.ajax({
			url: "getBoardReplyByBoardNo.do",
			data: {boardNo: boardNo},
			dataType: 'json',
			success: function(replys) {
				$.each(replys, function(index, reply) {
					
					if (reply.reply.no == reply.reply.parentNo) {
						html += '<div class="commentpost" id="commentpost-replyList-'+boardNo+'">';
						html += '<div class="input-group" id="reply-input-group-'+reply.reply.no+'" style="width:100%">';
						html += '<div style="display:inline-block">';
						html +=	'<a href="profile.do?userNo='+reply.user.no+'">';
						html +=	'<img src="resources/image/'+reply.user.profile+'" style="width:40px;height:40px;border-radius:50%"/>';
						html +=	'</a>';
						html += '</div>';
						html +=	'<div class="well well-sm" style="display:inline-block; margin-bottom:0px;">';
						html += '<a href="profile.do?userNo='+reply.user.no+'">'+reply.user.name+'</a>';
						html += '<span style="margin-left:5px;">'+reply.reply.contents+'</span></div>';
						html += '<div style="display:inline-block;">';
						html += '<button type="button" class="btn btn-danger btn-xs" id="btn_reply_report_'+reply.reply.no+'">신고하기</button>';
						html += '</div>';
 						html += '<div class="commentpost col-md-offset-1" id="commentReplyTextareaDiv-'+reply.reply.no+'" style="display:none">';
 						html += '<div style="display:inline-block; vertical-align:middle; width:88%;">';
					    html += '<textarea class="form-control" placeholder="댓글을 입력해주세요" id="replyOfReplyContents-'+reply.reply.no+'"></textarea>';
					    html += '</div>';
					    html += '<div style="display:inline-block; vertical-align:middle;">';
					    html += '<a class="btn btn-primary btn-sm pull-right" id="addReplyOfReply-'+reply.reply.no+'">등록</a>';
					    html += '</div>';
						html += '</div>'; 
						html +=	'</div>';
						html += '</div>';	
						
					} else {
						html += '<div class="commentpost" id="commentpost-replyList-'+boardNo+'">';
						html += '<div class="input-group col-md-offset-1" id="reply-input-group-'+reply.reply.no+'" style="width:100%">';
						html += '<div style="display:inline-block;">';
						html +=	'<a href="profile.do?userNo='+reply.user.no+'">';
						html +=	'<img src="resources/image/'+reply.user.profile+'" style="width:40px;height:40px;border-radius:50%"/>';
						html += '</a>';
						html += '</div>';
						html +=	'<div class="well well-sm" style="display:inline-block;">'+reply.user.name+':'+reply.reply.contents+'</div>';
						html += '<div style="display:inline-block;">';
						html += '<button type="button" class="btn btn-danger btn-xs" id="btn_reply_report_'+reply.reply.no+'">신고하기</button>';
						html += '</div>';
						html +=	'</div>';
						html += '</div>';
					}
					
					
/*   				html += '<div class="commentpost" id="commentpost-replyList-'+boardNo+'">';
					html += '<div class="input-group" id="reply-input-group-'+reply.reply.no+'">';
					html +=	'<a href="profile.do?userNo='+reply.user.no+'">';
					html +=	'<img src="resources/image/'+reply.user.profile+'" />';
					html +=	'</a>';
					html +=	'<div class="well well-sm">'+reply.user.name+':'+reply.reply.contents+'</div>';
					html += '<a href="javascript:void(0)">';
					html += '<i class="fab fa-replyd" style="font-size:30px;" id="replyOfReply-'+reply.reply.no+'"></i>';
					html += '</a>';
					
					html += '<div class="commentpost col-md-offset-2" id="commentReplyTextareaDiv-'+reply.reply.no+'" style="display:none">';
				    html += '<a class="btn btn-primary btn-sm pull-right" id="addReplyOfReply-'+reply.reply.no+'">등록</a>';
				    html += '<textarea class="form-control" placeholder="댓글을 입력해주세요" id="replyOfReplyContents-'+reply.reply.no+'"></textarea>';
					html += '</div>';
					
					html +=	'</div>';
					html += '</div>'; 댓글 눌렀을때 일반댓글만가져오는 ajax*/
				});
				$('#commentTextareaDiv-'+boardNo).attr('style', '');
				$('#commentListDiv-'+boardNo).children().remove();
				$('#commentListDiv-'+boardNo).prepend(html);
			}
		 });
		 }
	});
	$('.commentpost').on('keypress','[id^=replyContents-]',function(event){
		var userno = $(this).attr('id').replace('replyContents-','');
		if (event.which == 13){
			$('#addReply-'+userno).click();
			return false;
		}
	});
	$(".commentpost").on('click', "[id^=addReply-]", function() {
		var boardNo = $(this).attr('id').replace('addReply-','');
		var html = "";
		$.ajax({
			url: "addReply.do",
			data: {boardNo: boardNo, contents:$('#replyContents-'+boardNo).val()},
			dataType: 'json',
			success: function(reply) {
				html += '<div class="commentpost" id="commentpost-replyList-'+boardNo+'">';
				html += '<div class="input-group" id="reply-input-group-'+reply.no+'" style="width:100%">';
				html += '<div style="display:inline-block;">';
				html +=	'<a href="profile.do?userNo='+reply.user.no+'">';
				html +=	'<img src="resources/image/'+reply.user.profile+'" style="width:40px;height:40px;border-radius:50%"/>';
				html +=	'</a>';
				html += '</div>';
				html +=	'<div class="well well-sm" style="display:inline-block; margin-bottom:0px;">';
				html += '<a href="profile.do?userNo='+reply.user.no+'">'+reply.user.name+'</a>';
				html += '<span style="margin-left:5px;">'+reply.contents+'</span></div>';
				html += '<div style="display:inline-block;">';
				html += '<button type="button" class="btn btn-danger btn-xs" id="btn_reply_report_'+reply.no+'">신고하기</button>';
				html += '</div>';
				html += '<div class="commentpost col-md-offset-2" id="commentReplyTextareaDiv-'+reply.no+'" style="display:none">';
				html += '<div style="display:inline-block; vertical-align:middle; width:88%;"';
			    html += '<textarea class="form-control" placeholder="댓글을 입력해주세요" id="replyOfReplyContents-'+reply.no+'"></textarea>';
			    html += '</div>';
			    html += '<div style="display:inline-block; vertical-align:middle;">';
			    html += '<a class="btn btn-primary btn-sm pull-right" id="addReplyOfReply-'+reply.no+'">등록</a>';
			    html += '</div>';
				html += '</div>';
				html +=	'</div>';
				html += '</div>';
				$('#commentListDiv-'+boardNo).append(html);
				$('#replyContents-'+boardNo).val('');
				
				$.ajax({
					url: "updateRepCount.do",
					data: {boardNo: boardNo},
					dataType: 'json',
					success: function(board) {
						console.log(board);
						$('#boardRepCount-'+boardNo).text(board.repCount)
					}
				});
			}
		});
	});
	
	$(".recentcontainer").on('click', "[id^=replyOfReply-]", function() {
		var replyNo = $(this).attr('id').replace('replyOfReply-','');
		$('#commentReplyTextareaDiv-'+replyNo).attr('style', '');
/* 		 $.ajax({
				url: "getReplyOfReplyByReplyNo.do",
				data: {replyNo: replyNo},
				dataType: 'json',
				success: function(replys) {
						html += '<div id="replyOfReplyListDiv-'+replyNo+'">';
					$.each(replys, function(index, reply) {
						
						html += '<div class="commentpost col-md-offset-2" id="commentpost-replyOfReplyList-'+replyNo+'">';
						html += '<div class="input-group" id="reply-input-group-'+reply.no+'">';
						html +=	'<a href="profile.do?userNo='+reply.user.no+'">';
						html +=	'<img src="resources/image/'+reply.user.profile+'" />';
						html +=	'</a>';
						html +=	'<div class="well well-sm">'+reply.user.name+':'+reply.contents+'</div>';
						html +=	'</div>';
						html += '</div>';	
					});
						html += '</div>';
					
					$('#replyOfReplyListDiv-'+replyNo).remove();
					$('#commentReplyTextareaDiv-'+replyNo).attr('style', '');
					$('#commentReplyTextareaDiv-'+replyNo).before(html);
					
				}
		});	 대댓글 눌렀을때 ajax*/
	});
	
	$(".recentcontainer").on('click', "[id^=addReplyOfReply-]", function() {
		var boardNo = $(this).parent().parent().parent().attr('id').replace('commentpost-replyList-', '');
		var parentReplyNo = $(this).attr('id').replace('addReplyOfReply-','');
		var html = "";
		 $.ajax({
				url: "addReplyOfReply.do",
				data: {boardNo: boardNo, parentReplyNo: parentReplyNo, contents:$('#replyOfReplyContents-'+parentReplyNo).val()},
				dataType: 'json',
				success: function(reply) {
					html += '<div class="commentpost col-md-offset-2" id="commentpost-replyOfReplyList-'+parentReplyNo+'">';
					html += '<div class="input-group" id="reply-input-group-'+reply.no+'">';
					html +=	'<a href="profile.do?userNo='+reply.user.no+'">';
					html +=	'<img src="resources/image/'+reply.user.profile+'" />';
					html +=	'</a>';
					html += '<button type="button" class="btn btn-danger btn-xs" id="btn_reply_report_'+reply.no+'">신고하기</button>';
					html +=	'<div class="well well-sm">'+reply.user.name+':'+reply.contents+'</div>';
					html +=	'</div>';
					html += '</div>';				
					$('#commentReplyTextareaDiv-'+parentReplyNo).before(html);
					$('#replyOfReplyContents-'+parentReplyNo).val('');
					
					$.ajax({
						url: "updateRepCount.do",
						data: {boardNo: boardNo},
						dataType: 'json',
						success: function(board) {
							console.log(board);
							$('#boardRepCount-'+boardNo).text(board.repCount)
						}
					});
				}
		});	 
	});
	$("#boardModal").on('click', "#board-add-button", function(){
		$("#board-form").submit();
	})

	$("textarea").on('keyup keydown', function() {
		$(this).height(1).height( $(this).prop('scrollHeight') + 12 );
	});
	
	
	$("#boardModal").on('hide.bs.modal', function() {
		$(".tag-space").children().remove();
	})
	
	$("[id^=commentListDiv-]").on('click','[id^=btn_reply_report_]',function(){
		var id = $(this).attr('id').substring(17);
		
		var acuNo = ${loginUser.no};

		$.ajax({
			type:"POST",
			url:"report",
			data:{ihrNo:id, type:"sub", acuNo:acuNo},
			success:function(data){
				$("#btn_reply_report_"+id).addClass('hidden');
				
			}
			
		});
		
	})
});
</script>