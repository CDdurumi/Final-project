<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
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
<link rel="stylesheet" href="/css/community/boardDetailView.css">

<!-- input style -->
<link rel="stylesheet" href="/css/index.css">


<!--알람 팝업-->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>



<style>
.mainContent div{border: 1px solid black;}

</style>

<script>
	$(function(){
    	// 링크 공유하기 모달에서 사용할 링크 넣어두기
        let url = window.document.location.href;
        $("#shareLink").val(url);
		
		
		
		
		
		
		let replyArea = $('<div class="replyArea">');//각 댓글 전체 div
		
		////////댓글 프로필, 닉네임////////
		let replyTopArea = $('<div class="replyTopArea">');//댓글 프로필, 닉네임 전체 영역
		
		let replyProfileArea = $('<div class="replyProfileArea">');//프로필 div
		let replyProfile = $('<img src="/img/normal_profile.png" class="replyProfile">');//프로필
		replyProfileArea.append(replyProfile);//프로필 div에 프로필 삽입
		
		replyTopArea.append(replyProfileArea);//댓글 프로필, 닉네임 전체 영역에--프로필 div 삽입
		replyTopArea.append("&nbsp;닉네임");//댓글 프로필, 닉네임 전체 영역에--닉네임 삽입
		
		////////댓글 본문////////
		let replyMiddleArea = $('<div class="replyMiddleArea">');
		replyMiddleArea.append("본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글");

		
		
		////////댓글 등록한 시간, 좋아요 수, 답댓글 수, 옵션////////
		let replybottomArea = $('<div class="replybottomArea">');//댓글 등록시간, 좋아요, 답댓글 전체 영역
		
		let rGoodCountSpan = $('<span class = "rGoodCountSpan">');//좋아요 수 영역
		rGoodCountSpan.append('<i class="bi bi-hand-thumbs-up-fill replyGood"></i>');
		rGoodCountSpan.append('<span class="replyGoodText">좋아요 ${dto.like_count}</span>');
		
		let rReplyCountSpan = $('<span class = "rReplyCountSpan">');//답댓글 수 영역
		rReplyCountSpan.append('<i class="bi bi-chat-dots-fill reply_reCount"></i>');
		rReplyCountSpan.append('<span class="reply_reCountText"> 답댓글 수 미완</span>');
		
		
		let replyDropDown = $('<div class="dropdown replyDropDown">');//댓글 옵션 드롭다운 영역
		
		let replyOption = $('<span class="dropdown-toggle" id="replyDropdownMenu" data-bs-toggle="dropdown">');//옵션 영역
		replyOption.append('<b class="replyOption">⋮</b>');
		
		let replyDropdownMenu = $('<ul class="dropdown-menu" aria-labelledby="replyDropdownMenu">');//드롭다운 메뉴
		if(${dto.writer eq loginID}){
			replyDropdownMenu.append('<li><button class="dropdown-item" type="button" id="replyModi">수정하기</button></li>');//드롭다운 메뉴에 수정 넣기
			replyDropdownMenu.append('<li><button class="dropdown-item" type="button" id="replyDel">삭제하기</button></li>');//드롭다운 메뉴에 삭제 넣기
		}
		let reDropLi = $('<li>');//신고 메뉴
		reDropLi.append('<button class="dropdown-item report" type="button">신고하기</button>');
		reDropLi.append('<input type=hidden class="rSeq" value="${dto.board_seq }">');
		reDropLi.append('<input type=hidden class="reported" value="${dto.writer }">');
		reDropLi.append('<input type=hidden class="rpContents" value="${dto.title }">');
		reDropLi.append('<input type=hidden class="rstate" value="${dto.state }">');
		replyDropdownMenu.append(reDropLi);//드롭다운 메뉴에 신고 넣기
		
		replyDropDown.append(replyOption);//댓글 옵션 드롭다운 영역에 옵션 영역 삽입
		replyDropDown.append(replyDropdownMenu);//댓글 옵션 드롭다운 영역에 옵션 영역 삽입
		
		
		replybottomArea.append('<span class="reply_reg_date">시간</span>');//댓글 등록시간, 좋아요, 답댓글 전체 영역에 시간 영역 삽입
		replybottomArea.append(rGoodCountSpan);//댓글 등록시간, 좋아요, 답댓글 전체 영역에 좋아요 수 영역 삽입
		replybottomArea.append(rReplyCountSpan);//댓글 등록시간, 좋아요, 답댓글 전체 영역에 답댓글 수 영역 삽입
		replybottomArea.append(replyDropDown);//댓글 등록시간, 좋아요, 답댓글 전체 영역에 옵션 드롭다운 영역 삽입
	

		
		replyArea.append(replyTopArea);//각 댓글 전체 div에---댓글 프로필, 닉네임 전체 영역
		replyArea.append(replyMiddleArea);//각 댓글 전체 div에---댓글 본문 영역
		replyArea.append(replybottomArea);//각 댓글 전체 div에---댓글 등록한 시간, 좋아요 수, 답댓글 수, 옵션 영역

		////////////////////////////////////////////////////////////////////////////////////
	
		let reply_reArea = $('<div class="reply_reArea">');
		let reply_reDiv = $('<div class="reply_reDiv">');//각 답댓글 전체 div
		
		////////답댓글 프로필, 닉네임////////
		let reply_reTopArea = $('<div class="reply_reTopArea">');//답댓글 프로필, 닉네임 전체 영역
		
		let reply_reProfileArea = $('<div class="reply_reProfileArea">');//프로필 div
		let reply_reProfile = $('<img src="/img/normal_profile.png" class="reply_reProfile">');//프로필
		reply_reProfileArea.append(reply_reProfile);//프로필 div에 프로필 삽입
		
		reply_reTopArea.append('<i class="bi bi-arrow-return-right"></i>');//답댓글 프로필, 닉네임 전체 영역에--들여쓰기 기호 삽입
		reply_reTopArea.append(reply_reProfileArea);//답댓글 프로필, 닉네임 전체 영역에--프로필 div 삽입
		reply_reTopArea.append("&nbsp;닉네임");//답댓글 프로필, 닉네임 전체 영역에--닉네임 삽입
		
		////////답댓글 본문////////
		let reply_reMiddleArea = $('<div class="reply_reMiddleArea">');
		reply_reMiddleArea.append("본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글");

		////////답댓글 등록한 시간, 좋아요 수 옵션////////
		let reply_rebottomArea = $('<div class="reply_rebottomArea">');
		reply_rebottomArea.append('<b>시간</b>&nbsp;');//시간
		reply_rebottomArea.append('<b>좋아요 수</b>&nbsp;');//좋아요 수
		reply_rebottomArea.append('<b class="reply_reOption">⋮</b>');//옵션
		
		reply_reDiv.append(reply_reTopArea);//각 답댓글 전체 div에---답댓글 프로필, 닉네임 전체 영역
		reply_reDiv.append(reply_reMiddleArea);//각 답댓글 전체 div에---답댓글 본문 영역
		reply_reDiv.append(reply_rebottomArea);//각 답댓글 전체 div에---답댓글 등록한 시간, 좋아요 수, 옵션 영역

		reply_reArea.append(reply_reDiv);
		replyArea.append(reply_reArea);//개별 댓글 영역에 답대글 영역 삽입
		
		
		$(".replyEntireArea").append(replyArea);//댓글 전체 영역에 개별 댓글 영역 삽입
		$(".replyEntireArea").append("<br>");
	})	
	
