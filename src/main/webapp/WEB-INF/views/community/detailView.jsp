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
<link rel="stylesheet" href="/css/boardDetailView.css">

<!-- input style -->
<link rel="stylesheet" href="/css/index.css">

<style>
.mainContent div{border: 1px solid black;}

</style>

<script>
	$(function(){
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
		let replybottomArea = $('<div class="replybottomArea">');
		replybottomArea.append('<b>시간</b>&nbsp;');//시간
		replybottomArea.append('<b>좋아요 수</b>&nbsp;');//좋아요 수
		replybottomArea.append('<b>답댓글 수</b>&nbsp;');//답댓글 수
		replybottomArea.append('<b class="replyOption">⋮</b>');//옵션
		
		replyArea.append(replyTopArea);//각 댓글 전체 div에---댓글 프로필, 닉네임 전체 영역
		replyArea.append(replyMiddleArea);//각 댓글 전체 div에---댓글 본문 영역
		replyArea.append(replybottomArea);//각 댓글 전체 div에---댓글 등록한 시간, 좋아요 수, 답댓글 수, 옵션 영역

		////////////////////////////////////////////////////////////////////////////////////
	
		
		let reply_reArea = $('<div class="reply_reArea">');//각 답댓글 전체 div
		
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
		
		reply_reArea.append(reply_reTopArea);//각 답댓글 전체 div에---답댓글 프로필, 닉네임 전체 영역
		reply_reArea.append(reply_reMiddleArea);//각 답댓글 전체 div에---답댓글 본문 영역
		reply_reArea.append(reply_rebottomArea);//각 답댓글 전체 div에---답댓글 등록한 시간, 좋아요 수, 옵션 영역

		
		
		
		
		$(".replyEntireArea").append(replyArea);//댓글 영역에 댓글 삽입
		$(".replyEntireArea").append("<br>");
		
		$(".replyEntireArea").append(reply_reArea);//댓글 영역에 답대글 삽입
		$(".replyEntireArea").append("<br>");
	})	
	
</script>

</head>


<body>

	<!-- Header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/> 
	<jsp:include page="/WEB-INF/views/common/pNav.jsp"/>

	<div class="container mainContent">
		
		<!-- 카테고리 정보 출력하기 -->
		<c:set var="seqString" value="${dto.board_seq}" /><!-- 게시글 시퀀스 가지고 -->
		<c:set var="category" value="${fn:substring(seqString,0,1)}" /><!-- 앞 한글자 따기 -->
		<c:choose>
			<c:when test="${category eq 'q'}"><div>커뮤니티 > 궁금해요</div></c:when>
			<c:when test="${category eq 'h'}"><div>커뮤니티 > 도와주세요</div></c:when>
			<c:when test="${category eq 's'}"><div>커뮤니티 > 도와드려요</div></c:when>
			<c:when test="${category eq 'd'}"><div>커뮤니티 > 일상</div></c:when>		
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

				
				
	<div class="dropdown">
        
        <span class="dropdown-toggle" id="dropdownMenu1" data-bs-toggle="dropdown">
            <b id="option">⋮</b>
         </span>

        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
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

			<li><button class="dropdown-item" type="button">신고하기</button></li>
        </ul>
      </div>
				
				
			</div>	
			
		</div>
		
		<hr>
		
		<!-- 본문 ------------------------------------------------------------------------>
		<div class="row contentsRow">
			<!-- 본문 글 영역 -->
			<div class="col-12 content">
				<p>${dto.contents}</p>
			</div>
			<!-- 사진 영역 -->
			<div class="col-12 picture">
				<div class="imgBox" id="img1">사진1</div>
				<div class="imgBox" id="img2">사진2</div>
				<div class="imgBox" id="img3">사진3</div>
				<div class="imgBox" id="img4">사진4</div>
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
			
<!-- 				각 댓글 전체 div -->
<!-- 				<div class="replyArea"> -->
<!-- 					댓글 프로필, 닉네임 -->
<!-- 					<div class="replyTopArea"> -->
<!-- 						<div class="replyProfileArea"> -->
<!-- 							<img src="/img/normal_profile.png" class="replyProfile"> -->
<!-- 						</div>&nbsp;닉네임 -->
<!-- 					</div> -->
<!-- 					댓글 본문 -->
<!-- 					<div class="replyMiddleArea"> -->
<!-- 						본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글 -->
<!-- 					</div> -->
<!-- 					댓글 등록한 시간, 좋아요 수, 답댓글 수, 옵션 -->
<!-- 					<div class="replybottomArea"> -->
<!-- 						<b>시간</b>&nbsp; -->
<!-- 						<b>좋아요 수</b>&nbsp; -->
<!-- 						<b>답댓글 수</b>&nbsp; -->
<!-- 						<b class="replyOption">⋮</b> -->
<!-- 					</div> -->
					
					
<!-- 					<br> -->
<!-- 					답댓글 전체 div-----------------------------------		 -->
<!-- 					<div class="reply_reArea"> -->
<!-- 						답댓글 프로필, 닉네임 -->
<!-- 						<div class="reply_reTopArea"> -->
<!-- 							<i class="bi bi-arrow-return-right"></i> -->
<!-- 							<div class="reply_reProfileArea"> -->
<!-- 								<img src="/img/normal_profile.png" class="reply_reProfile"> -->
<!-- 							</div>&nbsp;닉네임 -->
<!-- 						</div> -->
<!-- 						답댓글 본문 -->
<!-- 						<div class="reply_reMiddleArea"> -->
<!-- 							본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글본문 글 -->
<!-- 						</div> -->
<!-- 						답댓글 등록한 시간, 좋아요 수, 답댓글 수, 옵션 -->
<!-- 						<div class="reply_rebottomArea"> -->
<!-- 							<b>시간</b>&nbsp; -->
<!-- 							<b>좋아요 수</b>&nbsp; -->
<!-- 							<b class="reply_reOption">⋮</b> -->
<!-- 						</div> -->
<!-- 					</div> -->
					
					
<!-- 				</div> -->


			</div>
			
			
			
			
			
			
									
		</div>
	
	</div>
	








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
	
	
	
	
	</script>

</body>
</html>