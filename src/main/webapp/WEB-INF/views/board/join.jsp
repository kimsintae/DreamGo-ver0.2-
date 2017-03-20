<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="${ctx}/resources/css/main.css"/>
  <link rel="stylesheet" href="${ctx}/resources/css/join.css"/>
  <script type="text/javascript">
  $(document).ready(function () {

      //회원가입 이미지 선택 js
      $("#profile").change(function(){
                  
      var fileValue = $("#profile").val().split("\\");
      var fileName = fileValue[fileValue.length-1]; // 파일명
      $("#img_name").text(fileName);
      $(".profile_box").attr("alt",fileName);
      
      
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
  
  //x버튼 누르면 선택한 이미지 삭제
  $(".close").click(function(){
	  $(".profile_box").attr("src","");
	  $(".profile_box").attr("src","${ctx}/resources/img/plus.png");
	  
/* 	  if ($.browser.msie) {
			// ie 일때 input[type=file] init.
			$("#profile").replaceWith( $("#filename").clone(true) );
		} else {
			// other browser 일때 input[type=file] init.
		
		} */
		
	 $("#profile").val(""); // input 초기화
	 $("#img_name").text("선택된 파일 없음");
  })
  
  
  //취소 버튼 누르면 전 페이지로 이동
  $(".cancle").click(function(){
	var result =  confirm("입력 하신 정보가 초기화 됩니다 취소 하시겠습니까?")
	if(!result){return false;}
	  history.back();
  })

	  
});

  </script>
</head>
<body>
  
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-3 sidenav"></div>
    <div class="col-sm-6 text-left"> 
     	<h2 class="col-sm-12 text-center join_title">회원가입</h2>
	     <!-- join -->
	           <form id="joinForm"  action="${ctx}/doJoin" method="POST" enctype="multipart/form-data">
	               <div class="row email_row form-group">
	                   <label class="col-sm-4" for="email">이메일</label>
	                   <div class="col-sm-6">
	                       <input type="text" id="email" name="email" class="col-sm-12 form-control" placeholder="kimstcool01@naver.com" />
	                   </div>
	                   <div class="col-sm-2">
	                       <button type="button" class="btn btn-default">인증</button>
	                   </div>
	                   <!-- 인증 되면 회원가입 진행 -->
	               </div>
	               <!--//email_row-->
	
	               <div class="row pwd_row form-group">
	                   <label class="col-sm-4" for="password">비밀번호</label>
	
	                   <div class="col-sm-6">
	                       <input type="password" id="password" name="password" class="col-sm-12 form-control" />
	                   </div>
	                   <div class="col-sm-2"></div>
	               </div>
	               <!--//pwd_row-->
	
	               <div class="row pwd_row form-group">
	                   <label class="col-sm-4" for="pwd_check">비밀번호 확인</label>
	                   <div class="col-sm-6">
	                       <input type="password" id="pwd_check" name="pwd_check" class="col-sm-12 form-control" />
	                   </div>
	                   <div class="col-sm-2"></div>
	               </div>
	               <!--//pwd_row-->
	
	               <div class="row nickname_row form-group">
	                   <label class="col-sm-4" for="nickname">닉네임</label>
	                   <div class="col-sm-6">
	                       <input type="text" id="nickname" name="nickname" maxlength="10" class="col-sm-12 form-control" placeholder="10자 이내" />
	                   </div>
	                   <div class="col-sm-2"></div>
	               </div>
	               <!--//nickname_row-->
	               <div class="row nickname_row form-group">
	                   <label class="col-sm-4" for="profile">프로필사진</label>
	                   <div class="col-sm-6">
	                      <label class="col-sm-12 text-center" for="profile" id="profileArea">
	                      	  <button type="button" class="close">&times;</button>
	                          <img src="${ctx}/resources/img/plus.png" class="img-rounded profile_box" alt="" width="150" height="150" title="클릭해서 원하는 사진 등록">
	                       <input type="file" id="profile" name="profile" class="col-sm-12 form-control" accept="image/*" />
	                      </label>
	                      <span id="img_name" class="text-center col-sm-12"></span>
	                   </div>	
	                   <div class="col-sm-2"></div>
	               </div>
	               <!--//nickname_row-->
	
	               <div class="row person_type_row form-group">
	                   <label class="col-sm-4" for="#typeSelector">구분</label>
	                   <div class="col-sm-6">
	                       <select class="form-control" id="typeSelector" name="type">
	                           <option value="e" selected>초등학생</option>
	                           <option value="m">중학생</option>
	                           <option value="h">고등학생</option>
	                           <option value="u">대학생</option>
	                           <option value="o">일반인</option>
	                       </select>
	                   </div>
	                   <div class="col-sm-2"></div>
	               </div>
	               <!--//person_type_row-->
	               
					<div class="row dream_row form-group">
	                   <label class="col-sm-4" for="dream">나의 꿈은?</label>
	                   <div class="col-sm-6">
	                       <input type="text" id="dream" name="nickname" class="col-sm-12 form-control" placeholder="꿈은 이루어집니다" />
	                   </div>
	                   <div class="col-sm-2"></div>
	               </div>
	               <!--//dream_row-->
	
	           </form>
	           <!--//joinForm-->
	       <div class="col-sm-12 join_footer">
	           <button type="submit" form="joinForm" class="btn btn-default col-sm-6">가입</button>
	           
	           <!-- 취소 누르면 이전 페이지로 이동 -->
	           <button type="button" class="btn btn-default col-sm-6 cancle">취소</button>
	       </div>
    </div>

    <div class="col-sm-3 sidenav">
    </div>
  </div><!-- //row content -->
</div>

</body>
</html>
