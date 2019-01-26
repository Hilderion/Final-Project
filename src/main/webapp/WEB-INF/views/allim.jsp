<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title></title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="resources/js/moment.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link type="text/css" rel="stylesheet" href="resources/css/allim.css?ver=<%=new Date()%>" />
	<link type="text/css" rel="stylesheet" href="resources/css/topbar.css?ver=<%=new Date()%>" />
	<link type="text/css" rel="stylesheet" href="resources/css/right.css?ver=<%=new Date()%>"/>
	
	
</head>
<body class="white">
	<%@ include file="topbar.jsp" %>
    <div class="container">
        <div class="row">
            <div id="list" class="col-lg-10 lg-10">
                <div class="allim margin60">
                    내 알림
                </div>
                <hr class='allim-hr'>
                <input type="hidden" value="${LOGIN_USER.no }" id="alim_login_user"/>
            	<c:forEach var="allim" items="${allims }"> 
			            <div class="row cont-box marginLR0">
			                <div class="col-lg-12 lg-12  allim-row">
			                    <div id="event-allim-${allim.no }" class="row allim-info marginLR0" ${allim.check eq 'Y' ? 'style="background-color:white;"' : 'style="background-color:#edf2fa;"'} >
			                        <div class="col-lg-1 lg-1">
			                            <img src="resources/image/${allim.user.profile}">       
			                        </div>
			                        <div id="user-allim-info" class="col-lg-9 lg-9 allim-info-event">
			                            <div>
			                            	<c:choose>
			                            		<c:when test="${allim.event eq '공유'}">
			                            			<c:if test="${allim.user.no eq allim.subUser.no }">
			                            				<a href="profile.do?userNo=${allim.user.no }">${allim.user.name }</a>님이 자신의 게시글을 <a href="allimdetailview?allimNo=${allim.no }&eventNo=${allim.eventNo }&confirm=Y" >공유</a>했습니다
			                            			</c:if>
			                            			<c:if test="${allim.user.no ne allim.subUser.no }">
			                            				<a href="profile.do?userNo=${allim.user.no }">${allim.user.name }</a>님이 <a href="profile.do?userNo=${allim.subUser.no }">${allim.subUser.name }</a>님의 게시글을 <a href="allimdetailview?allimNo=${allim.no }&eventNo=${allim.eventNo }&confirm=Y" >공유</a>했습니다
			                            			</c:if>
			                            		</c:when>
			                            		<c:when test="${allim.event eq '친구요청' }">
			                            			<a href="profile.do?userNo=${allim.user.no }">${allim.user.name }</a>님이 회원님에게 <a href="findFriend.do">친구 신청</a>을 했습니다.
			                            		</c:when>
			                            		<c:when test="${allim.event eq '게시글좋아요' }">
			                            			<a href="profile.do?userNo=${allim.user.no }">${allim.user.name }</a>님이 <a href="profile.do?userNo=${allim.subUser.no }">${allim.subUser.name }</a>님의 게시글에 <a href="allimdetailview?allimNo=${allim.no }&eventNo=${allim.eventNo }&confirm=Y" >좋아요</a>를 눌렀습니다.
			                            		</c:when>
			                            		<c:when test="${allim.event eq '댓글' }">
			                            			<c:if test="${allim.user.no eq allim.subUser.no}">
			                            				<a href="profile.do?userNo=${allim.user.no }">${allim.user.name }</a>님이 자신의 게시글에 <a href="allimdetailview?allimNo=${allim.no }&eventNo=${allim.eventNo }&confirm=Y" >댓글</a>을 남겼습니다.
			                            			</c:if>
			                            			<c:if test="${allim.user.no ne allim.subUser.no }">
			                            				<a href="profile.do?userNo=${allim.user.no }">${allim.user.name }</a>님이 <a href="profile.do?userNo=${allim.subUser.no }">${allim.subUser.name }</a>님의 게시글에 <a href="allimdetailview?allimNo=${allim.no }&eventNo=${allim.eventNo }&confirm=Y" >댓글</a>을 남겼습니다.
			                            			</c:if>
			                            		</c:when>
			                            		<c:when test="${allim.event eq '대댓글' }">
			                            				<a href="profile.do?userNo=${allim.user.no }">${allim.user.name }</a>님이 회원님의 댓글에  <a href="allimdetailview?allimNo=${allim.no }&eventNo=${allim.eventNo }&confirm=Y" >댓글</a>을 남겼습니다.
			                            		</c:when>
			                            		<c:when test="${allim.event eq '게시글작성' }">
			                            				<a href="profile.do?userNo=${allim.user.no }">${allim.user.name }</a>님이 <a href="allimdetailview?allimNo=${allim.no }&eventNo=${allim.eventNo }&confirm=Y" >게시글</a>을 작성했습니다.
			                            		</c:when>
			                            		<c:when test="${allim.event eq '태그' }">
			                            				<a href="profile.do?userNo=${allim.user.no }">${allim.user.name }</a>님이 회원님을 <a href="allimdetailview?allimNo=${allim.no }&eventNo=${allim.eventNo }&confirm=Y" >태그</a>했습니다.
			                            		</c:when>
			                            	</c:choose>
			                            </div>
			                            <div>
			                                <i class="fas fa-comment-alt"></i>
			                                <span>${allim.passedTime }</span>
			                            </div>
			                        </div>
			                        <div class="col-lg-2 lg-2">
			                            <button id="event-button-${allim.no }" class="far fa-eye reset-button "></button>
			                            <input type="hidden" id="event_button_${allim.check }">
			                        </div>
			                    </div>
			                </div>                
			            </div>
			            <hr class='allim-hr'>
			            <input type="hidden" value="${allim.check }" id="check-${allim.no }">   
            	</c:forEach>
            </div>
        </div>
        <!-- <button type="button" id="view-${logined.no }" class="btn btn-success btn-sm" style="margin-left: 400px;"><img src="https://static.thenounproject.com/png/2115273-200.png" style="width: 20px; height: 20px;">더보기</button> -->
    </div>
    <div class="right-content" style="position:absolute; top:0;border-radius:15px;width:160px;padding-bottom:0px;">
		<%@ include file="main/right-content.jsp" %>  
		</div>
    <%@ include file="chat.jsp" %>
