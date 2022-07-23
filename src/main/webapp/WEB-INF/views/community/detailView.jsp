<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="32x32" href="/img/favicon/favicon-32x32.png">
<title>[DOWA] 커뮤니티 - ${dto.title}</title>
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
/* .mainContent div{border: 1px solid black;} */

</style>

<script>
	$(function(){
// 		console.log('${replyList[0].WRITE_DATE}');
		
    	// 링크 공유하기 모달에서 사용할 링크 넣어두기
        let url = window.document.location.href;
        $("#shareLink").val(url);
		
        
        //댓글 대댓글에 대한 로그인 id 좋아요 정보 가져오기
        if(${loginID != null}){//로그인 했을 시
        	//해당 게시글에서 내가 좋아요 한 댓글,대댓글 정보 
			$.ajax({
				   url:"/community/replyGoodInfo"
				   ,data:{
					   board_seq : '${dto.board_seq}'
				    }
				   ,dataType:"json"
				}).done(function(resp){//goodDTO
					let replyGoodList = JSON.parse(resp[0]) //좋아요 한 댓글 정보
					let replyReGoodList = JSON.parse(resp[1]) //좋아요 한 대댓글 정보
// 					console.log(replyGoodList);
// 					console.log(replyReGoodList);
					
					
// 					//좋아요 한 댓글 정보(속성) 삽입
					$(".replyArea").each(function(i,item){
						let seq = $(this).children(".replyBottomArea").find(".rSeq").val();
// 						console.log(seq);
						for(let i =0; i< replyGoodList.length; i++){//댓글 시퀀스랑 좋아요 parent_seq랑 같으면(login id) 
							if(seq == replyGoodList[i].PARENT_SEQ){
					            $(this).find(".replyGood").css("color", "#9381ff" );
					            $(this).find(".replyGoodText").css("color", "#9381ff" );
					            $(this).find(".rGoodCountSpan").attr("good","true");
							}
						}
					})
					
					//좋아요 한 대댓글 정보(속성) 삽입
					$(".reply_reDiv").each(function(i,item){
						
						let seq = $(this).children(".reply_reBottomArea").find(".rSeq").val();
// 						console.log(seq);
						for(let i =0; i< replyReGoodList.length; i++){//대댓글 시퀀스랑 좋아요 parent_seq랑 같으면(login id) 
							if(seq == replyReGoodList[i].PARENT_SEQ){
					            $(this).find(".reply_reGood").css("color", "#9381ff" );
					            $(this).find(".reply_reGoodText").css("color", "#9381ff" );
					            $(this).find(".rrGoodCountSpan").attr("good","true");
							}
						}
					})
					
			}).fail(function(a, b){ 
			   console.log(a);
			   console.log(b);
			})	

        }		

        

        
        
        
        
		//==========< 댓글 등록 클릭 시 >================================	
		$("#replyBtn").on("click", function(){
			let contents = $("#replyInput").html().trim();
			let contentsLength = $("#replyInput").text().trim();

			// 로그인 되어있지 않다면 리턴
			if('${loginID}'==''){		
				Swal.fire({
    	            icon: 'warning',
    	            title: '로그인 후 이용 가능합니다.'
    	        })
    	        return false;
	    	}
			
			//수정 작업 활성화 되어 있으면 못하게.
			if(isReModiPro){
				Swal.fire({
    	            icon: 'warning',
    	            title: '기존 수정 작업을 완료해주세요.'
    	        })
    	        return false;			
			}
			
			if(isOpenReReInput){//이미 답댓글 창이 열려 있으면,
				Swal.fire({
    	            icon: 'warning',
    	            title: '답댓글 작업을 완료해주세요.'
    	        })
    	        return false;
			}				
			
			
			
	        if(getByteLengthOfString(contentsLength)>4000){//내용 길이 제한
				Swal.fire({
    	            icon: 'warning',
    	            title: '내용을 줄여주세요.'
    	        })
    	        return false;
	        }
	        if(contentsLength.replace(/\s|　/gi, "").length == 0){//공백 등록 못하게
	        	$("#replyInput").html("");
	        	$("#replyInput").focus();
				Swal.fire({
    	            icon: 'warning',
    	            title: '공백은 등록하실 수 없습니다.'
    	        })
    	        return false;
	        }
			
			
			
			
	       $.ajax({
		          url:"/community/replyReg",
		          data:{
		        	 board_seq :"${dto.board_seq}",
		             parent_seq:"${dto.board_seq}",
		             contents:contents
		          },
		          dataType:"json",
		          async: false
		       }).done(function(resp){
		    	   	$("#replyInput").text("");

		    	   //댓글 수 증가시켜서 삽입하기
		    	   let reCount = $("#replyTotalCount").text();
		    	   let reCountUp = (parseInt(reCount)+1).toString();
		    	   $("#replyTotalCount").text(reCountUp);
		    	   	
// 					console.log(resp)
// 					console.log(resp[0].BOARD_SEQ)
					
					let replyArea = $('<div class="replyArea">');//각 댓글 전체 div
					
					////////댓글 프로필, 닉네임////////
					let replyTopArea = $('<div class="replyTopArea">');//댓글 프로필, 닉네임 전체 영역
					
					let replyProfileArea = $('<div class="replyProfileArea">');//프로필 div
					let replyProfile;
					if(resp[0].PROFILE_IMG != null){
// 						replyProfile = $('<img src="/community/'+resp[0].PROFILE_IMG+'" class="replyProfile">');//프로필
						replyProfile = $('<img src="/upload/'+resp[0].PROFILE_IMG+'" class="replyProfile">');//프로필
					}else{
						replyProfile = $('<img src="/img/normal_profile.png" class="replyProfile">');//기본 프로필
					}
					
					replyProfileArea.append(replyProfile);//프로필 div에 프로필 삽입
					
					replyTopArea.append(replyProfileArea);//댓글 프로필, 닉네임 전체 영역에--프로필 div 삽입
					replyTopArea.append("&nbsp;&nbsp;"+resp[0].NICKNAME);//댓글 프로필, 닉네임 전체 영역에--닉네임 삽입
					
					////////댓글 본문////////
					let replyMiddleArea = $('<div class="replyMiddleArea">');
					replyMiddleArea.append(resp[0].CONTENTS);


					////////댓글 등록한 시간, 좋아요 수, 답댓글 수, 옵션////////
					let replyBottomArea = $('<div class="replyBottomArea">');//댓글 등록시간, 좋아요, 답댓글 전체 영역
					
					let rGoodCountSpan = $('<span class = "rGoodCountSpan"  good="false">');//좋아요 수 영역
					rGoodCountSpan.append('<i class="bi bi-hand-thumbs-up-fill replyGood"></i>');
					rGoodCountSpan.append('<span class="replyGoodText">좋아요 '+resp[0].LIKE_COUNT+'</span>');
					
					let rReplyCountSpan = $('<span class = "rReplyCountSpan" isOpen="false">');//답댓글 수 영역
					rReplyCountSpan.append('<i class="bi bi-chat-dots-fill reply_reCount"></i>');
					rReplyCountSpan.append('<span class="reply_reCountText">답댓글 <span class="reReCount">'+resp[0].RR_COUNT+'</span></span>');
					
					
					let replyDropDown = $('<div class="dropdown replyDropDown">');//댓글 옵션 드롭다운 영역
					
					let replyOption = $('<span class="dropdown-toggle" id="replyDropdownMenu" data-bs-toggle="dropdown">');//옵션 영역
					replyOption.append('<b class="replyOption">⋮</b>');
					
					let replyDropdownMenu = $('<ul class="dropdown-menu menu" aria-labelledby="replyDropdownMenu">');//드롭다운 메뉴
					
					let loginID = '${loginID}';
					let writer = resp[0].WRITER;
					if(loginID == writer){//로그인 id가 작성한 댓글이면,
						replyDropdownMenu.append('<li><button class="dropdown-item replyModi" type="button">수정하기</button></li>');//드롭다운 메뉴에 수정 넣기
						replyDropdownMenu.append('<li><button class="dropdown-item replyDel" type="button">삭제하기</button></li>');//드롭다운 메뉴에 삭제 넣기
					}
					
					let reDropLi = $('<li>');//신고 메뉴
					if(loginID != writer){
						reDropLi.append('<button class="dropdown-item report" type="button">신고하기</button>');	
					}
					
					reDropLi.append('<input type=hidden class="rSeq" value="'+resp[0].REPLY_SEQ+'">');
					reDropLi.append('<input type=hidden class="reported" value="'+resp[0].WRITER+'">');
					reDropLi.append('<input type=hidden class="rpContents" value="'+resp[0].CONTENTS+'">');
					reDropLi.append('<input type=hidden class="rstate" value="'+resp[0].STATE+'">');
					replyDropdownMenu.append(reDropLi);//드롭다운 메뉴에 신고 넣기
					
					replyDropDown.append(replyOption);//댓글 옵션 드롭다운 영역에 옵션 영역 삽입
					replyDropDown.append(replyDropdownMenu);//댓글 옵션 드롭다운 영역에 드롭다운 메뉴 영역 삽입
					
					
					replyBottomArea.append('<span class="reply_reg_date">'+resp[0].WRITE_DATE+'</span>');//댓글 등록시간, 좋아요, 답댓글 전체 영역에 - 시간 영역 삽입
					replyBottomArea.append(rGoodCountSpan);//댓글 등록시간, 좋아요, 답댓글 전체 영역에 - 좋아요 수 영역 삽입
					replyBottomArea.append(rReplyCountSpan);//댓글 등록시간, 좋아요, 답댓글 전체 영역에 - 답댓글 수 영역 삽입
					replyBottomArea.append('<span class = "replyModiComp" style="display:none">수정</span>');//댓글 등록시간, 좋아요, 답댓글 전체 영역에 - 수정 버튼(숨김) 삽입
					replyBottomArea.append(replyDropDown);//댓글 등록시간, 좋아요, 답댓글 전체 영역에 - 옵션 드롭다운 영역 삽입
				

					
					replyArea.append(replyTopArea);//각 댓글 전체 div에---댓글 프로필, 닉네임 전체 영역
					replyArea.append(replyMiddleArea);//각 댓글 전체 div에---댓글 본문 영역
					replyArea.append(replyBottomArea);//각 댓글 전체 div에---댓글 등록한 시간, 좋아요 수, 답댓글 수, 옵션 영역
					replyArea.append('<div class="reply_reArea">');//각 댓글 전체 div에---대댓글 전체 영역 div 만들기
					let reply_reInputArea = $('<div class="reply_reInputArea" style="display:none">');
					reply_reInputArea.append('<div contentEditable=true data-text="답댓글을 남겨보세요." class="reply_reInput" id="reply_reInput_'+resp[0].REPLY_SEQ+'"></div>');
					reply_reInputArea.append('<div class="reply_reBtnArea"><button type="button" class="reply_reBtn">등록</button></div>');
					replyArea.append(reply_reInputArea);//각 댓글 전체 div에---답댓글 입력창 div 만들기(숨김)
					

					$(".replyEntireArea").prepend(replyArea);//댓글 전체 영역에 개별 댓글 영역 삽입

		       })

		})
		//============================================================< 댓글 등록 클릭 시 >==============        
        
        
        //=====< 답댓글 등록 클릭 시 >=====================================================================       
			
 		$(".replyEntireArea").on("click", ".reply_reBtn" ,function(){
 			isOpenReReInput = false; //답댓글 입력창이 활성화 되어 있는지 판단하는 요소(등록 시 비활성화로 set - 답댓글 창 여러개(댓글마다) 못 열게 )
			let currLocation = $(this);//현재 위치

			//길이제한 및 공백 입력 방지
	        let contentsLength = $(this).closest(".replyArea").find(".reply_reInput").text().trim();
	        if(getByteLengthOfString(contentsLength)>4000){//내용 길이 제한
				Swal.fire({
    	            icon: 'warning',
    	            title: '내용을 줄여주세요.'
    	        })
    	        return false;
	        }
	        if(contentsLength.replace(/\s|　/gi, "").length == 0){//공백 등록 못하게
	        	$(this).closest(".replyArea").find(".reply_reInput").html("");
	        	$(this).closest(".replyArea").find(".reply_reInput").focus();
				Swal.fire({
    	            icon: 'warning',
    	            title: '공백은 등록하실 수 없습니다.'
    	        })
    	        return false;
	        }			

			
			$(this).parent().parent().css("display","none");//답댓글 입령창 닫아라
			$(this).closest(".replyArea").find(".rReplyCountSpan").attr("isOpen","false");			
 			
 			let parent_seq = $(this).closest(".replyArea").children(".replyBottomArea").find(".rSeq").val();//댓글 시퀀스
//  			console.log(parent_seq);
			let contents =  $(this).closest(".replyArea").find(".reply_reInput").html().trim();//대댓글 내용
// 			console.log(contents)
			
			// 로그인 되어있지 않다면 리턴
			if('${loginID}'==''){		
				Swal.fire({
    	            icon: 'warning',
    	            title: '로그인 후 이용 가능합니다.'
    	        })
    	        return false;
	    	}

	       $.ajax({
		          url:"/community/replyReg",
		          data:{
		        	 board_seq :"${dto.board_seq}",
		             parent_seq : parent_seq,
		             contents : contents
		          },
		          dataType:"json",
		          async: false
		       }).done(function(resp){
// 		    	   console.log(resp)
		    	   currLocation.closest(".replyArea").find(".reply_reInput").html("");//대댓글 입력창 클린
		    	   
		    	   //답댓글 수 증가시켜서 삽입하기
		    	   let reReCount = currLocation.closest(".replyArea").children(".replyBottomArea").find(".reReCount").text();
		    	   let reReCountUp = (parseInt(reReCount)+1).toString();
		    	   currLocation.closest(".replyArea").children(".replyBottomArea").find(".reReCount").text(reReCountUp);

		    	   
					//답댓글 색 없애기
		            currLocation.closest(".replyArea").find(".replyBottomArea").find(".reply_reCount").css("color", "#888" );
		            currLocation.closest(".replyArea").find(".replyBottomArea").find(".reply_reCountText").css("color", "#888" );
		            currLocation.closest(".replyArea").find(".replyBottomArea").find(".reReCount").css("color", "#888" );		    	   
		    	   
		    	   	
		    	   //답 댓글 출력=====================================================================================================
			   		let reply_reDiv = $('<div class="reply_reDiv">');//각 답댓글 전체 div
					
					////////답댓글 프로필, 닉네임////////
					let reply_reTopArea = $('<div class="reply_reTopArea">');//답댓글 프로필, 닉네임 전체 영역
					
					let reply_reProfileArea = $('<div class="reply_reProfileArea">');//프로필 div
					let reply_reProfile;
					if(resp[0].PROFILE_IMG != null){
// 						reply_reProfile = $('<img src="/community/'+resp[0].PROFILE_IMG+'" class="reply_reProfile">');//프로필
						reply_reProfile = $('<img src="/upload/'+resp[0].PROFILE_IMG+'" class="reply_reProfile">');//프로필
					}else{
						reply_reProfile = $('<img src="/img/normal_profile.png" class="reply_reProfile">');//기본 프로필
					}
					reply_reProfileArea.append(reply_reProfile);//프로필 div에 프로필 삽입
					
					
					reply_reTopArea.append('<i class="bi bi-arrow-return-right"></i>');//답댓글 프로필, 닉네임 전체 영역에--들여쓰기 기호 삽입
					reply_reTopArea.append(reply_reProfileArea);//답댓글 프로필, 닉네임 전체 영역에--프로필 div 삽입
					reply_reTopArea.append("&nbsp;&nbsp;"+resp[0].NICKNAME+"");//답댓글 프로필, 닉네임 전체 영역에--닉네임 삽입
					
					////////답댓글 본문////////
					let reply_reMiddleArea = $('<div class="reply_reMiddleArea">');
					reply_reMiddleArea.append(resp[0].CONTENTS);
	
					
					////////답댓글 등록한 시간, 좋아요 수, 옵션////////
					let reply_reBottomArea = $('<div class="reply_reBottomArea">');//답댓글 등록시간, 좋아요 전체 영역
					
					let rrGoodCountSpan = $('<span class = "rrGoodCountSpan"  good="false">');//좋아요 수 영역
					rrGoodCountSpan.append('<i class="bi bi-hand-thumbs-up-fill reply_reGood"></i>');
					rrGoodCountSpan.append('<span class="reply_reGoodText"> 좋아요 '+resp[0].LIKE_COUNT+'</span>');
					
					let reply_reDropDown = $('<div class="dropdown reply_reDropDown">');//답댓글 옵션 드롭다운 영역
					
					let reply_reOption = $('<span class="dropdown-toggle" id="reply_reDropdownMenu" data-bs-toggle="dropdown">');//옵션 영역
					reply_reOption.append('<b class="reply_reOption">⋮</b>');
					
					let reply_reDropdownMenu = $('<ul class="dropdown-menu menu" aria-labelledby="reply_reDropdownMenu">');//드롭다운 메뉴
					
					let loginID = '${loginID}';
					let writer = resp[0].WRITER;
					if(loginID == writer){//로그인id가 작성한 대댓글이면,
						reply_reDropdownMenu.append('<li><button class="dropdown-item reply_reModi" type="button">수정하기</button></li>');//드롭다운 메뉴에 수정 넣기
						reply_reDropdownMenu.append('<li><button class="dropdown-item reply_reDel" type="button">삭제하기</button></li>');//드롭다운 메뉴에 삭제 넣기
					}
					let re_reDropLi = $('<li>');//신고 메뉴
					if(loginID != writer){
						re_reDropLi.append('<button class="dropdown-item report" type="button">신고하기</button>');
					}

					re_reDropLi.append('<input type=hidden class="rSeq" value="'+resp[0].REPLY_SEQ+'">');
					re_reDropLi.append('<input type=hidden class="reported" value="'+resp[0].WRITER+'">');
					re_reDropLi.append('<input type=hidden class="rpContents" value="'+resp[0].CONTENTS+'">');
					re_reDropLi.append('<input type=hidden class="rstate" value="'+resp[0].STATE+'">');
					reply_reDropdownMenu.append(re_reDropLi);//드롭다운 메뉴에 신고 넣기
					
					reply_reDropDown.append(reply_reOption);//답댓글 옵션 드롭다운 영역에 옵션 영역 삽입
					reply_reDropDown.append(reply_reDropdownMenu);//답댓글 옵션 드롭다운 영역에 드롭다운 메뉴 영역 삽입
					
					
					reply_reBottomArea.append('<span class="reply_re_reg_date">'+resp[0].WRITE_DATE+'</span>');//답댓글 등록시간, 좋아요 전체 영역에 - 시간 영역 삽입
					reply_reBottomArea.append(rrGoodCountSpan);//답댓글 등록시간, 좋아요 전체 영역에 - 좋아요 수 영역 삽입
					reply_reBottomArea.append('<span class = "reply_reModiComp" style="display:none">수정</span>');//답댓글 등록시간, 좋아요 전체 영역에 - 수정 버튼(숨김) 삽입
					reply_reBottomArea.append(reply_reDropDown);//답댓글 등록시간, 좋아요 전체 영역에 - 옵션 드롭다운 영역 삽입
				
	
					
					reply_reDiv.append(reply_reTopArea);//각 답댓글 전체 div에---답댓글 프로필, 닉네임 전체 영역
					reply_reDiv.append(reply_reMiddleArea);//각 답댓글 전체 div에---답댓글 본문 영역
					reply_reDiv.append(reply_reBottomArea);//각 답댓글 전체 div에---답댓글 등록한 시간, 좋아요 수, 옵션 영역
	
					currLocation.closest(".replyArea").find(".reply_reArea").append(reply_reDiv);//답댓글 전체 영역에 개별 답댓글 영역 삽입		
			    	   
			    	   
				})
			
			
			
			
 		})
        	


			
		//=============================================================< 답댓글 등록 클릭 시 >=============    
		
			
			
			
		$(".toMain").on("click", function(){
			location.href = "/community/main";
		})
		
		$(".toQuestion").on("click", function(){
			location.href = "/community/main#question-tab";
		})
		$(".toHelp").on("click", function(){
			location.href = "/community/main#help-tab";
		})	
		$(".toSupport").on("click", function(){
			location.href = "/community/main#support-tab";
		})
		$(".toDaily").on("click", function(){
			location.href = "/community/main#daily-tab";
		})
		
		
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
			<c:when test="${category eq 'q'}"><div class="categoryArea"><span class="toMain">커뮤니티</span> > <span class="toQuestion">궁금해요</span></div></c:when>
			<c:when test="${category eq 'h'}"><div class="categoryArea"><span class="toMain">커뮤니티</span> > <span class="toHelp">도와주세요</span></div></c:when>
			<c:when test="${category eq 's'}"><div class="categoryArea"><span class="toMain">커뮤니티</span> > <span class="toSupport">도와드려요</span></div></c:when>
			<c:when test="${category eq 'd'}"><div class="categoryArea"><span class="toMain">커뮤니티</span> > <span class="toDaily">일상</span></div></c:when>		
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
<%-- 							<img class = "imgs" src="/community/${mDto.profile_img}"> --%>
							<img class = "imgs" src="/upload/${mDto.profile_img}">
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
			
			        <ul class="dropdown-menu menu" aria-labelledby="boardDropdownMenu">
						<c:if test="${dto.writer eq loginID}">
							<li><button class="dropdown-item" type="button" id="boardModi">수정하기</button></li>
						</c:if>
						<c:if test="${dto.writer eq loginID || type eq 'A'}">	
							<li><button class="dropdown-item" type="button" id="boardDel">삭제하기</button></li>
						</c:if>
						
						<c:if test="${dto.writer eq loginID}">
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
						</c:if>
						
						
						<li>
							<c:if test ="${dto.writer != loginID && type != 'A'}">
								<button class="dropdown-item report" type="button">신고하기</button>
							</c:if>
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
					<div class="hashtagSpan"><span class="hashtag">#${tag}</span></div>
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
					<span class="boardReCountText"> 댓글 <span id="replyTotalCount">${fn:length(replyList)}</span></span>
				</span>
	
			</div>
			
			<div class="col-12">
				<hr>
			</div>

			<!-- 댓글 입력창 영역 -->
			<div class="col-12">
				<div class="row replyInputArea" id="replyInputArea">
					<div class="col-9 col-sm-10 replyInputDiv">
						<div contentEditable=true data-text="댓글을 남겨보세요." id="replyInput"></div>
					</div>
					<div class="col-3 col-sm-2 replyBtnArea">
						<input type="button" id="replyBtn" value="등록">
<!-- 						<button type="button" id="replyBtn">등록</button> -->
					</div>
				</div>
			</div>		
			
							
			<!-- 댓글 영역 ---------------------------------------------------------------------------------------->
			<div class="col-12 mt-4 replyEntireArea">
			
				<c:forEach var="i" items="${replyList}">
				
					<!-- 각 댓글 전체 div -->
					<div class="replyArea">
						<!-- 댓글 프로필, 닉네임 -->
						<div class="replyTopArea">
							<div class="replyProfileArea">
								<c:choose>
									<c:when test="${!empty i.PROFILE_IMG}">
<%-- 										<img src="/community/${i.PROFILE_IMG}" class="replyProfile"> --%>
										<img src="/upload/${i.PROFILE_IMG}" class="replyProfile">
									</c:when>
									<c:otherwise>
										<img src="/img/normal_profile.png" class="replyProfile">
									</c:otherwise>
								</c:choose>
								
							</div>&nbsp;&nbsp;${i.NICKNAME}
						</div>
						
						
						<!-- 댓글 본문 -->
						<div class="replyMiddleArea">${i.CONTENTS}</div>
						
						
						<!-- 댓글 등록한 시간, 좋아요 수, 답댓글 수, 옵션 ----------->
						<div class="replyBottomArea">
							<span class="reply_reg_date">${i.WRITE_DATE}</span>
							
							<!-- 좋아요 -->
							<span class = "rGoodCountSpan" good="false">
								<i class="bi bi-hand-thumbs-up-fill replyGood"></i> 
								<span class="replyGoodText">좋아요 ${i.LIKE_COUNT}</span>
							</span>
							
							<!-- 답댓글 -->
							<span class = "rReplyCountSpan" isOpen="false">
								<i class="bi bi-chat-dots-fill reply_reCount"></i>
								<span class="reply_reCountText"> 답댓글 <span class='reReCount'>${i.RR_COUNT}</span></span>
							</span>
						
						
							<!-- 수정(완료) 버튼 숨겨두기 -->
							<span class = "replyModiComp" style="display: none;">수정</span>
							
							
	
							<!--댓글 옵션 드롭다운 ----------------------------------------------------------->		
							<div class="dropdown replyDropDown">
						        
						        <span class="dropdown-toggle" id="replyDropdownMenu" data-bs-toggle="dropdown">
						            <b class="replyOption">⋮</b>
						         </span>
						
						        <ul class="dropdown-menu menu" aria-labelledby="replyDropdownMenu">
									<c:if test="${i.WRITER eq loginID}">
										<li><button class="dropdown-item replyModi" type="button">수정하기</button></li>
									</c:if>
									<c:if test="${i.WRITER eq loginID || type == 'A' }">
										<li><button class="dropdown-item replyDel" type="button">삭제하기</button></li>
									</c:if>
			
						
									<li>
										<c:if test="${i.WRITER != loginID && type != 'A'}">
											<button class="dropdown-item report" type="button">신고하기</button>
										</c:if>
										<input type=hidden class="rSeq" value="${i.REPLY_SEQ}">
										<input type=hidden class="reported" value='${i.WRITER}'>
										<input type=hidden class="rpContents" value="${i.CONTENTS}">
										<input type=hidden class="rstate" value="${i.STATE}">
										
									</li>
						        </ul>
						      </div>
							<!-- -----------------------------------------댓글 옵션 드롭다운------------------>		
						</div>
						
						
						
						<!-- 답댓글 영역 ---------------------------------------------------------------------------->
						<!-- 답댓글 전체 div ----------------------------------------------------------------->
						<div class="reply_reArea">
						
						<c:forEach var="j" items="${replyReList}">
							<!-- 댓글 시퀀스랑 대댓글 parent_seq랑 같다면 출력해라 -->
							<c:if test="${i.REPLY_SEQ == j.PARENT_SEQ}">
						
								<!-- 답댓글 개별 div -->
								<div class="reply_reDiv">
									<!-- 답댓글 프로필, 닉네임 -->
									
									<div class="reply_reTopArea">
										<i class="bi bi-arrow-return-right"></i>
										<div class="reply_reProfileArea">
											<c:choose>
													<c:when test="${!empty j.PROFILE_IMG}">
<%-- 														<img src="/community/${j.PROFILE_IMG}" class="reply_reProfile"> --%>
														<img src="/upload/${j.PROFILE_IMG}" class="reply_reProfile">
													</c:when>
													<c:otherwise>
														<img src="/img/normal_profile.png" class="reply_reProfile">
													</c:otherwise>
												</c:choose>
										</div>&nbsp;&nbsp;${j.NICKNAME}
									</div>

									
									<!-- 답댓글 본문 -->
									<div class="reply_reMiddleArea">${j.CONTENTS}</div>
									
									
									<!-- 답댓글 등록한 시간, 좋아요 수, 옵션 ----------->
									<div class="reply_reBottomArea">
										<span class="reply_re_reg_date">${j.WRITE_DATE}</span>
										
										<!-- 좋아요 -->
										<span class = "rrGoodCountSpan" good="false">
											<i class="bi bi-hand-thumbs-up-fill reply_reGood"></i> 
											<span class="reply_reGoodText">좋아요 ${j.LIKE_COUNT}</span>
										</span>
										
									
										<!-- 수정(완료) 버튼 숨겨두기 -->
										<span class = "reply_reModiComp" style="display: none;">수정</span>
										
										
				
										<!--답댓글 옵션 드롭다운 ----------------------------------------------------------->		
										<div class="dropdown reply_reDropDown">
									        
									        <span class="dropdown-toggle" id="reply_reDropdownMenu" data-bs-toggle="dropdown">
									            <b class="reply_reOption">⋮</b>
									         </span>
									
									        <ul class="dropdown-menu menu" aria-labelledby="reply_reDropdownMenu">
												<c:if test="${j.WRITER eq loginID}">
													<li><button class="dropdown-item reply_reModi" type="button">수정하기</button></li>
												</c:if>
												<c:if test="${j.WRITER eq loginID || type == 'A'}">
													<li><button class="dropdown-item reply_reDel" type="button">삭제하기</button></li>
												</c:if>
									
									
												<li>
													<c:if test="${j.WRITER != loginID && type != 'A'}">
														<button class="dropdown-item report" type="button">신고하기</button>
													</c:if>
													<input type=hidden class="rSeq" value="${j.REPLY_SEQ}">
													<input type=hidden class="reported" value='${j.WRITER}'>
													<input type=hidden class="rpContents" value="${j.CONTENTS}">
													<input type=hidden class="rstate" value="${j.STATE}">
													
												</li>
									        </ul>
									      </div>
										<!-- -----------------------------------------대댓글 옵션 드롭다운------------------>		
									</div>	
											
									<!-- ----------------------------------------------------------- 답댓글------>
								</div>
								
							</c:if>
							
						</c:forEach>
							
						</div>
						
						
						
						
						

						<!-- 답댓글 입력창 ----------------------------------->
						<div class="reply_reInputArea" style="display:none">
							<div contentEditable=true data-text="답댓글을 남겨보세요." class="reply_reInput" id="reply_reInput_${i.REPLY_SEQ}"></div>
							<div class="reply_reBtnArea">
								<input type="button" class="reply_reBtn" value="등록">
<!-- 								<button type="button" class="reply_reBtn">등록</button> -->
							</div>
						</div>
						
						
						
						
					</div>

				</c:forEach>


			</div>
			<!--  ----------------------------------------------------------------------------댓글 영역------------>
			
			
			
			
			
									
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
	
	//state=2 인 게시글인 경우 main으로 되돌리기
	if(${dto.state == 2 && type!='A'}){
	    Swal.fire({
	        icon: 'warning',
	        title: '신고 처리되어 블락된 게시물입니다.',
	        text: '잠시 후 목록으로 이동합니다.',
	        showConfirmButton: false,
	        timer: 1500,
	        allowOutsideClick:false,
	        allowEscapeKey:false,
	        allowEnterKey:false
	    }).then((result2) => {						
			if (result2.dismiss === Swal.DismissReason.timer) {
			    location.replace("/community/main");
            }
		})

	}
	
	

	
	
    //UTF-8 인코딩 방식 바이트 길이 구하기 함수
	const getByteLengthOfString = function(s,b,i,c){
	    for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
	    return b;
	};
	
	
	
	
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

		let timeValue = new Date(i);//등록 시간
		let reg_date = i.slice(0,10);//등록일 ex) 2022-07-10

		let reg_year = timeValue.getFullYear();//등록 년
		let reg_month = timeValue.getMonth()+1;//등록 월
		let reg_day = timeValue.getDate();//등록 일

        let today = new Date();//현재시간
        let betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);//분(현재시간 등록시간 차)
        let betweenTimeHour = Math.floor(betweenTime / 60);//시(현재시간 등록시간 차)
//         const betweenTimeDay = Math.floor(betweenTime / 60 / 24);//일(현재시간, 등록시간 차)


		var d = new Date();//현재 날짜
		var now_year = d.getFullYear(); //현재 년, 2015
		var now_month = (d.getMonth() + 1); //현재 월, 11[1을 더해야함. 유일하게 조심해야할 부분. 1월은 0이다.]
		var now_day = d.getDate(); //현재 일
		var yesterday = now_day-1; //어제
		


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
		
		Swal.fire({
	        title: '정말 삭제하시겠습니까?',
	        showCancelButton: true,
	        confirmButtonColor: '#9381FF',
	        cancelButtonColor: '#D9D9D9',
	        confirmButtonText: '확인',
	        cancelButtonText: '취소',
        }).then((result) => {
        	if (result.isConfirmed) {   
        		
    	    	Swal.fire({
                    icon: 'success',
                    title: '삭제가 완료되었습니다.',
                    showConfirmButton: false,
                    timer: 1500,
                    allowOutsideClick:false,
                    allowEscapeKey:false,
                    allowEnterKey:false
                }).then((result2) => {
                    if (result2.dismiss === Swal.DismissReason.timer) {
                    	location.href = "/community/boardDel?seq=${dto.board_seq}"
                    }
                })
                
 
			}
		})	
		
		

			
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
	$(".hashtagSpan").on("click", function(){
		let hash_tag = $(this).text();
		$("#hashSearch").val(hash_tag);
		setCookie('hash', '1', 30);//detailView에서 hashtag 검색한 거라는 의미
		$("#hashForm").submit();
		
// 		location.href = "/community/hashSerach?hash_tag="+hash_tag;
		
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
		if(${!empty imgDto}){
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
// 				$("#co"+(1+i)+"_view").attr("src","/community/"+sys_name);
				$("#co"+(1+i)+"_view").attr("src","/upload/"+sys_name);
				
	
				//모달용 data-bs-imgSrc & grid class 설정
				$("#co"+(1+i)+"_view").parent().attr({"data-bs-imgSrc":"/upload/"+sys_name,
													"class":"item"+coCount});
				//사진이 존재한다면 사진 및 모달 활성화
				$("#co"+(1+i)+"_view").parent().css("display","inline-block")	
	
			}
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
		
		
		
		//게시글 좋아요 기능///////////////////////////////////////////////////////////////////
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
// 	             console.log("좋아요 개수 : "+resp)//좋아요 개수
	             $(".boardGoodText").text(" 좋아요 "+resp);
	             
	          }).fail(function(a, b){ 
	             console.log(a);
	             console.log(b);
	          })

		})
		
		//댓글 좋아요 기능///////////////////////////////////////////////////////////////////

		//==========< 댓글 좋아요 클릭 시 >================================		
		$(".replyEntireArea").on("click", ".rGoodCountSpan", function(){
			// 로그인 되어있지 않다면 리턴
			if('${loginID}'==''){		
				Swal.fire({
    	            icon: 'warning',
    	            title: '로그인 후 이용 가능합니다.'
    	        })
    	        return false;
	    	}
			
	        let currnetLocation = $(this);
	        let good = $(this).attr("good");//true,false 가져오기
			
			if (good == "false") {// -> 좋아요 상태로 변경 
				$(this).children(".replyGood").css("color", "#9381ff" );
				$(this).children(".replyGoodText").css("color", "#9381ff" );
				$(this).attr("good","true");//good에 true set.
			} else {
				$(this).children(".replyGood").css("color", "#888");
				$(this).children(".replyGoodText").css("color", "#888");
				$(this).attr("good","false");
			}
	        
	         good = $(this).attr("good");//true,false 다시 가져오기
	         let rLikeUpDown ;
	         if(good == "true"){
	        	 rLikeUpDown = 1;
	         }else{
	        	 rLikeUpDown = 0;
	         }

	         
	        let seq = $(this).siblings(".replyDropDown").find(".rSeq").val();
// 	        console.log(seq);
			$.ajax({
			    url:"/community/boardLike",
			    data:{
			       seq:seq,
			       likeUpDown:rLikeUpDown
			    },
			    dataType:"json"
			 }).done(function(resp){
// 			       console.log("좋아요 개수 : "+resp)//좋아요 개수
			       currnetLocation.children(".replyGoodText").text(" 좋아요 "+resp);
			       
			    }).fail(function(a, b){ 
			       console.log(a);
			       console.log(b);
			    })

		})
		


		
		
		//답댓글 좋아요 기능///////////////////////////////////////////////////////////////////

		//==========< 답댓글 좋아요 클릭 시 >================================		
		$(".replyEntireArea").on("click", ".rrGoodCountSpan", function(){
			// 로그인 되어있지 않다면 리턴
			if('${loginID}'==''){		
				Swal.fire({
    	            icon: 'warning',
    	            title: '로그인 후 이용 가능합니다.'
    	        })
    	        return false;
	    	}
			
	        let currnetLocation = $(this);
	        let good = $(this).attr("good");//true,false 가져오기
			
			if (good == "false") {// -> 좋아요 상태로 변경 
				$(this).children(".reply_reGood").css("color", "#9381ff" );
				$(this).children(".reply_reGoodText").css("color", "#9381ff" );
				$(this).attr("good","true");//good에 true set.
			} else {
				$(this).children(".reply_reGood").css("color", "#888");
				$(this).children(".reply_reGoodText").css("color", "#888");
				$(this).attr("good","false");
			}
	        
	         good = $(this).attr("good");//true,false 다시 가져오기
	         let rrLikeUpDown ;
	         if(good == "true"){
	        	 rrLikeUpDown = 1;
	         }else{
	        	 rrLikeUpDown = 0;
	         }

	         
	        let seq = $(this).siblings(".reply_reDropDown").find(".rSeq").val();
// 	        console.log(seq);
			$.ajax({
			    url:"/community/boardLike",
			    data:{
			       seq:seq,
			       likeUpDown:rrLikeUpDown
			    },
			    dataType:"json"
			 }).done(function(resp){
// 			       console.log("좋아요 개수 : "+resp)//좋아요 개수
			       currnetLocation.children(".reply_reGoodText").text(" 좋아요 "+resp);
			       
			    }).fail(function(a, b){ 
			       console.log(a);
			       console.log(b);
			    })

		})		
		
		
		
		
		
		
		//======< 댓글 수정하기 >====================================================================
		let isReModiPro = false;//댓글 수정 여러개 활성화 못 시키게. 수정 진행중?
		
		$(".replyEntireArea").on("click", ".replyModi", function(){//옵션 수정하기 버튼
			if(isOpenReReInput){//이미 답댓글 창이 열려 있으면,
				Swal.fire({
    	            icon: 'warning',
    	            title: '답댓글 작업을 완료해주세요.'
    	        })
    	        return false;
			}			
			
			
			
			
			if(isReModiPro){
				Swal.fire({
    	            icon: 'warning',
    	            title: '기존 수정 작업을 완료해주세요.'
    	        })
    	        return false;

			}else{
				//댓글 본문 작성 가능하게
		        $(this).closest(".replyArea").find(".replyMiddleArea").attr("contenteditable","true");
		        $(this).closest(".replyArea").find(".replyMiddleArea").css({"box-shadow": "0 0 10px blue"});

		        $(this).closest(".replyArea").find(".replyModiComp").css("display","block");//수정버튼 보이게
		        $(this).css("display","none");//옵션에서 수정하기 숨기기
		        isReModiPro = true;//수정 작업 중입니다~
			}

		})
			
		$(".replyEntireArea").on("click", ".replyModiComp", function(){//옵션 옆 수정 버튼
			isReModiPro = false;//수정 끝났습니다~
			
			//길이제한 및 공백 입력 방지
	        let contentsLength = $(this).closest(".replyArea").find(".replyMiddleArea").text().trim();
	        if(getByteLengthOfString(contentsLength)>4000){//내용 길이 제한
				Swal.fire({
    	            icon: 'warning',
    	            title: '내용을 줄여주세요.'
    	        })
    	        return false;
	        }
	        if(contentsLength.replace(/\s|　/gi, "").length == 0){//공백 등록 못하게
	        	$(this).closest(".replyArea").find(".replyMiddleArea").html("");
	        	$(this).closest(".replyArea").find(".replyMiddleArea").focus();
				Swal.fire({
    	            icon: 'warning',
    	            title: '공백은 등록하실 수 없습니다.'
    	        })
    	        return false;
	        }
			
			
			let contents = $(this).closest(".replyArea").find(".replyMiddleArea").html().trim();
	        let seq = $(this).closest(".replyArea").children(".replyBottomArea").find(".rSeq").val();//댓글 seq
// 	        console.log(seq);
	        
	        //댓글 본문 작성 못하게
	        $(this).closest(".replyArea").find(".replyMiddleArea").attr("contenteditable","false");
	        $(this).closest(".replyArea").find(".replyMiddleArea").css({"box-shadow": ""});
	        
	        $(this).css("display","none");//수정 버튼 숨기기
	        $(this).closest(".replyArea").find(".replyModi").css("display","block");//옵션에서 수정하기 보이게
	        
	        
 	        $.ajax({
 			    url:"/community/replyModi"
 			    ,data:{seq:seq , contents:contents}
	 			,dataType:"json"
 			    ,async: false
 			})
	        
	        
	        
		})
		//=================================================================< 댓글 수정 클릭 시 >=========


			
		//======< 대댓글 수정하기 >====================================================================
		$(".replyEntireArea").on("click", ".reply_reModi", function(){//옵션 수정하기 버튼
			
				if(isOpenReReInput){//이미 답댓글 창이 열려 있으면,
					Swal.fire({
	    	            icon: 'warning',
	    	            title: '답댓글 작업을 완료해주세요.'
	    	        })
	    	        return false;
				}		
			
			
			
			if(isReModiPro){
				Swal.fire({
    	            icon: 'warning',
    	            title: '기존 수정 작업을 완료해주세요.'
    	        })
    	        return false;

			}else{
				//대댓글 본문 작성 가능하게
		        $(this).closest(".reply_reDiv").find(".reply_reMiddleArea").attr("contenteditable","true");
		        $(this).closest(".reply_reDiv").find(".reply_reMiddleArea").css({"box-shadow": "0 0 10px blue"});

		        $(this).closest(".reply_reDiv").find(".reply_reModiComp").css("display","block");//수정버튼 보이게
		        $(this).css("display","none");//옵션에서 수정하기 숨기기
		        isReModiPro = true;//수정 작업 중입니다~
			}

		})
			
		$(".replyEntireArea").on("click", ".reply_reModiComp", function(){//옵션 옆 수정 버튼
			//길이제한 및 공백 입력 방지
	        let contentsLength = $(this).closest(".reply_reDiv").find(".reply_reMiddleArea").text().trim();
	        if(getByteLengthOfString(contentsLength)>4000){//내용 길이 제한
				Swal.fire({
    	            icon: 'warning',
    	            title: '내용을 줄여주세요.'
    	        })
    	        return false;
	        }
	        if(contentsLength.replace(/\s|　/gi, "").length == 0){//공백 등록 못하게
	        	$(this).closest(".reply_reDiv").find(".reply_reMiddleArea").html("");
	        	$(this).closest(".reply_reDiv").find(".reply_reMiddleArea").focus();
				Swal.fire({
    	            icon: 'warning',
    	            title: '공백은 등록하실 수 없습니다.'
    	        })
    	        return false;
	        }		

			
			let contents = $(this).closest(".reply_reDiv").find(".reply_reMiddleArea").html().trim();
// 			console.log(contents)
	        let seq = $(this).closest(".reply_reDiv").children(".reply_reBottomArea").find(".rSeq").val();//대댓글 seq
// 	        console.log(seq);
	        
	        //대댓글 본문 작성 못하게
	        $(this).closest(".reply_reDiv").find(".reply_reMiddleArea").attr("contenteditable","false");
	        $(this).closest(".reply_reDiv").find(".reply_reMiddleArea").css({"box-shadow": ""});
// 	        console.log($(this))
	        
	        $(this).css("display","none");//수정 버튼 숨기기
	        $(this).closest(".reply_reDiv").find(".reply_reModi").css("display","block");//옵션에서 수정하기 보이게
	        
	        
 	        $.ajax({
 			    url:"/community/replyModi"
 			    ,data:{seq:seq , contents:contents}
	 			,dataType:"json"
 			    ,async: false
 			})
	        
	        isReModiPro = false;//수정 끝났습니다~
	        
		})
		//=================================================================< 대댓글 수정 클릭 시 >=========	
			
			
			
			
			
			
			
			
			
		//======< 댓글 삭제 클릭 시 >====================================================================
		$(".replyEntireArea").on("click", ".replyDel" ,function(){
			isOpenReReInput = false; //답댓글 입력창이 활성화 되어 있는지 판단하는 요소(등록 시 비활성화로 set - 답댓글 창 여러개(댓글마다) 못 열게 )
			let isReModiPro = false;//댓글 수정 여러개 활성화 못 시키게. 수정 진행중?
			
			let currLocation = $(this);
	        let seq = $(this).closest(".replyArea").children(".replyBottomArea").find(".rSeq").val();//댓글 seq
// 			console.log(seq)

			Swal.fire({
		        title: '정말 삭제하시겠습니까?',
		        showCancelButton: true,
		        confirmButtonColor: '#9381FF',
		        cancelButtonColor: '#D9D9D9',
		        confirmButtonText: '확인',
		        cancelButtonText: '취소',
	        }).then((result) => {
	        	if (result.isConfirmed) {   
	        		
		 	        $.ajax({
		 			    url:"/community/replyDel"
		 			    ,data:{seq:seq}
//	 	 			    ,dataType:"json"
		 			    ,async: false
		 			}).done(function(resp){
		 				
		 		    	Swal.fire({
		                    icon: 'success',
		                    title: '삭제가 완료되었습니다.',
		                    showConfirmButton: false,
		                    timer: 1500,
		                    allowOutsideClick:false,
		                    allowEscapeKey:false,
		                    allowEnterKey:false
		                }).then((result2) => {
		                    if (result2.dismiss === Swal.DismissReason.timer) {
		                    	
		 			    	   //댓글 수 감소시켜서 삽입하기
		 			    	   let reCount = $("#replyTotalCount").text();
		 			    	   let reCountDown = (parseInt(reCount)-1).toString();
		 			    	   $("#replyTotalCount").text(reCountDown);
		 	 				
// 		 		 				console.log(resp)
		 		 				if(resp == 'success'){
		 		 					currLocation.closest(".replyArea").remove();
		 		 				}
		                    			
		                    }
		                })  	 				

		 			}) 
	 
				}
			})	
			
		})
			
		//=================================================================< 댓글 삭제 클릭 시 >=========

			
			
		//댓글의 답댓글 클릭 시 입력 창 활성화//////////////////////////////////////////
		let isOpenReReInput = false;//대댓글 입력창 여러개 활성화 못 시키게. 
		$(".replyEntireArea").on("click", ".rReplyCountSpan" ,function(){
			// 로그인 되어있지 않다면 리턴
			if('${loginID}'==''){		
				Swal.fire({
    	            icon: 'warning',
    	            title: '로그인 후 이용 가능합니다.'
    	        })
    	        return false;
	    	}
			
			//수정 작업 활성화 되어 있으면 못하게.
			if(isReModiPro){
				Swal.fire({
    	            icon: 'warning',
    	            title: '기존 수정 작업을 완료해주세요.'
    	        })
    	        return false;			
			}
			
			
				
				let inputLocation = $(this).closest(".replyArea").find(".reply_reInput");
				let isOpen = $(this).attr("isOpen"); //답댓글 입력창을 오픈했나요?
				if(isOpen == 'false'){
					
					if(isOpenReReInput){//이미 답댓글 창이 열려 있으면, 다른 댓글에서 답댓글 못 씀.
						Swal.fire({
		    	            icon: 'warning',
		    	            title: '답댓글 작업을 완료해주세요.'
		    	        })
		    	        return false;
					}
					
					//답댓글 보라색? 주기
		            $(this).children(".reply_reCount").css("color", "#9381ff" );
		            $(this).children(".reply_reCountText").css("color", "#9381ff" );
		            $(this).find(".reReCount").css("color", "#9381ff" );
					
					
					$(this).closest(".replyArea").find(".reply_reInputArea").css("display","block");//오픈해라
					$(this).attr("isOpen","true");
					
					let parent_seq = $(this).closest(".replyArea").children(".replyBottomArea").find(".rSeq").val();//댓글 시퀀스
// 					console.log(parent_seq)
	 				document.querySelector("#reply_reInput_"+parent_seq).focus();
// 	 				document.querySelector().scrollIntoView();
// 					요소y좌표 a = $(”#~”).pageY();
// 					이동할높이 b = a - screen.height() +50px (header높이) ;
// 					window.scrollTo({ left: 0, top: b, behavior: "smooth" });
// const absoluteTop = window.pageYOffset + element.getBoundingClientRect().top;
// 					let a = $("#reply_reInput_"+parent_seq).pageY;

					let element = $("#reply_reInput_"+parent_seq);
					let a = window.pageYOffset + element[0].getBoundingClientRect().top -400;
					
					window.scrollTo({ left: 0, top: a, behavior: "smooth" });
	 				
					isOpenReReInput = true;
				}else{
					//답댓글 색 없애기
		            $(this).children(".reply_reCount").css("color", "#888" );
		            $(this).children(".reply_reCountText").css("color", "#888" );
		            $(this).find(".reReCount").css("color", "#888" );
					
					
					$(this).closest(".replyArea").find(".reply_reInputArea").css("display","none");//닫아라
					$(this).attr("isOpen","false");
					isOpenReReInput = false;
				}



		})	
			

			
		//======< 대댓글 삭제 클릭 시 >====================================================================
		$(".replyEntireArea").on("click", ".reply_reDel" ,function(){
			isOpenReReInput = false; //답댓글 입력창이 활성화 되어 있는지 판단하는 요소(등록 시 비활성화로 set - 답댓글 창 여러개(댓글마다) 못 열게 )
			let isReModiPro = false;//댓글 수정 여러개 활성화 못 시키게. 수정 진행중?
			
			let currLocation = $(this);
	        let seq = $(this).parent().parent().find(".rSeq").val();//댓글 seq
// 			console.log(seq)

			Swal.fire({
		        title: '정말 삭제하시겠습니까?',
		        showCancelButton: true,
		        confirmButtonColor: '#9381FF',
		        cancelButtonColor: '#D9D9D9',
		        confirmButtonText: '확인',
		        cancelButtonText: '취소',
	        }).then((result) => {
	        	if (result.isConfirmed) {   
	        		
		 	        $.ajax({
		 			    url:"/community/replyDel"
		 			    ,data:{seq:seq}
//	 	 			    ,dataType:"json"
		 			    ,async: false
		 			}).done(function(resp){
		 				
		 		    	Swal.fire({
		                    icon: 'success',
		                    title: '삭제가 완료되었습니다.',
		                    showConfirmButton: false,
		                    timer: 1500,
		                    allowOutsideClick:false,
		                    allowEscapeKey:false,
		                    allowEnterKey:false
		                }).then((result2) => {
		                    if (result2.dismiss === Swal.DismissReason.timer) {
		                    	
		 			    	   //답댓글 수 감소시켜서 삽입하기
		 			    	   let reReCount = currLocation.closest(".replyArea").children(".replyBottomArea").find(".reReCount").text();
		 			    	   let reReCountDown = (parseInt(reReCount)-1).toString();
		 			    	   currLocation.closest(".replyArea").children(".replyBottomArea").find(".reReCount").text(reReCountDown);
		 	 				
// 		 		 				console.log(resp)
		 		 				if(resp == 'success'){
		 		 					currLocation.closest(".reply_reDiv").remove();
		 		 				}
		 		 				
		                    }
		                }) 


		 			})
	 
				}
			})	
			
			
			
			
			if (result == true) {

			}
		})
			
		//=================================================================< 대댓글 삭제 클릭 시 >=========
		
		
		
			
			
			
	// 신고하기 클릭 시 (모달 열리기 전) ///////////////////////////////////////////////////
		$(".mainContent").on("click",".report" ,function(){
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
                    timer: 1500,
                    allowOutsideClick:false,
                    allowEscapeKey:false,
                    allowEnterKey:false
                }).then((result2) => {
                    if (result2.dismiss === Swal.DismissReason.timer) {
                    	location.reload();
                    }
                })
                
		    })
		    
