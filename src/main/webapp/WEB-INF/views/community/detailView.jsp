<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>


<!--부트스트랩-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>


<!-- detailView 전용 스타일 -->
<link rel="stylesheet" href="/css/boardDetailView.css">

<!-- input style -->
<link rel="stylesheet" href="/css/index.css">

<style>
.mainContent div{border: 1px solid black;}

</style>

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
		<div>커뮤니티 > 도와주세요</div>
		<div>제목 제목</div>
		
		<div id="headerArea">
			<div id="profileArea">
				사진
			</div>
			
			<div id="profileRigintArea">
				<div id="name">
					닉네임
				</div>			
				<div id="nicknameUnderArea">
					시간&nbsp;·&nbsp;조회 수
					<span style="float:right;">
						<button id="close">마감</button>&nbsp;
						<b class="option">⋮</b>
					</span>
				</div>
			</div>
		</div>
	
	
	
<!-- 		<div class="row"> -->
<!-- 			<div class="col-12 category"> -->
<!-- 				커뮤니티 > 도와주세요 -->
<!-- 			</div> -->
<!-- 			<div class="col-12 title"> -->
<!-- 				제목 제목 -->
<!-- 			</div> -->
<!-- 			<div class="col-12"> -->
<!-- 				<div class="row"> -->
<!-- 					<div class="col-1"> -->
<!-- 						사진 -->
<!-- 					</div> -->
					
<!-- 					<div class="col-11"> -->
<!-- 						<div class="row"> -->
<!-- 							<div class="col-12"> -->
<!-- 								닉네임 -->
<!-- 							</div> -->
<!-- 							<div class="col-12"> -->
<!-- 								시간&nbsp;·&nbsp;조회 수 -->
<!-- 								<span style="float:right;"> -->
<!-- 									<button id="close">마감</button>&nbsp; -->
<!-- 									<b class="option">⋮</b> -->
<!-- 								</span> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
					
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
		
		<hr>
		
		<!-- 본문 ------------------------------------------------------------------------>
		<div class="row contentsRow">
			<div class="col-12 content">
				본문 내용 영역
			</div>
			
			<div class="col-12 picture">
				사진 영역
			</div>
			
			<div class="col-12 hashtag">
				해시태그 영역
			</div>
			
			<div class="col-12 good_relpyCount">
				좋아요 댓글 수 영역
			</div>
			
			<hr>
			
			<div class="col-12 replyInputArea">
				댓글 등록 영역
			</div>		

			<div class="col-12 replyArea">
				댓글 영역
			</div>							
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