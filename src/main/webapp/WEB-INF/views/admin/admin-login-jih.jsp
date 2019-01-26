<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<script>


</script>


<body style="background-color: #282828;">
	<div class="container">
    <div class="row">
      <div class="col-xs-offset-4 col-xs-4">
        <div class="panel panel-default" style="margin-top:300px;">
          <div class="panel-heading">
            <p>Administrator</p>

          </div>
          <div class="panel-body">
            <form action="adminLogin" method="post">
              <div class="row">
                <div class="col-xs-8">
                  <div class="form-group">
                    <label for="" style="width:25px;">ID</label>
                    <input type="text" name="id">
                  </div>
                  <div class="form-group">
                    <label for="" style="width:25px;">PW</label>
                    <input type="password" name="pwd">
                  </div>
                </div>
                <div class="col-xs-4">
                  <div class="form-group">
                    <button class="btn btn-primary" style="width:90px; height:70px;">Sign In</button>
                  </div>
                </div>
              </div>
            </form>
            <c:if test="${param.login eq 'fail' }">
	            <p id="denine" style="color:red; font-size:12px;">로그인이 필요한 페이지 입니다.</p>
            </c:if>
            <c:if test="${param.login eq 'exile' }">
	            <p id="denine2" style="color:red; font-size:12px;">관리자 권한이 동결된 계정입니다.</p>
            </c:if>
            <p style="color:lightgrey; font-size:12px;">새 관리자 등록은 최고 관리자에게 문의하세요</p>
          </div>
        </div>


      </div>
    </div>
	</div>
</body>
</html>
