$(document).ready(function () {

        //회원가입 이미지 선택 js
        $("#profile").change(function(){
                    
        var fileValue = $("#profile").val().split("\\");
        var fileName = fileValue[fileValue.length-1]; // 파일명
        $("#img_name").text(fileName);
        $(".profile_box").attr("alt","fileName");
        
        
        });//change
    

    //썸네일 만들기
    
    //input file 선택
    var file = document.querySelector('#profile');

    file.onchange = function () {
        var fileList = file.files ;

        // reader 객체 생성
        var reader = new FileReader();
        //파일 읽기
        //src 속성에  data RUL이 들어가 이미지가 나타나게된다.
        reader.readAsDataURL(fileList [0]);

        
        //선택된 파일의 로컬경로가
        //src 속성의 값으로 설정
        reader.onload = function  () {
            //img 태그의 src 속성 값으로 로컬 경로 넣기
            document.querySelector('.profile_box').src = reader.result ;
        };
    };//onchange
    
    
});


