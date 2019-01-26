<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<div class="row margin20">
            <div class="col-xs-4">
                <div class="information">
                    소개
                </div>
                <div class="picture padding10">
                	<div>
                    	사진
                    </div>
                    <c:forEach var="media" items="${medias }">
	                    <span class="picture-img">
	                        <a href="">
	                            <img src="resources/image/${media.name }" class="border">
	                        </a>   
	                    </span>
                    </c:forEach>
                </div>
                <div class="friend">
                    친구
                </div>
            </div>
            <div class="col-xs-6">
                <div class="recentcontainer">
                    <div class="newpost">
                      <textarea placeholder="게시글 영역"></textarea>
                    </div>
                    <div class="newpostfooter">
                        <a href="javascript:void(0)">
                          <i class="fa fa-image"></i>
                          <span>사진/동영상</span>
                        </a>
                        <a href="javascript:void(0)">
                          <i class="fas fa-user-tag"></i>
                          <span>친구 태그하기</span>
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
	                        <img src="resources/image/${profileBoard.user.profile }" />
	                        <span class="name">${profileBoard.user.name }</span>
	                      </a>
                    <c:choose>
	                    <c:when test="${profileBoard.share.no ne null }">
	                     <span>님이
	                     <a href="#">게시물</a>
	                 	을 공유했습니다.</span>
	                    </c:when>
                    </c:choose>
                      <p>
                        <a class="date" href="javascript:void(0)"><fmt:formatDate value="${profileBoard.createDate }" pattern="yyyy년MM월dd일" /></a>
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
                        	<p>${profileBoard.contents }</p>
                        <c:if test="${profileBoard.share.no ne null }">
                        	<p>${profileBoard.share.contents }</p>
                        </c:if>
                      </div>
                    </div>
                     <div class="community-counter">
                        <a href="javascript:void(0)">
                          <i class="fa fa-thumbs-up"></i>
                          <span>${profileBoard.like }</span>
                        </a>
                        <a href="javascript:void(0)">
                          <i class="far fa-comment-alt"></i>
                          <span>30</span>
                        </a>
                    </div>
                    <div class="newpostfooter">
                       <div class="newpostfooter-contents">
                        <a href="javascript:void(0)">
                          <i class="fa fa-thumbs-up"></i>
                          <span>좋아요</span>
                        </a>
                        <a href="javascript:void(0)" title="Leave a comment">
                          <i class="far fa-comment-alt"></i>
                          <span>댓글달기</span>
                        </a>
                        <a href="javascript:void(0)" title="Send this to friends or post it to your timeline">
                          <i class="fa fa-share"></i>
                          <span>공유하기</span>
                        </a>
                        </div>
                      </div>
                  </div>
                  </c:forEach>
            </div>
        </div>