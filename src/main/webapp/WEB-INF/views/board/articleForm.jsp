<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
  <title>글쓰기</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- editor 외부링크 -->
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css?v=1">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/writeForm.css?v=1">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  

</head>
<body>
<%@ include file="../include/header.jsp" %>
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
    </div>
    <div class="col-sm-8 text-left"> 
            <!-- 글쓰기 본문 -->
    
            <div class="col-sm-12 write_wrap">
                <form id="write_modify_Form" action="" method="get">
	                    <div class="col-sm-12 write_top">
	
	                       <div class="form-group title_box">
	                            <label for="title" class="col-sm-1 control-label">제목</label>
	                            <div class="col-sm-11">
	                              <input class="form-control" id="title" type="text" name="title">
	                            </div>
	                       </div>
	
	                        <div class="form-group type_box"> 
	                            <label for="type" class="col-sm-1 control-label">구분</label>
	                            <div class="col-sm-2">
	                                <select name="type" id="type" class="form-control">
	                                    <option value="career">진로</option>
	                                    <option value="school">학교</option>
	                                    <option value="job">직업</option>
	                                    <option value="talk">수다</option>
	                                </select>
	                            </div>
	                        </div>
	                    </div><!--//write_top-->
	                    
	                    
	                    <!-- 에디터 구역 -->              
	                    <div class="col-sm-12 editor_box">
	                       
	                    </div><!--//editor_box-->	                 
	            </form><!-- //write_modify_Form --> 
	                    
		                  <div class="form-group"> 
		                    <div class="col-sm-offset-2 col-sm-10 text-right write_btns">
		                      <button type="button" class="btn btn-default write_btn glyphicon glyphicon-saved" style="font-size:18px;" title="등록"></button>
		                      <a href="${pageContext.request.contextPath}/board/list" class="btn btn-default cancle_btn glyphicon glyphicon-remove"style="font-size:18px;" title="취소"></a>
		                      
		                      <!-- 수정일때는 list.jsp로 돌아가는게 아니라 read.jsp 로 -->
		                    </div>
		                  </div>

            </div><!--//write_wrap--> 
    </div>
    <div class="col-sm-2 sidenav">
    </div>
  </div>
</div>

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>
<script type="text/javascript">

//글 쓰다 다른 페이지로 넘어가려 할 때 메시지 띄우기
  $(".navbar-nav a").click(function(){
  var result = confirm("정말 글쓰기를 취소 하시겠습니까?");
        if(!result){return false;}
  })


</script>
</body>
</html>