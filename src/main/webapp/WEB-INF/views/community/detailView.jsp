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

<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

<!-- detailView 전용 스타일 -->
<link rel="stylesheet" href="/css/boardDetailView.css">

<!-- input style -->
<link rel="stylesheet" href="/css/index.css">

<style>
.mainContent div{border: 1px solid black;}

</style>

<script>
	$(function(){
		alert(111)
		
		
		
	})	
	
</script>

</head>


<body>

	<!-- Header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/> 
	<jsp:include page="/WEB-INF/views/common/pNav.jsp"/>

	
	<div class="container mainContent">
		<div>커뮤니티 > 도와주세요</div>
		<div id="title">제목 제목</div>
		<!-- 프로필, 닉네임, 조회수, 마감버튼, 옵션버튼 -->
		<div id="headerArea">
			<!-- 프로필 -->
			<div id="profileArea">
				<div class="profile">
					<img class = "imgs" src="/img/naver.png">				
				</div>
			</div>
			<!-- 닉네임/ 등록시간,조회수 -->
			<div id="profileCenterArea">
				<div id="name">
					닉네임
				</div>			
				<div id="nicknameUnderArea">
					시간&nbsp;·&nbsp;조회 수
				</div>				
			</div>
			<!-- 마감 버튼, 옵션 버튼 -->
			<div id="profileRigintArea">
				<span style="float:right; margin-right: 4px;">
					<button id="close">마감</button>&nbsp;
					<b id="option">⋮</b>
				</span>
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
			<!-- 본문 글 영역 -->
			<div class="col-12 content">
				본문 내용 영역본문 내용 영역본문 내용 영역본문 내용 영역본문 내용 영역본문 내용 영역본문 내용 영역본문 내용 영역본문 내용 영역본문 내용 영역<br>

			</div>
			<!-- 사진 영역 -->
			<div class="col-12 picture">
				사진 영역
			</div>
			<!-- 해시태그 영역 -->
			<div class="col-12 hashtag">
				해시태그 영역
			</div>
			<!-- 좋아요, 댓글 수 영역 -->
			<div class="col-12 good_relpyCount">
				좋아요 댓글 수 영역
			</div>
			
			<div class="col-12">
				<hr>
			</div>

			<!-- 댓글 입력창 영역 -->
			<div class="col-12">
				<div class="row replyInputArea">
					<div class="col-9 col-sm-10">
						<div contentEditable=true data-text="댓글을 남겨보세요." id="replyInput"></div>
					</div>
					<div class="col-3 col-sm-2 replyBtnArea">
						<button type="button" id="replyBtn">등록</button>
					</div>
				</div>
			</div>		
			
							
			<!-- 댓글 영역 -->
			<div class="col-12 mt-4 replyEntireArea">
			
				<!-- 각 댓글 전체 div -->
				<div class="replyArea">
					<!-- 댓글 프로필, 닉네임 -->
					<div class="replyTopArea">
						<div class="replyProfileArea">
							<img src="/img/naver.png" class="replyProfile">
						</div>&nbsp;닉네임
					</div>
					<!-- 댓글 본문 -->
					<div class="replyMiddleArea">
						본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글
					</div>
					<!-- 댓글 등록한 시간, 좋아요 수, 답댓글 수, 옵션 -->
					<div class="replybottomArea">
						<b>시간</b>&nbsp;
						<b>좋아요 수</b>&nbsp;
						<b>답댓글 수</b>&nbsp;
						<b class="replyOption">⋮</b>
					</div>
					
					
					<br>
					<!-- 답댓글 전체 div------------------------------------->		
					<div class="reply_reArea">
						<!-- 답댓글 프로필, 닉네임 -->
						<div class="reply_reTopArea">
							<i class="bi bi-arrow-return-right"></i>
							<div class="reply_reProfileArea">
								<img src="/img/naver.png" class="reply_reProfile">
							</div>&nbsp;닉네임
						</div>
						<!-- 답댓글 본문 -->
						<div class="reply_reMiddleArea">
							본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글
						</div>
						<!-- 답댓글 등록한 시간, 좋아요 수, 답댓글 수, 옵션 -->
						<div class="reply_rebottomArea">
							<b>시간</b>&nbsp;
							<b>좋아요 수</b>&nbsp;
							<b class="reply_reOption">⋮</b>
						</div>
					</div>
					
					
				</div>

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