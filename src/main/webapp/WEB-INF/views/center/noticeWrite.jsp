<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!--부트스트랩-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>


<!-- boardWrite 전용 스타일 -->
<link rel="stylesheet" href="/css/center/noticeWrite.css">

<!-- input style -->
<link rel="stylesheet" href="/css/index.css">


<script>
	$(function(){
		
	})	
</script>

</head>
<body>
	<!-- Header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/> 
	<jsp:include page="/WEB-INF/views/common/pNav.jsp"/>

	
	<div class="container mainContent">
		<div id="pageHeader">공지사항 작성<br><hr></div>		
		<form action="/center/writeNotice" method="post" id="form">			
			<!-- 제목, 등록버튼 영역 ---------------------------------->
			<div class="row w-100 titleRow">
				<!-- 제목 -->
				<div class="col-10 col-sm-10 col-md-11 h-100">
					<input type="text" placeholder="제목을 입력하세요" id="titleInput" name="title" required>
				</div>
				<!-- 등록버튼 -->
				<div class="col-2 col-sm-2 col-md-1 text-center h-100">
					<input type="submit" value="등록" id="submitBtn">
				</div>			
			</div>
		
			<!-- 본문 ---------------------------------->
			<div class="row w-100">
				<input type="hidden" id="contentsInp" name="contents"><!-- submit 할때 본문내용 담을 그릇  -->
				<div class="col-12 w-100" contenteditable="true" id="contents"></div>			
			</div>
	
		</form>
	</div>

	<!-- Footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<!-- loginModal -->
	<jsp:include page="/WEB-INF/views/common/loginModal.jsp" />
	
	
	
	<script>
	
	
	
    //UTF-8 인코딩 방식 바이트 길이 구하기 함수
	const getByteLengthOfString = function(s,b,i,c){
	    for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
	    return b;
	};
	
	
	///////submit 이벤트/////////////////////////////////////////////////////////////////////////////	
	$("#form").on("submit", function(){
        //제목 UTF-8 인코딩 방식 바이트 길이 구하기
        const titleLength = $("#titleInput").val();
        const contentsLength = $("#contents").text();
        
        if(getByteLengthOfString(titleLength)>200){
        	alert("제목을 줄여주세요.");
        	return false;
        }
        else if(getByteLengthOfString(contentsLength)>4000){
        	alert("내용을 줄여주세요.");
        	return false;
        }
        else if(titleLength.replace(/\s|　/gi, "").length == 0){
        	alert("제목을 입력해주세요.");
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
   			$("#contents").css({"box-shadow": "inset 0 0 10px red, 0 0 10px blue"});
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
		$("#contentsInp").val($("#contents").text());
		
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
	
	
	
	
	</script>
	
</body>

</html>