<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>학교정보</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/tabs.js?v=1"></script>
    <script src="${pageContext.request.contextPath}/resources/js/sch_info.js?v=1"></script>

	<style type="text/css">
	
		.active{background:rgba(252,231,0,.3);};
		.sch_pager span:hover{cursor: pointer;}
       
        .sch_cat a{
            font-size: 25px;
            
        }
        
        .sch_result{
            margin-top: 30px;
        }
        
        .sch_info{
            margin-top: 10px;
            font-size: 15px;
        }
        .sch_info span,.sch_name{
            font-weight: bold;
        }
        .sch_name{
            font-size: 20px;
        }
		/* �꺆 �뒪���씪 */
		
		div.tab {
		    overflow: hidden;
		    height: 80px;
		    margin: auto;
		}
		
		
		/* 硫붿씤 �꺆 */
		
		div.tab .tab-menu {
		    float: left;
		    display: block;
		    color: black;
		    text-align: center;
		    padding: 14px 16px;
		    text-decoration: none;
		    font-size: 20px;
		    font-weight: bold;
		    line-height: 50px;
		}
		
		
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
		        margin:10px;
		        font-size: 15px;
		}
		.btn-box{
		    margin: 20px 0;
		}
		
		/* // �꺆 �뒪���씪 */
		
		/* 寃곌낵 �꺆 �뒪���씪 */
		.result-tab-wrap{
		    margin: 30px 0;
		}
		
		.tab-menus{
		    margin: auto;
		}
		.result-tab-wrap .tab-menus a{
		    font-size: 20px;
		    color: black;
		    text-align: center;
		    margin-left: 75px;
		}
		
		
		/* // 寃곌낵 �꺆 �뒪���씪*/
		
		/* pagination*/
		
		.sch_pager{
			font-size:15px;
			
		}
		
		.campus{
			color:#b7d7e8;
			
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
                    <h1>학교 정보</h1>      
                    <p>학교 정보를 통해 진학 목표를 수립해 보세요!</p>
                </div>
                <br/>
                <br/>

                
                <!-- 탭 -->
                <div class="row">
               	   <div class="col-sm-5">
               	   <form id="searchForm">
					    <select name="gubun" class="form-control">
					    	<option value="elem_list">초등학교</option>
					    	<option value="midd_list">중학교</option>
					    	<option value="high_list">고등학교</option>
					    	<option value="univ_list">대학교</option>
					    </select>
		                <div class="input-group">
						    <input type="text" id="keyword" name="keyword" class="form-control" placeholder="Search">
						    <div class="input-group-btn">
						      <button class="btn btn-default" id="searchBtn" type="button">
						        <i class="glyphicon glyphicon-search"></i>
						      </button>
						    </div>
						</div>
					</form>	
	                </div>
                
                    <div class="tab">
                        <div class="col-sm-3">
                            <a href="javascript:void(0)" id="ele" class="tablinks tab-menu col-sm-12" style="background:#96ceb4;" onclick="openCity(event, 'ele_sh')">초등학교</a>
                        </div>
                        <div class="col-sm-3">
                            <a href="javascript:void(0)" id="mid" class="tablinks tab-menu col-sm-12" style="background:#ffeead;" onclick="openCity(event, 'mid_sh')">중학교</a>
                        </div>
                        <div class="col-sm-3">
                             <a href="javascript:void(0)" id="high" class="tablinks tab-menu col-sm-12" style="background:#ffcc5c;" onclick="openCity(event, 'high_sh')">고등학교</a>
                        </div>
                        <div class="col-sm-3">
                             <a href="javascript:void(0)" id="uni" class="tablinks tab-menu col-sm-12" style="background:#ff6f69;" onclick="openCity(event, 'uni_sh')">대학교</a>
                        </div>         
                    </div><!--//tab-->
                </div>               
                <!--초등학교 분류-->
                <div id="ele_sh" class="tabcontent">
                   
                    <div class="row">
                        
                        <div class="container col-sm-1"></div>
                        <div class="container col-sm-10 category">
                           
                            <form id="ele_sh_form" class="sch_form">
                                <input type="hidden" value="elem_list" name="gubun"/>
                             <h3>지역 :</h3>
                              <div class="row first_opt">
                              	<%@ include file="../include/region.jsp" %>
                              </div>
                            </form>
                        </div>
                            <div class="container col-sm-3"></div>
                            <div class="row text-center btn-box col-sm-6">
                                <input type="button" class="btn btn-block btn-default searchBtn" id="eleBtn" value="검색"/>
                            </div>
                            <div class="container col-sm-3"></div>
                        <div class="container col-sm-1"></div>
                    </div><!--//div row-->
                    <hr/>
                </div>
                
                <!--중학교 분류-->
                <div id="mid_sh" class="tabcontent">
                        <div class="row">
                            <div class="container col-sm-1"></div>
                            <div class="container col-sm-10 category">
                               
                                <form id="mid_sh_form" class="sch_form">
                                <input type="hidden" value="midd_list" name="gubun"/>
                                 <h3>지역 :</h3>
                                  <div class="row first_opt">
                                  <%@ include file="../include/region.jsp" %>
                                  </div>
                                </form>
                                
                            </div>
                                <div class="container col-sm-3"></div>
                                <div class="row text-center btn-box col-sm-6">
                                    <input type="button" class="btn btn-block btn-default searchBtn" id="midBtn" value="검색"/>
                                </div>
                                <div class="container col-sm-3"></div>
                            <div class="container col-sm-1"></div>
                        </div>
                    <hr/>
                </div><!--// mid_sh-->
                
                <!--고등학교 분류-->
                <div id="high_sh" class="tabcontent">
                    
                    <div class="row">
                        <div class="container col-sm-1"></div>
                        <div class="container col-sm-10 category">
                           
                            <form id="high_sh_form" class="sch_form">
                            <input type="hidden" value="high_list" name="gubun"/>
                             <h3>지역 :</h3>
                              <div class="row first_opt">
                              <%@ include file="../include/region.jsp" %>
                              </div>
                             <h3>학교종류 :</h3> 
                              <div class="row sec_opt">
                              <%@ include file="../include/high_opt.jsp" %>
                              </div>       
                            </form>
                        </div>
                            <div class="container col-sm-3"></div>
                            <div class="row text-center btn-box col-sm-6">
                                <input type="button" class="btn btn-block btn-default searchBtn" id="highBtn" value="검색"/>
                            </div>
                            <div class="container col-sm-3"></div>
                        <div class="container col-sm-1"></div>
                    </div>
                    <hr/>
                </div><!--// high_sh-->
                
                <!--대학교 분류-->
                <div id="uni_sh" class="tabcontent">
                    
                    <div class="row">
                        <div class="container col-sm-1"></div>
                        <div class="container col-sm-10 category">
                            <form id="uni_sh_form" class="sch_form">
                            <input type="hidden" value="univ_list" name="gubun"/>
                             <h3>지역 :</h3>
                               <div class="row first_opt">
                               <%@ include file="../include/region.jsp" %>
                               </div>   
                             <h3>학교종류 :</h3>    
                               <div class="row sec_opt">
                               	<%@ include file="../include/univ_opt.jsp" %>
                               </div>     
                             	<%@ include file="../include/univ_opt2.jsp" %>                   
                            </form>
                        </div>
                            <div class="container col-sm-3"></div>
                            <div class="row text-center btn-box col-sm-6">
                                <input type="button" class="btn btn-block btn-default searchBtn" id="univBtn" value="검색"/>
                            </div>
                            <div class="container col-sm-3"></div>
                        <div class="container col-sm-1"></div>
                    </div>
                    <hr/>
                </div><!--// uni_sh-->
                
                <!-- 검색 결과 -->
                <div class="container sch_result col-sm-12" style="display:none;">
                   <h3 class="search_result"><span class="totalCnt"></span>개의 검색 결과가 있습니다.<strong>(클릭시 해당 학교 홈페이지로 이동합니다.)</strong></h3>
                    <ul class="list-group list_body">
                    </ul>

				<!-- pagination -->         
					           
                    <div class="row col-sm-12">
                    	<div class="col-sm-3"></div>
                    	<ul class="pagination sch_pager col-sm-6">
						</ul>
                   		 <div class="col-sm-3"></div>
                    </div>
                </div>
            </div>
            <div class="col-sm-1 sidenav"></div>
            
        </div>
    </div>

 <%@ include file="../include/footer.jsp" %>
<script type="text/javascript">

	var formData;//전역변수로 선언한 폼데이터
	
	var $list_body = $(".list_body");
	var $sch_pager = $(".sch_pager");
	
	var startPage;
	var endPage;
	var thisPage;//현재 클릭한 페이지 번호
	
	
	
	//학교 검색버튼클릭시
	$(".searchBtn").click(function(){
		var id = $(this).attr("id");	
		//alert("test");			
		
		//검색 버튼에 따라 동적으로 초기화 되는 폼데이터
		switch(id){
		case "eleBtn":formData= $("#ele_sh_form").serialize();break;
		case "midBtn":formData= $("#mid_sh_form").serialize();break;
		case "highBtn":formData= $("#high_sh_form").serialize();break;
		case "univBtn":formData= $("#uni_sh_form").serialize();break;
		}
		
		//버튼 검색은
		//재검색을 의미하니까
		//thisPage를 초기화 시켜줘야한다.
		//이전 검색에서 30페이지에 있었으면
		//thisPage가 30으로 재검색을 하게 되니까
		
		thisPage=1;
		
		//ajax 호출
		sch_ajax(formData);

	})//button
	

	//페이지번호클릭시
	$(".sch_pager").on('click','span',function(){

		var btnId = $(this).attr('id');

		
		switch(btnId){
		
			//이전버튼 클릭시	
			case 'prev' :thisPage=startPage-1; 						 
			 			 sch_ajax(formData);
						 break;
		
				 
			//다음버튼 클릭시
			case 'next' :thisPage=endPage+1;
						 sch_ajax(formData);
						 break; 

			//번호 클릭시
			default :thisPage = $(this).text();
					 sch_ajax(formData);
					 break;
		}
	});

	//학교 리스트
	function sch_ajax(formData){

		$.ajax({
			type:"POST",
			url:'${pageContext.request.contextPath}/sch_info/search?thisPage='+thisPage,
			data:formData,//전송할 파라미터
		 	dataType:"json",
			success:function(json){
				//성공시
				//alert(json.pagination);
				
				//다음_이전 버튼을 위한 페이지번호 초기화
				endPage = json.pka.endPage;
				startPage = json.pka.startPage;
				

				
				//success 안에서 empty를 시켜야 
				//html 리로딩 현상이 안보인다
		 		$(".list_body").empty();
				$(".sch_pager").empty();

				//학교 종류 선택시 사라졌던 태그들 초기화
				$(".esttype,.schooltype,.schoolgubun").show();
				//목록 뿌리기
				result(json);
				//paginate 불러오기
				$sch_pager.append(json.pagination);
				$(".sch_result").show();	
				
				
				 //스크롤이동
				fnMove("sch_result");
			
			},

			
			error:function(xhr,error){
				alert("검색 결과가 없습니다.");
			}
		});//ajax
	}
	
	
	

	//검색버튼 클릭시 검색
	$("#searchBtn").click(function(){
		//formdata
		formdata = $("#searchForm").serialize();
		
		doGetSearchData(formdata);
		$(".list_body").empty();
		
		
	});//keyword 검색
	
	
	//엔터키 쳤을때 검색
	$('#keyword').on('keydown', function(evt){
		formdata = $("#searchForm").serialize();
        if(evt.keyCode==13){
           	evt.preventDefault();
           	doGetSearchData(formdata);
           	
        }
    });
	
	//키워드 검색 데이터 받아오기
	function doGetSearchData(formdata){
		$(".list_body").empty();
		$.ajax({
			url:"${pageContext.request.contextPath}/keyword/sch",
			type:"get",
			data:formdata,
			dataType:"json",
			success:function(json){
				$(".sch_result").show();
				//목록뿌리기
				result(json);
				
				 //스크롤이동
				fnMove("sch_result");
			
			},
			error:function(xhr,error){
				alert("실패");
			}
			
		})
	}
	
	
	//결과 데이터 붙이기
	function result(json){
		for(var i = 0 ; i < json.data.length ; i++){
			//총 결과수
			$(".totalCnt").text(json.data[0].totalcount);
			var esttype = json.data[0].esttype;
			var schooltype = json.data[0].schooltype;
			
			//결과
			$list_body
			.append($("<a href='"+json.data[i].link+"' target='_blank' class='list-group-item sch_content' title='클릭하시면 홈페이지가 열립니다.'>\
					<span class='sch_name'>"+json.data[i].schoolname+"</span> <span class='campus'>- [ "+json.data[i].campusname+"]</span>\
					<div class='row  sch_info'>\
						<div class='col-sm-4 adres'>\
						주소 : <span>"+json.data[i].adres+"</span>\
						</div>\
						<div class='col-sm-3 schoolgubun'>\
						학교종류 : <span>"+json.data[i].schoolgubun+"</span>\
						</div>\
						<div class='col-sm-2 esttype'>\
						설립유형 : <span>"+json.data[i].esttype+"</span>\
						</div>\
						<div class='col-sm-3 schooltype'>\
						학교유형 : <span>"+json.data[i].schooltype+"</span>\
						</div>\
					</div>\
					</a>"));
			}//for
				
			//학교종류별 보여지는 결과옵션
			if(esttype==''){
				//초,중학교
				$(".esttype,.schooltype,.schoolgubun,.campus").hide();
				
				//고등학교
				if(schooltype!=undefined){$(".schooltype").show();}
			}
			
		
	}

	//검색후 검색결과로 스크롤이동
	function fnMove(ele){
       var offset = $("."+ele).offset();
       $('html, body').animate({scrollTop : offset.top}, 400);
	}
	
	$(".tab-menu").click(function(){
		$(this).addClass("active");
	});
</script>
</body>

</html>