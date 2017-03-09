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
                <!--상세 결과 탭 -->
                <div class="container result-tab-wrap col-sm-12">
                <div class="row dep_top">
	                <div class="col-sm-7">
		                <div class="col-sm-4 major">
		                <span>e-비즈니스과</span>
		                </div>

	                	<div class="col-sm-3 salary">평균임금  <strong>130</strong> 만원 이상</div>     
	                	<div class="col-sm-3 emp">취업률  <strong>60</strong> % 이상</div>	
	                </div>
	                <div class="col-sm-4"></div>
              	</div>  

                    <div class="tab">
                        <a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'first_tab')">개요</a>
                        <a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'sec_tab')">관련직업/관련자격</a>
                        <a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'third_tab')">학과전망</a>
                        <a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'four_tab')">주요교과목</a>
                        <a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'five_tab')">개설대학</a>
                    </div>

                    <div id="first_tab" class="tabcontent">
                        <div class="row sub_row">
                            <div class="col-sm-12 text-left">
                                학과개요
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-9">
                                e-비즈니스과는 인터넷 등장에 의한 e-비즈니스 패러다임과 가치사슬을 통합한 실무중심 교육 및 e-비즈니스 실무 운영자 양성을 목표로 특성화 된 학과입니다.
                                <p>e-비즈니스과는 인터넷을 통해 수행되는 상품 및 금융의 거래, 기업홍보, 서비스 등의 모든 e-비즈니스 행위를 가장 효율적으로 수행할 수 있는 능력과 이를 효과적으로 유지하고 관리하기 위한 e-비즈니스 분야의 다양한 제반 문제를 해결할 수 있는 능력을 보유한 e-비즈니스 전문가 육성을 교육목표로 두고 있습니다.

                            </div>                                                                
                        </div>
                        <!--//sub_row-->

                        <div class="row sub_row">
                            <div class="col-sm-12 text-left">
                                <!--ability-->
                                세부관련학과
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-9">
                                e-경영정보계열, 디지털경영학과, 쇼핑몰디자인창업과, 인터넷경영정보과, 인터넷비즈니스과, 인터넷상거래과, 인터넷쇼핑경영과, 인터넷쇼핑몰마케팅과, e-경영정보과, e-비즈니스경영과, e-비즈니스과, E-비즈니스과, e-비즈니스경영학과(학사학위전공심화과정), e-비즈니스과(인문사회계열), e-비즈니스학과(학사학위전공심화), e-비지니스과, e-비지니스전공
                            </div>
                        </div>
                        <!--//sub_row-->

                        <div class="row sub_row">
                            <div class="col-sm-12 text-left">
                                취업률
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-9">
                                <strong>60</strong> % 이상
                            </div>
                        </div>
                        <!--//sub_row-->

                        <!-- 값 비어 있으면 아래 태그 삭제 -->
                        <div class="row sub_row">
                            <div class="col-sm-12 text-left">
                                학과특성
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-9">
                                <p>

                                </p>
                            </div>
                        </div>
                        <!--//sub_row-->

                        <!-- 값 비어 있으면 아래 태그 삭제 -->
                        <div class="row sub_row">
                            <div class="col-sm-12 text-left">
                                적성 및 흥미
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-9">
                                <p>

                                </p>
                            </div>
                        </div>
                        <!--//sub_row-->

                    </div>

                    <div id="sec_tab" class="tabcontent">
                        <div class="row sub_row">
                            <div class="col-sm-12 text-left">
                                관련직업
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-9">
                                웹마스터, 웹프로그래머, 전자상거래전문가, 웹기획자, 웹마케터
                            </div>
                        </div>
                        <!--//sub_row-->

                        <div class="row sub_row">
                            <div class="col-sm-12 text-left">
                                관련자격
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-9">
                                사무자동화산업기사, 웹디자인기능사, 인터넷정보관리사, 전자상거래 관리사, 정보처리산업기사
                            </div>
                        </div>
                        <!--//sub_row-->
                    </div>

                    <div id="third_tab" class="tabcontent">

                        <!-- chart 1part -->
                        <div class="row sub_row">
                            <div class="col-sm-2">
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
                                            text: '졸업 후 상황'
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
                                                y: 5.9
        }, {
                                                name: '기타',
                                                y: 34.8,
                                                color: '#ff80ff'

        }, {
                                                name: '취업자',
                                                y: 59.3
        }]
    }]
                                    });
                                </script>

                            </div>
                            <div class="col-sm-2"></div>
                            <div class="col-sm-2">
                                <div id="after_graduation" style="min-width: 310px; height: 500px; max-width: 600px; margin: 0 auto"></div>
                                <script>
                                    Highcharts.chart('after_graduation', {
                                        chart: {
                                            plotBackgroundColor: null,
                                            plotBorderWidth: null,
                                            plotShadow: false,
                                            type: 'pie'
                                        },
                                        title: {
                                            text: '졸업후 첫 직업분야'
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
                                                name: '식품·환경·농림어업·군인',
                                                y: 2.8
        }, {
                                                name: '전기·전자·정보통신',
                                                y: 4.2
        }, {
                                                name: '건설·기계·재료·화학·섬유',
                                                y: 1.4
        }, {
                                                name: '운송·영업·판매·경비',
                                                y: 25.4
        }, {
                                                name: '사회복지·문화·예술·방송',
                                                y: 4.2
        }, {
                                                name: '교육·연구·법률·보건',
                                                y: 2.8
        }, {
                                                name: '관리·경영·금융·보험',
                                                y: 45.1
        }]
    }]
                                    });
                                </script>


                            </div>
                            <div class="col-sm-2"></div>
                            <div class="col-sm-2">
                                <div id="avg_salary" style="min-width: 310px; height: 500px; max-width: 600px; margin: 0 auto"></div>
                                <script>
                                    Highcharts.chart('avg_salary', {
                                        chart: {
                                            plotBackgroundColor: null,
                                            plotBorderWidth: null,
                                            plotShadow: false,
                                            type: 'pie'
                                        },
                                        title: {
                                            text: '졸업 후 첫 직장 월평균 임금'
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
                                                name: '0~50만원',
                                                y: 0
        }, {
                                                name: '51~100만원',
                                                y: 17.9
        }, {
                                                name: '101~150만원',
                                                y: 50.7
        }, {
                                                name: '151~200만원',
                                                y: 26.9
        }, {
                                                name: '201~250만원',
                                                y: 0
        }, {
                                                name: '251~300만원',
                                                y: 1.5
        }, {
                                                name: '301만원 이상',
                                                y: 3
        }]
    }]
                                    });
                                </script>
                            </div>
                        </div>
                        <!--//sub_row-->
                        <!--//chart 1part-->

                        <!-- chart 2part -->
                        <div class="row sub_row">
                            <div class="col-sm-2">
                                <div id="satisfaction" style="min-width: 310px; height: 500px; max-width: 600px; margin: 0 auto"></div>
                                <script>
                                    Highcharts.chart('satisfaction', {
                                        chart: {
                                            plotBackgroundColor: null,
                                            plotBorderWidth: null,
                                            plotShadow: false,
                                            type: 'pie'
                                        },
                                        title: {
                                            text: '첫 직장 만족도'
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
                                                name: '매우 불만족',
                                                y: 5.6
        }, {
                                                name: '불만족',
                                                y: 19.7
        }, {
                                                name: '보통',
                                                y: 47.9
        }, {
                                                name: '만족',
                                                y: 23.9
        }, {
                                                name: '매우 만족',
                                                y: 2.8
        }]
    }]
                                    });
                                </script>

                            </div>
                            <div class="col-sm-2"></div>
                            <div class="col-sm-2">
                                <div id="applicant" style="min-width: 310px; height: 500px; max-width: 600px; margin: 0 auto"></div>

                                <table id="datatable" style="display:none;">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>지원자</th>
                                            <th>입학자</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th>e-비지니스학과</th>
                                            <td>92397</td>
                                            <td>13140</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <script>
                                    Highcharts.chart('applicant', {
                                        data: {
                                            table: 'datatable'
                                        },
                                        chart: {
                                            type: 'column'
                                        },
                                        title: {
                                            text: '입학상황'
                                        },
                                        yAxis: {
                                            allowDecimals: false,
                                            title: {
                                                text: '인원(명)'
                                            }
                                        },
                                        tooltip: {
                                            formatter: function () {
                                                return '<b>' + this.series.name + '</b><br/>' +
                                                    this.point.y + ' ' + this.point.name.toLowerCase();
                                            }
                                        }
                                    });
                                </script>


                            </div>
                            <div class="col-sm-2"></div>
                            <div class="col-sm-2">
                                <div id="employment_rate" style="min-width: 310px; height: 500px; max-width: 600px; margin: 0 auto"></div>
                                <script>
                                    Highcharts.chart('employment_rate', {
                                        title: {
                                            text: '취업률'
                                        },
                                        xAxis: {
                                            categories: ['취업률']
                                        },
                                        labels: {
                                            items: [{
                                                style: {
                                                    left: '50px',
                                                    top: '18px',
                                                    color: (Highcharts.theme && Highcharts.theme.textColor) || 'black'
                                                }
        }]
                                        },
                                        series: [{
                                            type: 'column',
                                            name: '남자',
                                            data: [65.7],
                                            color: '#3333ff'
    }, {
                                            type: 'column',
                                            name: '여자',
                                            data: [65.9],
                                            color: '#ff6666'
    }, {
                                            type: 'spline',
                                            name: '평균',
                                            data: [65.8],
                                            marker: {
                                                lineWidth: 5,
                                                lineColor: Highcharts.getOptions().colors[3],
                                                fillColor: 'white',
                                                width: 15
                                            }
    }]
                                    });
                                </script>
                            </div>
                        </div>
                        <!--//sub_row-->
                        <!--//chart 2part-->
	           </div>

                    <div id="four_tab" class="tabcontent">
                        <div class="row sub_row">
                            <div class="col-sm-12 text-left" style="padding-top:8px;">
                                주요교과목
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-10">
                                <!-- 반복문 돌려서 뿌리기 -->
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>과목명</th>
                                            <th class="col-sm-10">내용</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <!-- 얘를 반복문 돌리면 된다 -->
                                        <tr>
                                            <td>경영정보시스템</td>
                                            <td>기업경영과 정보기술이론, 의사결정지원시스켐, 실무사례분석, 경영정보시스템구축 방법에 대해 배웁니다.
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>e-비즈니스시스템</td>
                                            <td>e-비즈니스를 성공적으로 실행하기 위해서는 초고속 통신망 등의 정보화 기반시설, 물류시스템, 전문인력 등 물리적 인프라와 비즈니스 관행과 인식, 법률과 제도 등의 사회 제도적 인프라 그리고, 통신네트워크, 전자상거래 관련 응용기술, 보안/결제시스템, 기술표준 등의 기술적 인프라들을 중심으로 완성된 e-비즈니스시스템을 구성하므로, 이에 관한 일반화된 내용부터 심도 있는 부분까지를 학습합니다.

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>데이터베이스</td>
                                            <td>e-비즈니스 구현에 필요한 데이터베이스의 기본개념과 활용방법을 학습합니다. 또한 사례 및 실습을 통하여 e-비즈니스의 각종 경영활동에 적용할 수 있는 데이터베이스의 설계, 응용 능력을 배양합니다.

                                            </td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!--//sub_row-->


                    </div>

                    <div id="five_tab" class="tabcontent">
                        <div class="row sub_row">
                            <div class="col-sm-12">
                                <table class="table table-striped subject_table">
                                    <thead>
                                        <tr>
                                            <th>대학명</th>
                                            <th>학과명</th>
                                            <th>지역</th>
                                            <th>캠퍼스명</th>
                                            <th class="text-center">홈페이지</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>동양미래대학교</td>
                                            <td>e-비즈니스과(인문사회계열)</td>
                                            <td>서울특별시</td>
                                            <td>본교</td>
                                            <td class="text-center">
                                                <a href="http://www.dongyang.ac.kr" target="_blank" class="glyphicon glyphicon-link"></a>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>부산과학기술대학교</td>
                                            <td>e-경영정보계열</td>
                                            <td>부산광역시</td>
                                            <td>본교</td>
                                            <td class="text-center">
                                                <a href="http://www.bist.ac.kr" target="_blank" class="glyphicon glyphicon-link"></a>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>경인여자대학교</td>
                                            <td>e-비지니스과</td>
                                            <td>인천광역시</td>
                                            <td>본교</td>
                                            <td class="text-center">
                                                <a href="http://www.kic.ac.kr" target="_blank" class="glyphicon glyphicon-link"></a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
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
    <!--//content-->
</body>
</html>