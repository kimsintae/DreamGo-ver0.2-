<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css"/>
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
                <a class="navbar-brand" href="${pageContext.request.contextPath}/intro">Dream Go!</a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                    <li><a href="${pageContext.request.contextPath}/intro">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/info/job_info">직업정보</a></li>
                    <li><a href="${pageContext.request.contextPath}/info/sch_info">학교정보</a></li>
                    <li><a href="${pageContext.request.contextPath}/info/dep_info">학과정보</a></li>
                    <li><a href="${pageContext.request.contextPath}/board/list/1">우리끼리</a></li>
                    <li><a href="${pageContext.request.contextPath}/aptitudeTest/apti_test">적성 심리 검사</a></li>
                </ul>

		                <div class="modal fade" id="loginModal" role="dialog">
		                    <div class="modal-dialog">

		                        <div class="modal-content">
		                            <div class="modal-header">
		                                <button type="button" class="close" data-dismiss="modal">&times;</button>
		                                <h4 class="modal-title">Login</h4>
		                            </div>
		
		                            <div class="modal-body">
		
		                                <form action="${pageContext.request.contextPath}/admin/login" method="post" id="loginForm">
		                                    <div class="form-group">
		                                        <label for="email">Email:</label>
		                                        <input type="email" class="form-control" name="email" id="email" placeholder="Enter email">
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
		                                    <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/join">회원가입</a>
		                                </div>
		                            </div>
		                        </div>
		
		                    </div>
		                </div>



                <ul class="nav navbar-nav navbar-right">
                <c:choose>	
	                <c:when test="${loginUser==null}">
	                	 <li><a href="#" data-toggle="modal" data-target="#loginModal"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
	                 </c:when>
	                 <c:otherwise>
	                 	<li><a class="btn btn-default" href="${pageContext.request.contextPath}/admin/logout"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
	                 </c:otherwise>
                 </c:choose>	
                </ul>
            </div>
        </div>
    </nav>
    <script type="text/javascript">
    	var msg = '${msg}';
    	if(msg=='failed'){alert('아이디 혹은 비밀번호가 틀렸습니다.');}
    
    </script>
</body>
</html>