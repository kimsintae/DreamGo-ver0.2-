<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Dream Go!</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="../resources/js/tabs.js?v=1"></script>
    <script src="../resources/js/sch_info.js?v=1"></script>
    <link rel="stylesheet" href="../resources/css/sch_info.css?v=1" />


<style type="text/css">
.sch_pager span:hover{cursor: pointer;}
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
                    <div class="tab">
                        <div class="col-sm-3">
                            <a href="javascript:void(0)" id="ele" class="tablinks tab-menu" onclick="openCity(event, 'ele_sh')">초등학교</a>
                        </div>
                        <div class="col-sm-3">
                            <a href="javascript:void(0)" id="mid" class="tablinks tab-menu" onclick="openCity(event, 'mid_sh')">중학교</a>
                        </div>
                        <div class="col-sm-3">
                             <a href="javascript:void(0)" id="high" class="tablinks tab-menu" onclick="openCity(event, 'high_sh')">고등학교</a>
                        </div>
                        <div class="col-sm-3">
                             <a href="javascript:void(0)" id="uni" class="tablinks tab-menu" onclick="openCity(event, 'uni_sh')">대학교</a>
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
                                <input type="button" class="btn btn-block btn-default" value="검색" title="0"/>
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
                                    <input type="button" class="btn btn-block btn-default" value="검색" title="1"/>
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
                                <input type="button" class="btn btn-block btn-default" value="검색" title="2"/>
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
                                <input type="button" class="btn btn-block btn-default" value="검색" title="3"/>
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

//폼 객체
	var ele_sh_form = $("#ele_sh_form");
	var mid_sh_form = $("#mid_sh_form");
	var high_sh_form = $("#high_sh_form");
	var uni_sh_form = $("#uni_sh_form");
	
	var forms = [ele_sh_form,mid_sh_form,high_sh_form,uni_sh_form];

	var formData;//전역변수로 선언한 폼데이터
	
	var $list_body = $(".list_body");
	var $sch_pager = $(".sch_pager");
	
	var startPage;
	var endPage;
	var thisPage;//현재 클릭한 페이지 번호
	
	
	
	//학교 검색버튼클릭시
	$(".btn-block").click(function(){
	
		//alert("test");			
		var idx = $(this).attr("title");		
		var form = forms[idx];		
		//컨트롤러로 보낼 파라미터들
		formData = form.serialize();
		
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

	//ajax
	function sch_ajax(formData){

		$.ajax({
			type:"POST",
			url:'${ctx}/sch_info/search?thisPage='+thisPage,
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
				
				//총 결과수
				$(".totalCnt").text(json.data[0].totalcount);
				
				
				
				var esttype = json.data[0].esttype;
				var schooltype = json.data[0].schooltype;

				for(var i = 0 ; i < json.data.length ; i++){
					
					
	 				//결과
					$list_body
					.append($("<a href='"+json.data[i].link+"' target='_blank' class='list-group-item sch_content' title='클릭하시면 홈페이지가 열립니다.'>\
							<span class='sch_name'>"+json.data[i].schoolname+"</span>\
							<div class='row  sch_info'>\
								<div class='col-sm-5 adres'>\
								주소 : <span>"+json.data[i].adres+"</span>\
								</div>\
								<div class='col-sm-3 schoolgubun'>\
								학교종류 : <span>"+json.data[i].schoolgubun+"</span>\
								</div>\
								<div class='col-sm-2 esttype'>\
								설립유형 : <span>"+json.data[i].esttype+"</span>\
								</div>\
								<div class='col-sm-2 schooltype'>\
								학교유형 : <span>"+json.data[i].schooltype+"</span>\
								</div>\
							</div>\
							</a>"));
					
					}//for
	
				if(esttype==''){
					//초,중학교
					$(".esttype,.schooltype,.schoolgubun").hide();
					
					//고등학교
					if(schooltype!=undefined){$(".schooltype").show();}
				}
				
				
				//paginate 불러오기
				$sch_pager.append(json.pagination);
					
				$(".sch_result").show();	
			},
			
			error:function(xhr,error){
				alert("실패!");
			}
		});//ajax
	}

	
</script>
</body>

</html>