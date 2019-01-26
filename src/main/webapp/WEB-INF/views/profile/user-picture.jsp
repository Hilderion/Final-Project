<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 내 사진 모달 -->
<div id="viewPicture" class="modal fade" role="dialog">
	<div class="modal-dialog modal-lg" style="width:70%">
		<div class="modal-content">
			<div class="col-xs-8">
			<div class="modal-header">
				<h4 class="modal-title">내 사진</h4>
			</div>
				<div class="modal-body">
					<div id="carousel-picture" class="carousel slide" data-ride="carousel" data-interval="false">
						<div class="carousel-inner">
							<c:forEach var="medias" items="${boardInfo }">
								<div class="item" id="item-${medias.no }">
									<img src="resources/image/${medias.name }" style="width: 100%; height: 600px;">
								</div>
								<a id="myPic" class="left carousel-control" href="#carousel-picture" role="button" data-slide="prev"> 
									<span class='glyphicon glyphicon-chevron-left'></span>
								</a> 
								<a id="myPic" class='right carousel-control' href='#carousel-picture' role='button' data-slide='next'> 
									<span class='glyphicon glyphicon-chevron-right'></span>
								</a>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-4">
				<button type="button" class="close" data-dismiss="modal" style="position: relative; margin-top: 10px;">&times;</button>
				<div id="information">
					
				</div> 
			</div>
			<div class="modal-footer">
				
			</div>
		</div>
	</div>
</div>

<!-- 내가 태그된 사진 모달 -->
<div id="viewTagPicture" class="modal fade" role="dialog">
	<div class="modal-dialog modal-lg" style="width:70%">
		<div class="modal-content">
			<div class="col-xs-8">
			<div class="modal-header">
				<h4 class="modal-title">내가 태그된 사진</h4>
			</div>
				<div class="modal-body">
					<div id="tag-picture" class="carousel slide" data-ride="carousel" data-interval="false">
						<div class="carousel-inner">
							<c:forEach var="tag" items="${tags }">
								<div class="item" id="tag-${tag.board.no }">
									<img src="resources/image/${tag.name }" style="width:100%; height: 600px;">
								</div>
								<a id="tagPic" class="left carousel-control" href="#tag-picture" data-slide="prev">
		    						<span class="glyphicon glyphicon-chevron-left"></span>
		    						<span class="sr-only">Previous</span>
		  						</a>
		  						<a id="tagPic" class="right carousel-control" href="#tag-picture" data-slide="next">
		   							 <span class="glyphicon glyphicon-chevron-right"></span>
		    						 <span class="sr-only">Next</span>
		  						</a>
  							</c:forEach>	
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-4">
				<button type="button" class="close" data-dismiss="modal" style="position: relative; margin-top: 10px;">&times;</button>
				<div id="Taginformation">
					
				</div> 
			</div>
			<div class="modal-footer">
				
			</div>
		</div>
	</div>
</div>

