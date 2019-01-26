<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="section-content">
	<h4 style="font-weight: bold;">
		내 페이지 <a href="javascript:void(0)">
		</a>
		<hr class="hr">
	</h4>

	<a href="javascript:void(0)"> 
	</a>
	<c:choose>
		<c:when test="${page ne null }">
			<a href="pageProfile.do?userNo=${page.no }">
			<img src="resources/image/${page.profile }" style="margin-left:10px;"/>
			</a>
			<p>
				<a href="pageProfile.do?userNo=${page.no }"> <span>${page.pageName }</span></a>
				<a href="javascript:void(0)"> <i class="fa fa-comment"></i> 메시지</a>
				<a href="javascript:void(0)"> <i class="fa fa-globe"></i> 알림 </a>
				
			<hr class="hr">
			</p>
			<p>
				<a href="javascript:void(0)"> <i class="fa fa-camera" style="text-decoration: none;"></i> 0</a>
				<a href="javascript:void(0)"> <i class="fa fa-bell" style="text-decoration: none;"></i> 0</a>
				<a href="javascript:void(0)"> <i class="fa fa-thumbs-up" style="text-decoration: none;"></i>
					${page.pageLikeCount }
				</a>
			</p>
		</c:when>
		<c:otherwise>
			<div style="text-align:center;">
			<strong><span class="glyphicon glyphicon-exclamation-sign"
				style="text-align: center;"></span> 페이지가 없습니다.</strong>
			</div>
			<br />
			<div style="text-align:center;">
				<a class="btn btn-primary" href="makePageForm.do" style="margin-bottom:30px;">만들기</a>
			</div>
		</c:otherwise>
	</c:choose>
</div>

<div class="section-content">
	<div>
	<h4 style="font-weight:bold;font-size: 14px;margin: 6px;padding: 6px;color: #888;">
		<i class="fa fa-calendar" style="color:red"></i> 생일 알림
	</h4>
	</div>
	<hr class="hr">
	<c:choose>
		<c:when test="${birthInfoOfFriends eq null}">
			<strong><span class="glyphicon glyphicon-exclamation-sign"
				style="text-align: center;"></span> 생일인 친구가 없습니다.</strong>
		</c:when>
		<c:otherwise>
			<c:forEach items="${birthInfoOfFriends }" var="birthInfoOfFriend">
				<div style="margin-bottom:10px;margin-left:10px;">
					<a href="profile.do?userNo=${birthInfoOfFriend.no }" style="text-decoration:none;">
						<img alt="" src="resources/image/${birthInfoOfFriend.profile }" style="border-radius:50%"/>
						<span style="margin-left:5px;">${birthInfoOfFriend.name }</span>
					</a>
					<c:if test="${(birthInfoOfFriend.userBirthday - birthInfoOfFriend.nowday) eq 7}">
					7일전<br />
					</c:if>
					<c:if test="${(birthInfoOfFriend.userBirthday - birthInfoOfFriend.nowday) eq 6}">
					6일전<br />
					</c:if>
					<c:if test="${(birthInfoOfFriend.userBirthday - birthInfoOfFriend.nowday) eq 5}">
					5일전<br />
					</c:if>
					<c:if test="${(birthInfoOfFriend.userBirthday - birthInfoOfFriend.nowday) eq 4}">
					4일전<br />
					</c:if>
					<c:if test="${(birthInfoOfFriend.userBirthday - birthInfoOfFriend.nowday) eq 3}">
					3일전<br />
					</c:if>
					<c:if test="${(birthInfoOfFriend.userBirthday - birthInfoOfFriend.nowday) eq 2}">
					2일전<br />
					</c:if>
					<c:if test="${(birthInfoOfFriend.userBirthday - birthInfoOfFriend.nowday) eq 1}">
					1일전<br />
					</c:if>
					<c:if test="${(birthInfoOfFriend.userBirthday - birthInfoOfFriend.nowday) eq 0}">
					생일을 축하합니다<br />
					</c:if>
				</div>
				
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>
<div class="section-content">
	<h4 style="font-weight: bold;">홍보하기</h4>
	<hr />
	<c:choose>
		<c:when test="${ad ne null }">
			<a href="/fa/profile.do?userNo=${ad.userNo }"><img src="/fa/resources/admin/ad/${ad.photo }" style="width: 100%;height: 400px; padding:10px;border-radius: 20px;"></a>
		</c:when>
		<c:otherwise>
			<a href="/fa/ad"><img src="/fa/resources/admin/ad/defaultad.png" style="width: 100%;height: 400px; padding:10px;border-radius: 20px;"></a>
		</c:otherwise>
	</c:choose>

</div>
<div class="section-content">
	<a href="javascript:void(0)">English (US)</a> · <a
		href="javascript:void(0)">Español</a> · <a href="javascript:void(0)">Português
		(Brasil)</a> · <a href="javascript:void(0)">Français (France)</a> · <a
		href="javascript:void(0)">Deutsch</a>
</div>

<div>
	<a href="javascript:void(0)">Privacy</a> · <a href="javascript:void(0)">Terms</a>
	· <a href="javascript:void(0)">Advertising</a> · <a
		href="javascript:void(0)">Ad Choices</a> · <a
		href="javascript:void(0)">Cookies</a> · <a href="javascript:void(0)">More</a>
	<p>Facebook © 2018</p>
</div>