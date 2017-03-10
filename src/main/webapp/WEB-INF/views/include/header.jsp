<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<c:set var="ctx" value="<%=request.getContextPath()%>" scope="application" />
<html>
<head>
<script src="../resources/js/main.js"></script>
<link rel="stylesheet" href="../resources/css/main.css"/>
</head>
<body>
 <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${ctx}/intro">Dream Go!</a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                    <li><a href="${ctx}/intro">Home</a></li>
                    <li><a href="${ctx}/info/job_info">직업정보</a></li>
                    <li><a href="${ctx}/info/sch_info">학교정보</a></li>
                    <li><a href="${ctx}/info/dep_info">학과정보</a></li>
                    <li><a href="${ctx}/board/list">우리끼리</a></li>
                    <li><a href="${ctx}/aptitudeTest/apti_test">적성 심리 검사</a></li>
                </ul>



		            <!-- login 버튼 누르면 나오는 팝업창 -->
		                <div class="modal fade" id="loginModal" role="dialog">
		                    <div class="modal-dialog">
		
		                        <!-- 로그인 창 -->
		                        <div class="modal-content">
		                            <div class="modal-header">
		                                <button type="button" class="close" data-dismiss="modal">&times;</button>
		                                <h4 class="modal-title">Login</h4>
		                            </div>
		
		                            <div class="modal-body">
		
		                                <form action="/login" method="post" id="loginForm">
		                                    <div class="form-group">
		                                        <label for="email">Email:</label>
		                                        <input type="email" class="form-control" name="id" id="email" placeholder="Enter email">
		                                    </div>
		                                    <div class="form-group">
		                                        <label for="pwd">Password:</label>
		                                        <input type="password" class="form-control" name="password" id="pwd" placeholder="Enter password">
		                                    </div>
		                                    <div class="checkbox">
		                                        <label>
		                                            <input type="checkbox"> Remember me</label>
		                                    </div>
		                                </form>
		                            </div>
		                            <div class="modal-footer">
		                                <div class="col-sm-6 text-center">
		                                    <button type="submit" form="loginForm" class="btn btn-default">확인</button>
		                                </div>
		                                <div class="col-sm-6 text-center">
		                                    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#joinModal" data-dismiss="modal">회원가입</button>
		                                </div>
		                            </div>
		                        </div>
		
		                    </div>
		                </div>
		                <!--//loginModal-->
		                
		                <!-- 회원가입 -->
		                <div id="joinModal" class="modal fade" role="dialog">
						    <div class="modal-dialog">
						        <!-- join -->
						        <div class="modal-content">
						            <div class="modal-header">
						                <button type="button" class="close" data-dismiss="modal">&times;</button>
						                <h4 class="modal-title">회원가입</h4>
						            </div>
						            <div class="modal-body">
						                <form id="joinForm" action="/join" method="post" enctype="multipart/form-data">
						                    <div class="row email_row form-group">
						                        <label class="col-sm-4" for="email">이메일</label>
						                        <div class="col-sm-6">
						                            <input type="text" id="email" name="email" class="col-sm-12 form-control" placeholder="kimstcool01@naver.com" />
						                        </div>
						                        <div class="col-sm-2">
						                            <button type="button" class="btn btn-default">인증</button>
						                        </div>
						                        <!-- 인증 되면 회원가입 진행 -->
						                    </div>
						                    <!--//email_row-->
						
						                    <div class="row pwd_row form-group">
						                        <label class="col-sm-4" for="password">비밀번호</label>
						
						                        <div class="col-sm-6">
						                            <input type="password" id="password" name="password" class="col-sm-12 form-control" />
						                        </div>
						                        <div class="col-sm-2"></div>
						                    </div>
						                    <!--//pwd_row-->
						
						                    <div class="row pwd_row form-group">
						                        <label class="col-sm-4" for="pwd_check">비밀번호 확인</label>
						                        <div class="col-sm-6">
						                            <input type="password" id="pwd_check" name="pwd_check" class="col-sm-12 form-control" />
						                        </div>
						                        <div class="col-sm-2"></div>
						                    </div>
						                    <!--//pwd_row-->
						
						                    <div class="row nickname_row form-group">
						                        <label class="col-sm-4" for="nickname">닉네임</label>
						                        <div class="col-sm-6">
						                            <input type="text" id="nickname" name="nickname" maxlength="10" class="col-sm-12 form-control" placeholder="10자 이내" />
						                        </div>
						                        <div class="col-sm-2"></div>
						                    </div>
						                    <!--//nickname_row-->
						                    <div class="row nickname_row form-group">
						                        <label class="col-sm-4" for="profile">프로필사진</label>
						                        <div class="col-sm-6">
						                           <label class="col-sm-12 text-center" for="profile" id="profileArea">
						                               <img src="" class="img-rounded profile_box" alt="" width="150" height="150" title="클릭해서 원하는 사진 등록">
						                            <input type="file" id="profile" name="profile" class="col-sm-12 form-control" accept="image/*" />
						                           </label>
						                           <span id="img_name" class="text-center col-sm-12"></span>
						                        </div>
						                        <div class="col-sm-2"></div>
						                    </div>
						                    <!--//nickname_row-->
						
						                    <div class="row person_type_row form-group">
						                        <label class="col-sm-4" for="#typeSelector">구분</label>
						                        <div class="col-sm-6">
						                            <select class="form-control" id="typeSelector" name="type">
						                                <option value="e" selected>초등학생</option>
						                                <option value="m">중학생</option>
						                                <option value="h">고등학생</option>
						                                <option value="u">대학생</option>
						                                <option value="o">일반인</option>
						                            </select>
						                        </div>
						                        <div class="col-sm-2"></div>
						                    </div>
						                    <!--//person_type_row-->
						                    
											<div class="row dream_row form-group">
						                        <label class="col-sm-4" for="dream">나의 꿈은?</label>
						                        <div class="col-sm-6">
						                            <input type="text" id="dream" name="nickname" class="col-sm-12 form-control" placeholder="꿈은 이루어집니다" />
						                        </div>
						                        <div class="col-sm-2"></div>
						                    </div>
						                    <!--//dream_row-->
						
						                </form>
						                <!--//joinForm-->
						            </div>
						            <div class="modal-footer">
						                <button type="submit" form="joinForm" class="btn btn-default col-sm-12">가입</button>
						            </div>
						        </div>
					
					    </div>
					</div>
					<!--//joinModal-->



                <ul class="nav navbar-nav navbar-right">
                 <li><a href="#" data-toggle="modal" data-target="#loginModal"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                </ul>
            </div>
        </div>
    </nav>
</body>
</html>