<!-- 내 사진쪽  -->
<div class="row">
	<div class="col-lg-10 cont-tab">
		<div class="row border margin20 marginLR0">
			<div class="col-lg-8 lg-8">
				<div class="detail-info">
					<i class="far fa-images"></i> 사진
					<div class="picture-menu">
						<ul>
							<li>
								<input type="hidden" id="userNo" value="${user.no }" />
								<a href="javascript:void(0)" id="tagPictures">회원님이 나온 사진</a>
							</li>		
							<li><a href="">내 사진</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="pic" class="row cont-box border marginLR0">
			<div class="col-lg-12 lg-12 padding10">
				<c:if test="${not empty boardInfo }">
					<c:forEach var="boardInfo" items="${boardInfo }">
					  <span class="picture-info-img"> <a href="" data-toggle="modal" data-target="#viewPicture"> 
						  <img id="imgNo-${boardInfo.no }" src="resources/image/${boardInfo.name}" class="border"></a>
					  </span>
					</c:forEach>
				</c:if>
				<c:if test="${empty boardInfo }">
					<div>
						<p style="text-align: center; margin-top: 30px;">등록된 사진이 없습니다</p>
					</div>
				</c:if>

			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	// 내가 올린 사진
	$('#carousel-picture').on('slide.bs.carousel', function (event) {
		var el = event.relatedTarget;
		var id = $(el).attr('id').replace("item-","");
			$.ajax({
				url: "addInformation",
				data: {id:id},
				dataType: 'json',
				success: function(result) {
					var content = "";
							  content += '<div class="recentcontainer">';
							  content +=  '</div>';
						      content += '<div class="container">';
							  content += '<div class="row">';
							  content += '<div class="col-xs-4 main-content">';
							  content += '<div class="recentcontainer">';
							  content += '</div>';
							  content +=  '<div class="recentcontainer">';
							  content +=  '<div class="newpostheader">';
							  content +=  '<a href="profile.do?userNo='+result.user.no+'">';
							  content += '<img src="resources/image/'+result.user.profile+'" />';
							  content += '                    <span class="name">'+result.user.name+'</span>';
							  content += '                  </a>';
/* 							  content += '         <c:if test="${allimSelect.share.no ne null}">';
							  content += '														<span>님이';
							  content +=	'						<a href="#">게시물</a>';
							  content += 	'		                 을 공유했습니다.</span>';
							content +=			  '         </c:if>'; */
							   content +=                  ' <p>';
							    content +=   '<a class="date" href="javascript:void(0)">'+result.board.passedTime+'</a>';
							   content +=                   '  <a href="javascript:void(0)">';
							    content +=                     ' <i class="fa fa-globe"></i>';
							    content +=                   ' </a>';
							    content += '                 <div class="rightsideofpost">';
							     content +=  '                  <a class="personpostmenu" href="javascript:void(0)">';
							     content += '                    <i class="fa fa-caret-down"></i>';
							     content +=         ' </a>';
							     content +=     '            </div>';
							      content +=          '  </div>';
							      content +=            ' <div class="newpost">';
							      content +=              '  <div class="postcontent" id="post-board-content-'+result.board.no+'">';
							       content +=               	'<div>';
							      content +=                 	'<p>'+result.board.contents+'</p>';
							      content  +=                 '</div>';
							      content  +=                 '<div style="height:40px;">';
							      content  +=                	'<div style="margin-left:10px;margin-top:10px;">';
    								$.each(result.tags, function(index, tag){
							    									if('null' != tag.contents){
								   	content +=                   '<a href="profile.do?userNo='+tag.user.no+'" style="text-decoration: none;">'+tag.contents+'</a>';
							    									}
							    								})
							    								if(undefined != result.tags[0]){
							     content +=                 		'과 함께';
							    								}
							     content +=                 	'</div>';
							     content +=                 '</div>';
							     content +=                ' <div>';
/* 							        content +=              		'<c:if test="${not empty allimSelect.boardMedias}">';
							       content  +=	  	             	'<c:forEach var="mainBoardMedia" items="${allimSelect.boardMedias }">';
								    content +=                    	'<img src="resources/image/${mainBoardMedia.name }" style="width:535px; height:350px;">';
							         content +=         		      	'</c:forEach>';
							         content +=               	'</c:if>'; */
							         content +=              ' </div>';
							          content +=           ' </div>';
/* 								      content +=          ' <c:if test="${allimSelect.share.no ne null }">';
								         content  +=            '<div class="postcontent">';
											content +=				'<div class="recentcontainer" style="border:1px solid gray">';
											content += 					'<div class="newpostheader">';
											content +=						'<a href="javascript:void(0)">';
											content +=		'<img src="resources/image/${allimSelect.share.user.profile }" />';
											content +=			'<span class="name">${allimSelect.share.user.name }</span>';
											content +=		'</a>';
											content +=		'<p>';
											content +=	'<a class="date" href="javascript:void(0)">${allimSelect.share.passedTime }</a>';
											content += '<a href="javascript:void(0)"><i class="fa fa-globe"></i></a>';
											content +=	'</p>';
											content +=	'</div>';
											content += ' <div class="newpost">';
											content	+= '<div class="postcontent">';
											content +=	'<p>${allimSelect.share.contents }</p>';
											content +=	 '<div>';
 											content +=		   '<c:if test="${not empty allimSelect.share.boardMedias}">';
											content +=						    ' <c:forEach var="shareMedia" items="${allimSelect.share.boardMedias }">'
											content +=	 		'<img src="resources/image/${shareMedia.name}" style="width:513px; height:350px;"/>';
											content +=	'</c:forEach>';
											content +=	'</c:if>';  */
											content += 	'</div>'
											content += '</div>';
											content += '</div>';
											content +=	'</div>';
								            content +=   '</div>';
								     /*        content +=   ' </c:if>'; */
							                content +=  '</div>';
						                  content +=  '<div class="community-counter">';
					                      content +=  '<a href="javascript:void(0)" id="likeCount-'+result.board.no+'" data-toggle="tooltip" data-placement="top" data-html=true;>';
					                        content += '<i class="fa fa-thumbs-up"></i>';
					                       content +=   '<span id="likeCountInfo-'+result.board.no+' ">'+result.board.like+'</span>';
					                        content += '</a>';
					                       content += '<a href="javascript:void(0)" id="replyCount-'+result.board.no+'" data-toggle="tooltip" data-placement="top" data-html=true;>';
					                       content += ' <i class="far fa-comment-alt"></i>';
					                       content +=   '<span id="boardRepCount-'+result.board.no+'">'+result.board.repCount+'</span>';
					                       content += '</a>';
					                  content += ' </div>';
					                 content +=  '<div class="newpostfooter">';
					                 content +=     ' <div class="newpostfooter-contents">';
					                 content +=   '   <!-- 좋아요를 눌렀는지아닌지에대한 choose -->';
					                 content += ' <a href="javascript:void(0)" id="likeBoardButton-'+result.board.no+'" style="color: ';
				             			if(undefined == result.board.event ){
				             				content += '">';
				             			} else {
				             				content += 'Dodgerblue">';
				             			}
						              content +=  ' <label class="board-label"><i class="fa fa-thumbs-up"></i>좋아요</label>';
						                content +=     '   </a>';
					                content +=       ' <a href="javascript:void(0)" id="replyButton-'+result.board.no+'">';
					                    content +=      '<label class="board-label"><i class="far fa-comment-alt"></i>댓글달기</label>';
					                  content +=      '</a>';
					                  content +=     ' <a id="shareButton-'+result.board.no+'" href="#" data-toggle="modal" data-target="#shareModal">';
					                 content +=        ' <label class="board-label"><i class="fa fa-share"></i>공유하기</label>';
					                  content +=     ' </a>';
					                  content +=     ' </div>';
					                  content +=    '</div>';
					                  content +=  '  <div id="commentListDiv-'+result.board.no+'">';
					                  content +=    '</div>';
					                  
									content +=		'<div class="commentpost" id="commentTextareaDiv-'+result.board.no+'" style="display:none">';
									content +=		     '<div class="input-group" style="width:100%">';
									content += 				'<div style="display:inline-block">';
									content +=	 			 '  <a href="profileOpen.do?userNo='+result.user.no+'">';
									content +=				        ' <img src="resources/image/'+result.user.profile+'" style="width:40px;height:40px;border-radius:50%"/>';
									content +=			       '</a>';
									content +=  		 ' </div>';
									content +=				'<div style="display:inline-block; vertical-align:middle; width:75%">'
									content +=		    '   <textarea class="form-control" placeholder="댓글을 입력해주세요" id="replyContents-'+result.board.no+'" style="height:58px;"></textarea>';
									content +=   			'</div>';
									content += 				'<div style="display:none; vertical-align:middle;">';
									content +=		       '<a class="btn btn-primary btn-sm pull-right" id="addReply-'+result.board.no+'">등록</a>';
									content += 				'</div>';
									content +=		'</div>'; 
									content += '</div>';
					
									content += 	'				<div class="modal fade" id="shareModal" role="dialog">';
									content +=				'	<div class="modal-dialog">'
									content +=				      '	<div class="modal-content">';
									content +=				      ' 	<div class="modal-header">';
									content +=				       '   		<button type="button" class="close" data-dismiss="modal">&times;</button>'
									content +=				    '      		<select id="open-range">';
									content +=				        ' 			<option value="onlyme"> 나만보기</option>';
									content +=				        '  			<option value="all"> 모두</option>';
									content +=				     '    			<option value="onlyfriend"> 친구만</option>';
									content +=				     '     		</select>';
									content +=				      '  	</div>';
									content +=				      '  		<input type="hidden" id="clicked-board-no" />';
									content +=						    '    <div class="modal-body">';
									content +=	          '            			<div class="postcontent" id="modal-board-content">';
									content +=					'	<textarea class="form-control" rows="5" id="share-textarea" placeholder="하고싶은 말을 남겨주세요...." name="user-contents"></textarea>';
									content +=	                   '</div>';
									content +=					'        </div>';
									content +=						  '      <div class="modal-footer">';
									content +=				  '   <button type="button" class="btn btn-warning" data-dismiss="modal">취소</button>';
									content +=						  '        <a class="btn btn-default" id="share-board-add-button">게시</a>';
									content +=					'	        </div>';
									content +=				   ' 	</div>'
									content +=				   ' </div>';
									content +=				'</div>';			
									content +=			'</div>';
									 content +=      ' </div>';
									 content +=   '</div>';
					$("#information").html(content);
					
				}
			})
			
		});
	
	
	
	$('#viewPicture').on('hidden.bs.modal', function (e) {
		$(".carousel-inner .item").removeClass("active");
	});

	$("[id^=imgNo]").click(function() {
		var id = $(this).attr('id').replace("imgNo-", "");
		$("#item-" + id).addClass("active");
		$.ajax({
			url: "addInformation",
			data: {id:id},
			dataType: 'json',
			success: function(result) {
				var content = "";
				  content += '<div class="recentcontainer">';
				  content +=  '</div>';
			      content += '<div class="container">';
				  content += '<div class="row">';
				  content += '<div class="col-xs-4 main-content">';
				  content += '<div class="recentcontainer">';
				  content += '</div>';
				  content +=  '<div class="recentcontainer">';
				  content +=  '<div class="newpostheader">';
				  content +=  '<a href="profile.do?userNo='+result.user.no+'">';
				  content += '<img src="resources/image/'+result.user.profile+'" />';
				  content += '                    <span class="name">'+result.user.name+'</span>';
				  content += '                  </a>';
/* 							  content += '         <c:if test="${allimSelect.share.no ne null}">';
				  content += '														<span>님이';
				  content +=	'						<a href="#">게시물</a>';
				  content += 	'		                 을 공유했습니다.</span>';
				content +=			  '         </c:if>'; */
				   content +=                  ' <p>';
				    content +=   '<a class="date" href="javascript:void(0)">'+result.board.passedTime+'</a>';
				   content +=                   '  <a href="javascript:void(0)">';
				    content +=                     ' <i class="fa fa-globe"></i>';
				    content +=                   ' </a>';
				    content += '                 <div class="rightsideofpost">';
				     content +=  '                  <a class="personpostmenu" href="javascript:void(0)">';
				     content += '                    <i class="fa fa-caret-down"></i>';
				     content +=         ' </a>';
				     content +=     '            </div>';
				      content +=          '  </div>';
				      content +=            ' <div class="newpost">';
				      content +=              '  <div class="postcontent" id="post-board-content-'+result.board.no+'">';
				       content +=               	'<div>';
				      content +=                 	'<p>'+result.board.contents+'</p>';
				      content  +=                 '</div>';
				      content  +=                 '<div style="height:40px;">';
				      content  +=                	'<div style="margin-left:10px;margin-top:10px;">';
				      								$.each(result.tags, function(index, tag){
				      									if('null' != tag.contents){
					   content +=                   '<a href="profile.do?userNo='+tag.user.no+'" style="text-decoration: none;">'+tag.contents+'</a>';
				      									}
				      								})
				      								if(undefined != result.tags[0]){
				       content +=                 		'과 함께';
				      								}
				       content +=                 	'</div>';
				       content +=                 '</div>';
				       content +=                ' <div>';
/* 							        content +=              		'<c:if test="${not empty allimSelect.boardMedias}">';
				       content  +=	  	             	'<c:forEach var="mainBoardMedia" items="${allimSelect.boardMedias }">';
					    content +=                    	'<img src="resources/image/${mainBoardMedia.name }" style="width:535px; height:350px;">';
				         content +=         		      	'</c:forEach>';
				         content +=               	'</c:if>'; */
				         content +=              ' </div>';
				          content +=           ' </div>';
/* 								      content +=          ' <c:if test="${allimSelect.share.no ne null }">';
					         content  +=            '<div class="postcontent">';
								content +=				'<div class="recentcontainer" style="border:1px solid gray">';
								content += 					'<div class="newpostheader">';
								content +=						'<a href="javascript:void(0)">';
								content +=		'<img src="resources/image/${allimSelect.share.user.profile }" />';
								content +=			'<span class="name">${allimSelect.share.user.name }</span>';
								content +=		'</a>';
								content +=		'<p>';
								content +=	'<a class="date" href="javascript:void(0)">${allimSelect.share.passedTime }</a>';
								content += '<a href="javascript:void(0)"><i class="fa fa-globe"></i></a>';
								content +=	'</p>';
								content +=	'</div>';
								content += ' <div class="newpost">';
								content	+= '<div class="postcontent">';
								content +=	'<p>${allimSelect.share.contents }</p>';
								content +=	 '<div>';
									content +=		   '<c:if test="${not empty allimSelect.share.boardMedias}">';
								content +=						    ' <c:forEach var="shareMedia" items="${allimSelect.share.boardMedias }">'
								content +=	 		'<img src="resources/image/${shareMedia.name}" style="width:513px; height:350px;"/>';
								content +=	'</c:forEach>';
								content +=	'</c:if>';  */
								content += 	'</div>'
								content += '</div>';
								content += '</div>';
								content +=	'</div>';
					            content +=   '</div>';
					     /*        content +=   ' </c:if>'; */
				                content +=  '</div>';
			                  content +=  '<div class="community-counter">';
		                      content +=  '<a href="javascript:void(0)" id="likeCount-'+result.board.no+'" data-toggle="tooltip" data-placement="top" data-html=true;>';
		                        content += '<i class="fa fa-thumbs-up"></i>';
		                       content +=   '<span id="likeCountInfo-'+result.board.no+' ">'+result.board.like+'</span>';
		                        content += '</a>';
		                       content += '<a href="javascript:void(0)" id="replyCount-'+result.board.no+'" data-toggle="tooltip" data-placement="top" data-html=true;>';
		                       content += ' <i class="far fa-comment-alt"></i>';
		                       content +=   '<span id="boardRepCount-'+result.board.no+'">'+result.board.repCount+'</span>';
		                       content += '</a>';
		                  content += ' </div>';
		                 content +=  '<div class="newpostfooter">';
		                 content +=     ' <div class="newpostfooter-contents">';
		                 content +=   '   <!-- 좋아요를 눌렀는지아닌지에대한 choose -->';
			             content += ' <a href="javascript:void(0)" id="likeBoardButton-'+result.board.no+'" style="color: ';
			             			if(undefined == result.board.event ){
			             				content += '">';
			             			} else {
			             				content += 'Dodgerblue">';
			             			}
			              content +=  ' <label class="board-label"><i class="fa fa-thumbs-up"></i>좋아요</label>';
			                content +=     '   </a>';
		                content +=       ' <a href="javascript:void(0)" id="replyButton-'+result.board.no+'">';
		                    content +=      '<label class="board-label"><i class="far fa-comment-alt"></i>댓글달기</label>';
		                  content +=      '</a>';
		                  content +=     ' <a id="shareButton-'+result.board.no+'" href="#" data-toggle="modal" data-target="#shareModal">';
		                 content +=        ' <label class="board-label"><i class="fa fa-share"></i>공유하기</label>';
		                  content +=     ' </a>';
		                  content +=     ' </div>';
		                  content +=    '</div>';
		                  content +=  '  <div id="commentListDiv-'+result.board.no+'">';
		                  content +=    '</div>';
						content +=		'<div class="commentpost" id="commentTextareaDiv-'+result.board.no+'" style="display:none">';
						content +=		     '<div class="input-group" style="width:100%">';
						content += 				'<div style="display:inline-block">';
						content +=	 			 '  <a href="profileOpen.do?userNo='+result.user.no+'">';
						content +=				        ' <img src="resources/image/'+result.user.profile+'" style="width:40px;height:40px;border-radius:50%"/>';
						content +=			       '</a>';
						content +=  		 ' </div>';
						content +=				'<div style="display:inline-block; vertical-align:middle; width:75%">'
						content +=		    '   <textarea class="form-control" placeholder="댓글을 입력해주세요" id="replyContents-'+result.board.no+'" style="height:58px;"></textarea>';
						content +=   			'</div>';
						content += 				'<div style="display:none; vertical-align:middle;">';
						content +=		       '<a class="btn btn-primary btn-sm pull-right" id="addReply-'+result.board.no+'">등록</a>';
						content += 				'</div>';
						content +=		'</div>'; 
						content += '</div>';
		
						content += 	'				<div class="modal fade" id="shareModal" role="dialog">';
						content +=				'	<div class="modal-dialog">'
						content +=				      '	<div class="modal-content">';
						content +=				      ' 	<div class="modal-header">';
						content +=				       '   		<button type="button" class="close" data-dismiss="modal">&times;</button>'
						content +=				    '      		<select id="open-range">';
						content +=				        ' 			<option value="onlyme"> 나만보기</option>';
						content +=				        '  			<option value="all"> 모두</option>';
						content +=				     '    			<option value="onlyfriend"> 친구만</option>';
						content +=				     '     		</select>';
						content +=				      '  	</div>';
						content +=				      '  		<input type="hidden" id="clicked-board-no" />';
						content +=						    '    <div class="modal-body">';
						content +=	          '            			<div class="postcontent" id="modal-board-content">';
						content +=					'	<textarea class="form-control" rows="5" id="share-textarea" placeholder="하고싶은 말을 남겨주세요...." name="user-contents"></textarea>';
						content +=	                   '</div>';
						content +=					'        </div>';
						content +=						  '      <div class="modal-footer">';
						content +=				  '   <button type="button" class="btn btn-warning" data-dismiss="modal">취소</button>';
						content +=						  '        <a class="btn btn-default" id="share-board-add-button">게시</a>';
						content +=					'	        </div>';
						content +=				   ' 	</div>'
						content +=				   ' </div>';
						content +=				'</div>';			
						content +=			'</div>';
						 content +=      ' </div>';
						 content +=   '</div>';
				$("#information").html(content);
				
			}
		})
	});
	
	
	// 내가 태그 된 사진
	$('#tagPictures').click(function(){
		var userNo = $('#userNo').val();
		$.ajax({
			url: "tagPicture", 
			data: {userNo: userNo},
			dataType: 'json', 
			success: function(result) {
				var content = "";
				$.each(result,function(index, result1) {
					content += "<div class='col-lg-3 lg-3 padding10'>";
					content += "<span class='picture-info-img'>"; 
					content += "<a href='' data-toggle='modal' data-target='#viewTagPicture'>"; 
					content += "<img id='tagp-" + result1.board.no + "' src='resources/image/" + result1.name + "' class='border'>";
					content += "</a>"
					content += "</span>";
					content += "</div>";					
				});
					$("#pic").children().remove();
					$("#pic").append(content);
			}
		})
	})
	
	$('#pic').on('click', "[id^=tagp-]", function(){
		var tagId = $(this).attr('id').replace('tagp-',"");
		$("#tag-" + tagId).addClass("active");
		$.ajax({
			url: "tagInformation",
			data: {tagId: tagId},
			dataType: 'json', 
			success: function(result) {
				var content = "";
				 content += '<div class="recentcontainer">';
				  content +=  '</div>';
			      content += '<div class="container">';
				  content += '<div class="row">';
				  content += '<div class="col-xs-4 main-content">';
				  content += '<div class="recentcontainer">';
				  content += '</div>';
				  content +=  '<div class="recentcontainer">';
				  content +=  '<div class="newpostheader">';
				  content +=  '<a href="profile.do?userNo='+result.user.no+'">';
				  content += '<img src="resources/image/'+result.user.profile+'" />';
				  content += '                    <span class="name">'+result.user.name+'</span>';
				  content += '                  </a>';
/* 							  content += '         <c:if test="${allimSelect.share.no ne null}">';
				  content += '														<span>님이';
				  content +=	'						<a href="#">게시물</a>';
				  content += 	'		                 을 공유했습니다.</span>';
				content +=			  '         </c:if>'; */
				   content +=                  ' <p>';
				    content +=   '<a class="date" href="javascript:void(0)">'+result.board.passedTime+'</a>';
				   content +=                   '  <a href="javascript:void(0)">';
				    content +=                     ' <i class="fa fa-globe"></i>';
				    content +=                   ' </a>';
				    content += '                 <div class="rightsideofpost">';
				     content +=  '                  <a class="personpostmenu" href="javascript:void(0)">';
				     content += '                    <i class="fa fa-caret-down"></i>';
				     content +=         ' </a>';
				     content +=     '            </div>';
				      content +=          '  </div>';
				      content +=            ' <div class="newpost">';
				      content +=              '  <div class="postcontent" id="post-board-content-'+result.board.no+'">';
				       content +=               	'<div>';
				      content +=                 	'<p>'+result.board.contents+'</p>';
				      content  +=                 '</div>';
				      content  +=                 '<div style="height:40px;">';
				      content  +=                	'<div style="margin-left:10px;margin-top:10px;">';
												$.each(result.tags, function(index, tag){
													if('null' != tag.contents){
						content +=                   '<a href="profile.do?userNo='+tag.user.no+'" style="text-decoration: none;">'+tag.contents+'</a>';
													}
												})
												if(undefined != result.tags[0]){
						content +=                 		'과 함께';
												}
						content +=                 	'</div>';
						content +=                 '</div>';
						content +=                ' <div>';
/* 							        content +=              		'<c:if test="${not empty allimSelect.boardMedias}">';
				       content  +=	  	             	'<c:forEach var="mainBoardMedia" items="${allimSelect.boardMedias }">';
					    content +=                    	'<img src="resources/image/${mainBoardMedia.name }" style="width:535px; height:350px;">';
				         content +=         		      	'</c:forEach>';
				         content +=               	'</c:if>'; */
				         content +=              ' </div>';
				          content +=           ' </div>';
/* 								      content +=          ' <c:if test="${allimSelect.share.no ne null }">';
					         content  +=            '<div class="postcontent">';
								content +=				'<div class="recentcontainer" style="border:1px solid gray">';
								content += 					'<div class="newpostheader">';
								content +=						'<a href="javascript:void(0)">';
								content +=		'<img src="resources/image/${allimSelect.share.user.profile }" />';
								content +=			'<span class="name">${allimSelect.share.user.name }</span>';
								content +=		'</a>';
								content +=		'<p>';
								content +=	'<a class="date" href="javascript:void(0)">${allimSelect.share.passedTime }</a>';
								content += '<a href="javascript:void(0)"><i class="fa fa-globe"></i></a>';
								content +=	'</p>';
								content +=	'</div>';
								content += ' <div class="newpost">';
								content	+= '<div class="postcontent">';
								content +=	'<p>${allimSelect.share.contents }</p>';
								content +=	 '<div>';
									content +=		   '<c:if test="${not empty allimSelect.share.boardMedias}">';
								content +=						    ' <c:forEach var="shareMedia" items="${allimSelect.share.boardMedias }">'
								content +=	 		'<img src="resources/image/${shareMedia.name}" style="width:513px; height:350px;"/>';
								content +=	'</c:forEach>';
								content +=	'</c:if>';  */
								content += 	'</div>'
								content += '</div>';
								content += '</div>';
								content +=	'</div>';
					            content +=   '</div>';
					     /*        content +=   ' </c:if>'; */
				                content +=  '</div>';
			                  content +=  '<div class="community-counter">';
		                      content +=  '<a href="javascript:void(0)" id="likeCount-'+result.board.no+'" data-toggle="tooltip" data-placement="top" data-html=true;>';
		                        content += '<i class="fa fa-thumbs-up"></i>';
		                       content +=   '<span id="likeCountInfo-'+result.board.no+' ">'+result.board.like+'</span>';
		                        content += '</a>';
		                       content += '<a href="javascript:void(0)" id="replyCount-'+result.board.no+'" data-toggle="tooltip" data-placement="top" data-html=true;>';
		                       content += ' <i class="far fa-comment-alt"></i>';
		                       content +=   '<span id="boardRepCount-'+result.board.no+'">'+result.board.repCount+'</span>';
		                       content += '</a>';
		                  content += ' </div>';
		                 content +=  '<div class="newpostfooter">';
		                 content +=     ' <div class="newpostfooter-contents">';
		                 content +=   '   <!-- 좋아요를 눌렀는지아닌지에대한 choose -->';
			             content += ' <a href="javascript:void(0)" id="likeBoardButton-'+result.board.no+'" style="color:';
	             			if(undefined == result.board.event){
	             				content += '">';
	             			} else {
	             				content += 'Dodgerblue">';
	             			}
			              content +=  ' <label class="board-label"><i class="fa fa-thumbs-up"></i>좋아요</label>';
			                content +=     '   </a>';
		                content +=       ' <a href="javascript:void(0)" id="replyButton-'+result.board.no+'">';
		                    content +=      '<label class="board-label"><i class="far fa-comment-alt"></i>댓글달기</label>';
		                  content +=      '</a>';
		                  content +=     ' <a id="shareButton-'+result.board.no+'" href="#" data-toggle="modal" data-target="#shareModal">';
		                 content +=        ' <label class="board-label"><i class="fa fa-share"></i>공유하기</label>';
		                  content +=     ' </a>';
		                  content +=     ' </div>';
		                  content +=    '</div>';
		                  content +=  '  <div id="commentListDiv-'+result.board.no+'">';
		                  content +=    '</div>';
						content +=		'<div class="commentpost" id="commentTextareaDiv-'+result.board.no+'" style="display:none">';
						content +=		     '<div class="input-group" style="width:100%">';
						content += 				'<div style="display:inline-block">';
						content +=	 			 '  <a href="profileOpen.do?userNo='+result.user.no+'">';
						content +=				        ' <img src="resources/image/'+result.user.profile+'" style="width:40px;height:40px;border-radius:50%"/>';
						content +=			       '</a>';
						content +=  		 ' </div>';
						content +=				'<div style="display:inline-block; vertical-align:middle; width:75%">'
						content +=		    '   <textarea class="form-control" placeholder="댓글을 입력해주세요" id="replyContents-'+result.board.no+'" style="height:58px;"></textarea>';
						content +=   			'</div>';
						content += 				'<div style="display:none; vertical-align:middle;">';
						content +=		       '<a class="btn btn-primary btn-sm pull-right" id="addReply-'+result.board.no+'">등록</a>';
						content += 				'</div>';
						content +=		'</div>'; 
						content += '</div>';
		
						content += 	'				<div class="modal fade" id="shareModal" role="dialog">';
						content +=				'	<div class="modal-dialog">'
						content +=				      '	<div class="modal-content">';
						content +=				      ' 	<div class="modal-header">';
						content +=				       '   		<button type="button" class="close" data-dismiss="modal">&times;</button>'
						content +=				    '      		<select id="open-range">';
						content +=				        ' 			<option value="onlyme"> 나만보기</option>';
						content +=				        '  			<option value="all"> 모두</option>';
						content +=				     '    			<option value="onlyfriend"> 친구만</option>';
						content +=				     '     		</select>';
						content +=				      '  	</div>';
						content +=				      '  		<input type="hidden" id="clicked-board-no" />';
						content +=						    '    <div class="modal-body">';
						content +=	          '            			<div class="postcontent" id="modal-board-content">';
						content +=					'	<textarea class="form-control" rows="5" id="share-textarea" placeholder="하고싶은 말을 남겨주세요...." name="user-contents"></textarea>';
						content +=	                   '</div>';
						content +=					'        </div>';
						content +=						  '      <div class="modal-footer">';
						content +=				  '   <button type="button" class="btn btn-warning" data-dismiss="modal">취소</button>';
						content +=						  '        <a class="btn btn-default" id="share-board-add-button">게시</a>';
						content +=					'	        </div>';
						content +=				   ' 	</div>'
						content +=				   ' </div>';
						content +=				'</div>';			
						content +=			'</div>';
						 content +=      ' </div>';
						 content +=   '</div>';
				$("#Taginformation").html(content);
			}
			
		})
	});
	
	$('#tag-picture').on('slide.bs.carousel', function (event) {
		var el = event.relatedTarget;
		var tagId = $(el).attr('id').replace("tag-","");
		
			$.ajax({
				url: "tagInformation",
				data: {tagId:tagId},
				dataType: 'json',
				success: function(result) {
					var content = "";
					 content += '<div class="recentcontainer">';
					  content +=  '</div>';
				      content += '<div class="container">';
					  content += '<div class="row">';
					  content += '<div class="col-xs-4 main-content">';
					  content += '<div class="recentcontainer">';
					  content += '</div>';
					  content +=  '<div class="recentcontainer">';
					  content +=  '<div class="newpostheader">';
					  content +=  '<a href="profile.do?userNo='+result.user.no+'">';
					  content += '<img src="resources/image/'+result.user.profile+'" />';
					  content += '                    <span class="name">'+result.user.name+'</span>';
					  content += '                  </a>';
	/* 							  content += '         <c:if test="${allimSelect.share.no ne null}">';
					  content += '														<span>님이';
					  content +=	'						<a href="#">게시물</a>';
					  content += 	'		                 을 공유했습니다.</span>';
					content +=			  '         </c:if>'; */
					   content +=                  ' <p>';
					    content +=   '<a class="date" href="javascript:void(0)">'+result.board.passedTime+'</a>';
					   content +=                   '  <a href="javascript:void(0)">';
					    content +=                     ' <i class="fa fa-globe"></i>';
					    content +=                   ' </a>';
					    content += '                 <div class="rightsideofpost">';
					     content +=  '                  <a class="personpostmenu" href="javascript:void(0)">';
					     content += '                    <i class="fa fa-caret-down"></i>';
					     content +=         ' </a>';
					     content +=     '            </div>';
					      content +=          '  </div>';
					      content +=            ' <div class="newpost">';
					      content +=              '  <div class="postcontent" id="post-board-content-'+result.board.no+'">';
					       content +=               	'<div>';
					      content +=                 	'<p>'+result.board.contents+'</p>';
					      content  +=                 '</div>';
					      content  +=                 '<div style="height:40px;">';
					      content  +=                	'<div style="margin-left:10px;margin-top:10px;">';
														$.each(result.tags, function(index, tag){
															if('null' != tag.contents){
							content +=                   '<a href="profile.do?userNo='+tag.user.no+'" style="text-decoration: none;">'+tag.contents+'</a>';
															}
														})
														if(undefined != result.tags[0]){
							content +=                 		'과 함께';
														}
							content +=                 	'</div>';
							content +=                 '</div>';
							content +=                ' <div>';
	/* 							        content +=              		'<c:if test="${not empty allimSelect.boardMedias}">';
					       content  +=	  	             	'<c:forEach var="mainBoardMedia" items="${allimSelect.boardMedias }">';
						    content +=                    	'<img src="resources/image/${mainBoardMedia.name }" style="width:535px; height:350px;">';
					         content +=         		      	'</c:forEach>';
					         content +=               	'</c:if>'; */
					         content +=              ' </div>';
					          content +=           ' </div>';
	/* 								      content +=          ' <c:if test="${allimSelect.share.no ne null }">';
						         content  +=            '<div class="postcontent">';
									content +=				'<div class="recentcontainer" style="border:1px solid gray">';
									content += 					'<div class="newpostheader">';
									content +=						'<a href="javascript:void(0)">';
									content +=		'<img src="resources/image/${allimSelect.share.user.profile }" />';
									content +=			'<span class="name">${allimSelect.share.user.name }</span>';
									content +=		'</a>';
									content +=		'<p>';
									content +=	'<a class="date" href="javascript:void(0)">${allimSelect.share.passedTime }</a>';
									content += '<a href="javascript:void(0)"><i class="fa fa-globe"></i></a>';
									content +=	'</p>';
									content +=	'</div>';
									content += ' <div class="newpost">';
									content	+= '<div class="postcontent">';
									content +=	'<p>${allimSelect.share.contents }</p>';
									content +=	 '<div>';
										content +=		   '<c:if test="${not empty allimSelect.share.boardMedias}">';
									content +=						    ' <c:forEach var="shareMedia" items="${allimSelect.share.boardMedias }">'
									content +=	 		'<img src="resources/image/${shareMedia.name}" style="width:513px; height:350px;"/>';
									content +=	'</c:forEach>';
									content +=	'</c:if>';  */
									content += 	'</div>'
									content += '</div>';
									content += '</div>';
									content +=	'</div>';
						            content +=   '</div>';
						     /*        content +=   ' </c:if>'; */
					                content +=  '</div>';
				                  content +=  '<div class="community-counter">';
			                      content +=  '<a href="javascript:void(0)" id="likeCount-'+result.board.no+'" data-toggle="tooltip" data-placement="top" data-html=true;>';
			                        content += '<i class="fa fa-thumbs-up"></i>';
			                       content +=   '<span id="likeCountInfo-'+result.board.no+' ">'+result.board.like+'</span>';
			                        content += '</a>';
			                       content += '<a href="javascript:void(0)" id="replyCount-'+result.board.no+'" data-toggle="tooltip" data-placement="top" data-html=true;>';
			                       content += ' <i class="far fa-comment-alt"></i>';
			                       content +=   '<span id="boardRepCount-'+result.board.no+'">'+result.board.repCount+'</span>';
			                       content += '</a>';
			                  content += ' </div>';
			                 content +=  '<div class="newpostfooter">';
			                 content +=     ' <div class="newpostfooter-contents">';
			                 content +=   '   <!-- 좋아요를 눌렀는지아닌지에대한 choose -->';
			                 content += ' <a href="javascript:void(0)" id="likeBoardButton-'+result.board.no+'" style="color: ';
		             			if(undefined == result.board.event){
		             				content += '">';
		             			} else {
		             				content += 'Dodgerblue">';
		             			}
				              content +=  ' <label class="board-label"><i class="fa fa-thumbs-up"></i>좋아요</label>';
				                content +=     '   </a>';
			                content +=       ' <a href="javascript:void(0)" id="replyButton-'+result.board.no+'">';
			                    content +=      '<label class="board-label"><i class="far fa-comment-alt"></i>댓글달기</label>';
			                  content +=      '</a>';
			                  content +=     ' <a id="shareButton-'+result.board.no+'" href="#" data-toggle="modal" data-target="#shareModal">';
			                 content +=        ' <label class="board-label"><i class="fa fa-share"></i>공유하기</label>';
			                  content +=     ' </a>';
			                  content +=     ' </div>';
			                  content +=    '</div>';
			                  content +=  '  <div id="commentListDiv-'+result.board.no+'">';
			                  content +=    '</div>';
							content +=		'<div class="commentpost" id="commentTextareaDiv-'+result.board.no+'" style="display:none">';
							content +=		     '<div class="input-group" style="width:100%">';
							content += 				'<div style="display:inline-block">';
							content +=	 			 '  <a href="profileOpen.do?userNo='+result.user.no+'">';
							content +=				        ' <img src="resources/image/'+result.user.profile+'" style="width:40px;height:40px;border-radius:50%"/>';
							content +=			       '</a>';
							content +=  		 ' </div>';
							content +=				'<div style="display:inline-block; vertical-align:middle; width:75%">'
							content +=		    '   <textarea class="form-control" placeholder="댓글을 입력해주세요" id="replyContents-'+result.board.no+'" style="height:58px;"></textarea>';
							content +=   			'</div>';
							content += 				'<div style="display:none; vertical-align:middle;">';
							content +=		       '<a class="btn btn-primary btn-sm pull-right" id="addReply-'+result.board.no+'">등록</a>';
							content += 				'</div>';
							content +=		'</div>'; 
							content += '</div>';
			
							content += 	'				<div class="modal fade" id="shareModal" role="dialog">';
							content +=				'	<div class="modal-dialog">'
							content +=				      '	<div class="modal-content">';
							content +=				      ' 	<div class="modal-header">';
							content +=				       '   		<button type="button" class="close" data-dismiss="modal">&times;</button>'
							content +=				    '      		<select id="open-range">';
							content +=				        ' 			<option value="onlyme"> 나만보기</option>';
							content +=				        '  			<option value="all"> 모두</option>';
							content +=				     '    			<option value="onlyfriend"> 친구만</option>';
							content +=				     '     		</select>';
							content +=				      '  	</div>';
							content +=				      '  		<input type="hidden" id="clicked-board-no" />';
							content +=						    '    <div class="modal-body">';
							content +=	          '            			<div class="postcontent" id="modal-board-content">';
							content +=					'	<textarea class="form-control" rows="5" id="share-textarea" placeholder="하고싶은 말을 남겨주세요...." name="user-contents"></textarea>';
							content +=	                   '</div>';
							content +=					'        </div>';
							content +=						  '      <div class="modal-footer">';
							content +=				  '   <button type="button" class="btn btn-warning" data-dismiss="modal">취소</button>';
							content +=						  '        <a class="btn btn-default" id="share-board-add-button">게시</a>';
							content +=					'	        </div>';
							content +=				   ' 	</div>'
							content +=				   ' </div>';
							content +=				'</div>';			
							content +=			'</div>';
							 content +=      ' </div>';
							 content +=   '</div>';
					$("#Taginformation").html(content);
					
					
				}
			})
			
		});
		
	$('#viewTagPicture').on('hidden.bs.modal', function (e) {
		$(".carousel-inner .item").removeClass("active");
	});
	
	$('[data-toggle="tooltip"]').tooltip();
	//좋아요 카운트에 이벤트 발생자 정보 툴팁
	$('#viewPicture, #viewTagPicture').on('mouseenter','[id^=likeCountInfo-]',function(){
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
	$('#viewPicture, #viewTagPicture').on('mouseleave','[id^=likeCountInfo-]',function(){
		$(this).attr('title',''); 
	})
	//댓글 카운트에 작성자 정보 툴팁
	$('#viewPicture, #viewTagPicture').on('mouseenter','[id^=boardRepCount-]',function(){
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
	$('#viewPicture, #viewTagPicture').on('mouseleave','[id^=boardRepCount-]',function(){
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
	
	
	$("#viewPicture, #viewTagPicture").on('hide.bs.modal', function() {
		$(".tag-space").children().remove();
	})
	
	$("#viewPicture, #viewTagPicture").on('click', "[id^=likeBoardButton-]", function() {
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
	
	$("#viewPicture, #viewTagPicture").on('click', "[id^=replyButton-]", function() {
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
	$('#viewPicture, #viewTagPicture').on('keypress','[id^=replyContents-]',function(event){
		var userno = $(this).attr('id').replace('replyContents-','');
		if (event.which == 13){
			$('#addReply-'+userno).click();
			return false;
		}
	});
	$("#viewPicture, #viewTagPicture").on('click', "[id^=addReply-]", function() {
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
				html += '<span style="margin-left:5px;">'+reply.reply.contents+'</span></div>';
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
	
 	$("#viewPicture, #viewTagPicture").on('click', "[id^=replyOfReply-]", function() {
		var replyNo = $(this).attr('id').replace('replyOfReply-','');
		$('#commentReplyTextareaDiv-'+replyNo).attr('style', '');
	});
	
	$("#viewPicture, #viewTagPicture").on('click', "[id^=addReplyOfReply-]", function() {
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
	});
	
</script>