<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Dream Go!</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="../resources/css/job_detail.css?v=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="../resources/js/tabs.js?v=1"></script>
    <!-- chart -->
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/data.js"></script>
    <script>
    
    //처음 로드되면 개요 텝 활성화
    function initTab() {
         	$(".tablinks:eq(0)").addClass("active"); 	
        	$("#first_tab").css("display","block");
		}
    </script>
</head>

<!-- initTab 한번만 실행 -->
<body onload="initTab();">

<%@ include file="../include/header.jsp" %>
    <div class="container-fluid text-center">
        <div class="row content">
            <div class="col-sm-1 sidenav">
            </div>
            <div class="col-sm-10 text-left">
                

                <!--상세 결과 탭 -->
                <div class="container result-tab-wrap col-sm-12">
                <h1>웹프로그래머</h1>
                    <div class="tab">
                        <a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'first_tab')">개요</a>
                        <a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'sec_tab')">관련학과/관련자격</a>
                        <a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'third_tab')">적성 및 흥미</a>
                        <a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'four_tab')">취업현황</a>
                        <a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'five_tab')">직업전망</a>
                        <a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'six_tab')">준비방법</a>
                    </div>

                    <div id="first_tab" class="tabcontent">
                        <div class="row sub_row">
                            <div class="col-sm-12 text-left">
                                <!--job-->
                                직업명
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-9">
                                GIS전문가
                            </div>
                        </div>
                        <!--//sub_row-->

                        <div class="row sub_row">
                            <div class="col-sm-12 text-left">
                                <!--ability-->
                                핵심 능력
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-9">
                                공간시각능력, 창의력, 수리논리력
                            </div>
                        </div>
                        <!--//sub_row-->

                        <div class="row sub_row">
                            <div class="col-sm-12 text-left">
                                <!--similarjob-->
                                유사직업명
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-9">
                                지적·측량기술자, 토지측량사, 사진측량·분석가, 지도제작기술자
                            </div>
                        </div>
                        <!--//sub_row-->

                        <div class="row sub_row">
                            <div class="col-sm-12 text-left">
                                <!--similarjob-->
                                <!-- '-' 를 기준으로 <br/>을 삽입해줘야겠다 -->
                                하는 일
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-9">
                                <p>
                                    -GIS(Geographic Information System)전문가는 국토공간상에 존재하는 각종 위치 및 속성정보 등을 정보화하여 활용하는 것으로 첨단정보시스템에 대한 전반적인 업무를 수행한다.
                                    <br/> - 사용자의견을 수렴하여 시스템의 구조를 설계하고, 데이터베이스, 사용자 인터페이스 및 네트워크의 기본적인 시스템구조를 설계한다.
                                    <br/> - 지리정보에 사용되는 각종 데이터를 수집, 분석하여 이를 데이터베이스화 시킨다.
                                    <br/> - 구성요소들에 대한 인터페이스과정을 통하여 종합적인 시스템을 구축하고, 입력된 각종 지리정보데이터를 토대로 사용자가 필요로 하는 목적에 따라 다양한 형태로 분석, 변환시키거나 조작한다.
                                    <br/> - 지리정보시스템(GIS)를 가지고 작업하기도 하며 연산방식, 자료구조, GIS와 맵핑 시스템을 위한 사용자 인터페이스를 설계하고 평가하기도 한다.

                                </p>
                            </div>
                        </div>
                        <!--//sub_row-->

                    </div>

                    <div id="sec_tab" class="tabcontent">
                        <div class="row sub_row">
                            <div class="col-sm-12 text-left">
                                <!--capacity_major > capacity -->
                                관련자격증
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-9">
                                지적기능사, 지적산업기사, 지적기술사, 측량및지형공간정보산업기사, 측량및지형공간정보기사, 측량및지형공간정보기술사, 지적기사, 지질 및 지반 기술사
                            </div>
                        </div>
                        <!--//sub_row-->

                        <div class="row sub_row">
                            <div class="col-sm-12 text-left">
                                <!--capacity_major > capacity -->
                                관련학과
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-9">
                                <!-- 자바에서 "학과명":"이름","url","값" 으로 넘기자-->
                                <div class="list-group major_list col-sm-3">
                                    <a href="http://www.career.go.kr/cnet/front/base/major/FunivMajorView.do?SEQ=489" class="list-group-item major_name">디지털정보과</a>
                                    <a href="#" class="list-group-item">인터넷정보학과</a>
                                    <a href="#" class="list-group-item">정보통신공학과</a>
                                </div>
                            </div>
                        </div>
                        <!--//sub_row-->
                    </div>

                    <div id="third_tab" class="tabcontent">
                        <div class="row sub_row">

                            <div class="col-sm-12">
                                적성 및 흥미
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-10">
                                - GIS전문가는 지표, 지상, 지하에 존재하는 자연물과 인공물에 대한 분석력, 창의력, 판단력이 필요하며, 거시적인 안목에서 지리적 정보에 대한 예측능력이 필요하다.
                                <br/> - 정확하고 세밀한 성격의 소유자에게 유리하며, 여러 명씩 일하는 경우가 많으므로 협동심, 원만한 대인관계가 필요하다.
                                <br/> - 지리, 전산 관련 지식이 필요하며, 항공측량, 원격탐사, 공간분석, 자료변환, 데이터베이스 관리, 가시화 기술 등이 GIS 구축에 필요한 기술이다.
                                <br/> - 진취형과 탐구형의 흥미를 가진 사람에게 적합하며, 분석적 사고, 혁신, 협조심 등의 성격을 가진 사람들에게 유리하다.
                            </div>
                        </div>
                        <!--//sub_row-->

                    </div>

                    <div id="four_tab" class="tabcontent">
                        <div class="row sub_row">
                            <div class="col-sm-12 text-left">
                                <!--stateofemp-->
                                입적 및 취업방법
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-9">
                                - 측량전문업체나 지도제작업체, 지리정보업체, 건설회사, 부동산감정평가회사 등의 민간업체나 한국토지공사, 대한주택공사, 수자원공사, 한국도로공사, 한국농촌공사, 대한지적공사 등의 공공기관에 취업할 수 있다.
                                <br/> - 공무원으로서 국토교통부 국토지리정보원 등의 정부기관에서 일을 할 수도 있다.
                                <br/> - 지리정보를 기초로 데이터를 수집하고 시스템을 구축하려는 등 지리정보시스템(GIS)전산 분야의 업무가 많아지면서 정보처리관련 학과를 졸업한 사람도 지적 또는 측량 관련 업체에 취업하고 있다.
                            </div>
                        </div>
                        <!--//sub_row-->

                        <div class="row sub_row">
                            <div class="col-sm-12 text-left">
                                <!--employment-->
                                고용현황
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-9">
                                - GIS전문가를 포함한 측량 및 지리정보 전문가의 종사자수는 16,800명이며, 이 가운데 임금근로자는 15,400명(91.7%)이다.
                                <br/>- GIS전문가를 포함한 측량 및 지리정보 전문가의 성비는 남자 94.9%, 여자 5.1%이며, 평균 연령은 36.4세이다. 전체적으로 평균 14.5년의 학력을 보유하고 있으며, 평균 계속 근로연수는 8.4년이다(자료: 2011-2012 Job Map).
                            </div>
                        </div>
                        <!--//sub_row-->

                        <div class="row sub_row">
                            <div class="col-sm-12 text-left">
                                <!--salery-->
                                임금수준
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-9">
                                - GIS전문가를 포함한 측량 및 지리정보 전문가의 월평균 수입은 254만원이다(자료: 2011-2012 Job Map).
                            </div>
                        </div>
                        <!--//sub_row-->
                    </div>

                    <div id="five_tab" class="tabcontent">
                        <div class="row sub_row">

                            <div class="col-sm-12">
                                <!--job_possibility-->


                                <!--막대그래프 -->
                                <div class="col-sm-3"></div>
                                <div id="container" class="col-sm-3" style="min-width: 710px; height: 400px; margin: 0 auto"></div>
                                <div class="col-sm-3"></div>
                                <script>
                                    Highcharts.chart('container', {
                                        chart: {
                                            type: 'column',
                                            borderColor: "#000000",
                                            borderRadius: 0,
                                            borderWidth: 1
                                        },

                                        //x축 설정
                                        xAxis: {
                                            type: 'category'
                                        },

                                        //y축 설정
                                        yAxis: {
                                            title: {
                                                text: null
                                            },
                                            //최대 값 설정
                                            max: 100

                                        },
                                        legend: {
                                            enabled: false
                                        },
                                        plotOptions: {
                                            series: {
                                                borderWidth: 0,
                                                dataLabels: {
                                                    enabled: true,
                                                    format: '{point.y:f}'
                                                }
                                            }
                                        },

                                        series: [{
                                            name: 'GLS',
                                            colorByPoint: true,
                                            data: [{
                                                name: '보상',
                                                y: 49
                }, {
                                                name: '일자리전망',
                                                y: 54
                }, {
                                                name: '고용안정',
                                                y: 52
                }, {
                                                name: '발전가능성',
                                                y: 50
                }, {
                                                name: '근무여건',
                                                y: 56
                }, {
                                                name: '직업전문성',
                                                y: 46
                }, {
                                                name: '고용평등',
                                                y: 36
                }]
            }]
                                    });
                                </script>



                            </div>
                        </div>
                        <!--//sub_row-->

                        <div class="row sub_row">
                            <div class="col-sm-12 text-center">
                                <!--salery-->
                                설명
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-9">
                                - GIS전문가가 포함된 측량 및 지리정보 전문가는 다른 직업에 비해서 임금이 비교적 높은 편이며 복리후생도 좋은 편이다.
                                <br/>- 일자리의 창출과 성장이 활발하지는 않으나 취업을 위한 경쟁은 심한 편이다.
                                <br/> - 정규고용과 고용유지 수준이 평균보다 높은 편으로, 고용이 비교적 안정적인 편이다.
                                <br/> - 자기개발가능성이 높고, 전문 기술을 보유하여 직업 내 승진가능성과 직장이동가능성이 높다. 이에 개인적인 발전가능성이 비교적 높은 직업으로 평가된다.
                                <br/> - 기술의 계속적인 발전으로 높은 수준의 전문지식이 요구된다. 또한 업무자율성이 높고 업무권한이 높으며, 공공에 대한 기여도 및 소명의 식이 강해 전반적인 직업 전문성이 높은 편이다.
                            </div>
                        </div>
                        <!--//sub_row-->

                    </div>

                    <div id="six_tab" class="tabcontent">
                        <div class="row sub_row">
                            <div class="col-sm-12 text-left">
                                정규교육과정
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-9">
                                - GIS전문가가 되기 위해서는 대졸 및 대학원에서 대기과학과, 대기환경학과, 지질학과, 지구환경과학과, 지질과학과, 지질환경과학과, 지구시스템과학과 등을 졸업하면 유리하다.

                            </div>
                        </div>
                        <!--//sub_row-->


                        <!--만약에 교육훈련이 null이면 교육훈련 코드 없애기-->
                        <div class="row sub_row">
                            <div class="col-sm-12 text-left">
                                교육훈련
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-9">
                            </div>
                        </div>
                        <!--//sub_row-->

                        <div class="row sub_row">
                            <div class="col-sm-12 text-left">
                                관련 자격증
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-9">
                                - 관련자격증으로는 지적기능사, 지적산업기사, 지적기술사, 지적기사, 지질 및 지반 기술사, 측량및지형공간정보기술사 등이 있다.
                                <br/> - GIS전문가로서 일하기 위해서 국가 공인자격이 반드시 필요한 것은 아니지만 취득 시 우대를 받을 수 있다.

                            </div>
                        </div>
                        <!--//sub_row-->

                    </div>


                    <!--// 결과탭 -->
                </div>
                <div class="col-sm-1 sidenav"></div>
            </div>
		</div>

        </div>
<%@ include file="../include/footer.jsp" %>

</body>

</html>