</script>

</head>


<body>

	<!-- Header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/> 
	<jsp:include page="/WEB-INF/views/common/pNav.jsp"/>

	<div class="container mainContent">
		<!-- 해시태그 검색 -->
		<form action="/community/main" id="hashForm" method="post">
			<input type="hidden" id="hashSearch" name="hash_tag">
		</form>


	
		<!-- 카테고리 정보 출력하기 -->
		<c:set var="seqString" value="${dto.board_seq}" /><!-- 게시글 시퀀스 가지고 -->
		<c:set var="category" value="${fn:substring(seqString,0,1)}" /><!-- 앞 한글자 따기 -->
		<c:choose>
			<c:when test="${category eq 'q'}"><div class="categoryArea">커뮤니티 > 궁금해요</div></c:when>
			<c:when test="${category eq 'h'}"><div class="categoryArea">커뮤니티 > 도와주세요</div></c:when>
			<c:when test="${category eq 's'}"><div class="categoryArea">커뮤니티 > 도와드려요</div></c:when>
			<c:when test="${category eq 'd'}"><div class="categoryArea">커뮤니티 > 일상</div></c:when>		
		</c:choose>
	
		<!-- 제목 -->
		<div id="title">
			<span>${dto.title}</span>

			<!-- '도와주세요'의 경우, 마감 여부 표시 -->
			<c:if test="${category eq 'h'}">
				<c:choose>
					<c:when test="${dto.progress eq 'Y'}">
						<span id="progressY" class="progressYN">진행중</span>
					</c:when>
					<c:otherwise>
						<span id="progressN" class="progressYN">마감</span>
					</c:otherwise>
				</c:choose>	
			</c:if>
		
		
		
		</div>
		
		
		
		<!-- 프로필, 닉네임, 조회수, 옵션 -->
		<div id="headerArea">
		
			<!-- 프로필 -->
			<div id="profileArea">
				<div class="profile">
					<c:choose>
						<c:when test="${mDto.profile_img != null}">
							<img class = "imgs" src="/community/${mDto.profile_img}">
