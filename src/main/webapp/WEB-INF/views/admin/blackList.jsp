<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <title>블랙리스트</title>
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
                <h2>블랙리스트 관리</h2>
                <hr>
				<table>
				    <tr>
				      <th class="text-center" style="width:5%">No</th>
				      <th style="width:12%">이메일</th>
				      <th style="width:8%">탈퇴일자</th>
				      <th class="text-center" style="width:10%">처리확인</th>
				    </tr>
				    
				    <!-- 신고목록 -->
				    <c:forEach var="black" items="${blackList}">
					    <tr>
					      <td class="text-center">${black.no}</td>
					      <td>${black.email}</td>
					      <td><fmt:formatDate value="${black.regdate}" pattern="yyyy-MM-dd"/></td>
					      <td></td>
					     </tr>
					 </c:forEach>
				  </table>
            </div>
            <!--//content-->
        </div>
    </div>
</body>

</html>