<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>

	<title></title>
  	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">  	
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
  	
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<link type="text/css" rel="stylesheet" href="resources/css/topbar.css?ver=<%=new Date()%>" />
  	<link type="text/css" rel="stylesheet" href="resources/css/main-content.css?ver=<%=new Date()%>" />
  	<link type="text/css" rel="stylesheet" href="resources/css/left.css?ver=<%=new Date()%>" />
  	<link type="text/css" rel="stylesheet" href="resources/css/thirdcol.css?ver=<%=new Date()%>" />
  	<link type="text/css" rel="stylesheet" href="resources/css/right.css?ver=<%=new Date()%>"/>
  	
</head>
<body>
	<%@ include file="topbar.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-md-6 main-content" style="margin-left:200px;">
					<div class="recentcontainer">

					  </div>
	                  <div class="recentcontainer">
	                    <div class="newpostheader">
	                      <a href="profile.do?userNo=${allimSelect.user.no }">
	                        <img src="resources/image/${allimSelect.user.profile }" />
	                        <span class="name">${allimSelect.user.name }</span>
	                      </a>
				           <c:if test="${allimSelect.share.no ne null}">
								<span>님이
								<a href="#">게시물</a>
					                 을 공유했습니다.</span>
				           </c:if>
	                      <p>
	                        <a class="date" href="javascript:void(0)">${allimSelect.passedTime }</a>
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
	                      <div class="postcontent" id="post-board-content-${allimSelect.no }">
	                      	<div>
	                        	<p>${allimSelect.contents }</p>
	                        </div>
	                        <div style="height:40px;">
	                        	<div>
	                        	<c:forEach var="tag" items="${allimSelect.tags }">
	                        		<c:if test="${tag.contents ne null}">
		                        		<a href="profile.do?userNo=${allimSelect.user.no }" style="text-decoration: none;">${tag.contents }</a>
	                        		</c:if>
	                        	</c:forEach>
	                        	<c:if test="${not empty allimSelect.tags }">
	                        		과 함께
	                        	</c:if>
	                        	</div>
	                        </div>
	                        <div>
	                      		<c:if test="${not empty allimSelect.boardMedias}">
	         	  	             	<c:forEach var="mainBoardMedia" items="${allimSelect.boardMedias }">
		                        		<img src="resources/image/${mainBoardMedia.name }" style="width:535px; height:350px;">
	                  		      	</c:forEach>
	                        	</c:if>
	                        </div>
	                      </div>
		                 <c:if test="${allimSelect.share.no ne null }">
		                      <div class="postcontent">
									<div class="recentcontainer" style="border:1px solid gray">
										<div class="newpostheader">
											<a href="javascript:void(0)">
												<img src="resources/image/${allimSelect.share.user.profile }" />
												<span class="name">${allimSelect.share.user.name }</span>
											</a>
											<p>
												<a class="date" href="javascript:void(0)">${allimSelect.share.passedTime }</a>
												<a href="javascript:void(0)"><i class="fa fa-globe"></i></a>
											</p>
										</div>
									    <div class="newpost">
									    	<div class="postcontent">
									        	<p>${allimSelect.share.contents }</p>
										        <div>
											        <c:if test="${not empty allimSelect.share.boardMedias}">
											        	<c:forEach var="shareMedia" items="${allimSelect.share.boardMedias }">
											        		<img src="resources/image/${shareMedia.name}" style="width:513px; height:350px;"/>
											        	</c:forEach>
											        </c:if>
										    	</div>
											</div>
										</div>
									</div>		                      	
		                      </div>
		                  </c:if>
	                    </div>
		                     <div class="community-counter">
		                        <a href="javascript:void(0)" id="likeCount-${allimSelect.no }" data-toggle='tooltip' data-placement='top' data-html=true;>
		                          <i class="fa fa-thumbs-up"></i>
		                          <span id="likeCountInfo-${allimSelect.no} ">${allimSelect.like }</span>
		                        </a>
		                        <a href="javascript:void(0)" id="replyCount-${allimSelect.no }" data-toggle='tooltip' data-placement='top' data-html=true;>
		                          <i class="far fa-comment-alt"></i>
		                          <span id="boardRepCount-${allimSelect.no }">${allimSelect.repCount }</span>
		                        </a>
		                    </div>
		                    <div class="newpostfooter">
		                       <div class="newpostfooter-contents">
		                       <!-- 좋아요를 눌렀는지아닌지에대한 choose -->
			                        <a href="javascript:void(0)" id="likeBoardButton-${allimSelect.no }" style="color:${allimSelect.event.user.no eq null ? '' : 'Dodgerblue' }">
			                          <label class="board-label"><i class="fa fa-thumbs-up"></i>좋아요</label>
			                        </a>
		                        <a href="javascript:void(0)" id="replyButton-${allimSelect.no }">
		                          <label class="board-label"><i class="far fa-comment-alt"></i>댓글달기</label>
		                        </a>
		                        <a id="shareButton-${allimSelect.no }" href="#" data-toggle="modal" data-target="#shareModal">
		                          <label class="board-label"><i class="fa fa-share"></i>공유하기</label>
		                        </a>
		                        </div>
		                      </div>
		                      <div id="commentListDiv-${allimSelect.no }">
		                      
		                      </div>
		                      
								<div class="commentpost" id="commentTextareaDiv-${mainBoard.no }" style="display:none">
								     <div class="input-group" style="width:100%">
								     	<div style="display:inline-block">
									       <a href="profileOpen.do?userNo=${mainBoard.user.no }">
									         <img src="resources/image/${loginUser.profile }" style="width:40px;height:40px;border-radius:50%"/>
									       </a>
								       </div>
								       <div style="display:inline-block; vertical-align:middle; width:75%;">
								       <textarea class="form-control" placeholder="댓글을 입력해주세요" id="replyContents-${mainBoard.no}" style="height:58px;"></textarea>
								       </div>
								       <div style="display:none; vertical-align:middle;">
								       <a class="btn btn-primary btn-sm pull-right" id="addReply-${mainBoard.no }">등록</a>
								       </div>
								      </div>
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
			</div>
			
        </div>
    </div>