// 		    $('#rpForm')[0].reset();//모달 리셋
// 			$('#reportModal').modal('hide');//모달창 닫기
		})	
	


		
		//contenteditable Enter입력시 div생기는 거 없애기////////////////////////////////////
		document.addEventListener('keydown', event => {
		  if (event.key === 'Enter') {
		    document.execCommand('insertLineBreak')
		    event.preventDefault()
		  }
		})
		
		
		
		
	// 	30일 후에 만료되는 쿠키를 저장하고 싶다면 setCookie('key', 'value', 30); 과 같이 실행하면 됩니다.
	//쿠키 저장
	// expiredays 는 일자 정수 - 365년 1년 쿠키
	function setCookie(key, value, expiredays) {
	    let todayDate = new Date();
	    todayDate.setDate(todayDate.getDate() + expiredays); // 현재 시각 + 일 단위로 쿠키 만료 날짜 변경
	    //todayDate.setTime(todayDate.getTime() + (expiredays * 24 * 60 * 60 * 1000)); // 밀리세컨드 단위로 쿠키 만료 날짜 변경
	    document.cookie = key + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
	}
	
	//쿠키 삭제
	//쿠키는 삭제가 없어서 현재 시각으로 만료 처리를 함.
// 	function delCookie(key){
// 	    let todayDate = new Date();
// 	    document.cookie = key + "=; path=/; expires=" + todayDate.toGMTString() + ";" // 현재 시각 이전이면 쿠키가 만료되어 사라짐.
// 	}
	
	// 쿠키 읽기
	function getCookie(key){
		key = new RegExp(key + '=([^;]*)'); // 쿠키들을 세미콘론으로 구분하는 정규표현식 정의
		return key.test(document.cookie) ? unescape(RegExp.$1) : ''; // 인자로 받은 키에 해당하는 키가 있으면 값을 반환
	}
	
	//쿠키 체크 - 있으면 true 없으면 false
	//getCookie() 에 의존
	function boolCheckCookie(key) {
	    return getCookie(key) != '' ? true : false;
	}
	
	//쿠키 체크 테스트 함수
	//getCookie() 에 의존
	function checkCookieTest(key) {
	    let val = getCookie(key);
	    if (val != "") {
	      return val;
	    } else {
	      val = prompt(key+" 쿠키의 값을 입력해주세요:", "");
	      if (val != "" && val != null) {
	        setCookie(key, val, 365);
	        return val;
	      }
	    }
	}	
		
	
	
	
	
	
	//댓글 입력창 붙여넣기 막기
	$("#replyInput").on("paste", function(event){
		event.preventDefault();
	})
	
	//답댓글 입력창 붙여넣기 막기
	$(".replyEntireArea").on("paste", ".reply_reInput" ,function(){
		event.preventDefault();
	})
	
	//댓글 수정창 붙여넣기 막기
	$(".replyEntireArea").on("paste", ".replyMiddleArea" ,function(){
		event.preventDefault();
	})
	
	//답댓글 수정창 붙여넣기 막기
	$(".replyEntireArea").on("paste", ".reply_reMiddleArea" ,function(){
		event.preventDefault();
	})
	
	
	</script>

</body>
</html>