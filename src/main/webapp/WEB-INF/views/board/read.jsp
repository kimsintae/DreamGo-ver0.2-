<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Dream Go!</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="../js/main.js"></script>
    <link rel="stylesheet" href="../css/main.css" />
    <style>
        .table {
            font-size: 15px;
            border-bottom: 1px solid silver;
        }
        
        tbody td {
            line-height: inherit;
        }
        
        .board_detail {
            margin-top: 100px;
        }
        
        .btn_box {
            margin-top: 10px;
        }
        
        .reply {
            border-top: 1px solid #424242;
            border-bottom: 1px solid #424242;
            padding: 10px 0 10px 0;
            margin-top: 20px;
        }
        
        .reply_writer {
            /*          */
            font-size: 17px;
            margin-top: 10px;
        }
        
        .reply_content p {
            background: #fbefcc;
            min-height: 100px;
            font-size: 20px;
        }
        
        .reply_btns {
            margin-top: 15px;
        }
        .reply_box{
        	margin-bottom: 25px;
        }
    </style>
</head>

<body>

  <%@ include file="../include/header.jsp" %>

    <div class="container-fluid text-center">
        <div class="row content">
            <div class="col-sm-2 sidenav"></div>
            <div class="col-sm-8 text-left board_detail">
                <table class="table table-condensed table-responsive">
                    <thead>
                        <tr>
                            <th>제목</th>
                            <th>작성자</th>
                            <th class="text-center">구분</th>
                            <th class="text-center">조회수</th>
                            <th class="text-center">등록일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="col-sm-5">웹프로그래머가 되고 싶습니다.</td>
                            <td class="col-sm-4">
                                <img src="../img/img.jpg" class="img-thumbnail" alt="Cinque Terre" width="50" height="50"> 자바
                            </td>

                            <td class="col-sm-1 text-center">수다</td>
                            <td class="col-sm-1 text-center">23</td>
                            <td class="col-sm-1 text-center">2017-03-03</td>
                        </tr>
                    </tbody>
                </table>

                <div class="row col-sm-12 board_content">
                    <p>
                        되고싶어요 되고싶어요 되고싶어요 되고싶어요 되고싶어요 되고싶어요 되고싶어요 되고싶어요 되고싶어요 되고싶어요 되고싶어요
                        <br/> 되고싶어요 되고싶어요 되고싶어요
                        <br/> 되고싶어요 되고싶어요 되고싶어요
                        <br/> 되고싶어요 되고싶어요 되고싶어요
                    </p>
                </div>

                <div class="col-sm-9"></div>
                <div class="col-sm-3 text-right btn_box">
                    <button class="btn btn-success">수정</button>
                    <button class="btn btn-warning">삭제</button>
                    <button class="btn btn-danger">신고</button>
                </div>

                <!-- 댓글 -->
                <div class="col-sm-12 reply_wrap">
                    <h4 class="reply">댓글</h4>

                    <div class="col-sm-12 reply_box">
                        <div class="col-sm-2 text-center reply_profile">
                            <img src="../img/img.jpg" class="img-thumbnail" alt="Cinque Terre" width="100" height="100">
                            <br/>
                            <div class="reply_writer">
                                <span>별나라여행</span>
                            </div>
                        </div>
                        <!--댓글 내용창-->
                        <div class="col-sm-9 reply_content">
                            <p>잘됬으면 좋겠습니다 !!!
                                <br/> 잘됬으면 좋겠습니다 !!!
                                <br/> 잘됬으면 좋겠습니다 !!!
                                <br/> 잘됬으면 좋겠습니다 !!!
                                <br/> 잘됬으면 좋겠습니다 !!!
                            </p>
                        </div>
                        <div class="col-sm-1 reply_btns">
                            <button class="btn btn-default">수정</button>
                            <button class="btn btn-default">삭제</button>
                        </div>
                        <!--//reply_content-->
                    </div>
                    <!--//reply_box-->

                    <div class="col-sm-12 reply_box">
                        <div class="col-sm-2 text-center reply_profile">
                            <img src="../img/img.jpg" class="img-thumbnail" alt="Cinque Terre" width="100" height="100">
                            <br/>
                            <div class="reply_writer">
                                <span>별나라여행</span>
                            </div>
                        </div>
                        <!--댓글 내용창-->
                        <div class="col-sm-9 reply_content">
                            <p>잘됬으면 좋겠습니다 !!!
                                <br/> 잘됬으면 좋겠습니다 !!!
                            </p>
                        </div>
                        <div class="col-sm-1 reply_btns">
                            <button class="btn btn-default">수정</button>
                            <button class="btn btn-default">삭제</button>
                        </div>
                        <!--//reply_content-->
                    </div>
                    <!--//reply_box-->

                    <div class="col-sm-12 reply_box">
                        <div class="col-sm-2 text-center reply_profile">
                            <img src="../img/img.jpg" class="img-thumbnail" alt="Cinque Terre" width="100" height="100">
                            <br/>
                            <div class="reply_writer">
                                <span>별나라여행</span>
                            </div>
                        </div>
                        <!--댓글 내용창-->
                        <div class="col-sm-9 reply_content">
                            <p>잘됬으면 좋겠습니다 !!!
                                <br/> 잘됬으면 좋겠습니다 !!!
                            </p>
                        </div>
                        <div class="col-sm-1 reply_btns">
                            <button class="btn btn-default">수정</button>
                            <button class="btn btn-default">삭제</button>
                        </div>
                        <!--//reply_content-->
                    </div>
                    <!--//reply_box-->
                </div>
                <!--//reply_wrap-->
                
                
            </div>
            <!--//board_detail-->
            <div class="col-sm-2 sidenav"></div>
        </div>
        <!--//content-->
	</div>
        <div class="container-fluid">

        </div>
</body>

</html>