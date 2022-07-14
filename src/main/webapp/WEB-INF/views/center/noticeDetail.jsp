<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>


<!--부트스트랩-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>

<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

<!-- detailView 전용 스타일 -->
<link rel="stylesheet" href="/css/center/inquiryDetail.css">

<!-- input style -->
<link rel="stylesheet" href="/css/index.css">

<style>

</style>

<script>
	$(document).ready(function(){
		// 수정 -> 수정-삭제 버튼 숨기기, 수정완료-취소 버튼 만들기		
		$("#modify_notice").on("click", function(){
			
			// 수정 삭제 버튼 숨기기
			$("#modify_notice").css("display", "none");
			$("#delete_notice").css("display", "none");
			
			// 수정 완료, 수정 취소 버튼 만들기
			let ok = $("<button>");
			let cancel = $("<button>");
			
			// 수정 완료 버튼 세팅
			ok.attr({
				class : "adminBtn btn",
				type : "submit"
			});
			
			ok.css({"background-color":"yellow","margin-right":"6px"});
			ok.text("수정완료");
			
			// 수정 취소 버튼 세팅
			cancel.attr({
				class : "adminBtn btn",
				type : "button"
			});
			cancel.css("background-color", "red");
			cancel.text("수정취소");
			
			cancel.on("click", function(){
				location.reload();
			});
			
			$("#button-box").append(ok);
			$("#button-box").append(cancel);
			
			
			$(".title").attr("contenteditable", "true");
			$(".title").css("border-bottom", "2px solid black");
			$(".title").focus();
			
			$(".title").focus(function(){
				$(".title").css("border-bottom", "2px solid black");
			});
			$(".title").blur(function(){
				$(".title").css("border-bottom", "");
			});
			
			$(".content").attr("contenteditable", "true");
			
			
			
			$(".content").focus(function(){
	   			$(".content").css({"border": "3px solid black"});
			});
			
			$(".content").blur(function(){
	   			$(".content").css({"border": ""});
			});
			
		});
		
		
		// 입력 글자수 이벤트
		$(".title").keyup(function(e) {
			let content = $(this).text();
			
			// 글자수 제한
       	 	if($(this).text().length > 20) {
            	$(this).text($(this).text().substring(0, 20));
            	alert("25자까지만 입력가능합니다")
            	$(".title").focus();
       		 }
		});
		
		// 게시글
		$(".content").keyup(function(e) {
			let content = $(this).text();
			
			// 글자수 제한
       	 	if($(this).text().length > 1500) {
            	$(this).text($(this).text().substring(0, 1500));
            	alert("1500자까지만 입력가능합니다")
       		 }
		});
		
		$("#notice-article").submit(function(){
			
			let title = $(".title").text();
			let contents = $(".content").text();
			
			if(title.replace(/\s|　/gi, "").length == 0){
	        	$(".title").focus();
	        	alert("제목을 입력해주세요.");
	        	return false;
	        }
	        else if(contents.replace(/\s|　/gi, "").length == 0){
	    		//본문 입력 안할 시 본문 경계선 빨간색 효과주고 , submit 취소
	    		alert("내용을 입력해주세요.");
	        	$(".content").focus();
	   			return false;
	        }
			
			$("#titleInput").val(title);
			$("#contentsInput").val(contents);
			
		});
		
		// 삭제 - 삭제후 redirect(서버)		
		$("#delete_notice").on("click", function(){
			
			let result = confirm("해당 글을 삭제하시겠습니까?")
			let notice_seq = $("#seqInput").val();
			
			if(result){
				
				$.ajax({
					url:"/center/delNotice",
					data:{notice_seq:notice_seq}
				}).done(function(resp){
					location.href="/center/main";
				});
				
			}
		});
	});
</script>

</head>

<body>

	<!-- Header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/> 
	<jsp:include page="/WEB-INF/views/common/pNav.jsp"/>

	
	<form id="notice-article" action="/center/modifyNotice" method="post">
		<div class="container mainContent">
		
			<div>공지사항</div>
			<input type="hidden" id="seqInput" name="notice_seq" value="${data.notice_seq}">
	        <div class="row">
			    <div id="title" class="col-9 col-lg-10">
			    	<div class="row">
			    		<div class="d-none d-lg-block col-2">[ 공지 ]</div> 
			    		<div class="title col-10">${data.title}</div>
			    		<input type="hidden" id="titleInput" name="title">
			    	</div>
			    </div>
	            <div id="view" class="col-3 col-lg-2" style="text-align: right;">조회수&nbsp;${data.view_count}</div>
	        </div>
			<div id="headerArea" class="row justify-content-between">
				<!-- 닉네임/ 등록시간-->
					<div id="admin" class="col-3" style="text-align: center; line-height: 2rem;">
						관리자
					</div>			
					<div id="inquiry-date" class="col-9 col-lg-5">
						공지일 : <fmt:formatDate value="${data.write_date}" type="both" pattern="yyyy.MM.dd" />
					</div>				
			</div>
	
	        <!-- control box-->			   
	        
	        <c:choose>
				<c:when test="${type == 'A'}">
			        <div id="control-box" class="row justify-content-end">
			            <div class="col-12 col-lg-5" id="button-box">
			                <button id="modify_notice" class="adminBtn btn" style="background-color: yellow;" type="button">
			                    수정하기
			                </button>
			                <button id="delete_notice" class="adminBtn btn" style="background-color: red;" type="button">
			                    삭제하기
			                </button>
			            </div>
			        </div>			
				</c:when>	
			</c:choose>
				   
				  
			
			<hr style="height: 4px;">
			
			<!-- 공지내용 ------------------------------------------------------------------------>
			<div class="row contentsRow mb-4">
				<!-- 본문 글 영역 -->
				
					<div class="col-12 content">
		
						${data.contents}
		                
					</div>
					<input type="hidden" id="contentsInput" name="contents">
	            <hr style="height: 4px;">
			</div>
	        
		</div>
    </form>
	








	<!-- Footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<!-- loginModal -->
	<jsp:include page="/WEB-INF/views/common/loginModal.jsp" />
	
	
	
	<script>
	
	</script>

</body>
</html>