
        $(document).ready(function () {
        	var formData;
        	
        	
            $('.sch_opt').click(function () {
                 
                var id = $(this).attr("id");
               
                //전체로 검색하면
                // ?????_list 로 파라미터가 넘어감. 
                if (id === "high_sh_opt") {
                    $("#depar_list").attr("value","high_list");
                    $("#depar_Form strong").text("고등학교 ");
                } else if (id === "univ_sh_opt") {
                    $("#depar_list").attr("value","univ_list");
                    $("#depar_Form strong").text("대학교 ");
                
                }   
            })//cilick
            
            $("#depar_Form").on("click","input:radio[name='subject']",function(){
            var value = $(this).val();
                
                //검색 조건을 전체로 체크 할 경우
                if(value=="high_list" || value=="univ_list"){
                   $("#depar_list").remove();
                }else{
                 $("<input type='hidden' value='' name='gubun' id='depar_list'/>"); 
                }
            })    
        });//ready