<%-- 							<img class = "imgs" src="/upload/${mDto.profile_img}"> --%>
						</c:when>
						<c:otherwise>
							<img class = "imgs" src="/img/normal_profile.png">		
						</c:otherwise>
					</c:choose>	
				</div>
			</div>
			
			<!-- 닉네임/ 등록시간, 조회수 -->
			<div id="profileCenterArea">
				<div id="nameSpan">
					<span id="name">${mDto.nickname}</span>
				</div>
				<div id="nicknameUnderArea">	<!-- append로 넣기 -->
<!-- 					<span id="board_reg_date">등록 시간</span> -->
<!-- 					&nbsp;·&nbsp; -->
<!-- 					<span id = "board_viewCount">조회 수</span> -->
				</div>
	
			</div>
			
			
			<!-- 옵션 버튼(수정, 삭제, 마감, 신고) -->
			<div id="profileRigintArea">
			
				<i class="bi bi-share info_share share" data-bs-toggle="modal" data-bs-target="#shareModal"></i>
				
				<!--게시글 옵션 드롭다운 ----------------------------------------------------------->		
				<div class="dropdown">
			        
			        <span class="dropdown-toggle" id="boardDropdownMenu" data-bs-toggle="dropdown">
			            <b id="option">⋮</b>
			         </span>
			
			        <ul class="dropdown-menu" aria-labelledby="boardDropdownMenu">
						<c:if test="${dto.writer eq loginID}">
							<li><button class="dropdown-item" type="button" id="boardModi">수정하기</button></li>
							<li><button class="dropdown-item" type="button" id="boardDel">삭제하기</button></li>
						</c:if>
						<c:if test="${category eq 'h'}">
							<c:choose>
								<c:when test="${dto.progress eq 'Y'}">
									<li><button class="dropdown-item" type="button" id="close" progress="Y">마감하기</button></li>
								</c:when>
								<c:otherwise>
									<li><button class="dropdown-item" type="button" id="close" progress="N">진행하기</button></li>
								</c:otherwise>
							</c:choose>
							
						</c:if>
			
						<li>
							<button class="dropdown-item report" type="button">신고하기</button>
							<input type=hidden class="rSeq" value="${dto.board_seq }">
							<input type=hidden class="reported" value='${dto.writer }'>
							<input type=hidden class="rpContents" value="${dto.title }">
							<input type=hidden class="rstate" value="${dto.state }">
							
						</li>
			        </ul>
			      </div>
				<!-- -----------------------------------------게시글 옵션 드롭다운------------------>			
				
			</div>	
			
		</div>
		
		<hr>
		
		<!-- 본문 ------------------------------------------------------------------------>
		<div class="row contentsRow">
			<!-- 본문 글 영역 -->
			<div class="col-12 content">
				<p>${dto.contents}</p>
			</div>
			
			
			<c:if test="${!empty imgDto}">
				<!-- 사진 영역 -->
		        <div class="row classImgs">
		            <div class="col-12 h-100">            
		            	<div class="myGallery">
		            		<a data-bs-toggle="modal" data-bs-target="#imgModal" style="display:none">
			                    <img id="co1_view">
			                </a>
		            		<a class="ma_etc" data-bs-toggle="modal" data-bs-target="#imgModal" style="display:none">
		                     	<img id="co2_view">
		                    </a>
		                    <a class="ma_etc" data-bs-toggle="modal" data-bs-target="#imgModal" style="display:none">
		                        <img id="co3_view">
		                    </a>
		                    <a class="ma_etc" data-bs-toggle="modal" data-bs-target="#imgModal" style="display:none">
		                        <img id="co4_view">
		                    </a>                        
		            	</div>                
		            </div>
		        </div> 
			</c:if>


			
			
			
			<!-- 해시태그 영역 -->
			<c:if test="${!empty dto.hash_tag}"><!-- 해시태그가 존재한다면, -->
			<div class="col-12 hashtagArea">
				<c:set var="tagString" value="${dto.hash_tag}" /><!-- 해시태그 나열 가지고 -->
				<c:set var="tags" value="${fn:split(tagString,'#')}" /><!-- 배열로 나누기 -->
				<c:forEach var="tag" items="${tags}" varStatus="status">
					<span class="hashtag">#${tag}</span>
				</c:forEach>
			</div>		
			</c:if>
				

			<!-- 좋아요, 댓글 수 영역 -->
			<div class="col-12 good_relpyCount">
				<span class = "bGoodCountSpan">
					<i class="bi bi-hand-thumbs-up-fill boardGood"></i> 
					<span class="boardGoodText">좋아요 ${dto.like_count}</span>
				</span>
				<span class = "bReplyCountSpan">
					<i class="bi bi-chat-dots-fill boardReCount"></i>
					<span class="boardReCountText"> 댓글 수 미완</span>
				</span>
	
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
			
