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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  
    <link rel="stylesheet" href="../resources/css/list.css" />
    <script src="../resources/js/list.js"></script>
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
							<a href="/writeForm" class="btn btn-default glyphicon glyphicon-pencil write_btn" title="글쓰기"></a>
	                    </div>
		                    <form action="board.html" method="get" id="selectorForm">
		                        <div class="col-sm-1 text-right">
		                            <select name="order" class="orderSelector selector">
		                                <option value="recent" selected>최신순</option>
		                                <option value="readCnt">조회순</option>
		                                <option value="reply">댓글순</option>
		                            </select>
		                        </div>
		
		                        <div class="col-sm-1 text-right">
		                            <select name="type" class="typeSelector selector">
		                                <option value="list" selected>전체</option>
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
                                <th class="col-sm-1">No.</th>
                                <th class="col-sm-5">제목</th>
                                <th class="col-sm-1">내용</th>
                                <th class="col-sm-3">작성자</th>
                                <th class="col-sm-1">분류</th>
                                <th class="col-sm-1">조회수</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td class="title" title="웹프로그래머가 되고 싶습니다."><a href="${ctx}/board/read">웹프로그래머가 되고 싶습니다.</a><span class="badge" title="댓글 수">5</span></td>
                                <td class="content"><span class="content_span">안녕하세요. 웹 프로그래머가 꿈인 학생입니다. 자바개발을 기반으로 한 웹 개발자가 되고 싶습니다. 꼭 되고 싶습니다!</span>
                                </td>
                                <td class="writer"><img src="../img/img.jpg" class="img-thumbnail" alt="Cinque Terre" width="35" height="35"> c++</td>
                                <td class="cate">진로</td>
                                <td class="readCnt">23</td>
                            </tr>

                            <tr>
                                <td>1</td>
                                <td class="title" title="웹프로그래머가 되고 싶습니다."><a href="${ctx}/board/read">웹프로그래머가 되고 싶습니다.</a><span class="badge" title="댓글 수">5</span></td>
                                <td class="content"><span class="content_span">안녕하세요. 웹 프로그래머가 꿈인 학생입니다. 자바개발을 기반으로 한 웹 개발자가 되고 싶습니다. 꼭 되고 싶습니다!</span>
                                </td>
                                <td class="writer"><img src="../img/img.jpg" class="img-thumbnail" alt="Cinque Terre" width="35" height="35"> 개발자</td>
                                <td class="type">진로</td>
                                <td class="readCnt">23</td>
                            </tr>

                            <tr>
                                <td>1</td>
                                <td class="title" title="웹프로그래머가 되고 싶습니다."><a href="${ctx}/board/read">웹프로그래머가 되고 싶습니다.</a><span class="badge" title="댓글 수">5</span></td>
                                <td class="content"><span class="content_span">안녕하세요. 웹 프로그래머가 꿈인 학생입니다. 자바개발을 기반으로 한 웹 개발자가 되고 싶습니다. 꼭 되고 싶습니다!</span>
                                </td>
                                <td class="writer"><img src="../img/img.jpg" class="img-thumbnail" alt="Cinque Terre" width="35" height="35"> python</td>
                                <td class="type">진로</td>
                                <td class="readCnt">23</td>
                            </tr>

                            <tr>
                                <td>1</td>
                                <td class="title" title="웹프로그래머가 되고 싶습니다."><a href="${ctx}/board/read">웹프로그래머가 되고 싶습니다.</a><span class="badge" title="댓글 수">5</span></td>
                                <td class="content"><span class="content_span">안녕하세요. 웹 프로그래머가 꿈인 학생입니다. 자바개발을 기반으로 한 웹 개발자가 되고 싶습니다. 꼭 되고 싶습니다!</span>
                                </td>
                                <td class="writer"><img src="../img/img.jpg" class="img-thumbnail" alt="Cinque Terre" width="35" height="35"> john</td>
                                <td class="type">진로</td>
                                <td class="readCnt">23</td>
                            </tr>
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