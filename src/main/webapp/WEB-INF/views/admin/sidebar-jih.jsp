<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<script>
$(function(){
  $("li").hover(function(){
    $(this).css("background-color","green");
  },  function() {
    $(this).css("background-color","#282828")});
})
</script>
<style>
li {
	margin: 10px;
}

.panel {
	margin-top: 50px;
}
</style>
<div class="col-xs-2 hidden-xs" style="height:720px;">
  <ul style="color:#e1e1e1; font-size:15px;">
    <li><a href="/fa/admin">Home</a></li>
    <c:if test="${LOGIN_ADMIN.secLevel gt 2 }">
	    <li><a href="/fa/admin/adminConfig">관리자 생성</a></li>
    </c:if>
    <c:if test="${LOGIN_ADMIN.secLevel gt 1 }">
	    <li><a href="/fa/admin/adminList">관리자 목록</a></li>
    </c:if>
    <li><a href="/fa/admin/repBoard/boardList">문의 게시판</a></li>
    <li><a href="/fa/admin/case">신고 관리</a></li>
    <li class="hidden"><a href="/fa/admin/repBoard/boardWriteForm">문의글 작성(test)</a></li>
    <li class="hidden"><a href="/fa/admin/casetest">신고하기(test)</a></li>
    <li><a href="/fa/admin/repad">광고현황</a></li>
    <li><a href="/fa/admin/repuser">유저목록</a></li>
  </ul>
</div>
