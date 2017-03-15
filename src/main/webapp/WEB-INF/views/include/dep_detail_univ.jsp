<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	                <div class="col-sm-8">
		                <div class="col-sm-4 major">
		                <span>${data[1].major}</span>
		                
		                </div>
	                	<div class="col-sm-3 salary">평균임금  ${data[1].salary}</div>     
	                	<div class="col-sm-3 emp">취업률  ${data[1].employment}</div>	
	                </div>
	                <div class="col-sm-4"></div>
              	</div>  

                    <div class="tab">
                        <a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'first_tab')">개요</a>
                        <a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'sec_tab')">관련직업/관련자격</a>
                        <a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'third_tab')">학과전망</a>
                        <a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'four_tab')">주요교과목</a>
                        <a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'five_tab')">개설대학</a>
                        <a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'six_tab')">졸업후 진출분야</a>
                    </div>

                    <div id="first_tab" class="tabcontent">
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

                        <div class="row sub_row">
                            <div class="col-sm-12 text-left">
                                <!--ability-->
                                세부관련학과
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-9">
								${data[1].department}
                            </div>
                        </div>
                        <!--//sub_row-->

                        <div class="row sub_row">
                            <div class="col-sm-12 text-left">
                                취업률
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-9">
                                ${data[1].employment}
                            </div>
                        </div>
                        <!--//sub_row-->

                        <!-- 값 비어 있으면 아래 태그 삭제 -->
                        <c:if test="${data[1].property!=''}">
                        <div class="row sub_row">
                            <div class="col-sm-12 text-left">
                                학과특성
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-9">
                                <p>
                                
								${data[1].property}
                          
                                </p>
                            </div>
                        </div>
                        <!--//sub_row-->
      					</c:if>
                        <!-- 값 비어 있으면 아래 태그 삭제 -->
                        <c:if test="${data[1].interest!=''}">
                        <div class="row sub_row">
                            <div class="col-sm-12 text-left">
                                적성 및 흥미
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-9">
                                <p>
								${data[1].interest}
                                </p>
                            </div>
                        </div>
                        <!--//sub_row-->
                        </c:if>

                    </div>

                    <div id="sec_tab" class="tabcontent">
                        <div class="row sub_row">
                            <div class="col-sm-12 text-left">
                                관련직업
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-9">
                               ${data[1].job}
                            </div>
                        </div>
                        <!--//sub_row-->

                        <div class="row sub_row">
                            <div class="col-sm-12 text-left">
                                관련자격
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-9">
                                ${data[1].qualifications}
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
                                                y: ${data[0].after_graduation[0].data}
									        }, {
									        	 name: '취업자',
									             y: ${data[0].after_graduation[1].data},
									        	color: '#ff80ff' 
									        }, {
									        	name: '기타',
									            y: ${data[0].after_graduation[2].data},
									                                             
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
                                                name: '${data[0].field[0].item}',
                                                y: ${data[0].field[0].data}
									        }, {
									        	name: '${data[0].field[1].item}',
									            y: ${data[0].field[1].data}
									        }, {
									        	name: '${data[0].field[2].item}',
									            y: ${data[0].field[2].data}
									        }, {
									        	name: '${data[0].field[3].item}',
									            y: ${data[0].field[3].data}
									        }, {
									        	name: '${data[0].field[4].item}',
									            y: ${data[0].field[4].data}
									        }, {
									        	name: '${data[0].field[5].item}',
									            y: ${data[0].field[5].data}
									        }, {
									        	name: '${data[0].field[6].item}',
									            y: ${data[0].field[6].data}
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
                                                y: ${data[0].avg_salary[0].data}
        }, {
                                                name: '51~100만원',
                                                y: ${data[0].avg_salary[1].data}
        }, {
                                                name: '101~150만원',
                                                y: ${data[0].avg_salary[2].data}
        }, {
                                                name: '151~200만원',
                                                y: ${data[0].avg_salary[3].data}
        }, {
                                                name: '201~250만원',
                                                y: ${data[0].avg_salary[4].data}
        }, {
                                                name: '251~300만원',
                                                y: ${data[0].avg_salary[5].data}
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
                                                y: ${data[0].satisfaction[0].data}
       										}, {
                                                name: '불만족',
                                                y: ${data[0].satisfaction[1].data}
      										}, {
                                                name: '보통',
                                                y: ${data[0].satisfaction[2].data}
											}, {
                                                name: '만족',
                                                y: ${data[0].satisfaction[3].data}
											}, {
                                                name: '매우 만족',
                                                y: ${data[0].satisfaction[4].data}
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
                                            <th>남자</th>
                                            <th>여자</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th>${data[1].major}</th>
                                            <c:forEach var="gender" items="${data[0].gender}">
                                            <td>${gender.data}</td>
                                            </c:forEach>
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
                                                text: '비율(%)'
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
                                            data: [${data[0].employment_rate[1].data}],
                                            color: '#3333ff'
    }, {
                                            type: 'column',
                                            name: '여자',
                                            data: [${data[0].employment_rate[2].data}],
                                            color: '#ff6666'
    }, {
                                            type: 'spline',
                                            name: '평균',
                                            data: [${data[0].employment_rate[0].data}],
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
									
									<c:forEach var="subject" items="${data[0].main_subject}" >
                                        <!-- 얘를 반복문 돌리면 된다 -->
                                        <tr>
                                            <td>
                                            	${subject.sbject_nm}
                                            </td>
                                            <td>
                                            	${subject.sbject_sumry}
                                            </td>
                                        </tr>
									</c:forEach>
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
                                    <c:forEach var="university" items="${data[0].university}" >
                                        <tr>
                                            <td>${university.schoolname}</td>
                                            <td>${university.majorname}</td>
                                            <td>${university.area}</td>
                                            <td>${university.campus_nm}</td>
                                            <td class="text-center">
                                                <a href='${university.schoolurl}' target="_blank" class="glyphicon glyphicon-link"></a>
                                            </td>
                                        </tr>
									</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!--//sub_row-->
                </div>

                <div id="six_tab" class="tabcontent">
                        <div class="row sub_row">
                            <div class="col-sm-12">
                                <table class="table table-striped subject_table">
                                    <thead>
                                        <tr>
                                            <th>진출분야명</th>
                                            <th>설명</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="enter_field" items="${data[0].enter_field}">
                                        <tr>
                                            <td>${enter_field.gradeuate}</td>
                                            <td>${enter_field.description}</td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                     <!--//sub_row-->
                    </div>
     				
     				
     			<!--// 결과탭 -->
                <div class="col-sm-1 sidenav"></div>
            </div>


        </div>
    </div>
    <!--//content-->
</body>
</html>