</body>
<script type="text/javascript">
		$(function() {
			
			// 현재 페이지
			var cp = 1; 
			
			// 알림이 5개가 안 될때는 더보기 버튼 안 나오게 하기
			
			
			
			// 알림이 5개 이상이 첫 페이지에 있을 경우 생기는 더보기
			$("[id^=view-]").click(function(){
				
				var no = $("[id^=view-]").attr('id').replace("view-","");
				
				cp++;
				$.ajax({
					url: "view",
					data: {no: no},
					dataType: 'json',
					success: function(result) {
					
					
				
					var content = "";
					
					content += "<div class='row cont-box marginLR0'>";
					content += "<div class='col-lg-12 lg-12  allim-row'>";
					content += "<div id='event-allim-" + result[0].no + "' class='row allim-info marginLR0'";
					if('Y' == result[0].check){
						content += "style='background-color:#fff79b'>";  	
					} else {
						content += "style='background-color:#fecdf4'>";
					}
					content +=  "<div class='col-lg-1 lg-1'>";
					content +=  "<img src='resources/image/" +result[0].user.profile+ "'>";
					content +=  "</div>";
					content +=  "<div id='user-allim-info'  class='col-lg-9 lg-9 allim-info-event'>";
                    content +=  "<div>";
                    if('공유' == result[0].event) {
                    	content += "<a href='profile.do?no=" +result[0].user.no+ "'>"+result[0].user.name+"</a>님이 <a href='profile.do?no=" +result[0].subUser.no + "'>" + result[0].subUser.name + "</a>님의 게시글을 공유했습니다";
                    }
				    content +=   "</div>";
			        content +=   "<div>";
                    content +=   "<i class='fas fa-comment-alt'>" + "</i>";
                    content +=   "<span>" + result[0].passedTime + "</span>";
                  	content +=   "</div>";
              		content +=   "</div>";
                    content +=   "<div class='col-lg-2 lg-2'>";
                    content +=   "<button id='event-button-" + result[0].no+ "' class='far fa-eye reset-button b'>" + "</button>";
          	   		content +=   "</div>";
          			content +=   "</div>";
      				content +=   "</div>";                
  					content +=   "</div>";
  					content +=   "<hr class='allim-hr'>";
					
						
					$("#list").append(content);
					
						
						
					}
					
					
				 
					
				});
				
			})
			
			
		});
		
		$(function(){
		
		
		// 알림 확인 여부
		
		$("#list").on('click', "[id^=event-button-]",  function(){
			
			var no = $(this).attr('id').substring(13,20);
			console.log(no);
			
			var confirm = "Y";
			
			location.href = "/fa/updateallim?no="+no+"&confirm=" +confirm;
			
		});
		
		
		
		/* 동작이 실행되다 안되는 증상의 반복으로 사용 X
		$("#list").on('click', "[id^=event-button-]",  function(){
			
			var no = $(this).attr('id').replace("event-button-","");
			console.log(no);
			
			var userNo = $("#alim_login_user").val();
			var check = $("[id^=event_button_]").attr('id').replace("event_button_","");
			
			if('Y'== check) {
				var confirm = 'N'
			} else if ('N' == check) {
				var confirm = 'Y'
			}
			
			console.log(check);
			
			$.ajax({
				url: "updateallim",
				data: {no:no, confirm:confirm, userNo:userNo},
				dataType: 'json',
				success: function(result) {
					location.href = "/fa/allim"			
					$("#alim_ajax_count").text(result);
				}
			})
			
		});
		*/
		
		//var no = $("[id^=share-allim-]").attr('id').substring(12,20);
		
		/*
		$("[id^=share-allim-]").hover(function(){
			
			$(this).css("background-color","");
			
			
		},function(){
			
			var style = $("[id^=share-allim-]").attr('style').substring(18,30);
			
			$(this).css("background-color", );
		});
		*/
		$('#list').on('mouseenter','[id^=event-allim-]',function(){
			var no = $(this).attr('id').replace('event-allim-','');
			var check = $('#check-'+no).val();
			if("N" == check){
				$(this).css('background-color','white');
			}
		})
		$('#list').on('mouseleave','[id^=event-allim-]',function(){
			var no = $(this).attr('id').replace('event-allim-','');
			var check = $('#check-'+no).val();
			if("N" == check){
				$(this).css('background-color','#edf2fa');
			}
		})
	});
</script>
</html>