<!-- 				각 댓글 전체 div -->
				<div class="replyArea">
<!-- 					댓글 프로필, 닉네임 -->
					<div class="replyTopArea">
						<div class="replyProfileArea">
							<img src="/img/normal_profile.png" class="replyProfile">
						</div>&nbsp;닉네임
					</div>
<!-- 					댓글 본문 -->
					<div class="replyMiddleArea">
						본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글
					</div>
<!-- 					댓글 등록한 시간, 좋아요 수, 답댓글 수, 옵션 -->
					<div class="replybottomArea">
						<span class="reply_reg_date">시간</span>
						
						<span class = "rGoodCountSpan">
							<i class="bi bi-hand-thumbs-up-fill replyGood"></i> 
							<span class="replyGoodText">좋아요 ${dto.like_count}</span>
						</span>
						<span class = "rReplyCountSpan">
							<i class="bi bi-chat-dots-fill reply_reCount"></i>
							<span class="reply_reCountText"> 답댓글 수 미완</span>
						</span>
					

						<!--댓글 옵션 드롭다운 ----------------------------------------------------------->		
						<div class="dropdown replyDropDown">
					        
					        <span class="dropdown-toggle" id="replyDropdownMenu" data-bs-toggle="dropdown">
					            <b class="replyOption">⋮</b>
					         </span>
					
					        <ul class="dropdown-menu" aria-labelledby="replyDropdownMenu">
								<c:if test="${dto.writer eq loginID}"><!-- ------------------------------------------------------------------------수정--------------- -->
									<li><button class="dropdown-item" type="button" id="replyModi">수정하기</button></li>
									<li><button class="dropdown-item" type="button" id="replyDel">삭제하기</button></li>
								</c:if>
					
								<li>
									<button class="dropdown-item report" type="button">신고하기</button>
									<input type=hidden class="rSeq" value="${dto.board_seq }"><!-- --------------------------------------------------수정------------------ -->
									<input type=hidden class="reported" value='${dto.writer }'>
									<input type=hidden class="rpContents" value="${dto.title }">
									<input type=hidden class="rstate" value="${dto.state }">
									
								</li>
					        </ul>
					      </div>
						<!-- -----------------------------------------댓글 옵션 드롭다운------------------>		
					</div>
					
					
					<!-- 답댓글 전체 div -->
					<div class="reply_reArea">
	<!-- 					답댓글 개별 div-----------------------------------		 -->
						<div class="reply_reDiv">
	<!-- 						답댓글 프로필, 닉네임 -->
							<div class="reply_reTopArea">
								<i class="bi bi-arrow-return-right"></i>
								<div class="reply_reProfileArea">
									<img src="/img/normal_profile.png" class="reply_reProfile">
								</div>&nbsp;닉네임
							</div>
	<!-- 						답댓글 본문 -->
							<div class="reply_reMiddleArea">
								본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글
							</div>
	<!-- 						답댓글 등록한 시간, 좋아요 수, 답댓글 수, 옵션 -->
							<div class="reply_rebottomArea">
								<b>시간</b>&nbsp;
								<b>좋아요 수</b>&nbsp;
								<b class="reply_reOption">⋮</b>
							</div>
						</div>
						
						
					</div>
				</div>
				<br>

			</div>
			
			
			
			
			
			
									
		</div>
	
	</div>
	

	<!-- 신고하기 모달 ------------------------------------------------------------------------->
                <div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="rpmodalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content" id="rpmodal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="rpmodalLabel">신고하기</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body" id="rpmodal-body">
                                <form method="post" id="rpForm">
                                    <div class="mb-3 p-2">
                                        신고하는 이유를 선택해주세요.
                                        <input type=hidden name="parent_seq" id="reportPSeq">
                                        <input type=hidden name="writer" id="reported">
                                        <input type=hidden name="contents" id="rpContents">
                                    </div>
                                    <div class="mb-3 p-4">
                                        <input type=radio id="reason1" name="reason" value="광고 및 홍보성 내용" checked>
                                        <label for="reason1">광고 및 홍보성 내용</label><br><br>
                                        <input type=radio id="reason2" name="reason" value="관련없는 이미지, 내용">
                                        <label for="reason2">관련없는 이미지, 내용</label><br><br>
                                        <input type=radio id="reason3" name="reason" value="욕설, 비방, 공격적인 내용">
                                        <label for="reason3">욕설, 비방, 공격적인 내용</label><br><br>
                                        <input type=radio id="reason4" name="reason" value="음란/선정성">
                                        <label for="reason4">음란/선정성</label><br><br>
                                        <input type=radio id="reason5" name="reason" value="저작권 침해">
                                        <label for="reason5">저작권 침해</label><br><br>
                                        <input type=radio id="reason6" name="reason" value="개인정보 노출">
                                        <label for="reason6">개인정보 노출</label><br><br>
                                        <input type=radio id="reason7" name="reason" value="기타">
                                        <label for="reason7">기타</label>                                  
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                            	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                            	<button type="button" class="btn btn-primary" id="rpFormSubmit">신고하기</button>                                                                
                            </div>
                        </div>
                    </div>
                </div>
		<!--  ----------------------------------------------------------신고하기 모달--------------->

        <!--- 이미지 보기 모달 -------------------------------------------------------------------------->                
                <div class="modal" tabindex="-1" id="imgModal">
                    <div class="modal-dialog modal-dialog-centered modal-lg">
                        <div class="modal-content i_modal-content">
                            <div class="modal-header" style="border: 0;">
                                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                                  aria-label="Close"></button>
                            </div>
                            <div class="modal-body i_modal-body p-0">
                                <p class="p-2"><img src="/"></p>
                            </div>
                        </div>
                    </div>
                </div>
		<!--  -----------------------------------------------------------------------이미지 보기 모달--------->   
        
        <!-- 링크 공유 모달 --------------------------------------------------------------------------------->
                <div class="modal fade" id="shareModal" tabindex="-1" aria-labelledby="smodalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content" id="smodal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="smodalLabel">링크 공유하기</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body" id="smodal-body">
                                <input type="text" id="shareLink" readonly>
                                <button type="button" id="shareLinkBtn"><i class="bi bi-link-45deg"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
        <!--  ----------------------------------------------------------------------링크 공유 모달----------->






	<!-- Footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<!-- loginModal -->
	<jsp:include page="/WEB-INF/views/common/loginModal.jsp" />
	
	
	
	
	
	
	
	
	<script>
	
	
	//게시글 등록 시간, 조회 수 넣기
	let board_reg_date_diff = elapsedTime("${dto.write_date}");//등록 시간 차 구하기//함수 호출
	
	let board_reg_date = $('<span id="board_reg_date">'+board_reg_date_diff+'</span>');//등록 시간
	let board_viewCount = $('<span id = "board_viewCount">조회 ${dto.view_count}</span>');//조회수
	
	$("#nicknameUnderArea").append(board_reg_date);//게시글 등록 시간 넣기
	$("#nicknameUnderArea").append("&nbsp;·&nbsp;");
	$("#nicknameUnderArea").append(board_viewCount);//게시글 조회 수 넣기

