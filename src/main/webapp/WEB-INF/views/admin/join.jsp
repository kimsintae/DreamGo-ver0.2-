<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>회원가입</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style type="text/css">
	  
  	  #profile{
  		display: none;
  	  }
  	  #joinForm label{
  		text-align: center;
  	  }
	  	
	  .profile_box{
	  	border: 1px solid #424242;
	  }
	  
	  .join_footer{
	  	margin-top: 20px;
	  }
	  	
	  .join_title{
	  	margin-bottom:30px;
	  	background:#96ceb4;
	  	padding:10px;
	  	color:white;
	  }
	  
	  .loaderWrap{
	  	width: 100%;
	  	height: 100%;
	  	position:absolute;
	  	display:none;
	  	background: rgba(255,255,255,0);
	  	z-index: 2;
	  }
	  .loaderWrap img{
	  	display: block;
	  	margin-left: 50%;
	  	margin-top: 25%;
	  }
   </style>
</head>
<body>
  
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-3 sidenav"></div>
    <div class="col-sm-6 text-left"> 
    
    	<!-- 로딩이미지 -->
    	<div class="loaderWrap"><img src="${pageContext.request.contextPath}/resources/img/loader.gif" alt="loader"/></div>
     	<h2 class="col-sm-12 text-center join_title"></h2>
	     <!-- join -->
	           <form id="joinForm"  action="${pageContext.request.contextPath}/admin/do_join_modify" method="POST" enctype="multipart/form-data">
	               <div class="row email_row form-group">
	                   <label class="col-sm-4" for="preEmail">이메일</label>
	                   <div class="col-sm-6">
	                       <input type="text" id="preEmail" name="preEmail" class="col-sm-2 form-control" style="width:60%;" value=""/>
	                       <select id="sufEmail" name="sufEmail" class="form-control" style="width:40%;">
		                       	<option>gmail.com</option>
		                       	<option>naver.com</option>
		                       	<option>nate.com</option>
		                       	<option>hanmail.net</option>
		                       	<option>hotmail.com</option>
		                       	<option>yahoo.com</option>
	                       </select>
							<c:if test="${errors.email!=null}">
		                       	<div class="errorMsg">
		                       		<span class="bg-danger col-sm-12 text-center emailError" style="font-weight:bold;padding:10px;">${errors.email}</span>
		                      	</div>
	                   		</c:if>
	                      <div class="authCheckBox" style="display:none;">
	                       <input type="text" class="text-center authNumber form-control" placeholder="인증번호 입력" style="width:198px;margin-top:20px;display:inline-block;"/>
	                       <button type="button" class="btn btn-default authCheckBtn">확인</button>
	                      </div>
	                       <span class="bg-success col-sm-12 text-center authOk" style="display:none;font-weight:bold;padding:10px;">인증되었습니다.</span>
	                       <span class="bg-success col-sm-12 text-center checkDuplicatedEmail" style="display:none;font-weight:bold;padding:10px;">이미 가입된 이메일주소입니다.</span>
	                       <span class="bg-danger col-sm-12 text-center	authFail" style="display:none;font-weight:bold;padding:10px;">인증 실패로 인증번호 재발송 합니다.</span>
	                   </div>
	                   <div class="col-sm-2">
	                       <button type="button" class="btn btn-info mailAuth">인증</button>
	                   </div>
	                   
	                   <!-- 인증이 됬으면 hidden 으로 인증 유무값을 파라미터로 전송 -->
	                   <input type="hidden" id="authSender" name="emailAuthResult"/>
	               </div>
	               <!--//email_row-->
	
	               <div class="row pwd_row form-group">
	                   <label class="col-sm-4" for="password">비밀번호</label>
	
	                   <div class="col-sm-6">
	                       <input type="password" id="password" name="password" class="col-sm-12 form-control" maxlength="12" placeholder="영문,숫자 12자 이내" value="${user.password}"/>
	                       <c:if test="${errors.password!=null}">
		                       	<div class="errorMsg">
		                       		<span class="bg-danger col-sm-12 text-center emailError" style="font-weight:bold;padding:10px;">${errors.password}</span>
		                      	</div>
	                   		</c:if>
	                   </div>
	                   
	                   <div class="col-sm-2"></div>
	               </div>
	               <!--//pwd_row-->
	
	               <div class="row pwd_row form-group">
	                   <label class="col-sm-4" for="checkPwd">비밀번호 확인</label>
	                   <div class="col-sm-6">
	                       <input type="password" id="checkPwd" name="checkPwd" class="col-sm-12 form-control" maxlength="12" value="${user.checkPwd}"/>
	                       <c:if test="${errors.checkPwd!=null}">
		                       	<div class="errorMsg">
		                       		<span class="bg-danger col-sm-12 text-center emailError" style="font-weight:bold;padding:10px;">${errors.checkPwd}</span>
		                      	</div>
	                   		</c:if>
	                   </div>
	                   <div class="col-sm-2"></div>
	               </div>
	               <!--//pwd_row-->
	
	               <div class="row nickname_row form-group">
	                   <label class="col-sm-4" for="nickname">닉네임</label>
	                   <div class="col-sm-6">
	                       <input type="text" id="nickname" name="nickname" maxlength="10" class="col-sm-12 form-control" placeholder="한글,영문자 10자 이내" value="${user.nickname}" />
	                       <c:if test="${errors.nickname!=null}">
		                       	<div class="errorMsg">
		                       		<span class="bg-danger col-sm-12 text-center emailError" style="font-weight:bold;padding:10px;">${errors.nickname}</span>
		                      	</div>
	                   		</c:if>
	                   </div>
	                   <div class="col-sm-2"></div>
	               </div>
	               <!--//nickname_row-->
	               <div class="row nickname_row form-group">
	                   <label class="col-sm-4" for="profile">프로필사진</label>
	                   <div class="col-sm-6">
	                      <label class="col-sm-12 text-center" for="profile" id="profileArea">
	                      	  <button type="button" class="close">&times;</button>
	                          <img src="" class="img-rounded profile_box" alt="" width="150" height="150" title="클릭해서 원하는 사진 등록">
	                       <input type="file" id="profile" name="file" class="col-sm-12 form-control" accept="image/*" />
	                      </label>
	                      <span id="img_name" class="text-center col-sm-12"></span>
	                   </div>	
	                   <div class="col-sm-2"></div>
	               </div>
	               <!--//nickname_row-->
	
	               <div class="row person_type_row form-group">
	                   <label class="col-sm-4" for="typeSelector">구분</label>
	                   <div class="col-sm-6">
	                       <select class="form-control" id="typeSelector" name="type">
	                           <option value="E" selected>초등학생</option>
	                           <option value="M">중학생</option>
	                           <option value="H">고등학생</option>
	                           <option value="U">대학생</option>
	                           <option value="O">일반인</option>
	                       </select>
	                   </div>
	                   <div class="col-sm-2"></div>
	               </div>
	               <!--//person_type_row-->
	               
					<div class="row dream_row form-group">
	                   <label class="col-sm-4" for="dream">나의 꿈은?</label>
	                   <div class="col-sm-6">
	                       <input type="text" id="dream" name="dream" class="col-sm-12 form-control" placeholder="꿈은 이루어집니다" value="${user.dream}"/>
	                   </div>
	                   <div class="col-sm-2"></div>
	               </div>
	               <!--//dream_row-->
		
			       <div class="col-sm-12 join_footer">
			 
			 		   <c:choose>
			 		   	<c:when test="${loginUser==null}">
			           		<input type="submit" class="btn btn-default col-sm-6" id="joinBtn" value="가입"/>
			 		   	</c:when>
			 		   	<c:otherwise>
			 		   	<!-- false를 보내서 수정 로직을 처리하도록 만듬 -->
			 		   		<input type="hidden" name="isJoin" value="false"/>
			 		   		<input type="hidden" name="no" value="${loginUser.no}"/>
			 		   		<input type="submit" class="btn btn-default col-sm-6" id="modifyBtn" value="수정"/>
			 		   	</c:otherwise>
			 		   </c:choose>	
			           
			           <!-- 취소 누르면 이전 페이지로 이동 -->
			           <button type="button" class="btn btn-default col-sm-6 cancle">취소</button>
			       </div>
          </form>
          <!--//joinForm-->
    </div>
    <div class="col-sm-3 sidenav">
    </div>
  </div><!-- //row content -->
