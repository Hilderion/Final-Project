<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  	<link type="text/css" rel="stylesheet" href="resources/css/profile.css?ver=<%=new Date()%>" />
  	<link type="text/css" rel="stylesheet" href="resources/css/profilebar.css?ver=<%=new Date()%>" />
  	<link type="text/css" rel="stylesheet" href="resources/css/user-info.css?ver=<%=new Date()%>" />
  	<link type="text/css" rel="stylesheet" href="resources/css/right.css?ver=<%=new Date()%>"/>
  	
  	
</head>
<body>
	<%@ include file="topbar.jsp" %>
    <div class="container">
    	<%@ include file="profile/profilebar.jsp" %>
    	<c:choose>
    		<c:when test="${event eq 'profile' }">
        		<%@ include file="profile/profile-content.jsp" %>
    		</c:when>
    		<c:when test="${event eq 'Info' }">
        		<%@ include file="profile/user-info.jsp" %>
    		</c:when>
    		<c:when test="${event eq 'friend' }">
    			<%@ include file="profile/user-friend.jsp" %>	
    		</c:when>
    		<c:when test="${event eq 'picture' }">
    			<%@ include file="profile/user-picture.jsp" %>	
    		</c:when>
    		<c:when test="${event eq 'openrange' }">
    			<%@ include file="profile/profile-openrange.jsp" %>	
    		</c:when>
    	</c:choose>
    </div>
    <div class="right-content" style="position:absolute; top:0;border-radius:15px;width:160px;padding-bottom:0px;">
		<%@ include file="main/right-content.jsp" %>  
		</div>
    <%@ include file="chat.jsp" %>
</body>
</html>