<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="32x32" href="/img/favicon/favicon-32x32.png">
<title>[DOWA] 커뮤니티 - 수정하기</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!--부트스트랩-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>


<!-- boardWrite 전용 스타일 -->
<link rel="stylesheet" href="/css/community/boardWrite.css">

<!-- input style -->
<link rel="stylesheet" href="/css/index.css">

<!--알람 팝업-->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

<style>
	.mainContent div{
/*  		border: 1px solid black;
	}
	
	.row{ 
/* 		border: 1px solid black; */
	}
	
	[class *=col-]{
/* 		border: 1px solid blue; */
	}	
</style>

<script>
	$(function(){
		//게시판 콤보박스 자동 set.
        let seq = "${dto.board_seq}";
        let select = seq.substring(0,1);
        
        if(select == 'q'){//궁금해요
        	$("[value='q']").attr("selected","selected");
        	$("#select").attr("disabled","disabled");
        }else if(select == 'h'){//도와주세요
        	$("[value='h']").attr("selected","selected");
        	$("#select").attr("disabled","disabled");
        }else if(select == 's'){//도와드려요
        	$("[value='s']").attr("selected","selected");
        	$("#select").attr("disabled","disabled");
        }else if(select == 'd'){//일상
        	$("[value='d']").attr("selected","selected");
        	$("#select").attr("disabled","disabled");
        }
        
        
        
        // 입력 제한
        
   		// 특수문자 정규식 변수(공백 미포함)
   	    let replaceChar = /[@\#$%^&*\()\-=+_\'\;<>\/\`:\"\\[\]|{}]/gi;
   	    // 완성형 아닌 한글 정규식
//    	    let replaceNotFullKorean = /[ㄱ-ㅎㅏ-ㅣ]/gi;	
   	    
    	$("#titleInput").on("focusout", function() {
            let target = $(this).val();
            if (target.length > 0) {
                if (target.match(replaceChar) ) {
                	target = target.replace(replaceChar, "");
                }
                $(this).val(target);
            }
        }).on("keyup", function() {
            $(this).val($(this).val().replace(replaceChar, ""));
  		});
    	
        
        
        //등록 전송 하기//////////////////////////////////////////
        $("#submitBtn").on("click",function(){
        	$("#form").submit();
        })
        
        
	})	
</script>

</head>
<body>
	<!-- Header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/> 
	<jsp:include page="/WEB-INF/views/common/pNav.jsp"/>

	
	<div class="container mainContent">
		<div id="pageHeader">글 수정<input type="button" id="submitBtn" value="수정"><br><hr></div>	
		<form action="/community/modiPro" method="post" enctype="multipart/form-data" id="form">
			<input type="hidden" value="${dto.board_seq }" name="board_seq"><!-- 게시글 sdq -->
			
			<!-- 카테고리 콤보박스 -------------------->
			<div class="row category_hasgRow">
				<div class="col-12 categoryArea">
					<select name="categoryOption" id="select" required>
						<option value="">
						    카테고리
						</option>
						<option value="q">
						    궁금해요
						</option>
						<option value="h">
						    도와주세요
						</option>
						<option value="s">
						    도와드려요
						</option>
						<option value="d">
						    일상
						</option>
					</select>
				</div>
				
			</div>


			<!-- 이미지 영역 ---------------------------------->
			<div class="row imgRow">
				<!-- 이미지 업로드 아이콘 -->
				<div class="col-12 imgUplodArea">
					<input type="file" id="file-input" name="file" accept="image/*" multiple style="display:none;"/>
					
					<!-- 파일 업로드 커스텀 하기 -->
					<label for="file-input" id="uploadLabel">
<!-- 						<img src="/img/community/imgUpload.png" id="uploadIcon"> -->
						<i class="bi bi-images" id="uploadIcon"></i>
					</label> 

				</div>
				
				
				<!-- 이미지 목록 -->
				<div class="col-12 imgListgArea" id="preview">
					<c:forEach var="i" items="${imgDto}">
						<p>
<%-- 							<img src="/community/${i.sys_name}"> --%>
							<img src="/upload/${i.sys_name}">
							<i class="bi bi-x-circle-fill file-remove origin" sys_name="${i.sys_name}"></i>
						</p>
					</c:forEach>
				</div>
			</div>


			
			<!-- 해시태그 --------------------------------->
			<div class="row hashRow">
				<div class="col-12">
					<input type="hidden" id="hashContents" value="" name="hash_tag"><!-- 해시태그 내용 담는 그릇 -->
					
<!-- 					<div contenteditable=true data-text="#해시태그 #최대5개 #최대8글자" id="hashDiv">	 -->
<%-- 						<c:if test="${!empty dto.hash_tag}"><!-- 해시태그가 존재한다면, --> --%>
<%-- 							<c:set var="tagString" value="${dto.hash_tag}" /><!-- 해시태그 나열 가지고 --> --%>
<%-- 							<c:set var="tags" value="${fn:split(tagString,'#')}" /><!-- 배열로 나누기 --> --%>
<%-- 							<c:forEach var="tag" items="${tags}" varStatus="status"> --%>
<!-- 								<span class="hashtagArea"> -->
<!-- 						            <span class="shapArea">#</span> -->
<%-- 						            <span class="hashtag">${tag}&nbsp;<a class="hashDel">X</a></span> --%>
<!-- 								</span> -->
<%-- 							</c:forEach> --%>
<%-- 						</c:if> --%>
<!-- 					</div> -->
	
					<!--위에 주석 참고!!. palcaholder주기 위해서 위에 주석을 붙여서 처리함. 태그를 꼭 붙여 써야 함!!!-->
					<div data-text="#최대5개 #최대8글자" id="hashDiv"><c:if test="${!empty dto.hash_tag}"><c:set var="tagString" value="${dto.hash_tag}" /><c:set var="tags" value="${fn:split(tagString,'#')}" /><c:forEach var="tag" items="${tags}" varStatus="status"><span class="hashtagArea"><span class="shapArea">#</span><span class="hashtag">${tag}&nbsp;<a class="hashDel">X</a></span></span></c:forEach></c:if></div>
					
				</div>
			</div>			
			

		
			<!-- 제목, 수정버튼 영역 ---------------------------------->
			<div class="row w-100 titleRow">
				<!-- 제목 -->
				<div class="col-12 h-100">
					<input type="text" placeholder="제목을 입력해주세요." id="titleInput" name="title" value="${dto.title}" required maxlength="30" oninput="handleInputLength(this, 30)">
				</div>
				<!-- 수정버튼 -->
<!-- 				<div class="col-2 col-sm-2 col-md-1 text-center h-100"> -->
<!-- 					<input type="submit" value="수정" id="submitBtn"> -->
<!-- 				</div>			 -->
			</div>
		
			<!-- 본문 ---------------------------------->
			<div class="row w-100">
				<input type="hidden" id="contentsInp" name="contents"><!-- submit 할때 본문내용 담을 그릇  -->

				<div class="col-12 w-100" contenteditable=true id="contents" contenteditable=true data-text="요청 서비스 정보를 공유하거나 '도와'인에게 물어보세요. 주제에 맞지 않는 글이나 커뮤니티 이용정책에 위배되어 일정 수 이상 신고를 받는 경우 글이 숨김 및 삭제될 수 있습니다." >${dto.contents}</div>


	
			</div>
	
		</form>
	</div>

	<!-- Footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<!-- loginModal -->
	<jsp:include page="/WEB-INF/views/common/loginModal.jsp" />
	
	
	
	<script>
	$(window).bind("pageshow", function (event) {
		if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
			// Back Forward Cache로 브라우저가 로딩될 경우 혹은 브라우저 뒤로가기 했을 경우
			location.reload();
		}
	});
	

	
	//해시태그////////////////////////////////////////////////////////////////////////////////////
    //해시태그 전체 div영역 클릭 시
    $("#hashDiv").on("click", function(){
        if($(this).children().length == 0){//해시태그가 0개일 때,
//             $(this).removeAttr("contentEditable");

            //해시태그 새로 만들기
            let hashtagArea = $('<span class="hashtagArea">');
            let shapArea = $('<span class="shapArea">#</span>');
            let hashtag = $('<span class="hashtag" contenteditable="true"></span>');
            hashtagArea.append(shapArea);
            hashtagArea.append(hashtag);
            
            $("#hashDiv").append(hashtagArea);

            $(".hashtag").focus();
        }


        if( $($(this).children()[0]).children(".hashtag").attr("contenteditable") == null){//해시태그의 contenteditable 속성이 없을 때(즉, 포커스 아웃 된 후에 다시 클릭 시) 
        	$("#hashAlert").remove();
        	$(this).removeAttr("contentEditable");
        
        	$(this).removeAttr("contentEditable");

            if($(this).children().siblings().length <= 4){//해시태그는 최대 5개
                //해시태그 새로 만들기
                let hashtagArea = $('<span class="hashtagArea">');
                let shapArea = $('<span class="shapArea">#</span>');
                let hashtag = $('<span class="hashtag" contenteditable="true"></span>');
                hashtagArea.append(shapArea);
                hashtagArea.append(hashtag);
                
                $("#hashDiv").append(hashtagArea);

                $(".hashtag").focus();
            }else{
//                 alert("해시태그는 최대 5개만 가능합니다.");
				Swal.fire({
    	            icon: 'warning',
    	            title: '해시태그는 최대 5개만 가능합니다.'
    	        })
            }

        }

    })

    //해시태그에서 포커스 아웃했을 때,
    $("#hashDiv").on("focusout",".hashtag",function(e){
        if($("#hashDiv").children().length == 1 && $(this).text() != ""){//해시태그가 1개 있는데 내용이 있을 때 포커스 아웃하면,
            
            if($(this).children(".hashDel").length == 0){
                //해시태그 취소 x 넣기
                $(this).append("&nbsp;");
                $(this).append('<a class="hashDel">X</a>');
                $(this).removeAttr("contenteditable");
            }

        }else if($("#hashDiv").children().length == 1 && $(this).text() == ""){//해시태그가 1개 있는데 내용이 없을 때 포커스 아웃하면,
            $(this).parent().remove();
//             $("#hashDiv").attr("contentEditable","true");
        
        }else if($("#hashDiv").children().length > 1 && $(this).text() == ""){//해시태그가 1개 이상이고 내용이 없을 때 포커스 아웃하면,
            $(this).parent().remove();
        
        }else if($("#hashDiv").children().length > 1 && $(this).text() != ""){//해시태그가 1개 이상이고 내용이 있을 때 포커스 아웃하면,
            
            if($(this).children(".hashDel").length == 0){
                //해시태그 취소 x 넣기
                $(this).append("&nbsp;");
                $(this).append('<a class="hashDel">X</a>');
                $(this).removeAttr("contenteditable");
            }
        }
            let index = $(this).parent().siblings().length-1;
            let lastHsah = $($(this).parent().siblings()[index]).children(".hashtag");
    })

    //해시 태그 X 클릭 이벤트
    $("#hashDiv").on("click", ".hashDel", function(){ 
        
        let index = $(this).parent().parent().siblings().length-1;
        $($(this).parent().parent().siblings()[index]).children(".hashtag").focus();
        $(this).parent().parent().remove();

    })


    //해시태그 키 입력 이벤트
    $("#hashDiv").on("keydown",".hashtag",function(e){

        if(e.which  === 13 || e.which  == 9 || e.which  == 32){ //엔터, 탭, 스페이스 바
            if($(this).text() == ""){
                return false;
            }


            //해시태그 새로 만들기
            if($(this).parent().siblings().length <= 3){//해시태그는 5개 까지만

                //해시태그 취소 x 넣기
                if($(this).children(".hashDel").length == 0){
                    $(this).append("&nbsp;");
                    $(this).append('<a class="hashDel">X</a>');
                    $(this).removeAttr("contenteditable");
                }


                //해시태그 본문 영역 만들기
                let hashtagArea = $('<span class="hashtagArea">');
                let shapArea = $('<span class="shapArea">#</span>');
                let hashtag = $('<span class="hashtag" contenteditable="true"></span>');

                hashtagArea.append(shapArea);
                hashtagArea.append(hashtag);
                
                $("#hashDiv").append(hashtagArea);

                $(this).parent().siblings().children(".hashtag").focus();//새로 만든 해시태그에 포커스
                
            }else{
            	$(this).focusout();
//                 alert("해시태그는 최대 5개만 가능합니다.")
            }

            return false;
        }

        //최대글자 수
        if($(this).text().length > 7){
        	$(this).removeAttr("contenteditable");
//             alert("해시태그 최대 8글자.");
			$("#hashDiv").append('<div id="hashAlert">최대 8글자</div>');
            return false;
        }
        
        
        //입력 받은 데이터가 한글, 영어, 숫자가 아니면 입력 못하게.
        let str = e.key;
        let regex = /[ㄱ-힣a-zA-Z\d]/;
        let result = regex.test(str);
        if(result==false){
            return false;
        }

    })
	/////////////////////////////////////////////////////////////////////해시태그/////////////////
	
	/////////이미지 업로드//////////////////////////////////////////////////////////////////////////	
	let count = 0;
	let fileCount = $(".origin").length; //파일 개수 카운트
	var fileInput = document.getElementById('file-input');
	var preview = document.getElementById('preview');
	var dataTranster_ori = new DataTransfer();
	
	fileInput.addEventListener('change', (event) => {
// 			console.log("//////////////////////추가//////////////////")
// 			console.dir(fileInput) 
		var fileList = event.target.files;
		
		for(var i = 0; i < fileList.length; i++){
			if(fileCount < 4){
	// 				console.log(fileInput.files);
				if(fileList[i].type.includes('image/')){//이미지 확장자만 업로드 가능하게.
					if(fileList[i].name.length>100){//파일 이름 길이 제한(100자), 
// 						alert("파일명이 100자 이상인 파일은 제외되었습니다.")
						Swal.fire({
		    	            icon: 'warning',
		    	            title: '파일명이 100자 이상인 파일은 제외되었습니다.'
		    	        })
					}else if(fileList[i].size > (10*1024*1024)){//최대 파일 용량 10MB
// 						alert('10MB 이하 파일만 등록할 수 있습니다.\n\n' + '현재파일 용량 : ' + (Math.round(fileList[i].size / 1024 / 1024 * 100) / 100) + 'MB');
						Swal.fire({
		    	            icon: 'warning',
		    	            title: '10MB 이하 파일만 등록할 수 있습니다.\n\n' + '현재파일 용량 : ' + (Math.round(fileList[i].size / 1024 / 1024 * 100) / 100) + 'MB'
		    	        })
					}else if (fileList[i].name.lastIndexOf('.') == -1) {//확장자 없는 파일 제외
// 				        alert("확장자가 없는 파일은 제외되었습니다.");
						Swal.fire({
		    	            icon: 'warning',
		    	            title: '확장자가 없는 파일은 제외되었습니다.'
		    	        })
						
					}else{//정상 업로드 로직
						count++;
						dataTranster_ori.items.add(fileList[i]);
// 						preview.innerHTML += 
// 							"<p id='"+fileList[i].lastModified+"'>"
// 							+fileList[i].name+"<button data-index='"
// 							+fileList[i].lastModified+"' onClick='fncRemove(this)' class='file-remove'>X</button></p>";
						preview.innerHTML += 
							"<p id='"+fileList[i].lastModified+"'>"
							+"<img id='img"+count+"'><i data-index='"
							+fileList[i].lastModified+"' onClick='fncRemove(this)' class='bi bi-x-circle-fill file-remove'></i></p></img>";						
						
						//console.log(fileList[i].lastModified);
						
						readImage(event.target, i , 'img'+count);//이미지 세팅하기.
						
						fileCount++; //파일 개수 카운트
// 						console.log(fileCount);
					}
				}else{
// 					alert("이미지 파일만 선택 가능합니다.")
					Swal.fire({
	    	            icon: 'warning',
	    	            title: '이미지 파일만 선택 가능합니다.'
	    	        })
				}
			
			}else{
// 				alert("파일은 최대 4개까지만 가능합니다.");
				Swal.fire({
    	            icon: 'warning',
    	            title: '파일은 최대 4개까지만 가능합니다.'
    	        })
				break;
			}
			
		}
// 			console.log(dataTranster_ori);
		fileInput.files = dataTranster_ori.files;
	
	});
		
		
	function fncRemove(obj){ //x버튼 클릭 했을 시
// 			console.log("//////////////////////삭제//////////////////")
// 			console.dir(fileInput) 
		var removeTargetId = obj.dataset.index;
		var dataTranster = new DataTransfer();
		var fileList = fileInput.files;
// 			console.log(fileInput.files);
// 			console.log(dataTranster);
		for(var i = 0; i < fileList.length; i++){
			if(removeTargetId != fileList[i].lastModified){
// 					console.log(fileList[i])//남아 있는 거
				dataTranster.items.add(fileList[i]);
			}
		}
// 			console.dir(fileInput) 
			
		fileInput.files = dataTranster.files;
// 			console.log(dataTranster);
		$("#"+removeTargetId).remove();
// 			console.log(removeTargetId);
// 			console.log(fileInput.files);
// 			console.dir(fileInput) 
			
		dataTranster_ori=dataTranster;
		fileCount -= 1 ;//파일 개수 카운트
// 		console.log(fileCount);
	}
	
	
	//파일 업로드 시 이미지 불러오기
	function readImage(input, index, id) {
	    if (input.files && input.files[index]) {
	        const reader = new FileReader();
	        
	        reader.onload = (e) => {
	            const previewImage = document.getElementById(id);
	            previewImage.src = e.target.result;
	        }
	        reader.readAsDataURL(input.files[index]);
	    }
	}	
	////////////////////////////////////////////////////////이미지 업로드/////////////////////////////	
	
    //UTF-8 인코딩 방식 바이트 길이 구하기 함수
	const getByteLengthOfString = function(s,b,i,c){
	    for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
	    return b;
	};
	
	
	
	
	//기존(수정 전) 이미지 x버튼 클릭 시 삭제 //////////////////////////////////////////////////
	let delFileList=[];
	$("#preview").on("click", ".origin" ,function(){
		$(this).parent().remove();
		let fileName = $(this).attr("sys_name");
		delFileList.push(fileName);
// 		console.log(fileName+"콜백파일이름");
// 		console.log(delFileList);
		fileCount -= 1;
	})
		
	
	
	///////submit 이벤트/////////////////////////////////////////////////////////////////////////////	
	$("#form").on("submit", function(){
        //제목 UTF-8 인코딩 방식 바이트 길이 구하기
        const titleLength = $("#titleInput").val();
        const contentsLength = $("#contents").text();
        
        if(getByteLengthOfString(titleLength)>200){
//         	alert("제목을 줄여주세요.");
			Swal.fire({
	            icon: 'warning',
	            title: '제목을 줄여주세요.'
	        })
        	return false;
        }
        else if(getByteLengthOfString(contentsLength)>4000){
//         	alert("내용을 줄여주세요.");
			Swal.fire({
	            icon: 'warning',
	            title: '내용을 줄여주세요.'
	        })
        	return false;
        }
        else if(titleLength.replace(/\s|　/gi, "").length == 0){
//         	alert("제목을 입력해주세요.");
			Swal.fire({
	            icon: 'warning',
	            title: '제목을 입력해주세요.'
	        })
        	$("#title").val("");
        	$("#title").focus();
        	return false;
        }
        else if(contentsLength.replace(/\s|　/gi, "").length == 0){
//         	alert("본문을 작성해주세요.");
//         	$("#contents").text("");
//         	$("#contents").focus();
//         	return false;
    		//본문 입력 안할 시 본문 경계선 빨간색 효과주고 , submit 취소
//    			$("#contents").css({"box-shadow": "inset 0 0 10px red, 0 0 10px blue"});
   			$("#contents").css({"box-shadow": "inset 0 0 10px #9381ff, 0 0 10px #f8f9fa"});
        	$("#contents").text("");
        	$("#contents").focus();
   			return false;
        }

// 		//본문 입력 안할 시 본문 경계선 빨간색 효과주고 , submit 취소
// 		if($("#contents").text() == ''){
// 			$("#contents").css({"box-shadow": "inset 0 0 10px red, 0 0 10px blue"});
// 			return false;
// 		}

		//본문 내용 submit으로 넘길 본문 그릇에 담기
		$("#contentsInp").val($("#contents").html());
		
		//해시태그 한 문자열로 합치기(#붙여서)//////////////////////////
        let str = $(".hashtag").text();
        let str2 = str.replace(/\s+/g,'');//공백제거
        let str3 = str2.split("X");//X개준으로 배열로 나누기
        str3.splice(str3.length-1,1);//배열에서 맨 뒤 ''인 배열 빼기

        let str4 ='';
        for(let i=0; i<str3.length; i++){
            str4 += '#'+str3[i];//#붙여서 한 문자열로 합치기
        }
        //console.log(str3);//배열
        //console.log(str4);//#
		$("#hashContents").val(str4);//submit으로 넘길 해시태그 그릇에 담기.
		
	})
	
	//본문 클릭 시 경계선 블랙으로
	$("#contents").on("click", function(){
		$("#contents").css({"box-shadow": ""});
// 		$("#contents").removeAttr("box-shadow");
	})
	//본문 입력 시 경계선 블랙으로
	$("#contents").on("keydown", function(){
		$("#contents").css({"box-shadow": ""});
// 		$("#contents").removeAttr("box-shadow");
	})

	//contenteditable Enter입력시 div생기는 거 없애기////////////////////////////////////
	document.addEventListener('keydown', event => {
	  if (event.key === 'Enter') {
	    document.execCommand('insertLineBreak')
	    event.preventDefault()
	  }
	})
	
	
	
	//submit 발생 시 이벤트/////////////////////////////////////////////////////////////
	$("#form").on("submit",function(){
// 	 	$("#select").removeAttr("disabled");//콤보박스 disabled 풀어야 파라미터로 넘어감
	 	
		$.ajax({ // ajax를 통해 기존 업로드 이미지 삭제(d.b / 서버 폴더)
 	        data : {delFileList : delFileList , parent_seq:"${dto.board_seq}"},
 	      	traditional: true,
 	        url : "/community/imgDel",
 	        dataType:"json"
 	    });	 	
		
	})
	

	/////////////////////////////////////////////////////submit 발생 시 이벤트//////////
	
	
	//input type text 글자수 제한 함수
	function handleInputLength(el, max) {
	  if(el.value.length > max) {
	    el.value = el.value.substr(0, max);
	  }
	}	
	
	
	
	
	
	//해시태그 붙여넣기 막기
	$("#hashDiv").on("paste",".hashtag", function(event){
		event.preventDefault();
	})
	
	
	$("#contents").on("paste", function(e){
		
	    // cancel paste
	    e.preventDefault();

	    // get text representation of clipboard
	    var text = (e.originalEvent || e).clipboardData.getData('text/plain');
// 		console.log(text)
	    $(this).append(XSSFilter(text));
		
		//커서 위치 맨 뒤로.
		const selection = window.getSelection();
		const newRange = document.createRange();
		newRange.selectNodeContents(document.getElementById("contents"));
		newRange.collapse(false);
		selection?.removeAllRanges();
		selection?.addRange(newRange);
	})

	//꺽쇠괄호(<>) 문자열로 치환
	function XSSFilter(string){
	      return string
	      .replace(/&/g, '&amp;')
	      .replace(/</g, '&lt;')
	      .replace(/>/g, '&gt;')
	    }
		
	
	
	
	
	</script>
	
</body>

</html>