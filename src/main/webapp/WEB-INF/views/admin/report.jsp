<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <title>관리자페이지</title>
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
                <h2>신고 관리</h2>
                <hr>
				<div style="overflow-x:auto;">
				  <table>
				    <tr>
				      <th class="text-center" style="width:5%"><input type="checkbox" style="width:20px; height:20px;" id="checkAll" title="전체선택"/></th>
				      <th style="width:20%">no</th>
				      <th style="width:10%">신고자</th>
				      <th style="width:10%">신고사유</th>
				        <th style="width:8%">신고글</th>
				      <th class="text-center" style="width:12%">권한</th>
				      <th class="text-center" style="width:10%">가입일자</th>
				      <th class="text-center" style="width:5%">영구탈퇴</th>
				      <th class="text-center" style="width:10%">권한수정</th>
				    </tr>
				    
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
				      <td class="text-center"></td>
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
				  
				  </table>
				  
				</div>
            </div>
            <!--//content-->
        </div>
    </div>
</body>

</html>