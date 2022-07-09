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
	$(document).ready(function(){
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
	        
	        console.log(contentsLength);
	        
	        if(getByteLengthOfString(titleLength)>100){
	        	alert("제목을 줄여주세요.");
	        	return false;
	        }
	        else if(getByteLengthOfString(contentsLength)>3000){
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
	    		//본문 입력 안할 시 본문 경계선 빨간색 효과주고 , submit 취소
	   			$("#contents").css({"border": "3px solid black"});
	        	$("#contents").text("");
	        	$("#contents").focus();
	   			return false;
	        }

			//본문 내용 submit으로 넘길 본문 그릇에 담기
			$("#contentsInp").val($("#contents").text());
	

		//contenteditable Enter입력시 div생기는 거 없애기////////////////////////////////////
		document.addEventListener('keydown', event => {
		  if (event.key === 'Enter') {
		    document.execCommand('insertLineBreak')
		    event.preventDefault()
		  }
		})
		
		});
		
		//본문 이벤트 초기화
		$("#contents").on("click", function(){
			$("#contents").removeAttr("style");
			$("#contents").css({"border": "1px solid black"});
		})
		$("#contents").on("keydown", function(){
			$("#contents").removeAttr("style");
			$("#contents").css({"border": "1px solid black"});
		})
	});
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
	
	
</body>

</html>