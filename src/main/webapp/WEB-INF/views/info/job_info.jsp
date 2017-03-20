<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>직업정보</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${ctx}/resources/css/job_info.css?v=1"/>
    <script src="${ctx}/resources/js/tabs.js?v=1"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    <style type="text/css">
    .job_list .result_row{
    	margin-bottom: 15px;
    }

	.job_pager span{
		cursor: pointer;
	}
	.result_area{
		display: none;
	}
	.job_list .detail_btn{
		border: none;
		color: #87bdd8;
		font-weight: bold;
		
	}
	.job_list .detail_btn:hover{
		background: white;
		color:#ff6f69;
	}
    
    </style>
</head>

<body>
 <%@ include file="../include/header.jsp" %>

    <div class="container-fluid text-center">

        <div class="row content">
            <div class="col-sm-1 sidenav">
            </div>
            <div class="col-sm-10 text-left">

                <div class="jumbotron">
                    <h1>직업 정보</h1>
                    <p>직업 탐색을 통해 비전을 수립해보세요!</p>

                </div>
                <!-- 탭 -->
                <div class="row">
                    <div class="tab">
                        <div class="col-sm-6">
                            <a href="javascript:void(0)" class="tablinks tab-menu" onclick="openCity(event, 'job')">직업별 분류 검색
                           </a>
                        </div>
                        <div class="col-sm-6">
                            <a href="javascript:void(0)" class="tablinks tab-menu" onclick="openCity(event, 'aptitude')">적성별 분류 검색</a>
                        </div>
                    </div>
                </div>
                <!--직업별 분류-->
                <div id="job" class="tabcontent">

                    <div class="row">

                        <div class="container col-sm-1"></div>
                        <div class="container col-sm-10 category">
                            <h3>조건 검색</h3>
                            <form id="job_form">
                                <input type="hidden" value="job_dic_list" name="gubun" />
                                <div class="row job_opt">
                                <%@include file="../include/job_cat.jsp" %>
                                
                                </div>
                            </form>
                        </div>
                        <div class="container col-sm-3"></div>
                        <div class="row text-center btn-box col-sm-6">
                            <input type="button" class="btn btn-block btn-default searchBtn" id="jobBtn" value="검색" />
                        </div>
                        <div class="container col-sm-3"></div>
                        <div class="container col-sm-1"></div>
                    </div>
                    <!--//div row-->
                    <hr/>
                </div>
                <!--적성별 분류-->
                <div id="aptitude" class="tabcontent">

                    <div class="row">
                        <div class="container col-sm-1"></div>
                        <div class="container col-sm-10 category">
                            <h3>조건 검색</h3>
                            <form id="apti_form">
                                <input type="hidden" value="job_apti_list" name="gubun" />
                                <div class="row apti_opt">
                                	<%@include file="../include/apti_cat.jsp" %>
                                </div>
                            </form>
                        </div>
                        <div class="container col-sm-3"></div>
                        <div class="row text-center btn-box col-sm-6">
                            <input type="button" class="btn btn-block btn-default searchBtn" id="aptiBtn" value="검색" />
                        </div>
                        <div class="container col-sm-3"></div>
                        <div class="container col-sm-1"></div>
                    </div>
                    <hr/>
                </div>

                <!-- 검색 결과 -->

                <div class="container col-sm-12 result_area">
                    <h4 class="search_result">검색 결과 : <span class="totalCnt"></span>개의 직업을 찾았습니다.</h4>
                    <ul class="list-group job_list">
					  
					</ul>
					
					
					<!-- 페이징 -->
	                <ul class="pagination job_pager">
	
					</ul>
                </div>
            </div>
            <div class="col-sm-1 sidenav">
            </div>
        </div>
    </div>

<%@ include file="../include/footer.jsp" %>
<script type="text/javascript">

var thisPage;
var formDate;
var startPage;
var endPage;

//검색 버튼에 따라 동적으로 폼데이터 생성
$(".searchBtn").click(function(){	
	var id = $(this).attr("id");	

	if(id=="jobBtn"){
		formDate = $("#job_form").serialize();
		
	}else{
		formDate = $("#apti_form").serialize();
	}	
	
	
	//재검색시 페이지 1로 초기화
	thisPage=1;

	//ajax 호출
	job_ajax();
	
	//스크롤이동
	fnMove("result_area");
});



function job_ajax(){
	$.ajax({
		type:"POST",
		url:"${ctx}/job_search?thisPage="+thisPage,
		data:formDate,
		dataType:"json",
		success:function(json){
			//alert("성공!");	
			$(".result_area").show();
			$(".job_list").empty();
			$(".job_pager").empty();
			$(".job_pager").append(json.pagination);//페이징 붙이기
			$(".totalCnt").text(json.pka.totalCount);//총검색수
			
			
			endPage = json.pka.endPage;
			startPage = json.pka.startPage;
			
			result(json);
		},
		error:function(error,xhr){
			alert("실패!");
		}
	});
}

//콜벡시 호출될 함수
function result(json){
	
	for(var i=0;i<json.data.length;i++){
		var html = "<form action=\'${ctx}/detail/"+json.data[i].jobdicseq+"\' method='POST'>\
					<li class='list-group-item row'>\
						<div class='col-sm-12 result_row'>\
							직업명 : <span class='job_title'><button class='btn-default detail_btn'>"+json.data[i].job+"</button></span>\
						</div>\
						<div class='col-sm-12 row result_row'>\
							<div class='col-sm-6'>직업분야 : <span class='job_type'>"+json.data[i].profession+"</span></div>\
							<div class='col-sm-3'>연봉 : <span class='job_title'>"+json.data[i].salery+"</span></div>\
							<div class='col-sm-3'>전망 : <span class='job_title'>"+json.data[i].possibility+"</span></div>\
						</div>\
						<div class='col-sm-12 row result_row'>\
							<div class='col-sm-12'>직업설명 :</div>\
							<div class='col-sm-12'>"+modifyingSumm(json.data[i].summary)+"</div>\
							<div class='col-sm-12'>유사직종 : <span class='job_rele'>"+json.data[i].similarjob+"</span></div>\
						</div>\
					</li>\
						<input type='hidden' name='salary' value='"+json.data[i].salery+"'/>\
						<input type='hidden' name='profession' value='"+json.data[i].profession+"'/>\
					</form>";
		
		$(".job_list").append(html);

	}//for
}//result

function modifyingSumm(summary){	
	// -를 기준으로 줄바꿈이 일어남
	// - gi를 붙이면 모든 문자열 변경이 발생함	
	return summary.replace(/-/gi, "<br> ▶ ");
}


//페이지번호클릭시
	$(".job_pager").on('click','span',function(){
		 var btnId = $(this).attr('id');
		switch(btnId){
		
			//이전버튼 클릭시	
			case 'prev' :thisPage=startPage-1; 						 
						 job_ajax();
						 break;
		
				 
			//다음버튼 클릭시
			case 'next' :thisPage=endPage+1;
						 job_ajax();
						 break; 

			//번호 클릭시
			default :thisPage = $(this).text();
					 job_ajax();
					 break;
		} 
	});

	//검색후 검색결과로 스크롤이동
		function fnMove(ele){
	       var offset = $("."+ele).offset();
	       $('html, body').animate({scrollTop : offset.top}, 400);
		}

</script>
</body>
</html>