<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
    <div class="row margin20">
        <div class="col-lg-9">
		  <form class="form-horizontal" action="/action_page.php">
		    <div class="form-group">
		      <label class="control-label col-sm-2" for="email">이메일:</label>
		      <div class="col-sm-10">
		        <input type="email" class="form-control" id="email" value="${user.email }" placeholder="이메일을 입력해주세요" name="email">
		      </div>
		    </div>
		    <div class="form-group">        
		      <div class="col-sm-offset-2 col-sm-10">
		          <button class="btn btn-lg btn-primary btn-block signup-btn" type="submit">수정</button>
		          <a href="profileInfo.do" class="btn btn-lg btn-danger btn-block signup-btn">취소</a>
		      </div>
		    </div>
		  </form>
       </div>
    </div>
</div>