</body>

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
	
	function readImgURL(input) {
		if(input.files && input.files[0]){
			var reader = new FileReader();
			
			reader.onload = function(e) {
				$('#board-img').attr('src',e.target.result).css('width','200px').css('height','200px');
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
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

	$("textarea").on('keyup keydown', function() {
		$(this).height(1).height( $(this).prop('scrollHeight') + 12 );
	});
	
	
	$("#boardModal").on('hide.bs.modal', function() {
		$(".tag-space").children().remove();
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
				
				html += "<span id='likeCountInfo-"+boardNo+"'>"+result.like+"</span>";
				$("#likeCount-"+boardNo).append(html);
			}
		});
	});
	
	$(".newpostfooter").on('click', "[id^=replyButton-]", function() {
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
 						html += '<div style="display:inline-block; vertical-align:middle; width:75%;">';
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
				html += '<div style="display:inline-block;">';
				html += '<button type="button" class="btn btn-danger btn-xs" id="btn_reply_report_'+reply.no+'">신고하기</button>';
				html += '</div>';
				html +=	'<div class="well well-sm" style="display:inline-block; margin-bottom:0px;">';
				html += '<a href="profile.do?userNo='+reply.user.no+'">'+reply.user.name+'</a>';
				html += '<span style="margin-left:5px;">'+reply.contents+'</span></div>';
				html += '<div class="commentpost col-md-offset-2" id="commentReplyTextareaDiv-'+reply.no+'" style="display:none">';
				html += '<div style="display:inline-block; vertical-align:middle; width:75%;"';
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
</html>