<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<!DOCTYPE html>
<html lang="ko">
<head>
  <title></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
  .admin-register label{
    margin:10px;
    width:100px;
  }
  .form-group p {
    color:red;
    size:10px;
    margin-left:120px;
  }
</style>
<script>
$(function(){

  $("input").focus(function(){
    $(this).css('background-color','lightgreen');
  })
  $("input").focusout(function(){
    $(this).css('background-color','white');
  })

  idCheck();
  nameCheck();
  pwdCheck();
  pwdCheck2();
  
  
  var duplStatus = false;

  // submit
  $("#admsubmit").on('click',function(){

    if (idCheck() == false) {
      $("#admidc").focus();
      return false;
    }
    
    if (duplStatus == false) {
    	$("#admidc").focus();
    	return false;
    }

    if (nameCheck() == false) {
      $("#admname").focus();
      return false;
    }

    if (pwdCheck() == false) {
      $("#admpwd").focus();
      return false;
    }

    if (pwdCheck2() == false) {
      $("#admpwd2").focus();
      return false;
    }

  });
  // db에서 정보를 가져와서 이미 있는 아이디인지 체크하는 업무로직

  
  $("#btndpl").on('click', function() {
    $("#iddupl").addClass('hide');
    $("#idposs").addClass('hide');
    
    // cb 사용
    idDuplCheck(function(result) {
    	if (result == true) {
	    	duplStatus = true;
	    }    	
    });

  });

});

function idDuplCheck(cb) {
	// ajax
	 var checkId = $("#admidc").val()
	
	 $.ajax({
	    	type:"GET",
	    	url:"duplCheck",
	    	data:{id:checkId},
	    	dataType:"text",
	    	success:function(result){
	    		if (result == 'dupl') {
	    			$("#iddupl").removeClass('hide');
	    			cb(false);
	    		} else {
	    			$("#idposs").removeClass('hide');
	    			cb(true);
	    		}
	    	}
	    });

}


function idCheck() {

  $("#admidc").on('keyup',function(){
    if($("#admidc").val().length < 5) {
      $("#idwrn").removeClass('hide');
      $("#btndpl").prop("disabled",true);
    } else if ($("#admidc").val().length >= 5) {
      $("#idwrn").addClass('hide');
      $("#btndpl").prop("disabled",false);
    }
  });

  $("#admidc").focus('keyup',function(){
    if($("#admidc").val().length == 0) {
      $("#idmust").removeClass('hide');
    }
  });
  $("#admidc").focusout('keyup',function(){
    if($("#admidc").val().length > 0) {
      $("#idmust").addClass('hide');
    }
  });

  if ($("#admidc").val().length >=5 ){
    return true;
  } else {
    return false;
  }

}

function nameCheck() {

  $("#admname").focus('keyup',function(){
    if($("#admname").val().length == 0) {
      $("#namewrn").removeClass('hide');
    }
  });
  $("#admname").focusout('keyup',function(){
    if($("#admname").val().length > 0) {
      $("#namewrn").addClass('hide');
    }
  });

  if($("#admname").val().length > 0 ) {
    return true;
  } else {
    return false;
  }

}

function pwdCheck() {
  $("#admpwd").focus('keyup',function(){
    if($("#admpwd").val().length == 0) {
      $("#pwdmust").removeClass('hide');
    }
  });
  $("#admpwd").focusout('keyup',function(){
    if($("#admpwd").val().length > 0) {
      $("#pwdmust").addClass('hide');
    }
  });
  $("#admpwd").on('keyup',function(){
    if ($("#admpwd").val().length < 6) {
      $("#pwdwrn").removeClass('hide');
    } else if ($("#admpwd").val().length >= 6) {
      $("#pwdwrn").addClass('hide');
    }
  })

  if ($("#admpwd").val().length < 6 ) {
    return false;
  } else {
    return true;
  }

}

function pwdCheck2() {
  $("#admpwd2").focus('keyup',function(){
    if($("#admpwd2").val().length == 0) {
      $("#pwd2must").removeClass('hide');
    }
  });
  $("#admpwd2").focusout('keyup',function(){
    if($("#admpwd2").val().length > 0) {
      $("#pwd2must").addClass('hide');
    }
  });

  $("#admpwd2").on('change', function() {
    if ($("#admpwd").val() != $("#admpwd2").val()) {
      $("#pwdwrn2").removeClass('hide');
    } else {
      $("#pwdwrn2").addClass('hide');
    }
  })

  $("#admpwd").on('change', function() {
    if ($("#admpwd").val() != $("#admpwd2").val()) {
      $("#pwdwrn2").removeClass('hide');
    } else {
      $("#pwdwrn2").addClass('hide');
    }
  })

  if ($("#admpwd").val() != $("#admpwd2").val()) {
    return false;
  } else {
    return true;
  }
}

</script>
<body>
  <div class="container admin-register">
    <div class="row">
      <div class="col-xs-offset-2 col-xs-6" style="margin-left:210px;">
        <div class="panel panel-primary">
          <div class="panel-heading">
            <h3>New Admin</h3>
          </div>
          <div class="panel-body">
            <form method="post" action="adminregister">
              <div class="form-group">
                <label for="">ID</label>
                <input type="text" name="id" id="admidc" />
                <button type="button" class="btn btn-danger btn-xs" style="margin-left:20px;" id="btndpl" disabled=true>중복확인</button>
                <p id="idwrn" class="hide">관리자 ID는 5자 이상 작성해야 합니다</p>
                <p id="idmust" class="hide">관리자 ID는 필수 입력요소입니다.</p>
	            <p id="iddupl" class="hide" style="margin-left:120px;">이미 존재하는 ID입니다.</p>                
               	<p id="idposs" class="hide" style="margin-left:120px; color:green;">사용할 수 있는 ID입니다.</p>

              </div>
              <div class="form-group">
                <label for="">관리자명</label>
                <input type="text" name="name" id="admname">
                <p id="namewrn" class="hide">관리자 이름은 필수 입력요소입니다</p>
              </div>
              <div class="form-group">
                <label for="">비밀번호</label>
                <input type="password" name="pwd" id="admpwd">
                <p id="pwdwrn" class="hide">비밀번호는 6자 이상 입력해야 합니다.</p>
                <p id="pwdmust" class="hide">비밀번호는 필수 입력요소입니다.</p>
              </div>
              <div class="form-group">
                <label for="">비밀번호 확인</label>
                <input type="password" id="admpwd2">
                <p id="pwdwrn2" class="hide">비밀번호가 일치하지 않습니다.</p>
                <p id="pwd2must" class="hide">비밀번호 확인은 필수 입력요소입니다.</p>
              </div>
              <div class="form-group">
                <label>보안레벨</label>
                <select name="secLevel" style="width:180px;">
                  <option value="1">level 1</option>
                  <option value="2">level 2</option>
                </select>
              </div>
              <p style="font-size:12px; margin-left:10px; color:lightgrey">보안레벨 3(*최고 관리자) 부여는 최고 관리자에게 문의하세요</p>
              <div class="form-group text-right">
                <button type="submit" class="btn btn-primary" id="admsubmit">가입</button>
              </div>
            </form>

          </div>
        </div>


      </div>

    </div>
  </div>


</body>
</html>
