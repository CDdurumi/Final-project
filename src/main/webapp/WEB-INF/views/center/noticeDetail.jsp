<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	
</script>

</head>


<body>

	<!-- Header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/> 
	<jsp:include page="/WEB-INF/views/common/pNav.jsp"/>

	
	<div class="container mainContent">
		<!-- 작성자(O), 문의일(O), 문의명(O), 문의내용, 처리상태(O), 답변 입력칸(댓글, 대댓글 없다) -->
		<div>공지사항</div>
        <div class="row">
		    <div id="title" class="col-9 col-lg-10">[ 공지 ] 환불관련 정책 안내입니다.</div>
            <div id="view" class="col-3 col-lg-2" style="text-align: right;">조회 100</div>
        </div>
		<div id="headerArea" class="row justify-content-between">
			<!-- 닉네임/ 등록시간-->
				<div id="admin" class="col-3" style="text-align: center; line-height: 2rem;">
					관리자
				</div>			
				<div id="inquiry-date" class="col-5">
					공지일 : 2022.07.06
				</div>				
		</div>

        <!-- control box-->
        <div id="control-box" class="row justify-content-end">
            <div class="col-12 col-lg-5">
                <button class="adminBtn" style="background-color: yellow;">
                    수정하기
                </button>
                <button class="adminBtn" style="background-color: red;">
                    삭제하기
                </button>
            </div>
        </div>
		
		<hr style="height: 4px;">
		
		<!-- 공지내용 ------------------------------------------------------------------------>
		<div class="row contentsRow mb-4">
			<!-- 본문 글 영역 -->
			<div class="col-12 content">




                
			</div>
        
            <hr style="height: 4px;">

		</div>
        
	</div>
	








	<!-- Footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<!-- loginModal -->
	<jsp:include page="/WEB-INF/views/common/loginModal.jsp" />
	
	
	
	<script>
	
	</script>

</body>
</html>