<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
                  <div class="recentcontainer">
		                    <div class="newpostheader">
			                      <a href="javascript:void(0)">
			                        <img src="resources/image/${profileBoard.share.user.profile }" />
			                        <span class="name">${profileBoard.share.user.name }
			                        </span>
			                      </a>
		                      <p>
		                        <a class="date" href="javascript:void(0)">${profileBoard.share.passedTime }</a>
		                        <a href="javascript:void(0)">
		                          <i class="fa fa-globe"></i>
		                        </a>
		                  </div>
                    <div class="newpost">
                      <div class="postcontent">
                        	<p>${profileBoard.share.contents }</p>
	                        <div>
	                        	<c:if test="${not empty profileBoard.share.boardMedias}">
			                        		<c:forEach var="profileBoardMedia" items="${profileBoard.share.boardMedias }">
				                        		<img src="resources/image/${profileBoardMedia.name }" style="width:513px; height:350px;">
			                        		</c:forEach>
			                        	</c:if>
	                        </div>
                      </div>
                    </div>
                  </div>