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
    <script src="../js/dep_info.js"></script>
    <link rel="stylesheet" href="../resources/css/dep_info.css"/>

</head>

<body>
 <%@ include file="../include/header.jsp" %>
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
                    <form action="/depart" method="get" id="depar_Form">
                    	<%@include file="../include/dep_opt.jsp" %>
                    
                    </form>
                </div>
                
                <div class="row">
                    <div class="col-sm-5"></div>
                    <button class="btn btn-default col-sm-2 search_btn" >검색</button>
                    <div class="col-sm-5"></div>
                </div>

               <div class="row result_area">
                <h3 class="col-sm-2 text-left">검색 결과</h3>
                <div class="container col-sm-12 ">
     

                     <div class="list-group">
                      <a href="/dep_detail/1231" class="list-group-item">
                        <div class="row">
                            <div class="col-sm-6 title text-left">학과명 : <span>응용시스템과</span></div>
                            <div class="col-sm-6 text-left">계열 : <span>공학계열</span></div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-sm-12 text-left">관련 학과명 : 
                            <span>
                            하이테크CAD/CAM과, 전자CAD과, 반도체CAD, 캐드캠과, CAD&amp;모델링과
                            </span>
                            </div>
                        </div>
                      </a>
                      <a href="/dep_detail/1231" class="list-group-item">
                        <div class="row">
                            <div class="col-sm-6 title text-left">학과명 : <span>기전공학</span></div>
                            <div class="col-sm-6 text-left">계열 : <span>농산업</span></div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-sm-12 text-left">관련 학과명 : 
                            <span>
                            메카트로닉스과, 자동화기계과, 자동화설비기계과, 자동화시스템과, 전기자동화과, 생산자동화설비과, 시스템자동화과, 생산자동화과, 자동화모델링과, 자동화시스템, 산업자동화과, 디지털생산자동화과, 메카트로닉스계열, 철강자동화과, 자동화과
                            </span>
                            </div>
                        </div>
                      </a>
                      <a href="/dep_detail/1231" class="list-group-item">
                        <div class="row">
                            <div class="col-sm-6 title text-left">학과명 : <span>뷰티아트</span></div>
                            <div class="col-sm-6 text-left">계열 : <span>디자인산업</span></div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-sm-12 text-left">관련 학과명 : 
                            <span>
메이크업과, 미용과, 미용예술과, 미용정보과, 미용피부과, 이·미용과, 토탈미용과, 토탈뷰티과, 피부미용과, 뷰티미용과, 화장품응용과학과, 미용건강과, 미용과학과, 뷰티과, 바이오향장과, 국제뷰티아트과, 피부케어과, 미용디자인과, 헤어미용과, 뷰티케어과
                            </span>
                            </div>
                        </div>
                      </a>
                      
                    </div>
                </div><!--//result_area --> 
                </div>
            </div>
            <div class="col-sm-1 sidenav"></div>
        </div>
    </div>

<%@ include file="../include/footer.jsp" %>

</body>

</html>