<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="global-links">
                        <a href="profile.do?userNo=${loginUser.no }">
                          <img src="resources/image/${loginUser.profile }" style="border-radius:50%"/> ${loginUser.name }
                        </a>
                        <a href="javascript:void(0)">
                          <img src="http://brassnecktheatre.com/wp-content/uploads/2013/11/news-icon.png" /> 뉴스피드
                          <span class="counter">
                            <i class="fa fa-ellipsis-h"></i>
                          </span>
                        </a>
                        <a href="receivemessage.do">
                          <img src="http://icons.iconarchive.com/icons/wineass/ios7-redesign/512/Messages-icon.png" /> 받은 메세지함
                          <c:if test="${messageCount ne 0}">
                          	<span class="counter">${messageCount}</span>
                          </c:if>
                        </a>
                        <div class="group-content">
                         <p>둘러보기</p>
                          <a href="javascript:void(0)">
                            <img src="http://icons.iconarchive.com/icons/custom-icon-design/pretty-office-13/512/Webpage-icon.png" /> 페이지
                          </a>
                          <a href="request" id="dummy_0">
                            <img src="http://icons.iconarchive.com/icons/chanut/outer-space/24/Astronaut-icon.png" /> 문의사항
                          </a>
                          <a href="ad">
                            <img src="http://icons.iconarchive.com/icons/chanut/outer-space/24/Space-Exploration-icon.png" /> 광고요청
                          </a>
                        </div>
                    </div>
                    