</div>
<script type="text/javascript">
var user = '${loginUser}';
var userEmail='${loginUser.email}';


$.ajaxSetup({
	  url: "${pageContext.request.contextPath}/admin/doMailAuth",
	  type: "POST",
	  dataType:"json"
	});
	
	
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
	$(".profile_box").attr("src","${pageContext.request.contextPath}/resources/img/plus.png");
		
	$("#profile").val(""); // input 초기화
	$("#img_name").text("선택된 파일 없음");
});


//취소 버튼 누르면 전 페이지로 이동
$(".cancle").click(function(){
	var result =  confirm("입력 하신 정보가 초기화 됩니다 취소 하시겠습니까?");
	if(!result){return false;}
	  history.back();
});


var email='';
var authCheckNumber=0;
//이메일 인증 보내는 ajax
$(".mailAuth").click(function(){
		var preEmail = $("#preEmail").val();
		var sufEmail = $("#sufEmail option:selected").text();
		
		//이메일
		email = preEmail+"@"+sufEmail;
		
		//이메일 중복 체크
		checkDuplicatedEmail(email);

});


//이메일 중복 화인
var hasEmail;
function checkDuplicatedEmail() {
	$(".checkDuplicatedEmail").hide();
	
	$.ajax({
		url:"${pageContext.request.contextPath}/admin/checkDuplicatedEmail",
		type:"get",
		data:{"email":email},
		dataType:"text",
		success:function(hasEmail){
			if(hasEmail=="true"){
				$(".checkDuplicatedEmail").show();
			}else{
				//이미 가입된 메일이 아니면 인증번호 발송
				mailAuth(email,authCheckNumber);
			}
		},
		error:function(){
			alert("실패");
		}
	});
}