// 	$('document').ready(function(){
// 		let board_reg_date = elapsedTime("${dto.write_date}");//등록 시간 차 구하기
// 		$("#board_reg_date").text(board_reg_date);
// 	})
	

	//등록 시간차 구하는 함수
	function elapsedTime(i) {

		const timeValue = new Date(i);//등록 시간
        const today = new Date();//현재시간
        const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);//분(현재시간 등록시간 차)
        const betweenTimeHour = Math.floor(betweenTime / 60);//시(현재시간 등록시간 차)
//         const betweenTimeDay = Math.floor(betweenTime / 60 / 24);//일(현재시간, 등록시간 차)


		var d = new Date();//현재 날짜
		var now_year = d.getFullYear(); //현재 년, 2015
		var now_month = (d.getMonth() + 1); //현재 월, 11[1을 더해야함. 유일하게 조심해야할 부분. 1월은 0이다.]
		var now_day = d.getDate(); //현재 일
		var yesterday = now_day-1; //어제
		
		let reg_date = timeValue.toISOString().slice(0,10);//등록일 ex) 2022-07-10
		let reg_year = reg_date.slice(0,4);//등록 년
		let reg_month = reg_date.slice(5,7);//등록 월
		let reg_day = reg_date.slice(8,10);//등록 일

		
		if(now_year == reg_year && now_month == reg_month && yesterday == reg_day ){//등록시간이랑 어제랑 날짜가 같으면,
			return '어제';
		}else{
			
			if(betweenTimeHour > 24){
				return reg_date;
			}else if(betweenTime >= 60 && betweenTimeHour <= 24){
	        	return betweenTimeHour + '시간 전';
	        }else if(betweenTime < 60 && betweenTime > 1){
	        	return betweenTime + '분 전';
	        }else if(betweenTime <= 1){
	        	return '방금 전';
	        }
			
		}
		
	}        
        

	
	
	
	//게시글 수정하기//////////////////////////
	$("#boardModi").on("click",function(){
		location.href = "/community/boardModi?seq=${dto.board_seq}"
	})
	
	//게시글 삭제하기
	$("#boardDel").on("click",function(){
		let result = confirm("삭제하시겠습니까?");//////삭제 확인//////
		if (result == true) {
			location.href = "/community/boardDel?seq=${dto.board_seq}"
		}
	})
	
	//마감하기(도와주세요)
	$("#close").on("click", function(){
		let progress = $(this).attr("progress");//Y:진행중 -> 마감으로 처리 / N:마감중 -> 진행중으로 처리

		if(progress == 'Y'){//마감처리
			$(this).text("진행하기");
			$(this).attr("progress","N");
			$(".progressYN").remove();
			$("#title").append('<span id="progressN" class="progressYN">마감</span>');
		}else if(progress == 'N'){//진행처리
			$(this).text("마감하기")
			$(this).attr("progress","Y");
			$(".progressYN").remove();
			$("#title").append('<span id="progressY" class="progressYN">진행중</span>');
		}
		
        $.ajax({
            url:'/community/progress',
            type:'POST',
			data : {seq : '${dto.board_seq}' , progress : progress},
			dataType : 'json',
         })
		
	})
	
	
	//해시 태그 검색
	$(".hashtag").on("click", function(){
		let hash_tag = $(this).text();
		$("#hashSearch").val(hash_tag);
		$("#hashForm").submit();
		
// 		location.href = "/community/hashSerach?hash_tag="+hash_tag;
		
	})
	
	
	
	
	// 신고하기 클릭 시 (모달 열리기 전)
		$(".report").on("click",function(){
// 			$('#reportModal').modal('show');
			
			// 로그인 되어있지 않다면 리턴
			if('${loginID}'==''){		
				Swal.fire({
    	            icon: 'warning',
    	            title: '로그인 후 이용 가능합니다.'
    	        })
    	        return false;
	    	}
			
			let parent_seq = $(this).siblings('.rSeq').val();//신고하는 게시글,댓글,대댓글 seq
			let reported = $(this).siblings(".reported").val();//신고 받는 사람
			let rpContents = $(this).siblings(".rpContents").val();//게시글 제목, 댓글, 대댓글
			let rstate = $(this).siblings(".rstate").val();//

			// 신고 여부 확인
			if(rstate == '1'){
				Swal.fire({
    	            icon: 'warning',
    	            text: '이미 신고한 게시물입니다.'
    	        })
    	        return false;
			}else{
				$("#reported").val(reported);
				$("#rpContents").val(rpContents);
				$("#reportPSeq").val(parent_seq);
				
				$('#reportModal').modal('show');
			}
			
			
		})
	
		
		
	// 신고하기 폼 submit 시
		$("#rpFormSubmit").on("click",function(){
			
			let form = $("#rpForm");
		    let actionUrl = "/community/report";
			
			$.ajax({
		        url: actionUrl,
		        data: form.serialize()
		        
		    }).done(function(resp){ 
		    	
		    	Swal.fire({
                    icon: 'success',
                    title: '신고가 접수되었습니다.',
                    showConfirmButton: false,
                    timer: 1500
                }).then((result2) => {
                    if (result2.dismiss === Swal.DismissReason.timer) {
                    	location.reload();
                    }
                })
                
		    })
		    
// 		    $('#rpForm')[0].reset();//모달 리셋
// 			$('#reportModal').modal('hide');//모달창 닫기
		})	
	
		
		
		
		//==========< 모달 3 - 링크 공유 모달 >================================
			
	    // 링크 공유하기 이벤트
		    $("#shareLinkBtn").on("click",function(){
		        $("#shareLink").select();
		        document.execCommand("copy");  
		
		        Swal.fire({
		            icon: 'success',
		            text: '링크가 복사되었습니다.',
		            showConfirmButton: false,
		            timer: 1000
		        })
		    })		
		
		
		
		
		//본문 이미지 설정//////////////////////////////////////////////////////////////////////
		let arr = JSON.parse('${imgDto}');
	    let coCount = 0;//이미지 개수
	    
