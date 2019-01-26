<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<ul>
	<h4>접속중인 친구</h4>
	<c:forEach var="friend" items="${loginFriends }">
	    <li>
	    	<a href="profile.do?userNo=${friend.no }">
				<img src="resources/image/${friend.profile }" align="left" style="border-radius:50%"> 
				<span>${friend.name }</span> <i id="ws-friend-${friend.no }" class="fa fa-circle fRight" style="color:gray"></i>
			</a>
		</li>
	</c:forEach>
</ul>