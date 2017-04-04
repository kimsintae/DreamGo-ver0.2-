<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<html>
<head>
<style type="text/css">
	      /* header css*/
        /* Remove the navbar's default margin-bottom and rounded borders */
        
        .navbar {
            margin-bottom: 0;
			border:none;
            background:#588c7e;
            font-size: 20px;
        }
        
       .navbar-inverse .navbar-nav>li>a{
        	  color: black;
        }
        /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
        
        .row.content {
            height: 450px
        }
        
        .logout{
        	background: white;
        	background-color: transparent;
        	border: none;
        	font-size:20px;
        }
        /* Set gray background color and 100% height */
        
        .sidenav {
            padding-top: 20px;
            background-color: white;
            height: 100%;
        }

	   /* Set black background color, white text and some padding */
        
        .footer {
			color: black;
            padding: 15px;

        }
        /* On small screens, set height to 'auto' for sidenav and grid */
        
        @media screen and (max-width: 767px) {
            .sidenav {
                height: auto;
                padding: 15px;
            }
            .row.content {
                height: auto;
            }
            
        }
	
	
		/* 폰트 적용 */
		@FONT-FACE {
			font-family: 'BMJUA';
			src: url("${pageContext.request.contextPath}/resources/font/BMJUA.ttf") format('truetype');
		}
		
		body{
			font-family: BMJUA;
		}
</style>

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
                    <li><a href="${pageContext.request.contextPath}/aptitudeTest/apti_test">적성 심리 검사</a></li>
                    <li><a href="${pageContext.request.contextPath}/board/list/1">우리끼리</a></li>
                    <li><a href="${pageContext.request.contextPath}/board/chattingPage">수다방</a></li>
                    <c:if test="${loginUser!=null}">
                    <li><a href="${pageContext.request.contextPath}/modifyForm">회원 정보수정</a></li>
                    </c:if>
                </ul>

		                <div class="modal fade" id="loginModal" role="dialog">
		                    <div class="modal-dialog">

		                        <div class="modal-content">
		                            <div class="modal-header">
		                                <button type="button" class="close" data-dismiss="modal">&times;</button>
		                                <h4 class="modal-title">Login</h4>
		                            </div>
		
		                            <div class="modal-body">
		
		                                <form action="${pageContext.request.contextPath}/login" method="post" id="loginForm">
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
		                                    <a class="btn btn-default" href="${pageContext.request.contextPath}/join">회원가입</a>
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
	                 	<li><a class="btn btn-default logout" href="${pageContext.request.contextPath}/logout"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
	                 </c:otherwise>
                 </c:choose>	
                </ul>
            </div>
        </div>
    </nav>
    <script type="text/javascript">
    	var msg = '${msg}';
    	if(msg=='failed'){alert('아이디 혹은 비밀번호가 틀렸습니다.');}
    
    	//제한에 걸릴경우 발생하는 메세지
    	var auth = '${param.auth}';
    	if(auth=='denied'){alert("글쓰기가 제한 되어있습니다.")};
    	if(auth=='unlogin'){alert("로그인 후에 이용해주세요.")};
    </script>
</body>
</html>