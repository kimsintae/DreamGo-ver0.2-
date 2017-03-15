<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
    <div class="container-fluid text-center">
        <div class="row content">
            <div class="col-sm-1 sidenav">
            </div>
            <div class="col-sm-10 text-left">
                

                <!-- 고등학교 학과 -->
                <div class="container result-tab-wrap col-sm-12">
                <h1>가정관리</h1>
                    <div class="tab">
                        <a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'first_tab')">개요</a>
                        <a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'sec_tab')">진출분야 및 관련 직업</a>
                        <a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'third_tab')">적성 및 흥미</a>
                        <a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'four_tab')">취업현황</a>
                        <a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'five_tab')">주요교육내용</a>
                        <a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'six_tab')">졸업 상황</a>
                    </div>

                    <div id="first_tab" class="tabcontent">
                        <div class="row sub_row">
                            <div class="col-sm-12 text-left">
                                <!--job-->
                                학과명
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-9">
                                ${data[1].major}
                            </div>
                        </div>
                        <!--//sub_row-->

                        <div class="row sub_row">
                            <div class="col-sm-12 text-left">
                                학과개요
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-9">
			${data[1].summary}
                            </div>
                        </div>
                        <!--//sub_row-->

                    </div>

                    <div id="sec_tab" class="tabcontent">
                        <div class="row sub_row">
                            <div class="col-sm-12 text-left">
                                <!--capacity_major > capacity -->
                                분야 및 직업
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-9">
？ 근로복지공단, 금융기관, 실버산업 관련 분야 
 ？ 사회복지기관 및 단체, 재가복지시설, 보건의료기관, 종합병원, 특수병원, 요양병원 등                            
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
                              사람의 문제에 관심이 많고 심리적·정서적으로 안정적인 학생에 유리하며, 봉사활동에 관심이 많고 경험이 있는 학생에게 적합하다.

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
                            <div class="col-sm-12 text-left">
                                <!--employment-->
                                교육내용
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-9">
                            식품과 영양, 급식관리를 비롯하여 인간발달, 유아생활교육, 아동복지, 노인생활지원, 사회복지, 보건간호, 공중보건 등 복지 관련 교과목을 배운다. 컴퓨터일반, 전자계산실무, 회계원리 등의 교과목을 통해 복지 시설 경영에 대한 기술을 습득한다.
                            
                            </div>
                        </div>
                        <!--//sub_row-->

                    </div>

                    <div id="six_tab" class="tabcontent">
                       <div class="row sub_row">
                       	 <div class="col-sm-2"></div>
                            <div class="col-sm-4">
                                <div id="prospect" style="min-width: 310px; height: 500px; max-width: 600px; margin: 0 auto"></div>
                                <script>
                                    Highcharts.chart('prospect', {
                                        chart: {
                                            plotBackgroundColor: null,
                                            plotBorderWidth: null,
                                            plotShadow: false,
                                            type: 'pie'
                                        },
                                        title: {
                                            text: '졸업자 후 상황'
                                        },
                                        tooltip: {
                                            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                                        },
                                        plotOptions: {
                                            pie: {
                                                allowPointSelect: true,
                                                cursor: 'pointer',
                                                dataLabels: {
                                                    enabled: false
                                                },
                                                showInLegend: true
                                            }
                                        },
                                        series: [{
                                            name: '비율',
                                            colorByPoint: true,
                                            data: [{
                                                name: '진학자',
                                                y: 61
        }, {
                                                name: '기타',
                                                y: 10.2,
                                                color: '#ff80ff'

        }, {
                                                name: '취업자',
                                                y: 28.8
        }]
    }]
                                    });
                                </script>
                                </div>
                       		<div class="col-sm-4">
                                <div id="graduation_gender" style="min-width: 310px; height: 500px; max-width: 600px; margin: 0 auto"></div>
                                <script>
                                    Highcharts.chart('graduation_gender', {
                                        chart: {
                                            plotBackgroundColor: null,
                                            plotBorderWidth: null,
                                            plotShadow: false,
                                            type: 'pie'
                                        },
                                        title: {
                                            text: '졸업자 후 상황'
                                        },
                                        tooltip: {
                                            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                                        },
                                        plotOptions: {
                                            pie: {
                                                allowPointSelect: true,
                                                cursor: 'pointer',
                                                dataLabels: {
                                                    enabled: false
                                                },
                                                showInLegend: true
                                            }
                                        },
                                        series: [{
                                            name: '비율',
                                            colorByPoint: true,
                                            data: [{
                                                name: '남자',
                                                y: 3.6,
                                                color: '#3333ff'
        }, {
                                                name: '여자',
                                                y: 96.4,
                                                color: '#ff6666'

        }]
    }]
                                    });
                                </script>

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
</body>
</html>