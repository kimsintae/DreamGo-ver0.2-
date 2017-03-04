$(document).ready(function(){

    //학교별 메뉴 클릭시 지역검색 조건 포함시키기
    $('.first_opt').load("html/region.html");

    $(".tab-menu").click(function(){
        var name = $(this).attr("id");

        //고등학교 대학교 선택시, 학교유형 조건 로드
        if(name === "high"){
            $('.sec_opt').load("html/high_opt.html");
        }else if(name === "uni"){
            $('.sec_opt').load("html/uni_opt.html");
        }
    })

})//ready