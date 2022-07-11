<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 내역</title>
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
	
</script>

</head>


<body>

	<!-- Header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/> 
	<jsp:include page="/WEB-INF/views/common/pNav.jsp"/>

	
	<div class="container mainContent">
		<!-- 작성자(O), 문의일(O), 문의명(O), 문의내용, 처리상태(O), 답변 입력칸(댓글, 대댓글 없다) -->
		<div>문의내용</div>
        <div class="row">
		    <div id="title" class="col-9 col-lg-10">${detail.title}</div>
            <div id="result" class="col-3 col-lg-2">
				<c:choose>
					<c:when test="${detail.sts == 0}">
						답변 대기
					</c:when>
				
					<c:otherwise>
						답변 완료
					</c:otherwise>
				</c:choose>            
            </div>
        </div>
		<div id="headerArea" class="row justify-content-between">
			<!-- 닉네임/ 등록시간-->
				<div id="quiryName" class="col-3">
					${detail.writer}
				</div>			
				<div id="inquiry-date" class="col-5">
					문의일 : <fmt:formatDate value="${detail.write_date}" type="both" pattern="yyyy.MM.dd" />
				</div>				
		</div>

        <!-- control box-->
        
        <c:choose>
			
			<c:when test="${loginID == detail.email}">        
        
		        <div id="control-box" class="row justify-content-end">
		            <div class="col-12 col-lg-5">
		                <button class="userBtn" style="background-color: yellow;">
		                    수정하기
		                </button>
		                <button class="userBtn" style="background-color: red;">
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
				
				${detail.contents}
                
			</div>
        
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
		        <div class="resultOutputArea">
				            
		            <div class="row justify-content-between mt-3">
		                <div class="result-title col-12 col-lg-6">
		                    문의하신 내용에 대한 답변입니다.
		                </div>
		
		                <div class="result-date col-12 col-lg-4">
			                <fmt:formatDate value="${reply.write_date}" type="both" pattern="yyyy.MM.dd" />
		                </div>
		
		                <div class="col-9 col-sm-12">
		                    <div contentEditable=false data-text="답변등록" class="resultout">
		                        ${reply.contents}
		                    </div>
		                </div>
		                
		                <!-- JSTL if문 처리 : 관리자일 때만 -->
		                <c:choose>
		            		<c:when test="${type == 'A'}">
			                	<div class="col-12" style="text-align: right; margin-bottom: 6px;">
			                    	<button class="userBtn" style="background-color: yellow; margin: 4px;">
			                       		답변 수정
			                    	</button>
			                    	<button class="userBtn" style="background-color: red; margin: 4px;">
			                       	 	답변 삭제
			                    	</button>
			                	</div>
							</c:when>
						</c:choose>
						
		            </div>
		        </div>
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