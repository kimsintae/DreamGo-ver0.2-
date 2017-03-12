/**
 * 
 */
$(document).ready(function(){

		
		//학교종류 선택시
		$(":input[name=sch1]").click(function(){
		var value =	$(this).val();
		
		if(value=="100322"){
			
			//전문대학 선택시
			$(".category_list .college").css("display","block");
			$(".category_list .univ").css("display","none");
			
		}else if(value=="100323"){
			//4년제  선택
			$(".category_list .univ").css("display","block");
			$(".category_list .college").css("display","none");
		}else{
			//전체선택시
			$(".category_list .univ").css("display","block");
			$(".category_list .college").css("display","block");
		}
			
		})
	
	
})//ready 
	