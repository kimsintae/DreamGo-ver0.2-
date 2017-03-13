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
    <script src="../resources/js/dep_info.js?v=2"></script>
    <link rel="stylesheet" href="../resources/css/dep_info.css?v=1"/>
	<style type="text/css">
	.progressWrap{
		width: 100%;
		height:100%;
		position: fixed;
		background: rgba(0,0,0,.2);
		z-index:2;
		display:none;
	}
	.dep_pager span:hover{cursor: pointer;}
	</style>
</head>
<body>
 <%@ include file="../include/header.jsp" %>
 	<div class="progressWrap">

		<div class="progress">
		  <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar"
		  aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:40%">
		    0% Complete (success)
		  </div>
		</div>
	</div>	
    <div class="container-fluid text-center">
        <div class="row content">
            <div class="col-sm-1 sidenav"></div>
            <div class="col-sm-10">


                <div class="jumbotron col-sm-12 text-left">
                    <h1>학과 정보</h1>
                    <p>학과 정보을 통해 배우고픈 전공 분야와 비전을 수립해보세요!</p>
                </div>


                <div class="col-sm-6 sch_opt" id="high_sh_opt">고등학교</div>
                <div class="col-sm-6 sch_opt" id="univ_sh_opt">대학교</div>

                <div class="container search_opt_box col-sm-12">
                    <form id="depar_Form">
                    	<%@include file="../include/dep_opt.jsp" %>
                    </form>
                </div>
                
                <div class="row">
                    <div class="col-sm-5"></div>
                    <button class="btn btn-default col-sm-2 search_btn" onclick="getFormData()" >검색</button>
                    <div class="col-sm-5"></div>
                </div>
			
			<!-- 검색 결과 -->
               	<div class="row result_area" style="display:none;">
	                <h3 class="col-sm-2 text-left"><span class="totalCnt"></span> 검색 결과</h3>
	                <div class="container col-sm-12 ">
	     
	
	                     <div class="list-group dep_body">
	                      <!-- ajax로 통해 넘어온 결과 붙여지는 곳 -->
	                    </div>
	                    
	                    <!-- 페이징 -->
		                 <ul class="pagination dep_pager">

						</ul>
	                </div><!--//result_area --> 

                </div>
            </div>
            <div class="col-sm-1 sidenav"></div>
        </div>
    </div>

<%@ include file="../include/footer.jsp" %>

<script type="text/javascript">




var formData;
var thisPage=1;
var endPage;
var startPage;
var gubun;


//고등학교, 대학교를 선택시 input에 담아 파라미터로 보내기
$(".sch_opt").click(function(){
	var id = $(this).attr("id");
	if(id=='univ_sh_opt'){
		gubun = "univ_list";
	}else{
		gubun = "high_list";
	}
})

//폼데이터 얻기
function getFormData(){
	
	 //선택 안했을 경우
    if($("input[name='gubun']").val()==""){
        alert("학교 종류를 선택해 주세요");
        return;
    }else{
    	
    	formData = $("#depar_Form").serialize();
    	dep_ajax();
    }

}


//ajax
function dep_ajax(){
	$.ajax({
		type:"POST",
		url:'${ctx}/dep_search?thisPage='+thisPage,
		data:formData,
		error:function(xhr,error){
			alert("실패!");
		},
		success:function(json){
			
			//초기화 영역
			thisPage=1;
			$(".result_area").show();
			$(".dep_body").empty();
			$(".dep_pager").empty();
			endPage = json.pka.endPage;
			startPage = json.pka.startPage;
			
			
			//총 검색수
			$(".totalCnt").text(json.data[0].totalcount);
			result(json);
		}
	})//ajax
}


//ajax 콜벡시 동작할 함수
function result(json){
	
	for(var i = 0 ; i<json.data.length;i++){
		var html = "<a href='${ctx}/detail/"+gubun+"/"+json.data[i].majorseq+"\' class='list-group-item'>\
				    <div class='row'>\
				        <div class='col-sm-6 title text-left'>학과명 : <span>"+json.data[i].mclass+"</span></div>\
				        <div class='col-sm-6 text-left'>계열 : <span>"+json.data[i].lclass+"</span></div>\
				    </div>\
				    <br/>\
				    <div class='row'>\
				        <div class='col-sm-12 text-left'>관련 학과명 : \
				        <span>"+json.data[i].facilname+"</span>\
				        </div>\
				    </div>\
				  </a>";
		
		$(".dep_body").append(html);
		
	}
	
	//pagination
	$(".dep_pager").append(json.pagination);
}

$(".dep_pager").on('click','span',function(){

	var btnId = $(this).attr('id');
	switch(btnId){
	
		//이전버튼 클릭시	
		case 'prev' :thisPage=startPage-1; 	
					 dep_ajax();
					 break;
	
			 
		//다음버튼 클릭시
		case 'next' :thisPage=endPage+1;
					 dep_ajax();
					 break; 

		//번호 클릭시
		default :thisPage = $(this).text();
				 dep_ajax();
				 break;
	}
})

</script>
</body>

</html>