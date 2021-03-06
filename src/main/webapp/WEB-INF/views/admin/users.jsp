<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <title>회원관리</title>
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
                <h2>회원 관리</h2>
                <hr>
				<div style="overflow-x:auto;">
				  <table>
				    <tr>
				      <th class="text-center" style="width:5%"><input type="checkbox" style="width:20px; height:20px;" id="checkAll" title="전체선택"/></th>
				      <th style="width:20%">이메일</th>
				      <th style="width:10%">닉네임</th>
				      <th style="width:8%">구분</th>
				      <th style="width:10%">장래희망</th>
				      <th class="text-center" style="width:12%">권한</th>
				      <th class="text-center" style="width:10%">가입일자</th>
				      <th class="text-center" style="width:5%">영구탈퇴</th>
				      <th class="text-center" style="width:10%">권한수정</th>
				    </tr>
				    
				    <c:forEach var="user" items="${userList}">
				    <!-- 회원정보 -->
				    <tr>
				      <td class="text-center"><input type="checkbox" name="checkedBoard" style="width:20px; height:20px;"/></td>
				      <td>${user.email}</td>
				      <td>${user.nickname}</td>
				      <td>${user.realType}</td>
				      <td>${user.dream}</td>
				      <td class="selectTd">
				      	<select class="form-control" id="select_${user.no}">
			      			 <option value='ALL'>모두허용</option>
                             <option value='AR'>글쓰기제한</option>
                             <option value='AC'>댓글제한</option>
                             <option value='UA'>모두제한</option>
				      	</select>
						<script type="text/javascript">
						      	//타입 초기값
					      		$("#select_${user.no}").val("${user.auth}").attr("selected",true);
				      	</script>	
				      </td>
				      <td class="text-center"><fmt:formatDate value="${user.regdate}" pattern="yyyy-MM-dd"/></td>
				      <td class="text-center">
					      <button type="button" class="btn btn-default removeUserBtn" id="removeBtn_${user.no}" title="게시글을 삭제 합니다.">
							탈퇴
					      </button>
				      </td>
				      <td class="text-center">
					      <button type="button" class="btn btn-default modifyAuthBtn" id="modifyBtn_${user.no}" title="게시글을 성격에 맞게 이동시킵니다.">
					      	권한수정
					      </button>
				      </td>
				   </tr>
				   </c:forEach>
				  </table>
				  
				</div>
            </div>
            <!--//content-->
        </div>
    </div>
	<script type="text/javascript">
	
		//회원 권한 수정
		$(".modifyAuthBtn").on('click',function(){
			var id = $(this).attr('id');
			//회원 번호
			var no = id.substring(10,id.length);
		
			var result = confirm("해당 회원의 권한을 변경 하시겠습니까?");
		      if(!result){return false;}
			//권한 값
			var auth = $(this).parent().parent().children("td:nth-child(6)").children().val();
			
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/admin/modifyAuth",
				data:{'no':no,'auth':auth},
				dataType:"text",
				success:function(msg){
					alert(msg);
				},
				error:function(){
					alert("실패!");
				}
			});
			
		});
		
		//회원 영구 탈퇴
		$(".removeUserBtn").on('click',function(){
			
			var result = confirm("해당 회원을 영구탈퇴 시키겠습니까?\n해당 회원이 작성한 모든 글과 댓글은 삭제됩니다.");
		      if(!result){return false;}
			var id = $(this).attr('id');
			var email = $(this).parent().parent().children('td:nth-child(2)').text();
			//회원 번호
			var no = id.substring(10,id.length);
			alert("no :"+no +" / email :"+email);
			
			$.ajax({
				type:"post",
				url:'${pageContext.request.contextPath}/admin/removeUser',
				data:{'no':no,'email':email},
				dataType:"text",
				success:function(msg){
					alert(msg)
					window.location.reload(true);
				},
				error:function(error,xhr){
					alert("죄송합니다. 서버에 문제가 발생했습니다.")
				}
			})
		});
		
	</script>
</body>

</html>