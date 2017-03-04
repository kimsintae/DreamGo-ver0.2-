<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>DreamGo</title>
    <!-- Bootstrap -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        
        .btnBox {
            position: absolute;
            width: 710px;
            height: 710px;
            right: 50%;
            top: 50%;
            margin-right: -355px;
            margin-top: -355px;
        }
        
        .btnBox .btn {
            width: 350px;
            height: 350px;
            margin-bottom: 5px;
            font-size: 40px;
            font-weight: bold;
            line-height: 320px;
            background: #b7d7e8;
            border: none;
        }
        
        .btn:hover {
            transform: scale(1.2);
            transition: all 2.5s ease;
            color: chartreuse;
        }
    </style>
</head>

<body>

    <div class="btnBox">
        <div class="btn-group-vertical">
            <a href="${ctx}/info/job_info" class="btn btn-info" role="button">직업 정보</a>
            <a href="${ctx}/info/sch_info" class="btn btn-info" role="button">학교 정보</a>
        </div>
        <div class="btn-group-vertical">
            <a href="${ctx}/info/dep_info" class="btn btn-info" role="button">학과 정보</a>
            <a href="${ctx}/aptitudeTest/apti_test" class="btn btn-info" role="button">직업 심리 검사</a>
        </div>
    </div>




    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>

</html>