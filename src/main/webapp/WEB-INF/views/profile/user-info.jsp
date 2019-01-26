<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <input type="hidden" id="nowUserNo" value="${user.no }"/>
       <div class="row margin20">
            <div class="col-lg-10 cont-tab">
                <div class="detail-info border">
                    <i class="fas fa-user"></i> 정보
                </div>
                <div class="row cont-box marginLR0 border">
                    <div class="col-lg-3">
                       <div class="side-info">
                            <a href="profileInfo.do?userNo=${user.no }">개요</a>
                            <a href="javascript:void(0)" id="profileInfoEducation">학력</a>
                            <a href="javascript:void(0)" id="profileInfoAddress">주소</a>
                            <a href="javascript:void(0)" id="profileInfoTelAndPrimary">연락처및기본정보</a>
                       </div>
                    </div>
                    <div class="col-lg-9">
                        <div class="side-cont">
                        	<div id="mainInfoOfUser">
                        		<h4 style="color: black;">이름: <span>${user.name }</span></h4>
	                        	<h4 style="color: black;">생일: <span>${user.birth }</span></h4>
	                        	<h4 style="color: black;">성별: <span>
	                        	<c:if test="${user.sex eq 'M' }">
	                        		남자
	                        	</c:if>
	                        	<c:if test="${user.sex eq 'F' }">
	                        		여자
	                        	</c:if>	                        		
	                        	</span></h4>
	                        	<h4 style="color: black;">이메일: <span>${user.email }</span></h4>
                        	</div>
                        	
                        	
                        	<div id="educationOfUser" style="display:none;">
	                        	<c:if test="${user.education eq null }">
	                        		<h4>학력을 입력해주세요</h4>
	                        		<a href="javascript:void(0)" class="btn btn-md btn-primary" id="modifyKeyword-education">등록하기</a>
	                        	</c:if>
	                        	<c:if test="${user.education ne null }">
	                        		<h4>학력: ${user.education }</h4>
	                        		<a href="javascript:void(0)" class="btn btn-md btn-info" id="modifyKeyword-education">수정하기</a>
	                        	</c:if>
                        	</div>
                        	
                        	<div id="addressOfUser" style="display:none;">
                        		<c:if test="${user.address eq null }">
                        			<h4>주소을 입력해주세요</h4>
                        			<a href="javascript:void(0)" class="btn btn-md btn-primary" id="modifyKeyword-address">등록하기</a>
                        		</c:if>
                        		<c:if test="${user.address ne null }">
                        			<h4>주소: ${user.address }</h4>
                        			<a href="javascript:void(0)" class="btn btn-md btn-info" id="modifyKeyword-address">수정하기</a>
                        		</c:if>                        	
                        	</div>
                        	
                        	<div id="telAndPrimaryOfUser" style="display:none;">
                        		<c:if test="${user.tel eq null }">
                        			<h4>전화번호를 입력해주세요</h4>
                        			<a href="javascript:void(0)" class="btn btn-md btn-primary" id="modifyKeyword-tel">등록하기</a>
                        		</c:if>
                        		<c:if test="${user.tel ne null }">
                        			<h4>전화번호: ${user.tel }</h4>
                        			<a href="javascript:void(0)" class="btn btn-md btn-info" id="modifyKeyword-tel">수정하기</a>
                        		</c:if>                          		
                        	</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<script type="text/javascript">
