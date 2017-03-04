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
    <script src="../js/main.js"></script>
    <link rel="stylesheet" href="../css/job_info.css"/>
    <link rel="stylesheet" href="../css/main.css" />
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
                            <a href="javascript:void(0)" class="tablinks tab-menu" onclick="openCity(event, 'aptitude')">적성별 분류 검색                           </a>
                        </div>
                    </div>
                </div>
                <!--직업별 분류-->
                <div id="job" class="tabcontent">

                    <div class="row">

                        <div class="container col-sm-1"></div>
                        <div class="container col-sm-10 category">
                            <h3>조건 검색</h3>
                            <form action="/job" method="get" id="job_form">
                                <input type="hidden" value="job_dic_list" name="gubun" />
                                <div class="row job_opt">
                                <%@include file="../include/job_cat.jsp" %>
                                </div>
                            </form>
                        </div>
                        <div class="container col-sm-3"></div>
                        <div class="row text-center btn-box col-sm-6">
                            <input type="submit" form="job_form" class="btn btn-block btn-default" value="검색" />
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
                            <form action="/aptitude" method="get" id="apti_form">
                                <input type="hidden" value="job_apti_list" name="gubun" />
                                <div class="row apti_opt">
                                	<%@include file="../include/apti_cat.jsp" %>
                                </div>
                            </form>
                        </div>
                        <div class="container col-sm-3"></div>
                        <div class="row text-center btn-box col-sm-6">
                            <input type="submit" form="apti_form" class="btn btn-block btn-default" value="검색" />
                        </div>
                        <div class="container col-sm-3"></div>
                        <div class="container col-sm-1"></div>
                    </div>
                    <hr/>
                </div>

                <!-- 검색 결과 -->

                <div class="container col-sm-12">
                    <h4 class="search_result">검색 결과 : <span>23</span>개의 직업을 찾았습니다.</h4>
                    <div class="list-group job_list">
                        <a href="/job_detail/0002314" class="list-group-item active">
                            <h4 class="list-group-item-heading job_title">직업명 : <span>가수</span></h4>
                            <div class="row job_info">
                                <div class="col-sm-7 job_sub_info">
                                    <div class="col-sm-4">
                                        직업분야 :
                                    </div>
                                    <div class="col-sm-8">
                                        엔터테인먼트
                                    </div>

                                </div>
                                <div class="col-sm-3 job_sub_info">
                                    <div class="col-sm-5">
                                        연봉 :
                                    </div>
                                    <div class="col-sm-7">
                                        3000만원 이상
                                    </div>

                                </div>
                                <div class="col-sm-2 job_sub_info">
                                    <div class="col-sm-5">
                                        전망 :
                                    </div>
                                    <div class="col-sm-7">
                                        매우좋음
                                    </div>
                                </div>
                            </div>
                            <!--//job_info-->
                            <div class="row job_info">
                                <div class="col-sm-12 job_sub_info">
                                    <div class="col-sm-2">
                                        유사직종 :
                                    </div>
                                    <div class="col-sm-10">
                                        정보시스템컨설턴트,정보기술컨설턴트(IT),KMS컨설턴트,네트워크컨설턴트,CRP컨설턴트,정보보안컨설턴트,ERP컨설턴트,시스템컨설턴트

                                    </div>

                                </div>
                            </div>
                            <!--//job_info-->
                        </a>
                        <a href="/job_detail/0002314" class="list-group-item active">
                            <h4 class="list-group-item-heading job_title">직업명 : <span>가수</span></h4>
                            <div class="row job_info">
                                <div class="col-sm-7 job_sub_info">
                                    <div class="col-sm-4">
                                        직업분야 :
                                    </div>
                                    <div class="col-sm-8">
                                        엔터테인먼트
                                    </div>

                                </div>
                                <div class="col-sm-3 job_sub_info">
                                    <div class="col-sm-5">
                                        연봉 :
                                    </div>
                                    <div class="col-sm-7">
                                        3000만원 이상
                                    </div>

                                </div>
                                <div class="col-sm-2 job_sub_info">
                                    <div class="col-sm-5">
                                        전망 :
                                    </div>
                                    <div class="col-sm-7">
                                        매우좋음
                                    </div>
                                </div>
                            </div>
                            <!--//job_info-->
                            <div class="row job_info">
                                <div class="col-sm-12 job_sub_info">
                                    <div class="col-sm-2">
                                        유사직종 :
                                    </div>
                                    <div class="col-sm-10">
                                        정보시스템컨설턴트,정보기술컨설턴트(IT),KMS컨설턴트,네트워크컨설턴트,CRP컨설턴트,정보보안컨설턴트,ERP컨설턴트,시스템컨설턴트

                                    </div>

                                </div>
                            </div>
                            <!--//job_info-->
                        </a>
                        <a href="/job_detail/0002314" class="list-group-item active">
                            <h4 class="list-group-item-heading job_title">직업명 : <span>가수</span></h4>
                            <div class="row job_info">
                                <div class="col-sm-7 job_sub_info">
                                    <div class="col-sm-4">
                                        직업분야 :
                                    </div>
                                    <div class="col-sm-8">
                                        엔터테인먼트
                                    </div>

                                </div>
                                <div class="col-sm-3 job_sub_info">
                                    <div class="col-sm-5">
                                        연봉 :
                                    </div>
                                    <div class="col-sm-7">
                                        3000만원 이상
                                    </div>

                                </div>
                                <div class="col-sm-2 job_sub_info">
                                    <div class="col-sm-5">
                                        전망 :
                                    </div>
                                    <div class="col-sm-7">
                                        매우좋음
                                    </div>
                                </div>
                            </div>
                            <!--//job_info-->
                            <div class="row job_info">
                                <div class="col-sm-12 job_sub_info">
                                    <div class="col-sm-2">
                                        유사직종 :
                                    </div>
                                    <div class="col-sm-10">
                                        정보시스템컨설턴트,정보기술컨설턴트(IT),KMS컨설턴트,네트워크컨설턴트,CRP컨설턴트,정보보안컨설턴트,ERP컨설턴트,시스템컨설턴트

                                    </div>

                                </div>
                            </div>
                            <!--//job_info-->
                        </a>
                        <a href="/job_detail/0002314" class="list-group-item active">
                            <h4 class="list-group-item-heading job_title">직업명 : <span>가수</span></h4>
                            <div class="row job_info">
                                <div class="col-sm-7 job_sub_info">
                                    <div class="col-sm-4">
                                        직업분야 :
                                    </div>
                                    <div class="col-sm-8">
                                        엔터테인먼트
                                    </div>

                                </div>
                                <div class="col-sm-3 job_sub_info">
                                    <div class="col-sm-5">
                                        연봉 :
                                    </div>
                                    <div class="col-sm-7">
                                        3000만원 이상
                                    </div>

                                </div>
                                <div class="col-sm-2 job_sub_info">
                                    <div class="col-sm-5">
                                        전망 :
                                    </div>
                                    <div class="col-sm-7">
                                        매우좋음
                                    </div>
                                </div>
                            </div>
                            <!--//job_info-->
                            <div class="row job_info">
                                <div class="col-sm-12 job_sub_info">
                                    <div class="col-sm-2">
                                        유사직종 :
                                    </div>
                                    <div class="col-sm-10">
                                        정보시스템컨설턴트,정보기술컨설턴트(IT),KMS컨설턴트,네트워크컨설턴트,CRP컨설턴트,정보보안컨설턴트,ERP컨설턴트,시스템컨설턴트

                                    </div>

                                </div>
                            </div>
                            <!--//job_info-->
                        </a>
                        <a href="/job_detail/0002314" class="list-group-item active">
                            <h4 class="list-group-item-heading job_title">직업명 : <span>가수</span></h4>
                            <div class="row job_info">
                                <div class="col-sm-7 job_sub_info">
                                    <div class="col-sm-4">
                                        직업분야 :
                                    </div>
                                    <div class="col-sm-8">
                                        엔터테인먼트
                                    </div>

                                </div>
                                <div class="col-sm-3 job_sub_info">
                                    <div class="col-sm-5">
                                        연봉 :
                                    </div>
                                    <div class="col-sm-7">
                                        3000만원 이상
                                    </div>

                                </div>
                                <div class="col-sm-2 job_sub_info">
                                    <div class="col-sm-5">
                                        전망 :
                                    </div>
                                    <div class="col-sm-7">
                                        매우좋음
                                    </div>
                                </div>
                            </div>
                            <!--//job_info-->
                            <div class="row job_info">
                                <div class="col-sm-12 job_sub_info">
                                    <div class="col-sm-2">
                                        유사직종 :
                                    </div>
                                    <div class="col-sm-10">
                                        정보시스템컨설턴트,정보기술컨설턴트(IT),KMS컨설턴트,네트워크컨설턴트,CRP컨설턴트,정보보안컨설턴트,ERP컨설턴트,시스템컨설턴트

                                    </div>

                                </div>
                            </div>
                            <!--//job_info-->
                        </a>

                    </div>
                    <!--// list-group-->
                </div>
            </div>
            <div class="col-sm-1 sidenav">
            </div>
        </div>
    </div>

    <footer class="container-fluid text-center">
        <p>Footer Text</p>
    </footer>

</body>

</html>