<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>${board.title}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/readForm.css?v=2">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
	                                <td class="col-sm-4 board_title">${board.title}</td>
	                                <td class="col-sm-4">
	                                    <img src="${pageContext.request.contextPath}/resources/upload/${board.profile}" class="img-thumbnail" alt="Cinque Terre" width="50" height="50">${board.writer}
	                                </td>
	                                <td class="col-sm-1 text-center">${board.realType}</td>
	                                <td class="col-sm-1 text-center">${board.readCnt}</td>
	                                <td class="col-sm-2 text-center"><fmt:formatDate value="${board.regdate}"/></td>
                            </tr>
                        </tbody>
                    </table>

					
                    <div class="row col-sm-12 board_content">
                        ${board.content}
                    </div>
                    <div class="row col-sm-12 btn_row">
                        <div class="col-sm-9">
                 			  <a class="btn btn-warning" href="${pageContext.request.contextPath}/board/list/${thisPage}" title="목록"><i class="glyphicon glyphicon-list"></i></a>
                        </div>
                        <div class="col-sm-3 text-right btn_box">
                            <c:choose>
                            	<c:when test="${loginUser.no==board.userNo}">
                           	          <a href="${pageContext.request.contextPath}/board/modifyForm/${board.bno}" class="btn btn-success" title="수정"><i class="glyphicon glyphicon-erase"></i></a>
                          			  <a href="${pageContext.request.contextPath}/board/remove/${board.bno}" class="btn btn-warning" id="removeBtn" title="삭제"><i class="glyphicon glyphicon-trash"></i></a>
                          			  <script type="text/javascript">
		                          			//글삭제 클릭시
		                          			$("#removeBtn").click(function(){
		                          			  var result = confirm("정말 삭제 하시겠습니까?\n-해당 내용과 모든 댓글도 함께 삭제됩니다.");
		                          			        if(!result){return false;}
		                          			})
                          			  </script>
                            	</c:when>
                            	<c:otherwise>
		                            <button id="report_btn" type="button" class="btn btn-danger" title="신고"><i class="glyphicon glyphicon-flag"></i></button>
                            	</c:otherwise>
                            </c:choose>
                            
							  <!-- 신고 modal -->
                            
                            <div id="report_modal" class="modal rep_modal">

							  <div class="modal-content rep__mc">
							    <div class="modal-header rep_mh">
							      <span class="close rep_ic" data-dismiss="modal">&times;</span>
							      	신고하기
							    </div>
							    <div class="modal-body rep_b">
							      
									  <form action="${pageContext.request.contextPath}/admin/report" id="report_from">
									    <label for="reporter" class="col-sm-12">신고자</label>
									    <input type="text" id="reporter" name="reporter" value="${loginUser.nickname}" readonly="readonly">
										<input type="hidden" name="reportedBno" value="${board.bno}"/>
										<input type="hidden" name="reportedTitle" value="${board.title}"/>
										<input type="hidden" name="reportedWriter" value="${board.writer}"/>
									    <label for="cause" class="col-sm-12">신고사유</label>
									    <c:choose>
									    	<c:when test="${loginUser!=null}">
											    <textarea id="cause" name="cause" style="height:200px" placeholder="욕설/비방/광고성/음란물에 해당하는 게시글을 신고해주세요"></textarea>
											    <button class="btn btn-default" id="reportSubmit" type="button">확인</button>
									    	</c:when>
									    	<c:otherwise>
											    <textarea id="cause" name="cause" style="height:200px" placeholder="로그인 후에 이용해주세요." disabled="disabled"></textarea>									    
									    	</c:otherwise>
									    </c:choose>
								
									
									  </form>
									</div>
							    
							    <div class="modal-footer rep_f">
							      	<span class="col-sm-12 text-danger text-left">
									    신고하시면 해당 게시물은 삭제될 수 있으며, <br/>해당 게시물 작성자의 글쓰기 또한 금지될 수 있습니다. <br/>
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


						<c:forEach var="reply" items="${replyMainList}">
                        <div class="col-sm-12 reply_box">
                            <div class="col-sm-3 text-center reply_profile">
                                <img src="${pageContext.request.contextPath}/resources/upload/${reply.profile}" class="img-thumbnail" alt="Cinque Terre" width="100" height="100">
                                <br/>
                                <div class="reply_writer">
                                    <span>${reply.nickname}</span>
                                </div>
                                <div class="reply_regdate">
                                    <span><fmt:formatDate value="${reply.regdate}"/> </span>
                                </div>
                            </div><!--댓글 내용창-->
                            <div class="col-sm-8 reply_content">
                                ${reply.content}
                            </div>
                            <div class="col-sm-1 reply_btns">
                            	<c:if test="${loginUser.no==reply.userNo||loginUser.no==1}">
                                <a class="btn btn-default modifyMainBtn">수정</a>
                                <a href="${pageContext.request.contextPath}/reply/remove/${reply.rno}" class="btn btn-default">삭제</a>
                                </c:if>
                                <button class="btn btn-info subReply_btn">답글</button>
                            </div><!--//reply_content-->
                            
		                    <!-- 답글 작성폼 -->    
		                    <!-- 댓글 수정폼 -->
							<div class="col-sm-12 subReply_writeForm">
						        	<hr/>
						            <form action="" method="post" class='subReplyForm'>
						            
						               <!--답글 작성자 프로필 -->
						                <div class='col-sm-2 text-center reply_profile'>
						                    <img src='${pageContext.request.contextPath}/resources/upload/${loginUser.profile}' class='../img-thumbnail' alt='Cinque Terre' width='100' height='100'>
						                    <br/>
						                    <div class='reply_writer'>
						                        <span>${loginUser.nickname}</span>
						                    </div>
						                </div>
						                
						                <!--답글 작성 박스 -->
						                <div class='col-sm-9 form-group'>
						                      <textarea class='form-control' name="content" rows='5' class='comment'></textarea>
						                </div>
						                
						                <!--답글 작성 버튼 박스 -->
					                    <div class='col-sm-1 reply_btns'>
					                        <button type="submit"class='btn btn-default'>확인</button>
					                        <button type='reset' class='btn btn-default subReply_cancle'>취소</button>
					                    </div>
					                    
						            	<input type="hidden" name="rno" value="${reply.rno}"/>    
						            	<input type="hidden" name="mainNo" value="${reply.rno}"/>    
						            	<%-- <input type="hidden" name="sno" value="${replySub.sno}"/>   --%>  
						            	<input type="hidden" name="userNo" value="${loginUser.no}"/>    
						            	<input type="hidden" name="articleNo" value="${board.bno}"/>    
					                </form>
			       		 	</div><!--//subReply_writeForm-->
			       		 	
                     			 <c:forEach var="replySub" items="${replySubList}">
                     			 	<c:if test="${replySub.mainNo==reply.rno||loginUser.no==1}">
		                     			<!-- 답글 내용 -->
			                            <div class="col-sm-12 subRply_box">
			                            	<div class="col-sm-2 text-right">
			                            		<i class="material-icons" style="font-size:35px">subdirectory_arrow_right</i>
			                            	</div>
				                            <div class="col-sm-2 text-center reply_profile">
				                                <img src="${pageContext.request.contextPath}/resources/upload/${replySub.profile}" class="img-thumbnail" alt="Cinque Terre" width="100" height="100">
				                                <br/>
				                                <div class="reply_writer">
				                                    <span>${replySub.nickname}</span>
				                                </div>
				                                <div class="reply_regdate">
				                                    <span><fmt:formatDate value="${replySub.regdate}"/></span>
				                                </div>
				                            </div><!--답글 내용창-->
				                            <div class="col-sm-7 reply_content sub_content">
				                                ${replySub.content}
				                            </div>
				                            <div class="col-sm-1 reply_btns">
				                            	<c:if test="${loginUser.no==replySub.userNo||loginUser.no==1}">
				                                <button class="btn btn-default modifySubBtn">수정</button>
				                                <a href="${pageContext.request.contextPath}/reply/removeSub/${replySub.sno}" class="btn btn-default">삭제</a>
				                                </c:if>
				                            </div><!--//reply_content-->
			                            </div><!-- //subRply_box -->
			                            
			                            
			                            <!-- 답글 수정폼 -->    
										<div class="col-sm-12 subReply_modifyForm">
									        	<hr/>
									            <form action="" method="post" class='subReplyModifyForm'>
									            
									               <!--답글 작성자 프로필 -->
									                <div class='col-sm-2 text-center reply_profile'>
									                    <img src='${pageContext.request.contextPath}/resources/upload/${loginUser.profile}' class='../img-thumbnail' alt='Cinque Terre' width='100' height='100'>
									                    <br/>
									                    <div class='reply_writer'>
									                        <span>${loginUser.nickname}</span>
									                    </div>
									                </div>
									                
									                <!--답글 수정 내용 박스 -->
									                <div class='col-sm-9 form-group'>
									                      <textarea class='form-control comment'  id='subReplyContent' name="content" rows='5'></textarea>
									                </div>
									                
									                <!--답글 수정 버튼 박스 -->
								                    <div class='col-sm-1 reply_btns'>
								                        <button type="submit"class='btn btn-default'>확인</button>
								                        <button type='reset' class='btn btn-default subReply_cancle'>취소</button>
								                    </div>
								                    
									            	<input type="hidden" name="sno" value="${replySub.sno}"/> 
								                </form>
						       		 	</div><!--//subReply_modifyForm-->
		                            </c:if>
		                        </c:forEach>
		              	 </div><!--//reply_box--> 
						</c:forEach>
                    </div>
                    <!--//reply_wrap-->
                    
                    <hr/>
                    <!-- 댓글 작성 박스 -->
                    <div class="row col-sm-12 reply_writeForm">
	                     	<c:if test="${loginUser!=null && loginUser.auth!='UA' && loginUser.auth!='AC'}">
	                        <form action="${pageContext.request.contextPath}/reply/writeMainReply" method="post" id="replyForm">
	                           <!--댓글 작성자 프로필 -->
	                            <div class="col-sm-2 text-center reply_profile">
	                                <img src="${pageContext.request.contextPath}/resources/upload/${loginUser.profile}" class="../img-thumbnail" alt="Cinque Terre" width="100" height="100">
	                                <br/>
	                                <div class="reply_writer">
	                                    <span>${loginUser.nickname}</span>
	                                </div>
	                            </div>
	
	                            <!--댓글 작성 박스 -->
	                            <div class="col-sm-9 form-group">
	                                  <textarea class="form-control" rows="5" name="content" class="comment"></textarea>
	                            </div>
	                            <input type="hidden" name="userNo" value="${loginUser.no}"/>
	                            <input type="hidden" name="articleNo" value="${board.bno}"/>
	
	                            <!--댓글 작성 버튼 박스 -->
	                                <div class="col-sm-1 reply_btns">
	                                    <button class="btn btn-default">확인</button>
	                                    <button type="reset" class="btn btn-default">삭제</button>
	                                </div>
	                            </form>
	                       </c:if>
	                      
	                      <!-- 댓글 작성이 제한되있는 회원일 경우 -->
	                       <c:if test="${loginUser.auth=='UA'|| loginUser.auth=='AC'}">
	                       		<!--댓글 작성자 프로필 -->
	                            <div class="col-sm-2 text-center reply_profile">
	                                <img src="${pageContext.request.contextPath}/resources/upload/default.png" class="../img-thumbnail" alt="Cinque Terre" width="100" height="100">
	                                <br/>
	                            </div>
	
	                            <!--댓글 작성 박스 -->
	                            <div class="col-sm-9 form-group">
	                                  <textarea class="form-control" rows="5" class="comment" disabled="disabled">댓글 작성이 제한되있습니다.</textarea>
	                            </div>
	                       </c:if>
	                       
	                       <!-- 로그인을 안했을 경우 -->
	                       <c:if test="${loginUser==null}">
	                       		<!--댓글 작성자 프로필 -->
	                            <div class="col-sm-2 text-center reply_profile">
	                                <img src="${pageContext.request.contextPath}/resources/upload/default.png" class="../img-thumbnail" alt="Cinque Terre" width="100" height="100">
	                                <br/>
	                            </div>
	
	                            <!--댓글 작성 박스 -->
	                            <div class="col-sm-9 form-group">
	                                  <textarea class="form-control" rows="5" class="comment" disabled="disabled">로그인을 하셔야 작성 가능합니다.</textarea>
	                            </div>
	                       </c:if>
	                 
                    </div><!--//reply_writeForm-->
                </div><!--//row-->
                </div><!--//board_detail-->
            </div>
            <!--//content-->
            <div class="col-sm-2 sidenav"></div>
        </div>
        <!--//content-->
        
        <%@include file="../include/footer.jsp" %>
        
        
        <script type="text/javascript">
        
        //삭제된 게시글의 경우
       	var content = '${board.content}';
        if(content=="removed"){
        	$(".board_title").text("삭제된 게시글");
        	$(".board_content").html("<h3 style='color:red;'>관리자에 의해 삭제된 게시글 입니다.</h3>");
        }
        
        
        
        //답글버튼 클릭시
        var loginUser = '${loginUser}';	
        
        $(".reply_wrap").on('click','.subReply_btn',function(){
        		
        		if(loginUser!=''){
        			//로그인 됬을 경우
        			var $subReply = $(this).parent(".reply_btns").next(".subReply_writeForm");
    				$subReply.toggle();
    				
    				$(".subReplyForm").attr("action",'${pageContext.request.contextPath}/reply/writeSubReply');
    				
        		}else{
        			//로그아웃 상태일 경우
        			alert("로그인을 하셔야 이용 가능합니다.");
        		}
				
			});
			
			
			//수정버튼 클릭시
			$(".reply_box").on('click','.modifyMainBtn',function(){
				$(".subReplyForm").attr("action",'${pageContext.request.contextPath}/reply/modifyMainReply');
				
				var content = $(this).parent().prev().text();
				
				var $subReply = $(this)
								.parent(".reply_btns")
								.next(".subReply_writeForm");
				
		/* 		var $textarea = $(this)
								.parent(".reply_btns")
								.next(".subReply_writeForm")
								.children("#comment"); */
				//alert(content);
				//$textarea.text(content);
				$subReply.toggle();
			})
			
			
			//답글 수정 버튼 클릭시
			$(".reply_box").on('click','.modifySubBtn',function(){
				$(".subReplyModifyForm").attr("action",'${pageContext.request.contextPath}/reply/modifySubReply');
				
				var $subReply_modifyForm = $(this)
											.parent()
											.parent()
											.next();
				
				var content = $(this).parent().prev().text();
				$subReply_modifyForm.find("#subReplyContent").text(content.trim());
				
				$subReply_modifyForm.toggle();
			});
			
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
			
			
			//신고하기 버튼 클릭시
			$("#reportSubmit").click(function(){
				var result = confirm("해당 게시글을 신고 하시겠습니까?");
			      if(!result){return false;}
			      $("#report_from").submit();
			})
			
			//신고성공시
			if('${msg}'!=''){alert('${msg}');}
			
			
        </script>
</body>


</html>