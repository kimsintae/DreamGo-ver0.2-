<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>직업상세</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/job_detail.css?v=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/tabs.js?v=1"></script>
    <!-- chart -->
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/data.js"></script>
    <style type="text/css">
    	.col-container {
		    display: table; /* Make the container element behave like a table */
		    width: 100%; /* Set full-width to expand the whole page */
		}
    
    	.col {
		    display: table-cell; /* Make elements inside the container behave like table cells */
		}
		.salary,.profession{
			color:blue;
			font-weight: bold;
		}
    </style>
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
                <div class="col-sm-12 col-container">
                <h1 class="col col-sm-10">${data[0].job}</h1>
                <div class="col">연봉 : <span class="salary">${salary}</span></div>
                <div class="col">분야 : <span class="profession">${profession}</span></div>
                </div>
                    <div class="tab">
                        <a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'first_tab')">개요</a>
                        <a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'sec_tab')">관련학과/관련자격</a>
                        <a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'third_tab')">적성 및 흥미</a>
                        <a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'four_tab')">취업현황</a>
                        <a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'five_tab')">직업전망</a>
                        <a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'six_tab')">준비방법</a>
                        <a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'sevn_tab')">문의기관</a>
                    </div>

                    <div id="first_tab" class="tabcontent">
                        <div class="row sub_row">
                            <div class="col-sm-12 text-left">
                                <!--job-->
                                직업명
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-9">
                                ${data[0].job}
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
                               ${data[0].ability}
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
                                ${data[0].similarjob}
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
                            <div class="col-sm-9 summary">
                              
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
                                ${data[0].similarjob}
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
                                <c:forEach var="major" items="${data[0].major}">
                                    <a href="${pageContext.request.contextPath}/detail/univ_list/${major.major_seq}" class="list-group-item major_name">${major.major_nm}</a>
                                </c:forEach>
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
                            <div class="col-sm-10 aptitude">
                            	${data[0].aptitude}
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
                            	${data[0].empway}
                            </div>
                        </div>
                        <!--//sub_row-->

                        <div class="row sub_row">
                            <div class="col-sm-12 text-left">
                                <!--employment-->
                                고용현황
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-9 employment">
                            	${data[0].employment}
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
								${data[0].salery}
                            </div>
                        </div>
                        <!--//sub_row-->
                    </div>

                    <div id="five_tab" class="tabcontent">
                        <div class="row sub_row">

                            <div class="col-sm-12">
                                <!--job_possibility-->


                                <!--막대그래프 -->
                                <div class="col-sm-2"></div>
                                <div id="container" class="col-sm-3" style="min-width: 710px; height: 400px; margin: 0 auto"></div>
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
                                                text: "%"
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
                                            name: '',
                                            colorByPoint: true,
                                            data: [{
                                                name: '보상',
                                                y: ${data[0].chart[0].chart_value}
         									 }, {
                                                name: '일자리전망',
                                                y: ${data[0].chart[1].chart_value}
               								 }, {
                                                name: '고용안정',
                                                y: ${data[0].chart[2].chart_value}
              								 }, {
                                                name: '발전가능성',
                                                y: ${data[0].chart[3].chart_value}
               								 }, {
                                                name: '근무여건',
                                                y: ${data[0].chart[4].chart_value}
               								 }, {
                                                name: '직업전문성',
                                                y: ${data[0].chart[5].chart_value}
                							 }, {
                                                name: '고용평등',
                                                y: ${data[0].chart[6].chart_value}
               								 }]
           								 }]
                                    });
                                </script>



                            </div>
                        </div>
                        <!--//sub_row-->

                        <div class="row sub_row">
                            <div class="col-sm-12">
                                <!--salery-->
                                설명
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-9 possibility">
                            	
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
                            <div class="col-sm-9 preparation">
                            </div>
                        </div>
                        <!--//sub_row-->


					<c:if test="${data[0].training !=''}">
                        <!--만약에 교육훈련이 null이면 교육훈련 코드 없애기-->
                        <div class="row sub_row">
                            <div class="col-sm-12 text-left">
                                교육훈련
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-9 training">
                            </div>
                        </div>
                        <!--//sub_row-->
                     </c:if>

                        <div class="row sub_row">
                            <div class="col-sm-12 text-left">
                                관련 자격증
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-9 certification">
                            </div>
                        </div>
                        <!--//sub_row-->

                    </div>
                    
                    <div id="sevn_tab" class="tabcontent">
                        <div class="row sub_row">
                            <div class="col-sm-1"></div>
                            <div class="col-sm-11">
                            	 <table class="table">
                                    <thead>
                                        <tr>
                                            <th>기관명</th>
                                            <th class="col-sm-5">홈페이지</th>
                                        </tr>
                                    </thead>
                                    <tbody>
									
									<c:forEach var="contact" items='${data[0].contact}' >
                                        <!-- 얘를 반복문 돌리면 된다 -->
                                        <tr>
                                            <td>
                                            	${contact.mapng_nm}
                                            </td>
                                            <td>
                                            	<a href="${contact.mapng_url}">${contact.mapng_url}</a>
                                            </td>
                                        </tr>
									</c:forEach>
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
<%@ include file="../include/footer.jsp" %>

<script type="text/javascript">

// 개행추가하기
$(".summary").html(modifyingSumm('${data[0].summary}'));
$(".aptitude").html(modifyingSumm('${data[0].aptitude}'));
$(".employment").html(modifyingSumm('${data[0].employment}'));
$(".preparation").html(modifyingSumm('${data[0].preparation}'));
$(".training").html(modifyingSumm('${data[0].training}'));
$(".certification").html(modifyingSumm('${data[0].certification}'));

function modifyingSumm(summary){	
	// -를 기준으로 줄바꿈이 일어남
	// - gi를 붙이면 모든 문자열 변경이 발생함	
	return summary.replace(/-/gi, "<br> ▶ ");
}

</script>
</body>

</html>