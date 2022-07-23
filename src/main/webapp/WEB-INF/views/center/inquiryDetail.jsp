<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="32x32" href="/img/favicon/favicon-32x32.png">
<title>[DOWA] 문의 내역</title>
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


</head>

<body>

	<!-- Header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/> 
	<jsp:include page="/WEB-INF/views/common/pNav.jsp"/>

	
	<div class="container mainContent">
		<!-- 작성자(O), 문의일(O), 문의명(O), 문의내용, 처리상태(O), 답변 입력칸(댓글, 대댓글 없다) -->
<form id="inquriy-article" action="/center/modifyinquiry" method="post">
		<div style="FONT-SIZE: 14PX; MARGIN-BOTTOM: 4PX;">문의</div>
        <div class="row">
		    <div id="title" class="col-9 col-lg-10">
		    	<c:out value="${detail.title}" />
		    </div>
		    <input type="hidden" id="inquiry_seq" name="inquiry_seq" value="${detail.inquiry_seq}">
			<input type="hidden" id="titleInput" name="title">
            <div id="result" class="col-3 col-lg-2">
				<c:choose>
					<c:when test="${detail.sts == 0}">
						<span id="resultWait">답변 대기</span>
					</c:when>
				
					<c:otherwise>
						<span id="resultFin">답변 완료</span>
					</c:otherwise>
				</c:choose>            
            </div>
        </div>
		<div id="headerArea" class="row justify-content-between">
			<!-- 닉네임/ 등록시간-->
				<div id="quiryName" class="col-7">
					작성자 : ${detail.writer}
				</div>			
				<div id="inquiry-date" class="col-5 d-lg-block d-none">
					문의일 : <fmt:formatDate value="${detail.write_date}" type="both" pattern="yyyy.MM.dd" />
				</div>
				<div id="inquiry-date" class="col-5 d-lg-none d-block">
					<fmt:formatDate value="${detail.write_date}" type="both" pattern="yyyy.MM.dd" />
				</div>					
		</div>

        <!-- control box-->
        
        <c:choose>
			
			<c:when test="${(loginID == detail.email or type eq 'A') and detail.sts != 1}">        
        
		        <div id="control-box" class="row justify-content-end">
		            <div id="inquiry-box" class="col-12 col-lg-5">
		                <button class="userBtn btn" id="modify-inquiry" type="button" style="padding-top: 0.6rem;">
		                    수정하기
		                </button>
		                <button class="userBtn btn" id="delete-inquiry" type="button" style="padding-top: 0.6rem;">
		                    삭제하기
		                </button>
		            </div>
		        </div>
		        
			</c:when>
        </c:choose>
		<hr style="height: 4px;">
		
		<!-- 문의내용 ------------------------------------------------------------------------>
		<div class="row contentsRow">
			<!-- 본문 글 영역 -->
			<div class="col-12 content">
				<c:out value="${detail.contents}"/>
				<input type="hidden" id="contentsInput" name="contents">                
			</div>
 </form>       
 
            <hr style="height: 4px;">
            <!-- 답변 등록 JSTL 처리 : 관리자만 등록 가능 -->
            <c:choose>
            	<c:when test="${type == 'A' and reply == null}">
					<div class="col-12">
						<div class="row resultInputArea">
								<div class="col-12" data-text="답변등록" id="resultInput" contenteditable="true"></div>
								<div class="col-12  mt-1">
									<button class="btn" type="button" id="resultBtn" style="float:right;">등록</button>
								</div>
						</div>
					</div>	
				</c:when>
			</c:choose>
			<!------------------------------>
		</div>
        
        <c:choose>
        	<c:when test="${reply != null}">
		        <!-- 답변이 있을 때만 출력 JSTL -->
		       <form id="reply-article" action="/center/modifyReply" method="post">
		       	<input type="hidden" id="parent_seq2" name="parent_seq" value="${detail.inquiry_seq}">
		       	<input type="hidden" id="reply_seq" name="reply_inquiry_seq" value="${reply.reply_inquiry_seq}">
		        <div class="resultOutputArea">
				            
		            <div class="row justify-content-between mt-3">
		                <div class="result-title col-12 col-lg-6">
		                    문의하신 내용에 대한 답변입니다.
		                </div>
		
		                <div class="result-date col-12 col-lg-4 d-none d-lg-block">
			                <fmt:formatDate value="${reply.write_date}" type="both" pattern="yyyy.MM.dd" />
		                </div>
		
		                <div class="col-12 col-sm-12">
		                    <div contentEditable=false data-text="답변등록" class="resultout">
		                    	<c:out value="${reply.contents}" />
		                        <input type="hidden" id="replyInput" name="contents">
		                    </div>
		                </div>
		                
		                <!-- JSTL if문 처리 : 관리자일 때만 -->
		                <c:choose>
		            		<c:when test="${type == 'A'}">
			                	<div id="reply-btn-box"class="col-12" style="text-align: right; margin-bottom: 6px;">
			                    	<button class="userBtn btn" id="modify-rply" type="button" style="margin: 4px;">
			                       		답변 수정
			                    	</button>
			                    	<button class="userBtn btn" id="delete-rply" type="button" style="margin: 4px;">
			                       	 	답변 삭제
			                    	</button>
			                	</div>
							</c:when>
						</c:choose>
						
		            </div>
		        </div>
		       </form>
			</c:when>
        </c:choose>
        
        
        <!---------------답변 스크립트----------------->
        <script type="text/javascript">
        
        	let parent_seq =${detail.inquiry_seq}
        
			const getByteLengthOfString = function(s,b,i,c){
			    for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
			    return b;
			};
        
        	$("#resultBtn").on("click", function(){
        		const contents = $("#resultInput").text();
 
        		if(getByteLengthOfString(contents)>1500){
    	        	alert("답변을 줄여주세요.");
 			       	console.log(getByteLengthOfString(contents))
    	        	return false;
        		}
    	        else if(contents.replace(/\s|　/gi, "").length == 0){
    	        	alert("답변을 입력하세요.");
    	   			$("#resultInput").css({"border": "3px solid black"});
    	        	$("#resultInput").text("");
    	        	$("#resultInput").focus();
    	   			return false;
    	        }
        		
	    		// 답변 서버로 전송
	    		$.ajax({
					url:"/center/inquiryAnswer",  
					data:{parent_seq:parent_seq, contents:contents},
	    			type:"post"
	    		}).done(function(resp){
	    			if(resp == 1){
	    				location.reload();
	    			}
	    			else {
	    				alert("답변 등록에 실패했습니다. 다시 시도해주세요");
	    				$("#resultBtn").focus();
	    			}
	    		});
        	});
        	
    		$("#resultInput").on("keydown", function(){
    			$("#resultInput").removeAttr("style");
    			$("#resultInput").css({"border": "1px solid black"});
    		});	
    		
    		// 문의글 수정
    		$("#modify-inquiry").on("click", function(){
    			// 수정 삭제 버튼 숨기기
    			$("#modify-inquiry").css("display", "none");
    			$("#delete-inquiry").css("display", "none");
    			
    			// 수정 완료, 수정 취소 버튼 만들기
    			let ok = $("<button>");
    			let cancel = $("<button>");
    			
    			// 수정 완료 버튼 세팅
    			ok.attr({
    				class : "userBtn btn",
    				type : "submit"
    			});
    			
    			ok.css({"padding-top": "0.6rem;","margin-right":"6px"});
    			ok.text("수정완료");
    			
    			// 수정 취소 버튼 세팅
    			cancel.attr({
    				class : "userBtn btn",
    				type : "button"
    			});
    			cancel.css("padding-top", "0.6rem;");
    			cancel.text("수정취소");
    			
    			cancel.on("click", function(){
    				location.reload();
    			});
    			
    			// 동적 바인딩
    			$("#inquiry-box").append(ok);
    			$("#inquiry-box").append(cancel);    			
    			
    			$("#title").attr("contenteditable", "true");
    			$("#title").css("border-bottom", "2px solid black");
    			$("#title").focus();
    			
    			$("#title").focus(function(){
    				$("#title").css("border-bottom", "2px solid black");    			
    			});
    			
    			$("#title").blur(function(){
    				$("#title").css("border-bottom", "");
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
    		$("#title").keyup(function(e) {
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
    		
    		$("#inquriy-article").submit(function(){
    			
    			let title = $("#title").text();
    			let contents = $(".content").text();
    			
    			if(title.replace(/\s|　/gi, "").length == 0){
    	        	$(".title").focus();
    	        	alert("제목을 입력해주세요.");
    	        	return false;
    	        }
    	        else if(contents.replace(/\s|　/gi, "").length == 0){
    	    		alert("내용을 입력해주세요.");
    	        	$(".content").focus();
    	   			return false;
    	        }
    			
    			$("#titleInput").val(title);
    			$("#contentsInput").val(contents);
    			
    		});    		
    		
    		// 문의글 삭제
    		$("#delete-inquiry").on("click", function(){
    			
    			let result = confirm("문의하신 사항을 삭제하시겠습니까?");
    			let inquiry_seq = $("#inquiry_seq").val();
    			
    			if(result){
    				
    				$.ajax({
    					url: "/center/deleteInquiry",
    					data: {inquiry_seq:inquiry_seq},
    					type: "get"
    				}).done(function(resp){
						location.href="/center/main"    					
    				});
    			}
    			
    		});
    	////////////////////////////////////////////////////////////////////////////////////////////
    		
    		// 답변 수정
    		$("#modify-rply").on("click", function(){
    			// 수정 삭제 버튼 숨기기
    			$("#modify-rply").css("display", "none");
    			$("#delete-rply").css("display", "none");
    			
    			// 수정 완료, 수정 취소 버튼 만들기
    			let ok = $("<button>");
    			let cancel = $("<button>");
    			
    			// 수정 완료 버튼 세팅
    			ok.attr({
    				class : "userBtn btn",
    				type : "submit"
    			});
    			
    			ok.css({"margin-right":"6px"});
    			ok.text("수정완료");
    			
    			// 수정 취소 버튼 세팅
    			cancel.attr({
    				class : "userBtn btn",
    				type : "button"
    			});
    			cancel.text("수정취소");
    			
    			cancel.on("click", function(){
    				location.reload();
    			});
    			
    			$("#reply-btn-box").append(ok);
    			$("#reply-btn-box").append(cancel);    			
    			
    			$(".resultout").attr("contenteditable", "true");
    			
    			$(".resultout").focus(function(){
    	   			$(".resultout").css({"border": "3px solid black"});
    			});
    			
    			$(".resultout").blur(function(){
    	   			$(".resultout").css({"border": ""});
    			});
    			
    			
    		});
    		
    		// 게시글
    		$(".resultout").keyup(function(e) {
    			let content = $(this).text();
    			
    			// 글자수 제한
           	 	if($(this).text().length > 1500) {
                	$(this).text($(this).text().substring(0, 1500));
                	alert("1500자까지만 입력가능합니다")
           		 }
    		});    		
    		
    		$("#reply-article").submit(function(){
    			
    			let contents = $(".resultout").text();
    			
    			if(contents.replace(/\s|　/gi, "").length == 0){
    	    		alert("내용을 입력해주세요.");
    	        	$(".content").focus();
    	   			return false;
    	        }
    			
    			$("#replyInput").val(contents);
    			
    		});    		
    		
    		
    		// 답변 삭제
    		$("#delete-rply").on("click", function(){
    			
    			let result = confirm("해당 답변을 삭제하시겠습니까?")
    			let reply_inquiry_seq = $("#reply_seq").val();
    			let parent_seq = $("#parent_seq2").val();

    			if(result){
    				
	    			$.ajax({
    					url:"/center/deleteReply",
    					type:"get",
    					data:{reply_inquiry_seq:reply_inquiry_seq, parent_seq:parent_seq}
	    			}).done(function(resp){
	    				
	    				location.href="/center/inquiryDetail?seq="+parent_seq
	    				
	    			});
	    			
    			}
    		});
    		
    	    //contenteditable Enter입력시 div생기는 거 없애기////////////////////////////////////
    	    document.addEventListener('keydown', event => {
    	      if (event.key === 'Enter') {
    	        document.execCommand('insertLineBreak')
    	        event.preventDefault()
    	      }
    	    })	
        </script>
        
	</div>
	








	<!-- Footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<!-- loginModal -->
	<jsp:include page="/WEB-INF/views/common/loginModal.jsp" />
	
	
	
	<script>
	
	</script>

</body>
</html>