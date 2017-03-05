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
        
        .board_detaile_contentBar td{
            /* 수직 가운데 정렬이 안된다...*/
        }
        
        .board_detail {
            margin-top: 100px;
        }
        
        .btn_box {
            margin-top: 10px;
        }
        
        .btn_box i{
            font-size: 20px;
            
        }
        
        .reply {
            border-top: 1px solid #424242;
            border-bottom: 1px solid #424242;
            padding: 10px 0 10px 0;
            margin-top: 35px;
        }
        .reply i{
            font-size: 50px;
        }
        
        .reply_writer {
            font-size: 17px;
            margin-top: 5px;
            font-weight: bold;
        }
        
        .reply_content p {
            background: #fbefcc;
            min-height: 100px;
            font-size: 15px;
            padding: 10px;
        }
        .board_content p{
            font-size: 15px;
        }
        .btn_row{
            margin-top: 300px;
        }
        
        .reply_box{
            margin-top: 10px;
        }
        
        .reply_writeForm{
            margin-top: 35px;
        }
        .reply_writeForm div{
            margin-top: 20px;
        }
        .pagenation_box{
            margin-top: 10px;
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
                            <tr class="board_detaile_contentBar">
                                <td class="col-sm-5">웹프로그래머가 되고 싶습니다.</td>
                                <td class="col-sm-4">
                                    <img src="../img/img.jpg" class="img-thumbnail" alt="Cinque Terre" width="50" height="50">자바
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
                    <div class="row col-sm-12 btn_row">
                        <div class="col-sm-9"></div>
                        <div class="col-sm-3 text-right btn_box">
                            <button class="btn btn-success" title="수정"><i class="glyphicon glyphicon-erase"></i></button>
                            <button class="btn btn-warning" title="삭제"><i class="glyphicon glyphicon-trash"></i></button>
                            <button class="btn btn-danger" title="신고"><i class="glyphicon glyphicon-flag"></i></button>
                        </div>
                    </div><!--//btn_row-->
                    
                    <!-- 댓글 -->
                    <div class="row">
                    <div class="col-sm-12 reply_wrap">
                        <h3 class="reply"><i class="fa fa-comments-o"></i> 댓글</h3>

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
                    
                    <!-- 페이징 처리 -->
                    <div class="row col-sm-12 pagenation_box">
                        <div class="col-sm-12">페이징 처리 </div>
                    </div>
                    
                    
                    <!-- 댓글 작성 박스 -->
                    <div class="row col-sm-12 reply_writeForm">
                        <form action="" method="post" id="replyForm">
                           <!--댓글 작성자 프로필 -->
                            <div class="col-sm-2 text-center reply_profile">
                                <img src="img/img.jpg" class="../img-thumbnail" alt="Cinque Terre" width="100" height="100">
                                <br/>
                                <div class="reply_writer">
                                    <span>별나라여행</span>
                                </div>
                            </div>

                            <!--댓글 작성 박스 -->
                            <div class="col-sm-9 form-group">
                                  <textarea class="form-control" rows="5" id="comment"></textarea>
                            </div>

                            <!--댓글 작성 버튼 박스 -->
                                <div class="col-sm-1 reply_btns">
                                    <button class="btn btn-default">확인</button>
                                    <button type="reset" class="btn btn-default">삭제</button>
                                </div>
                            </form>
                    </div><!--//reply_writeForm-->
                    
                    
                    
                </div><!--//row-->
                </div><!--//board_detail-->
            </div>
            <!--//content-->
            

            
            <div class="col-sm-2 sidenav"></div>
        </div>
        <!--//content-->
</body>

</html>