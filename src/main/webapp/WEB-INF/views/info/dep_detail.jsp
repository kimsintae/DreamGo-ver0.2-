<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Dream Go!</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dep_detail.css?v=2"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/tabs.js?v=1"></script>
	
    <!-- chart -->
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/data.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script>
    
    //처음 로드되면 개요 텝 활성화
    function initTab() {
         	$(".tablinks:eq(0)").addClass("active"); 	
        	$("#first_tab").css("display","block");
		}
    </script>
</head>

<body onload="initTab();">
<%@include file="../include/header.jsp" %>

<!-- 대학의 검색결과이면 univ.jsp를 include함 -->
<c:choose>
<c:when test="${gubun=='univ_list'}">
<%@include file="../include/dep_detail_univ.jsp" %>
</c:when>
<c:otherwise>
<%@include file="../include/dep_detail_high.jsp" %>
</c:otherwise>
</c:choose>



<%@include file="../include/footer.jsp" %>
</body>

</html>