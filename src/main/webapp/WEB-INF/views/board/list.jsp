<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	                    <div class="col-sm-9">
							<a href="${pageContext.request.contextPath}/board/write" class="btn btn-default glyphicon glyphicon-pencil write_btn" title="글쓰기"></a>
	                    </div>
		                    <form action="board.html" method="get" id="selectorForm">
		                        <div class="col-sm-1 text-right">
		                            <select name="order" class="orderSelector selector form-control">
		                                <option value="recent">최신순</option>
		                                <option value="readCnt">조회순</option>
		                                <option value="reply">댓글순</option>
		                            </select>
		                        </div>
		
		                        <div class="col-sm-1 text-right">
		                            <select name="type" class="typeSelector selector form-control">
		                                <option value="list">전체</option>
		                                <option value="career">진로</option>
		                                <option value="school">학교</option>
		                                <option value="job">직업</option>
		                                <option value="talk">수다</option>
		                            </select>
		                        </div>
		                        <div class="col-sm-1">
		                            <button type="submit" form="selectorForm" class="btn btn-default">정렬</button>
		                        </div>
		                    </form>
		            </div>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>제목</th>
                                <th>내용</th>
                                <th>작성자</th>
                                <th>분류</th>
                                <th>조회수</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach var="board" items="${list}">
	                            <tr>
	                                <td>1</td>
	                                <td class="title" title="웹프로그래머가 되고 싶습니다."><a href="${ctx}/board/read">${board.title}</a><span class="badge" title="댓글 수">5</span></td>
	                                <td class="contentTd"><span class="content_span">${board.content}</span>
	                                </td>
	                                <td class="writer"><img src="c:\dream_go\upload\${board.profile}" class="img-thumbnail" alt="Cinque Terre" width="35" height="35">${board.writer}</td>
	                                <td class="cate">${board.type}</td>
	                                <td class="readCnt">${board.readCnt}</td>
	                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
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

</body>

</html>