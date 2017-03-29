<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <title>Bootstrap Example</title>
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
				      <th class="text-center" style="width:12%"><input type="checkbox" style="width:20px; height:20px;" id="checkAll" title="전체선택"/></th>
				      <th>이메일</th>
				      <th>닉네임</th>
				      <th style="width:10%">장래희망</th>
				      <th class="text-center" style="width:12%">권한</th>
				      <th class="text-center" style="width:10%">가입일자</th>
				      <th class="text-center" style="width:5%">삭제</th>
				      <th class="text-center" style="width:10%">권한수정</th>
				    </tr>
				    
				    <tr>
				      <td class="text-center"><input type="checkbox" name="checkedBoard" style="width:20px; height:20px;"/></td>
				      <td>${board.writer}</td>
				      <td><a href="${pageContext.request.contextPath}/board/read/${board.bno}" target="_blank">${board.title}</a></td>
				      <td>변호사</td>
				      <td>
				      	<select class="form-control">
				      		<option value='C'>모두허용</option>
                               <option value='S'>글쓰기제한</option>
                               <option value='J'>댓글제한</option>
                               <option value='T'>모두제한</option>
				      	</select>
				      </td>
				      <td><fmt:formatDate value="${board.regdate}"/></td>
				      <td class="text-center"><a class="btn btn-default removeBtn" title="게시글을 삭제 합니다.">탈퇴</a></td>
				      <td class="text-center"><a class="btn btn-default modifyBtn" title="게시글을 성격에 맞게 이동시킵니다.">권한수정</a></td>
				   </tr>
				  </table>
				</div>
            </div>
            <!--//content-->
        </div>
    </div>

</body>

</html>