// 	    console.log(arr)
// 	    console.log(arr.length)
	    for(let i=0;i<arr.length;i++){
			//이미지 grid class 설정용 
			coCount += 1;		
		}    
	    
		for(let i=0;i<arr.length;i++){
			let sys_name = arr[i].sys_name;
			//이미지 src 설정
			$("#co"+(1+i)+"_view").attr("src","/community/"+sys_name);
			

			//모달용 data-bs-imgSrc & grid class 설정
			$("#co"+(1+i)+"_view").parent().attr({"data-bs-imgSrc":"/community/"+sys_name,
												"class":"item"+coCount});
			//사진이 존재한다면 사진 및 모달 활성화
			$("#co"+(1+i)+"_view").parent().css("display","inline-block")	

		}
		
		
		//==========< 이미지 보기 모달 >================================			
	    
	    // 이미지 클릭시 모달에 이미지 소스 설정 
		    var imgModal = document.getElementById('imgModal')
		    imgModal.addEventListener('show.bs.modal', function (event) {
		        var button = event.relatedTarget
		        var recipient = button.getAttribute('data-bs-imgSrc')
		        var modalBodyImg = imgModal.querySelector('.modal-body img')
		        $(modalBodyImg).attr("src",recipient);
		    })
		/////////////////////////////////////////////////////////////////본문 이미지 설정///////
		
		
		
		let good = false;//좋아요 안되어 있을 때, 좋아요 가능

		if(${boardGoodExist == '1'}){
             $(".boardGood").css("color", "#9381ff" );
             $(".boardGoodText").css("color", "#9381ff" );
			good=true;
		}


		let bLikeUpDown = 0;
		//==========< 게시글 좋아요 클릭 시 >================================		
		$(".bGoodCountSpan").on("click", function(){
			// 로그인 되어있지 않다면 리턴
			if('${loginID}'==''){		
				Swal.fire({
    	            icon: 'warning',
    	            title: '로그인 후 이용 가능합니다.'
    	        })
    	        return false;
	    	}
			
			
	         if (good == false) {//좋아요 가능(좋아요 안된 상태에서 -> 좋아요 상태로)
	             $(".boardGood").css("color", "#9381ff" );
	             $(".boardGoodText").css("color", "#9381ff" );
	             good=true;
	
	         } else {
	             $(".boardGood").css("color", "#888");
	             $(".boardGoodText").css("color", "#888");
	             good=false;
	             
	         }
	         
	         if(good){//위에서 좋아요 했으면 true인 상태니까.
	            bLikeUpDown = 1;
	         }else{
	            bLikeUpDown = 0;
	         }
	         
	       $.ajax({
	          url:"/community/boardLike",
	          data:{
	             seq:"${dto.board_seq}",
	             likeUpDown:bLikeUpDown
	          },
	          dataType:"json"
	       }).done(function(resp){
	             console.log("좋아요 개수 : "+resp)//좋아요 개수
	             $(".boardGoodText").text(" 좋아요 "+resp);
	             
	          }).fail(function(a, b){ 
	             console.log(a);
	             console.log(b);
	          })

		})
		
		
		
		
	</script>

</body>
</html>