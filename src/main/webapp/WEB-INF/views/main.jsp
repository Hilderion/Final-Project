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

	<c:if test="${fail eq 'fail' }">
	<%@ include file="users/home-hjs.jsp" %>
	</c:if>
	<c:if test="${empty fail}">	
	<%@ include file="topbar.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-md-2 left-content">
            	<%@ include file="main/left-content.jsp" %>        
		    </div>
		    <div class="col-md-6 main-content">
            	<%@ include file="main/main-content.jsp" %>    
            </div>
            <div class="col-md-3 thirdcol-content">
            	<%@ include file="main/thirdcol-content.jsp" %>
            </div>
            <div class="right-content" style="width:160px;border-radius:15px;padding-bottom:0px;">
				<%@ include file="main/right-content.jsp" %>  
			</div>
        </div>
    </div>
    <%@ include file="chat.jsp" %>
    </c:if>
</body>
</html>