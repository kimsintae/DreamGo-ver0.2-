<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
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
				      <th class="text-center" style="width:5%">No</th>
				      <th style="width:12%">신고자</th>
				      <th style="width:30%">신고사유</th>
				      <th>신고글</th>
				      <th style="width:8%">신고일자</th>
				      <th class="text-center" style="width:8%">처리상태</th>
				      <th class="text-center" style="width:10%">처리확인</th>
				    </tr>
				    
				    <!-- 신고목록 -->
				    <c:forEach var="report" items="${reportList}">
					    <tr>
					      <td class="text-center">${report.no}</td>
					      <td>${report.reporter}</td>
					      <td>${report.cause}</td>
					      <td><a href="${pageContext.request.contextPath}/board/read/${report.reportedBno}">${report.reportedTitle}</a> ( ${report.reportedBno} )</td>
					      <td><fmt:formatDate value="${report.regdate}" pattern="yyyy-MM-dd"/></td>
					      <c:if test="${report.realState=='미처리'}">
					      <td class="text-center state" style="font-weight: bold;color:red;">${report.realState}</td>
					      <td class="text-center">
						      <button type="button" class="btn btn-default handlingBtn">
								처리완료
						      </button>
					      </td>
					      </c:if>
					      <c:if test="${report.realState=='처리'}">
					      <td class="text-center state" style="font-weight: bold;color:blue;">${report.realState}</td>
					      <td class="text-center">
						      <button type="button" class="btn btn-default handlingBtn" disabled="disabled">
								처리완료
						      </button>
					      </td>
					      </c:if>
					     </tr>
					 </c:forEach>
				  </table>
				  
				</div>
            </div>
            <!--//content-->
        </div>
    </div>
    
    <script type="text/javascript">
    	$(".handlingBtn").on('click',function(){
    		
    		var no = $(this).parent().parent().find("td:first").html();
    		
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/admin/handlingReport",
				data:{'no':no},
				dataType:"text",
				success:function(msg){
					alert(msg);
					location.reload();
				},
				error:function(){
					alert("서버에 심각한 문제로 실패하였습니다.");
				}
				
			})
    		
    	})
    
    </script>
</body>

</html>