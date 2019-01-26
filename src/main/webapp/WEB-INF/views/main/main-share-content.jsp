<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="recentcontainer" style="border:1px solid gray">
	<div class="newpostheader">
		<a href="javascript:void(0)">
			<img src="resources/image/${mainBoard.share.user.profile }" />
			<span class="name">${mainBoard.share.user.name }</span>
		</a>
		<p>
			<a class="date" href="javascript:void(0)">${mainBoard.share.passedTime }</a>
			<a href="javascript:void(0)"><i class="fa fa-globe"></i></a>
		</p>
	</div>
    <div class="newpost">
    	<div class="postcontent">
        	<p>${mainBoard.share.contents }</p>
	        <div>
		        <c:if test="${not empty mainBoard.share.boardMedias}">
		        	<c:forEach var="shareMedia" items="${mainBoard.share.boardMedias }">
		        		<img src="resources/image/${shareMedia.name}" style="width:513px; height:350px;"/>
		        	</c:forEach>
		        </c:if>
	    	</div>
		</div>
	</div>
</div>