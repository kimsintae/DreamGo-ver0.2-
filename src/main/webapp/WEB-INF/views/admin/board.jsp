<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <title>관리자페이지-게시글</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_main.css?v=1"> 
</head>

<body>
 <div class="container-fluid">
        <div class="row content">
        
   		<%@include file="../include/adminHeader.jsp" %>

            <div class="col-sm-9">
                <h2>게시글 관리</h2>
                <hr>
				<div style="overflow-x:auto;">
				<form action="" method="POST">
				
					  <table>
					    <tr>
					      <th class="text-center" style="width:5%">
					    	  <input type="checkbox" style="width:20px; height:20px;" id="checkAll" title="전체선택"/>
					      </th>
					      <th>작성자</th>
					      <th>제목</th>
					      <th class="text-center" style="width:10%">구분</th>
					      <th style="width:10%">등록일</th>
					      <th class="text-center"style="width:7%">조회수</th>
					      <th class="text-center" style="width:5%">삭제</th>
					      <th class="text-center" style="width:5%">수정</th>
					    </tr>
					    
					    
					    <c:forEach var="board" items="${boardList}">
						    <tr>
							      <td class="text-center"><input class="checkBtn" type="checkbox" name="checkedBoard" style="width:20px; height:20px;"/></td>
							      <td>${board.writer}<span style="font-weight:bold;"> ( ${board.email} )</span></td>
							      <td><a href="${pageContext.request.contextPath}/board/read/${board.bno}" target="_blank">${board.title}</a></td>
							      <td>
								      	<select class="form-control typeSelctor">
								      		<option value='C'>진로</option>
			                                <option value='S'>학교</option>
			                                <option value='J'>직업</option>
			                                <option value='T'>수다</option>
								      	</select>
							      </td>
							      <td><fmt:formatDate value="${board.regdate}"/></td>
							      <td class="text-center">${board.readCnt}</td>
							      <td class="text-center"><a href="${pageContext.request.contextPath}/admin/remove/${board.bno}" class="btn btn-default removeBtn" title="게시글을 삭제 합니다.">삭제</a></td>
							      <td class="text-center"><a href="#" onclick="modify(${board.bno});" class="btn btn-default modifyBtn" title="게시글을 성격에 맞게 이동시킵니다.">수정</a></td>
						   </tr>
						</c:forEach>
					   </table>
					  
					  <div style="margin-top:12px;">
					  	<button type="button" class="btn btn-default" id="checkedRemove">선택삭제</button>
					  	<button type="button" class="btn btn-default" id="checkedModify">선택수정</button>
					  </div>
				  </form><!-- //form -->
				  
				  <!-- 페이징 -->
				  <div>
				 	 <div class="col-sm-3"></div>
				  	<div class="pagination col-sm-8 text-center">
						  ${pagination}
					</div>	
				  </div>
				</div>
            </div>
        </div> <!--//content-->
    </div>
	<script type="text/javascript">
	
	
	
	//전체선택
    $("#checkAll").click(function(){
        if($("#checkAll").prop("checked")){
            $("input[name=checkedBoard]").prop("checked",true);
        }else{
            $("input[name=checkedBoard]").prop("checked",false);
        }
    });
	
	
	//글삭제 확인창
 	$(".removeBtn").on('click',function(){

		 //해당 게시글 선택 유무

	})

	
	
	
	/*
	
			무조건 뿌려줄때 구분에 맞게 셀렉트 되게 해야한다...
	
	*/

	//게시글 구분 수정
	function modify(bno) {
		
		var result = confirm("해당 게시글을 수정 하시겠습니까?");
	      if(!result){
	    	  return false;
	    	 }else{
	    		 //확인버튼 클릭시
	    		  
				var type = $(".typeSelctor").val();
				
				alert(bno+"\n"+type);
		  	 	$.ajax({
		 			type:"POST",
		 			url:"${pageContext.request.contextPath}/admin/modify",
		 			data:{'bno':bno,'type':type}
		 		})
		 		
	    	 }
	}
	</script>

</body>

</html>