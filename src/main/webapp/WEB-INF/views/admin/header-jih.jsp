<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<div class="row text-right" style="background-color:#282828; height:100px; padding-right:10px;">
  <p style="color:white;">관리자 <span style="color:red;">${LOGIN_ADMIN.name }</span>님 환영합니다.</P>
  <p style="color:white;">관리자 LV :  <span style="color:green">${LOGIN_ADMIN.secLevel }</span></p>
  <input type="hidden" value="${LOGIN_ADMIN.secLevel }" id="login_admin_seclevel">	
  <a class="btn btn-xs btn-danger" href="/fa/admin/logout">로그아웃</a>
</div>
