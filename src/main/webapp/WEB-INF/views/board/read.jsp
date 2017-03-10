<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Dream Go!</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="../resources/css/readForm.css?v=2">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="../resources/js/read.js?v=2"></script>
	<script type="text/javascript">
	
	<!-- 신고 창  -->
		$(document).ready(function(){
		    

			// Get the modal
			var modal = document.getElementById('report_modal');

			// Get the button that opens the modal
			var btn = document.getElementById("report_btn");

			// Get the <span> element that closes the modal
			var span = document.getElementsByClassName("close")[0];

			// When the user clicks the button, open the modal 
			btn.onclick = function() {
			    modal.style.display = "block";
			}

			// When the user clicks on <span> (x), close the modal
			span.onclick = function() {
			    modal.style.display = "none";
			}

			// When the user clicks anywhere outside of the modal, close it
			window.onclick = function(event) {
			    if (event.target == modal) {
			        modal.style.display = "none";
			    }
			}		
		})
	</script>
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
                                    <img src="../resources/img/img.jpg" class="img-thumbnail" alt="Cinque Terre" width="50" height="50">자바
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
                            <a href="${ctx}/board/modifyForm" class="btn btn-success" title="수정"><i class="glyphicon glyphicon-erase"></i></a>
                            <a class="btn btn-warning" title="삭제"><i class="glyphicon glyphicon-trash"></i></a>
                            <button id="report_btn" type="button" class="btn btn-danger" title="신고"><i class="glyphicon glyphicon-flag"></i></button>
                            
							  <!-- 신고 modal -->
                            
                            <div id="report_modal" class="modal rep_modal">

							  <div class="modal-content rep__mc">
							    <div class="modal-header rep_mh">
							      <span class="close rep_ic">&times;</span>
							      	신고하기
							    </div>
							    <div class="modal-body rep_b">
							      
									  <form action="/admin/report" id="report_from">
									    <label for="reporter" class="col-sm-12">신고자</label>
									    <input type="text" id="reporter" name="reporter" disabled="disabled">
									
									    <label for="cause" class="col-sm-12">신고사유</label>
									    <textarea id="cause" name="cause" style="height:200px" placeholder="욕설/비방/광고성/음란물에 해당하는 게시글을 신고해주세요"></textarea>

									
									    <input id="report_sub" type="submit" value="Submit">
									  </form>
									</div>
							    
							    <div class="modal-footer rep_f">
							      	<span class="col-sm-12 text-danger text-left">
									    신고하시면 해당 게시물은 삭제될 수 있으며, 해당 게시물 작성자의 글쓰기 또한 금지될 수 있습니다. <br/>
									    단, 허위신고일 경우 신고자의 활동에 제한을 받게 되오니 이점 유의해 주시기 바랍니다.
									    </span>
							    </div>
							  </div>

							</div>
						
							<!-- //신고 modal -->
                        </div>
                    </div><!--//btn_row-->
                    
                    
                    <!-- 댓글 -->
                    <div class="row">
                    <div class="col-sm-12 reply_wrap">
                        <h3 class="reply"><i class="fa fa-comments-o"></i> 댓글</h3>

                        <div class="col-sm-12 reply_box">
                            <div class="col-sm-2 text-center reply_profile">
                                <img src="../resources/img/img.jpg" class="img-thumbnail" alt="Cinque Terre" width="100" height="100">
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
                                <img src="../resources/img/img.jpg" class="img-thumbnail" alt="Cinque Terre" width="100" height="100">
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
                                <img src="../resources/img/img.jpg" class="img-thumbnail" alt="Cinque Terre" width="100" height="100">
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
        <%@include file="../include/footer.jsp" %>
</body>


</html>