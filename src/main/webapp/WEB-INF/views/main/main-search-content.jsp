<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="recentcontainer">
                    <div class="newpost" style="display:none;">

                    </div>
                    <div class="newpostfooter" style="display:none;"> 
                      
                    </div>
                  </div>
	                  <div class="recentcontainer">
	                  	<div class="newpostheader">
	                  		<span style="margin-left:10px;top:2px;">유저</span>
	                  	</div>
	                  	
	                  	<div class="newpost">
	                  	</div>
	                 <c:choose>
		                 <c:when test="${empty searchUser }">
		                 	<div class="newpostfooter" style="height:200px;">
		                  		<div class="newpostfooter-contents" style="vertical-align: middle;line-height: 200px;">
										<span style="font-size:18px;">검색에 해당하는 인물이 없습니다.</span>
		                        </div>
		                  	</div>
		                 </c:when>
		                 
		                <c:otherwise>
		                  	<c:forEach items="${searchUser }" var="user">
		                  	<div class="newpostfooter">
		                  		<div class="newpostfooter-contents">
									<a href="profile.do?userNo=${user.no }">
										<img src="resources/image/${user.profile }" style="border-radius:50%">
									</a>
									<a href="profile.do?userNo=${user.no }" title="Leave a comment">
										<span class="">${user.name }</span>
									</a>
									<a id="shareButton-${user.no }" href="#" title="Send this to friends or post it to your timeline" data-toggle="modal" data-target="#shareModal">
										<span></span>
									</a>
		                        </div>
		                  	</div>
		                  	</c:forEach>
		                </c:otherwise>
	                 </c:choose>
	                  </div>
	                  
	                  <div class="recentcontainer">
	                  	<div class="newpostheader">
	                  		<span style="margin-left:10px;top:2px;">페이지</span>
	                  	</div>
	                  	
	                  	<div class="newpost">
	                  	
	                  	</div>
	                 <c:choose>
	                 	<c:when test="${empty searchPage }">
		                  	<div class="newpostfooter" style="height:200px;">
		                  		<div class="newpostfooter-contents" style="vertical-align: middle;line-height: 200px;">
										<span style="font-size:18px;">검색에 해당하는 페이지가 없습니다.</span>
		                        </div>
		                  	</div>	                 		
	                 	</c:when>
	                 	
	                 	<c:otherwise>
		                  	<c:forEach items="${searchPage }" var="page">
		                  	<div class="newpostfooter">
		                  		<div class="newpostfooter-contents">
									<a href="javascript:void(0)">
										<img src="resources/image/${page.profile }"  style="border-radius:50%">
									</a>
									<a href="pageProfile.do?userNo=${page.parentNo }" title="Leave a comment">
										<span>${page.pageName }</span>
									</a>
									<a id="shareButton-${page.no }" href="#" title="Send this to friends or post it to your timeline" data-toggle="modal" data-target="#shareModal">
										<span></span>
									</a>
		                        </div>
		                  	</div>
		                  	</c:forEach>
	                 	</c:otherwise>
	                 </c:choose>
	                  </div>
	              
	              <c:choose>
	              	    <c:when test="${empty searchBoard }">
			                  <div class="recentcontainer">
			                  	<div class="newpostheader">
			                  		<span style="margin-left:10px;top:2px;">게시글</span>
			                  	</div>
			                  	
			                  	<div class="newpost">
			                  	</div>
				                 	<div class="newpostfooter" style="height:200px;">
		                  		<div class="newpostfooter-contents" style="vertical-align: middle;line-height: 200px;">
												<span style="font-size:18px;">검색에 해당하는 게시글이 없습니다.</span>
				                        </div>
				                  	</div>
			                  </div>                		
	                 	</c:when>
	              
	              	<c:otherwise>
	                  <c:forEach var="board" items="${searchBoard}">
		                  <div class="recentcontainer">
		                    <div class="newpostheader">
		                      <a href="profile.do?userNo=${board.user.no }">
		                        <img src="resources/image/${board.user.profile }" style="border-radius:50%" />
		                        <span class="name">${board.user.name }</span>
		                      </a>
		                      <p>
		                        <a class="date" href="javascript:void(0)">${board.passedTime }</a>
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
		                      <div class="postcontent" id="post-board-content-${board.no }">
		                      	<div style="margin-left:10px;margin-top:10px;">
		                        	${board.contents }
		                        </div>
		                        <div style="height:40px;">
	                        	<div style="margin-left:10px;margin-top:10px;">
		                        	<c:forEach var="tag" items="${board.tags }">
		                        		<c:if test="${tag.contents ne null}">
			                        		<a href="profile.do?userNo=${board.user.no }" style="text-decoration: none;">${tag.contents }</a>
		                        		</c:if>
		                        	</c:forEach>
		                        	<c:if test="${not empty board.tags }">
		                        		과 함께
		                        	</c:if>
		                        	</div>
		                        </div>
		                        <div>
	                      		<c:if test="${not empty board.boardMedias}">
			         	  	             	<c:forEach var="mainBoardMedia" items="${board.boardMedias }">
				                        		<img src="resources/image/${mainBoardMedia.name }" style="width:535px; height:350px;">
			                  		      	</c:forEach>
			                        	</c:if>
			                        </div>
		                      </div>
		                      <c:if test="${board.share.no ne null }">
		                      <div class="postcontent">
		                      	<%@ include file="main-share-content.jsp" %>
		                      </div>
		                  </c:if>
		                    </div>
		                     <div class="community-counter">
		                        <a href="javascript:void(0)" id="likeCount-${board.no }"data-toggle='tooltip' data-placement='top' data-html=true;>
		                          <i class="fa fa-thumbs-up"></i>
		                          <span id="likeCountInfo-${board.no} ">${board.like }</span>
		                        </a>
		                        <a href="javascript:void(0)" id="replyCount-${board.no }" data-toggle='tooltip' data-placement='top' data-html=true;>
		                          <i class="far fa-comment-alt"></i>
		                          <span id="boardRepCount-${board.no }">${board.repCount }</span>
		                        </a>
		                    </div>
		                    <div class="newpostfooter">
		                       <div class="newpostfooter-contents">
		                       <!-- 좋아요를 눌렀는지아닌지에대한 choose -->
			                        <a href="javascript:void(0)" id="likeBoardButton-${board.no }" style="color:${board.event.user.no eq null ? '' : 'Dodgerblue' }">
			                          <label class="board-label"><i class="fa fa-thumbs-up"></i>좋아요</label>
			                        </a>	                       	
		                        <a href="javascript:void(0)" id="replyButton-${board.no }">
		                          <label class="board-label"><i class="far fa-comment-alt"></i>댓글달기</label>
		                        </a>
		                        <a id="shareButton-${board.no }" href="#" data-toggle="modal" data-target="#shareModal">
		                          <label class="board-label"><i class="fa fa-share"></i>공유하기</label>
		                        </a>
		                        </div>
		                      </div>
		                      <div id="commentListDiv-${board.no }">
		                      
		                      </div>
		                      
								<div class="commentpost" id="commentTextareaDiv-${board.no }" style="display:none">
								     <div class="input-group" style="width:100%">
								     	<div style="display:inline-block">
									       <a href="profileOpen.do?userNo=${board.user.no }">
									         <img src="resources/image/${loginUser.profile }" style="width:40px;height:40px;border-radius:50%"/>
									       </a>
								       </div>
								       <div style="display:inline-block; vertical-align:middle; width:75%;">
								       <textarea class="form-control" placeholder="댓글을 입력해주세요" id="replyContents-${board.no}" style="height:35px;"></textarea>
								       </div>
								       <div style="display:inline-block; vertical-align:middle;">
								       <a class="btn btn-primary btn-sm pull-right" id="addReply-${board.no }">등록</a>
								       </div>
								      </div>
								</div>
		                  </div>
	                  </c:forEach>
	              	</c:otherwise>
	              </c:choose>
	              
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
						          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						          <a class="btn btn-primary" id="share-board-add-button">게시</a>
						        </div>
				    	</div>
				    </div>
				</div>
<script type="text/javascript">
$(function() {
	$('[data-toggle="tooltip"]').tooltip();
	//좋아요 카운트에 이벤트 발생자 정보 툴팁
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
	
/*  	$("#textArea").keydown(function(event) {
		if (event.which == 32) {
			var text = $('#textArea').val();
			$('#boardModalTextAreas').wrap('<a href="asdasdasd.do"></a>');
		}
	});  게시글작성시 태그 임시코드*/
	
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
