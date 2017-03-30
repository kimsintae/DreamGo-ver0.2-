<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Dream Go!</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/list.css?v=1" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  
    <script src="${pageContext.request.contextPath}/resources/js/list.js?v=1"></script>
</head>

<body>
<!-- header -->
<%@include file="../include/header.jsp" %>

    <div class="container-fluid text-center">
        <div class="row content">
            <div class="col-sm-1 sidenav">
            </div>
            <div class="col-sm-10 text-left">
                <div class="jumbotron">
                    <h1>우리끼리</h1>
                    <p>알고 있는 것을 공유해보고</p>
                    <p>고민을 털어놓는 공간입니다.!</p>
                </div>


                <!-- 게시판 -->
                <div class="container col-sm-12 board_wrap">
	                <div class="row">
	                    <div class="col-sm-4">
							<a href="${pageContext.request.contextPath}/board/writeForm" class="btn btn-default glyphicon glyphicon-pencil write_btn" title="글쓰기"></a>
	                    </div>
	                    <div class="col-sm-3"></div>
	                    <div class="col-sm-5" >
		                    <form action="board.html" method="get" id="selectorForm">
		                        <div class="col-sm-4 form-group">
		                            <select name="order" class="form-control" id="orderSelector">
								       	<option value="recent">최신순</option>
		                                <option value="readCnt">조회순</option>
		                                <option value="reply">댓글순</option>
								      </select>
		                        </div>
		
		                        <div class="col-sm-4 form-group">
		                            <select name="type" class="form-control" id="typeSelector">
								       	<option value="l">전체</option>
		                                <option value='C'>진로</option>
		                                <option value='S'>학교</option>
		                                <option value='J'>직업</option>
		                                <option value='T'>수다</option>
								      </select>
		                        </div>
		                        <div class="col-sm-2">
		                            <button type="submit" form="selectorForm" class="btn btn-default">정렬</button>
		                        </div>
		                    </form>
		                    </div>
		            </div>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>작성자</th>
                                <th>제목</th>
                                <th class="text-center">분류</th>
                                <th class="text-center">조회수</th>
                                <th>등록일</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach var="board" items="${list}">
                            	<form action="${pageContext.request.contextPath}/board/read/${board.bno}" method="POST" id="form_${board.bno}">
	                            <tr>
	                                <td class="text-center">${board.bno}</td>
	                                <c:choose>
	                                	<c:when test="${board.userNo==loginUser.no}">
		                                	<td class="writer" style="width:25%; color:#e06377;">
			                                <img src="${pageContext.request.contextPath}/resources/upload/${board.profile}" class="img-thumbnail" alt="Cinque Terre" width="35" height="35"/>
			                                	${board.writer}
			                                </td>
	                                	</c:when>
	                                	<c:otherwise>
		                                 	<td class="writer" style="width:25%;">
				                                <img src="${pageContext.request.contextPath}/resources/upload/${board.profile}" class="img-thumbnail" alt="Cinque Terre" width="35" height="35"/>
				                               ${board.writer}
			                                </td>
	                                	</c:otherwise>
	                                </c:choose>
	                                <td class="title" style="width:40%;"><span class="board_title" style="border:none;" onclick="$('#form_${board.bno}').submit();">${board.title}</span><span class="badge" title="댓글 수">5</span></td>
	                                <td class="type text-center">${board.realType}</td>
	                                <td class="readCnt text-center">${board.readCnt}</td>
	                                <td class="regdate"><fmt:formatDate value="${board.regdate}" type="both" dateStyle="short" timeStyle="short"/></td>
	                            </tr>
	                                <input type="hidden" name="thisPage" value="${pageMaker.thisPage}"/>
	                            </form>
                            </c:forEach>
                        </tbody>
                    </table>
                    
                    <!-- 페이징 -->
                    <div class="row">
                    	<div class="col-sm-3"></div>
						<div class="pagination col-sm-8 text-center">
						  ${pagination}
						</div>		
                    </div>
                </div>
                <!--//board_wrap-->
                <div class="row col-sm-12">

                </div>
            </div>
            <div class="col-sm-1 sidenav">
            </div>
        </div>
    </div>
<%@include file="../include/footer.jsp" %>
<script type="text/javascript">
//글쓰기를 선택하면 회원의 권한을 검사
var auth = '${param.auth}';
if(auth=='denied'){alert("글쓰기가 제한 되어있습니다.")};
if(auth=='unlogin'){alert("로그인 후에 이용해주세요.")};
</script>
</body>

</html>