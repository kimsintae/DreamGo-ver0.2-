<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>직업정보</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script src="${pageContext.request.contextPath}/resources/js/tabs.js?v=1"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<style type="text/css">
	  	  /* 탭 스타일 */
		
		div.tab {
		    overflow: hidden;
		    height: 80px;
		    margin: auto;
		}
		
		
		/* 메인 탭 */
		
		div.tab .tab-menu {
		    float: left;
		    color: black;
		    text-align: center;
		    padding: 14px 16px;
		    text-decoration: none;
		    font-size: 20px;
		    height: 80px;
		    font-weight: bold;
		    line-height: 50px;
		}
		        
		div.tab .tab-menu:hover {
		    background-color: #d5f4e6;
		}
		
		.job_tab{background:#c0ded9; }
		.apti_tab{background:#8ca3a3;}
		
		
		/* Style the tab content */
		
		.tabcontent {
		    display: none;
		    padding: 6px 12px;
		    /*    border: 1px solid #ccc;*/
		    border-top: none;
		    margin-top: 30px;
		}
		
		.category{
		    border: 1px solid #424242;
		}
		
		
		.category_list{
		    margin-left: 50px;
		}
		.category_list li{
		        float: left;
		        list-style: none;
		        width:150px;
		        font-size: 15px;
		        
		}
		.btn-box{
		    margin: 20px 0;
		}
		
		/* // 탭 스타일 */
		 
		.result_row div{
			margin-bottom: 15px;
		}   	
		.job_pager span{
			cursor: pointer;
		}
		.result_area{
			margin-top:20px;
			display: none;
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
                
                <!-- 검색 -->
                <div class="row">
	               <div class="col-sm-5">
	                <div class="input-group">
					    <input type="text" id="keyword" class="form-control" placeholder="Search">
					    <div class="input-group-btn">
					      <button class="btn btn-default" id="searchBtn" type="submit">
					        <i class="glyphicon glyphicon-search"></i>
					      </button>
					    </div>
				    </div>
	               </div>
	               <!-- 탭 -->
	              
	               <div class="tab">
	                   <div class="col-sm-6">
	                       <a href="javascript:void(0)" class="tablinks tab-menu col-sm-12 job_tab" onclick="openCity(event, 'job')">직업별 분류 검색
	                      </a>
	                   </div>
	                   <div class="col-sm-6">
	                       <a href="javascript:void(0)" class="tablinks tab-menu col-sm-12 apti_tab" onclick="openCity(event, 'aptitude')">적성별 분류 검색</a>
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

});



function job_ajax(){
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/job_search?thisPage="+thisPage,
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
			//스크롤이동
			fnMove("result_area");
		},
		error:function(error,xhr){
			alert("실패!");
		}
	});
}



//키워드 검색
$("#searchBtn").click(function(){
	var keyword = $("#keyword").val();
	$(".job_list").empty();
	$.ajax({
		url:"${pageContext.request.contextPath}/keyword/job",
		type:"get",
		data:{'keyword':keyword},
		dataType:"json",
		success:function(json){
			$(".result_area").show();
			$(".totalCnt").text(json.data.length);//총검색수
			result(json);
			//스크롤이동
			fnMove("result_area");
		},
		error:function(xhr,error){
			alert("실패");
		}
		
	})
	
});//keyword 검색


//콜벡시 호출될 함수
function result(json){
	
	for(var i=0;i<json.data.length;i++){
		var html = "<form action=\'${pageContext.request.contextPath}/detail/"+json.data[i].jobdicseq+"\' method='POST'>\
					<li class='list-group-item row'>\
						<div class='col-sm-12 result_row'>\
							직업명 :<button class='btn-default detail_btn job_title' style='color:#034f84;font-weight:bold;font-size:25px;border: none;'>"+json.data[i].job+"</button>\
						</div>\
						<div class='col-sm-12 row result_row'>\
							<div class='col-sm-6'>직업분야 : <span class='job_type'>"+json.data[i].profession+"</span></div>\
							<div class='col-sm-3'>연봉 : <span class='job_salary' style='color:blue;'>"+json.data[i].salery+"</span></div>\
							<div class='col-sm-3'>전망 : <span class='job_prospec' style='color:blue;'>"+json.data[i].possibility+"</span></div>\
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