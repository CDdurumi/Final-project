<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		    <div id="title" class="col-9 col-lg-10">환불은 언제 가능한가요?</div>
            <div id="result" class="col-3 col-lg-2">답변완료</div>
        </div>
		<div id="headerArea" class="row justify-content-between">
			<!-- 닉네임/ 등록시간-->
				<div id="quiryName" class="col-3">
					닉네임
				</div>			
				<div id="inquiry-date" class="col-5">
					문의일 : 2022.07.06
				</div>				
		</div>

        <!-- control box-->
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
		
		<hr style="height: 4px;">
		
		<!-- 문의내용 ------------------------------------------------------------------------>
		<div class="row contentsRow">
			<!-- 본문 글 영역 -->
			<div class="col-12 content">




                
			</div>
        
            <hr style="height: 4px;">
            <!-- 답변 등록 JSTL 처리 필요 -->
			<div class="col-12">
				<div class="row resultInputArea">
					<div class="col-9 col-sm-10">
						<div contentEditable=true data-text="답변등록" id="resultInput"></div>
					</div>
					<div class="col-3 col-sm-2  my-auto">
						<button type="button" id="resultBtn">등록</button>
					</div>
				</div>
			</div>		
			<!------------------------------>
		</div>
        
        <!-- 답변이 있을 때만 출력 JSTL -->
        <div class="resultOutputArea">
            
            <div class="row justify-content-between mt-3">
                <div class="result-title col-12 col-lg-6">
                    문의실 내용에 대한 답변입니다.
                </div>

                <div class="result-date col-12 col-lg-4">
                    2022.07.07
                </div>

                <div class="col-9 col-sm-12">
                    <div contentEditable=false data-text="답변등록" class="resultout">
                        이게 답변이다.
                    </div>
                </div>
                <!-- JSTL if문 처리 : 관리자일 때만 -->
                <div class="col-12" style="text-align: right; margin-bottom: 6px;">
                    <button class="userBtn" style="background-color: yellow; margin: 4px;">
                        답변 수정
                    </button>
                    <button class="userBtn" style="background-color: red; margin: 4px;">
                        답변 삭제
                    </button>
                </div>

            </div>

        </div>
        <!-------------------------------->
	</div>
	








	<!-- Footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<!-- loginModal -->
	<jsp:include page="/WEB-INF/views/common/loginModal.jsp" />
	
	
	
	<script>
	
	</script>

</body>
</html>