//인증 확인번호 보내는 ajax
$(".authCheckBtn").click(function(){
	authCheckNumber = $(".authNumber").val();
	mailAuth(email,authCheckNumber);
});

//인증번호 발송과 인증번호확인하는 ajax

//회원가입, 수정일때 동적으로 메일메시지 보내기 위한 변수
var isJoin = (user=='')?true:false;

//로딩이미지
var $loaderWrap = $(".loaderWrap");


function mailAuth(email,authCheckNumber){
	$loaderWrap.show();
	$.ajax({
		data:{'email':email,'authCheckNumber':authCheckNumber,'isJoin':isJoin},
		success:function(json){
			$loaderWrap.hide();
			switch(json.result){
				case 'success' :alert("인증번호가 발송되었습니다.");
								$(".authCheckBox").css("display","block");		
								$(".emailError").css("display","none");
								break;
				case 'failed' :alert("메일주소를 확인해 주세요!");break;
				case 'isEmpty':alert("이메일을 입력해주세요!");
							   $("#preEmail").focus();
							   break;
				case 'authOk' :$(".authOk").css("display","block");
							   $("#authSender").attr("value","true");
							   $(".authCheckBox").css("display","none");
							   $(".authFail").css("display","none");
							   break;//인증 됨		
				case 'reSubmit':alert("인증번호가 틀려 재전송 합니다.");
								$(".authFail").css("display","block");
								break; //인증 실패로 인증번호 재전송
			}//switch
		},
		error:function(xhr,error){alert("실패!");}
	});
}

//email 넣기
var email = '${user.email}';

if('${errors.emailAuth}'!=''){
	$("#preEmail").attr("value",email.substring(0,email.indexOf('@')));//pre 값 넣기
	$("#sufEmail").val(email.substring(email.indexOf('@')+1,email.length)).attr("selected","selected");//suf 값 넣기
}
	
if('${errors.emailAuth}'!=''){
	alert('${errors.emailAuth}');
}	

//로그인 되있을 경우 수정페이지, 그렇지않으면 회원가입페이지

if(user!=''){
	$(".join_title").text("회원정보 수정");
	$("#preEmail").attr("value",userEmail.substring(0,userEmail.indexOf('@')));
	$("#sufEmail").val(userEmail.substring(userEmail.indexOf('@')+1,userEmail.length)).attr("selected","selected");
	//$("#preEmail,#sufEmail").attr("disabled","disabled");
	$("#nickname").val('${loginUser.nickname}');
	$(".profile_box").attr("src",'${pageContext.request.contextPath}/resources/upload/${loginUser.profile}');
	$("#typeSelector").val('${loginUser.type}').attr("selected","selected");
	$("#dream").val('${loginUser.dream}');
}else{
	$(".join_title").text("회원가입");
	$(".profile_box").attr("src",'${pageContext.request.contextPath}/resources/img/plus.png');
}
	
</script>
</body>
</html>