$(function() {
	$('#profileInfoEducation').click(function(event) {
		$('#educationOfUser').attr('style', 'display:')
		$('#addressOfUser').attr('style', 'display:none')
		$('#telAndPrimaryOfUser').attr('style', 'display:none')
		$('#mainInfoOfUser').attr('style', 'display:none')
	});
	
	$('#profileInfoAddress').click(function(event) {
		$('#addressOfUser').attr('style', 'display:')
		$('#educationOfUser').attr('style', 'display:none')
		$('#telAndPrimaryOfUser').attr('style', 'display:none')
		$('#mainInfoOfUser').attr('style', 'display:none')
	});
	
	$('#profileInfoTelAndPrimary').click(function(event) {
		$('#telAndPrimaryOfUser').attr('style', 'display:')
		$('#educationOfUser').attr('style', 'display:none')
		$('#addressOfUser').attr('style', 'display:none')
		$('#mainInfoOfUser').attr('style', 'display:none')
	});
	
	$(".side-cont").on('click', "[id^=modifyKeyword]", function(event) {
		$('#modifyFormDiv').remove();
		var modifyKeyword = $(this).attr("id").replace('modifyKeyword-', '');
		var keyword = "";
		var aHtml = "";
		if ("education" == modifyKeyword) {
			keyword = "학력";
			$('#modifyKeyword-education').attr('style', 'display:none');
		}else if ("address" == modifyKeyword) {
			keyword = "주소";
			$('#modifyKeyword-address').attr('style', 'display:none');
		}else {
			keyword = "전화번호";
			$('#modifyKeyword-tel').attr('style', 'display:none');
		}
		
		var html = "";
		html += '<div class="row margin20" id="modifyFormDiv">';
		html += '<div class="col-lg-12">';
		html += '<div class="form-group">';
		html += '<label class="control-label col-sm-2" for="email">'+keyword+':</label>';
		html += '<div class="col-sm-10">';
		if ("education" == modifyKeyword) {
			html += '<input type="text" class="form-control" value="" placeholder="'+keyword+'을 입력해주세요" name="email" id="modifyInputContents">';
		} else if ("address" == modifyKeyword) {
			html += '<input type="text" class="form-control" value="" placeholder="'+keyword+'을 입력해주세요" name="address" id="modifyInputContents">';
		} else {
			html += '<input type="text" class="form-control" value="" placeholder="'+keyword+'을 입력해주세요" name="tel" id="modifyInputContents">';
		}
		html += '</div>';
		html += '</div>';
		html += '<div class="form-group">';
		html += '<div class="col-sm-offset-2 col-sm-10" id="buttonDiv" style="margin-top:10px;">';
		html += '<a href="javascript:void(0)" class="btn btn-md btn-primary signup-btn" id="modifyUserSave-'+modifyKeyword+'" style="display:inline-block;">저장</a>';
		html += '<a href="javascript:void(0)" class="btn btn-md btn-danger signup-btn" id="modifyFormCancel" style="display:inline-block;">취소</a>';
		html += '</div>';
		html += '</div>';
		html += '</div>';
		html += '</div>';
		
		if ("education" == modifyKeyword) {
			$('#educationOfUser').prepend(html);
		} else if ("address" == modifyKeyword) {
			$('#addressOfUser').prepend(html);
		} else {
			$('#telAndPrimaryOfUser').prepend(html);
		}
		
		$('.side-cont').on('click', '[id^=modifyFormCancel]', function(event) {
			$('#modifyFormDiv').remove();
			if ("education" == modifyKeyword) {
				keyword = "학력";
				$('#modifyKeyword-education').attr('style', '');
			}else if ("address" == modifyKeyword) {
				keyword = "주소";
				$('#modifyKeyword-address').attr('style', '');
			}else {
				keyword = "전화번호";
				$('#modifyKeyword-tel').attr('style', '');
			}
		});
	});
	

	$('.side-cont').on('click', '[id^=modifyUserSave]', function(event) {
		var userNo = $('#nowUserNo').val();
		var insertHtml = "";
		var keyword = $('[id^=modifyUserSave-]').attr("id").replace('modifyUserSave-', '');
		$.ajax({
			url: "profileInfoModify.do",
			data: {modifyInputContents: $('#modifyInputContents').val(), keyword: keyword, userNo: userNo },
			dataType: 'json',
			success: function(newUser) {
				if ("education" == keyword) {
					if (newUser.education != null) {
 						insertHtml += '<h4>학력: '+newUser.education+'</h4>';
 						insertHtml += '<a href="javascript:void(0)" class="btn btn-md btn-info" id="modifyKeyword-'+keyword+'">수정하기</a>'
					} else {
						insertHtml += '<h4>학력를 입력해주세요</h4>';
						insertHtml += '<a href="javascript:void(0)" class="btn btn-md btn-primary" id="modifyKeyword-'+keyword+'">등록하기</a>'
					}
				} else if ("address" == keyword) {
					if (newUser.address != null) {
						insertHtml += '<h4>주소: '+newUser.address+'</h4>';
						insertHtml += '<a href="javascript:void(0)" class="btn btn-md btn-info" id="modifyKeyword-'+keyword+'">수정하기</a>'
					} else {
						insertHtml += '<h4>주소를 입력해주세요</h4>';
						insertHtml += '<a href="javascript:void(0)" class="btn btn-md btn-primary" id="modifyKeyword-'+keyword+'">등록하기</a>'
					}
				} else {
					if (newUser.tel != null) {
						insertHtml += '<h4>전화번호: '+newUser.tel+'</h4>';
						insertHtml += '<a href="javascript:void(0)" class="btn btn-md btn-info" id="modifyKeyword-'+keyword+'">수정하기</a>'
					} else {
						insertHtml += '<h4>전화번호를 입력해주세요</h4>';
						insertHtml += '<a href="javascript:void(0)" class="btn btn-md btn-primary" id="modifyKeyword-'+keyword+'">등록하기</a>'
					}
				}
				
				if ("education" == keyword) {
					$('#educationOfUser').children().remove();
					$('#educationOfUser').prepend(insertHtml);
				} else if ("address" == keyword) {
					$('#addressOfUser').children().remove();
					$('#addressOfUser').prepend(insertHtml);
				} else {
					$('#telAndPrimaryOfUser').children().remove();
					$('#telAndPrimaryOfUser').prepend(insertHtml);
				}
				
			}
		});
	});
	
})
</script>