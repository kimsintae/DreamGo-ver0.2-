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
    <script src="../resources/js/tabs.js?v=1"></script>
    <link rel="stylesheet" href="../resources/css/sch_info.css?v=1" />

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
                             <h3>학교유형 :</h3> 
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
                             <h3>설립유형 :</h3>                     
                               <div class="row third_opt">
                                   <ul class="list-group category_list">
                                       <li>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" value="" name="est" checked>전체
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" value="100334" name="est">국립
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" value="100335" name="est">사립
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" value="100336" name="est">공립
                                                </label>
                                            </div>
                                        </li>
                                </ul>
                                   
                               </div>  
                               
                               <h3>학교유형 :</h3>   
                               <ul class="list-group category_list">
                                   <li>
                                        <div class="radio ">
                                            <label>
                                                <input type="radio" value="" name="sch2" checked>전체
                                            </label>
                                        </div>
                                    </li>
                                    <li class="college">
                                        <div class="radio">
                                            <label>
                                                <input type="radio" value="100324" name="sch2">전문대학
                                            </label>
                                        </div>
                                    </li>
                                    <li class="college">
                                        <div class="radio">
                                            <label>
                                                <input type="radio" value="100325" name="sch2">기능대학(폴리텍대학)
                                            </label>
                                        </div>
                                    </li>
                                    <li class="college">
                                        <div class="radio">
                                            <label>
                                                <input type="radio" value="100326" name="sch2">사이버대학(2년제)
                                            </label>
                                        </div>
                                    </li>
                                    <li class="college">
                                        <div class="radio">
                                            <label>
                                                <input type="radio" value="100327" name="sch2">각종대학(전문)
                                            </label>
                                        </div>
                                    </li>
                                    
                                    <!-- //대학(4년제) -->
                                    
                                    <li class="univ">
                                        <div class="radio">
                                            <label>
                                                <input type="radio" value="100328" name="sch2">일반대학
                                            </label>
                                        </div>
                                    </li>
                                    <li class="univ">
                                        <div class="radio">
                                            <label>
                                                <input type="radio" value="100329" name="sch2">교육대학
                                            </label>
                                        </div>
                                    </li>
                                    <li class="univ">
                                        <div class="radio">
                                            <label>
                                                <input type="radio" value="100330" name="sch2">산업대학
                                            </label>
                                        </div>
                                    </li>
                                    <li class="univ">
                                        <div class="radio">
                                            <label>
                                                <input type="radio" value="100331" name="sch2">사이버대학(4년제)
                                            </label>
                                        </div>
                                    </li>
                                    <li class="univ">
                                        <div class="radio">
                                            <label>
                                                <input type="radio" value="100332" name="sch2">각종대학(대학)
                                            </label>
                                        </div>
                                    </li>
                                </ul>                   
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
                <div class="container sch_result col-sm-12">
                   <h3 class="search_result"><span class="totalCnt"></span>개의 검색 결과가 있습니다.<strong>(클릭시 해당 학교 홈페이지로 이동합니다.)</strong></h3>
                    <ul class="list-group list_body">

                    </ul>
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
 
	$(".btn-block").click(function(){
		
		//alert("test");			
		var idx = $(this).attr("title");		
		var form = forms[idx];
	
		
		//컨트롤러로 보낼 파라미터들
		var formdata = form.serialize();
		//alert(formdata);
		$(".list_body").empty();
		$.ajax({
			type:"POST",
			url:'${ctx}/sch_info/search',
			data:formdata, //전송할 파라미터
		 	dataType:"json",
			success:function(json){
				//성공시

				$(".totalCnt").text(json[0].totalcount);
				
 				for(var i = 0 ; i < json.length ; i++){
					
					
				$(".list_body")
				.append($("<a href='"+json[i].link+"' target='_blank' class='list-group-item sch_content' title='클릭하시면 홈페이지가 열립니다.'>\
						<span class='sch_name'>"+json[i].schoolname+"</span>\
						<div class='row  sch_info'>\
						<div class='col-sm-5'>\
						주소 : <span>"+json[i].adres+"</span>\
						</div>\
						<div class='col-sm-3'>\
						학교종류 : <span>"+json[i].schoolgubun+"</span>\
						</div>\
						<div class='col-sm-2'>\
						설립유형 : <span>"+json[i].esttype+"</span>\
						</div>\
						<div class='col-sm-2'>\
						학교유형 : <span>"+json[i].schooltype+"</span>\
						</div>\
						</div>\
						</a>"));
				
				}

			},
			
			error:function(xhr,error){
				alert("실패!");
			}
		});
		
	})//button

	
	//학교종류 선택시
	$(":input[name=sch1]").click(function(){
	var value =	$(this).val();
	
	if(value=="100322"){
		
		//전문대학 선택시
		$(".category_list .college").css("display","block");
		$(".category_list .univ").css("display","none");
		
	}else if(value=="100323"){
		//4년제  선택
		$(".category_list .univ").css("display","block");
		$(".category_list .college").css("display","none");
	}else{
		//전체선택시
		$(".category_list .univ").css("display","block");
		$(".category_list .college").css("display","block");
	}
		
	})
 </script>

</body>

</html>