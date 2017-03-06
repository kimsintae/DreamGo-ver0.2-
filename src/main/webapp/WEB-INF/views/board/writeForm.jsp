<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>글쓰기</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="../resources/css/main.css">
  <link rel="stylesheet" href="../resources/css/writeForm.css">
  <link rel="stylesheet" href="${ctx}/resources/editor/css/editor.css" type="text/css" charset="utf-8"/>
  <script src="${ctx}/resources/editor/js/editor_loader.js" type="text/javascript" charset="utf-8"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


</head>
<body>
<%@ include file="../include/header.jsp" %>
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
    </div>
    <div class="col-sm-8 text-left"> 
            <!-- 글쓰기 본문 -->
    
            <div class="col-sm-12 write_wrap">
                <form id="write_modify_Form" action="" method="get">
	                    <div class="col-sm-12 write_top">
	
	                       <div class="form-group title_box">
	                            <label for="title" class="col-sm-1 control-label">제목</label>
	                            <div class="col-sm-11">
	                              <input class="form-control" id="title" type="text" name="title">
	                            </div>
	                       </div>
	
	                        <div class="form-group type_box"> 
	                            <label for="type" class="col-sm-1 control-label">구분</label>
	                            <div class="col-sm-2">
	                                <select name="type" id="type" class="form-control">
	                                    <option value="career">진로</option>
	                                    <option value="school">학교</option>
	                                    <option value="job">직업</option>
	                                    <option value="talk">수다</option>
	                                </select>
	                            </div>
	                        </div>
	                    </div><!--//write_top-->
	                    
	                    
	                    <!-- 에디터 구역 -->              
	                    <div class="col-sm-12 editor_box">
	                   
	                    	<!-- 에디터 삽입 -->
	                         <jsp:include page="/WEB-INF/views/include/editor_frame.jsp"></jsp:include>
	                         
	                       
	                    </div><!--//editor_box-->	                 
	            </form><!-- //write_modify_Form --> 
	                                     
	                      <!-- 수정 text -->	                                     
           				 <textarea id="modifiedText" style="display:none;"></textarea>
	                    
		                  <div class="form-group"> 
		                    <div class="col-sm-offset-2 col-sm-10 text-right write_btns">
		                      <button type="button" class="btn btn-default write_btn glyphicon glyphicon-saved" style="font-size:18px;" title="등록"></button>
		                      <button type="button" class="btn btn-default cancle_btn glyphicon glyphicon-remove"style="font-size:18px;" title="취소"></button>
		                    </div>
		                  </div>

            </div><!--//write_wrap--> 
    </div>
    <div class="col-sm-2 sidenav">
    </div>
  </div>
</div>

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>
<script type="text/javascript">

//글 쓰다 다른 페이지로 넘어가려 할 때 메시지 띄우기
  $(".navbar-nav a").click(function(){
  var result = confirm("정말 글쓰기를 취소 하시겠습니까?");
        if(!result){return false;}
  })

var config = {
		txHost: '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) http://xxx.xxx.com */
		txPath: '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) /xxx/xxx/ */
		txService: 'sample', /* 수정필요없음. */
		txProject: 'sample', /* 수정필요없음. 프로젝트가 여러개일 경우만 수정한다. */
		initializedId: "", /* 대부분의 경우에 빈문자열 */
		wrapper: "tx_trex_container", /* 에디터를 둘러싸고 있는 레이어 이름(에디터 컨테이너) */
		form: 'write_modify_Form'+"", /* 등록하기 위한 Form 이름 */
		txIconPath: "${pageContext.request.contextPath}/resources/editor/images/icon/editor/", /*에디터에 사용되는 이미지 디렉터리, 필요에 따라 수정한다. */
		txDecoPath: "${pageContext.request.contextPath}/resources/editor/images/deco/contents/", /*본문에 사용되는 이미지 디렉터리, 서비스에서 사용할 때는 완성된 컨텐츠로 배포되기 위해 절대경로로 수정한다. */
		canvas: {
            exitEditor:{
                /*
                desc:'빠져 나오시려면 shift+b를 누르세요.',
                hotKey: {
                    shiftKey:true,
                    keyCode:66
                },
                nextElement: document.getElementsByTagName('button')[0]
                */
            },
			styles: {
				color: "#123456", /* 기본 글자색 */
				fontFamily: "굴림", /* 기본 글자체 */
				fontSize: "10pt", /* 기본 글자크기 */
				backgroundColor: "#fff", /*기본 배경색 */
				lineHeight: "1.5", /*기본 줄간격 */
				padding: "8px" /* 위지윅 영역의 여백 */
			},
			showGuideArea: false
		},
		events: {
			preventUnload: false
		},
		sidebar: {
			attachbox: {
				show: true,
				confirmForDeleteAll: true
			}
		},
		size: {
			contentWidth: 800 /* 지정된 본문영역의 넓이가 있을 경우에 설정 */
		}
	};

	EditorJSLoader.ready(function(Editor) {
		var editor = new Editor(config);
	});
	
	function validForm(editor) {
		// Place your validation logic here

		// sample : validate that content exists
		var validator = new Trex.Validator();
		var content = editor.getContent();
		if (!validator.exists(content)) {
			alert('내용을 입력하세요');
			return false;
		}

		return true;
	}
	
	function setForm(editor) {
        var i, input;
        var form = editor.getForm();//form 요소 얻기
        var content = editor.getContent();//작성한 내용 얻기

        // 본문 내용을 필드를 생성하여 값을 할당하는 부분
        var textarea = document.createElement('textarea');
        
        //새로만들어진 폼의 name을 content로 설정
        textarea.name = 'content';
        
        //새로만들어진 폼의 value를 작성한 내용으로 설정
        textarea.value = content;
        form.createField(textarea);
        return true;
	}
	
	/* 수정 함수 */
	function loadContent() {
		/* 저장된 컨텐츠를 불러오기 위한 함수 호출 */
		Editor.modify({
			"attachments": function () { /* 저장된 첨부가 있을 경우 배열로 넘김, 위의 부분을 수정하고 아래 부분은 수정없이 사용 */
				var allattachments = [];
				for (var i in attachments) {
					allattachments = allattachments.concat(attachments[i]);
				}
				return allattachments;
			}(),
			"content": document.getElementById("modifiedText") /*필드(textarea)를 만들고, 그 textarea의 id값을 넣어준다. 그리고 text 필드는 display:none을 준다 */
		});
	}

	//글쓰기 일시에만 
	$(".write_btn").click(function() {
		
		//이 함수는
		//submit 기능이 있다.
		//즉 버튼 클릭시 서버로 내용을 전송한다.
		$("#write_modify_Form").attr('action','${ctx}/board/write');
		
		Editor.save();

	});
  
</script>
</body>
</html>