<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Dream Go!</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../css/main.css?v=1" />
    <style type="text/css">
    	.test_cat{
    		padding: 20px;
    	}
    </style>
    
    <script type="text/javascript">
    
    $(document).ready(function(){	
    	var url = "//www.career.go.kr/cnet/iframe/Inspect.do?apiKey=";
    	var key = "0e3a27591319ce0e97e4e3ec62077e8d";
     	$(".test_cat .btn").click(function(){
    		var value = $(this).attr("name");
    		$(".test_iframe").attr("src",url+key+"&gubun="+value);
    		
    	});
    });
    
    </script>
</head>

<body>
<%@ include file="../include/header.jsp" %>

    <div class="container-fluid text-center">
        <div class="row content">
            <div class="col-sm-1 sidenav">
            </div>
            <div class="col-sm-10 text-left">
				<div class="col-sm-4">
                    <h1>적성 검사</h1>
                    <p>적성 검사를 통해 비전을 수립해 보세요!</p>
				</div>
				
				<div class="col-sm-8 test_cat">
                    <button type="button" class="btn btn-default" name="1">직업적성검사</button>
                    <button type="button" class="btn btn-default" name="4">직업흥미검사(K)</button>
                    <button type="button" class="btn btn-default" name="6">직업가치관검사</button>
                    <button type="button" class="btn btn-default" name="7">진로성숙도검사</button>
                    <button type="button" class="btn btn-default" name="8">진로개발준비도검사</button>
                    <button type="button" class="btn btn-default" name="9">이공계전공적합도검사</button>
                    <button type="button" class="btn btn-default" name="10">주요능력효능감검사</button>
                    <button type="button" class="btn btn-default" name="17">직업흥미검사(H)</button>
				</div>
                <hr>
               
                <iframe class="test_iframe"  src="" width="100%" height="800" frameborder="0" scrolling="no"></iframe>

            </div>
            <div class="col-sm-1 sidenav">
            </div>
        </div>
    </div>

</body>

</html>