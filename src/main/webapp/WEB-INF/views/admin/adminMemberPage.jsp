
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!--  부트스트랩-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<!-- 아이콘 CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<!--  부트스트랩-->

<!-- css -->
<link rel="stylesheet" href="/css/admin/adminCommon.css">
<link rel="stylesheet" href="/css/admin/adminMember.css">
</head>
<body>




	<div class="container mainContent">
	
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/common/pNav.jsp" />
		<div id="adminHeader">관리자 페이지</div>
		<hr id="boundaryLine">
				<!-- 가로 탭 -->		
			<ul class="nav nav-pills nav-justified d-flex d-md-none" id="v-pills-tab2">
				<li class="nav-item"><a href="/admin/adminMain/#adminMember-tab"><button class="nav-link tabs2  active" id="v-pills-adminMember-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-adminMember" type="button" role="tab" aria-controls="v-pills-adminMember" aria-selected="true">회원정보</button></a></li>
				<li id="cate1" class="nav-item"><details id="hDetail">
						<summary style="padding: 0px; font-size: 14px; margin-bottom: 20px;">신고관리</summary>
						<ul  class="subMenu">
							<li><a href="/admin/adminMain/#report1-tab"><button class="nav-link tabs2" id="v-pills-report1-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-report1" type="button" role="tab" aria-controls="v-pills-report1" aria-selected="true" style="color: #666666;">신고목록</button></a></li>
							<li><a href="/admin/adminMain/#report2-tab"><button class="nav-link tabs2" id="v-pills-report2-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-report2" type="button" role="tab" aria-controls="v-pills-report2" aria-selected="true" style="color: #666666;">블랙리스트</button></a></li>
						</ul>
					</details></li>
				<li class="nav-item"><a href="/admin/adminMain/#dashBoard"><button class="nav-link tabs2" id="v-pills-dashBoard-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-dashBoard" type="button" role="tab" aria-controls="v-pills-adminMember" aria-selected="true">대시보드</button></a></li>
			</ul>
		<div class="d-flex align-items-start">
			<!-- 사이드 탭-->
			<div class="nav flex-column nav-pills d-none d-md-flex"  id="v-pills-tab" role="tablist" aria-orientation="vertical">
<!--첫번째 탭 : 회원정보 -->
				<a href="/admin/adminMain/#adminMember-tab" class="tapUrl firstDepthTab">
					<button class="nav-link active" id="v-pills-adminMember-tab" data-bs-toggle="pill" data-bs-target="#v-pills-adminMember" type="button" role="tab" aria-controls="v-pills-adminMember" aria-selected="true">회원정보관리</button>
				</a>
<!--두번째 탭 : 신고관리 -->
				<details id="vDetail">
					<summary class="navi-link firstDepthTab">신고관리</summary>
					<ul>
						<li class="reLi">
						<a href="/admin/adminMain/#report1-tab" class="tapUrl">
								<button class="nav-link sub" id="v-pills-report1-tab" data-bs-toggle="pill" data-bs-target="#v-pills-report1" type="button" role="tab" aria-controls="v-pills-report1" aria-selected="false">
									<div>신고목록</div>
								</button>
						</a></li>
						<li class="reLi">
						<a href="/admin/adminMain/#report2-tab" class="tapUrl">
								<button class="nav-link sub" id="v-pills-report2-tab" data-bs-toggle="pill" data-bs-target="#v-pills-report2" type="button" role="tab" aria-controls="v-pills-report2" aria-selected="false">
									<div>블랙리스트</div>
								</button>
						</a></li>
					</ul>
				</details>
<!--세번째 탭 : 대시보드 -->
				<a href="/class/write"tapUrl firstDepthTab">
					<button class="nav-link" id="v-pills-dashBoard-tab" data-bs-toggle="pill" data-bs-target="#v-pills-dashBoard" type="button" role="tab" aria-controls="v-pills-dashBoard" aria-selected="false">대시보드</button>
				</a>
			</div>
<!-- 탭 페이지 -->
			<div class="tab-content" id="v-pills-tabContents">
<!-- 탭 페이지 : 회원정보 상세 -->
					<div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab" style="width: 100%;">
<!-- 회원 정보 -->						
						<div class="category">
							회원 정보
						</div>
						<div>
							<div class="box" style="background: #BDBDBD;">
								<c:choose>
									<c:when test="${mdto.profile_img != null}">
										<img class="profile" src='/upload/${mdto.profile_img}'>
									</c:when>
									<c:otherwise>
										<img class="profile" src="/img/defaultProfile.png">
									</c:otherwise>
								</c:choose>
							</div>
							<div class="row1">
								<div class="left">
									<div class="leftc">이름</div>
									<div class="leftc">이메일</div>
									<div class="leftc">휴대전화</div>
									<div class="leftc">닉네임</div>
									<div class="leftc">회원등급</div>
									<div class="leftc">신고수</div>
								</div>
								<div class="right">
									<div class="rightc">
										<input id="modiname" type="text" value="${mdto.name}" size=8 maxlength=13 disabled class="editable" name="name">
										<span class="modify"><i class="bi bi-pencil-fill"></i></span>
										<input type="hidden" value="name">
										<button type="button" class="btn2 modifybtn" style="display: none;">변경</button>
										<button type="button" class="btn2 upcancel" style="display: none; margin-top: 0px;">취소</button>
										<span class="noticebox" style="display: none;"></span>
									</div>
									<div class="rightc" id="memberEmail">${mdto.email}</div>
									<div class="rightc">
										<input id="modiphone" type="text" value="${mdto.phone}" size=8 maxlength=13 disabled class="editable" name="phone">
										<span class="modify"><i class="bi bi-pencil-fill"></i></span>
										<input type="hidden" value="phone">
										<button type="button" class="btn2 modifybtn" style="display: none;">변경</button>
										<button type="button" class="btn2 upcancel" style="display: none; margin-top: 0px;">취소</button>
										<span class="noticebox" style="display: none;"></span>
									</div>
									<div class="rightc">
										<input id="modinickname" type="text" value="${mdto.nickname}" size=8 disabled class="editable" name="nickname">
										<span class="modify"><i class="bi bi-pencil-fill"></i></span>
										<input type="hidden" value="nickname">
										<button type="button" class="btn2 modifybtn" style="display: none;">변경</button>
										<button type="button" class="btn2 upcancel" style="display: none; margin-top: 0px;">취소</button>
										<span class="noticebox" style="display: none;"></span>
									</div>
									<div class="rightc">
										<input id="moditype" type="text" value="${mdto.type }" size=8 disabled class="editable" name="type">
										<select id="modiType2"  style="display:none">
											<option value="M">일반회원</option>
											<option value="B">블랙리스트</option>
											<option value="A">관리자</option>
										</select>
										<span class="modifyType"><i class="bi bi-pencil-fill"></i></span>
										<input type="hidden" value="type">
										<button type="button" class="btn2 modifybtn" style="display: none;">변경</button>
										<button type="button" class="btn2 upcancel" style="display: none; margin-top: 0px;">취소</button>
										<span class="noticebox" style="display: none;"></span>
									</div>
									<div class="rightc">${reportCount }건</div>
								<div id="memberOut">
								<a data-bs-toggle="modal" href="#adninMemberOut-toggle" role="button" style="color: #6B54FF;">
								<button id="memberOutBtn">강제탈퇴</button>
								</a></div>
								</div>
							</div>
						</div>
						
						
						<div style="clear: both;"></div>
						<div class="category">
							재능<img id="totalent" class="btns" src="/img/rightBtn2.png">
						</div>
						<c:choose>
							<c:when test="${empty buycList}">
								<div class="info">
									<p>
										구매한 클래스가 없습니다.
									</p>
								</div>
							</c:when>
							<c:otherwise>
						<div class="classHead">
							${mdto.name } 님이 구매한 클래스
<!-- 							<span id="tomorepost" class="more">더보기 ></span> -->
						</div>
								<c:forEach var="i" items="${buycList }" begin="0" end="2" varStatus="status">
									<a href="/class/detail?class_seq=${i.class_seq }">
									<div class="class">
										<div class="classdate">
										구매일 : 
											<fmt:formatDate value="${buydayList[status.index]}" type="both" pattern="yyyy-MM-dd" />
										/ 수업시작일 :	
											<fmt:formatDate value="${i.class_date}" type="both" pattern="yyyy-MM-dd" />
										</div>
										<div class="row2">
											<div class="left2">
												<img class="classimg" src="/upload/${mainImgList[status.index].sys_name }">
											</div>
											<div class="right2">
												<div class="classrow1">${i.category1 }</div>
												<div class="classrow2">
													${i.title } · <span class="creator">${i.creater_info }</span>
												</div>
											</div>
										</div>
									</div>
									</a>
								</c:forEach>
							</c:otherwise>
						</c:choose>

						<div style="clear: both;"></div>
<!-- 커뮤니티 -->
						<div class="category">
							커뮤니티<img id="tocommunity" class="btns" src="/img/rightBtn2.png">
						</div>
						<div class="comucate">
							내가 쓴 글<span id="tomorepost" class="more">더보기 ></span>
						</div>
						<div class="mypost">
							<div class="postitle">글 제목</div>
							<div class="postdetail">
								카테고리 · 작성일 · 조회 · <i class="bi bi-emoji-smile-fill"></i> 좋아요 수 · <i class="bi bi-chat-dots-fill"></i> 댓글 수
							</div>
						</div>
						<div class="mypost">
							<div class="postitle">글 제목</div>
							<div class="postdetail">
								카테고리 · 작성일 · 조회 · <i class="bi bi-emoji-smile-fill"></i> 좋아요 수 · <i class="bi bi-chat-dots-fill"></i> 댓글 수
							</div>
						</div>
						<div class="mypost">
							<div class="postitle">글 제목</div>
							<div class="postdetail">
								카테고리 · 작성일 · 조회 · <i class="bi bi-emoji-smile-fill"></i> 좋아요 수 · <i class="bi bi-chat-dots-fill"></i> 댓글 수
							</div>
						</div>
						<div class="comucate">
							내가 쓴 댓글<span id="tomorereply" class="more">더보기 ></span>
						</div>
						<div class="myreply">
							<div class="replytitle">카테고리 · [원문] 본문 제목</div>
							<div class="replydetail">
								댓글 내용 <span class="like">작성일 · <i class="bi bi-emoji-smile-fill"></i> 좋아요 수
								</span>
							</div>
						</div>
						<div class="myreply">
							<div class="replytitle">카테고리 · [원문] 본문 제목</div>
							<div class="replydetail">
								댓글 내용 <span class="like">작성일 · <i class="bi bi-emoji-smile-fill"></i> 좋아요 수
								</span>
							</div>
						</div>
						<div class="myreply" style="margin-bottom: 50px;">
							<div class="replytitle">카테고리 · [원문] 본문 제목</div>
							<div class="replydetail">
								댓글 내용 <span class="like">작성일 · <i class="bi bi-emoji-smile-fill"></i> 좋아요 수
								</span>
							</div>
						</div>
					</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/admin/adminMemberOut.jsp" />
	<jsp:include page="/WEB-INF/views/common/pNav.jsp" />
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
	
	// 회원탈퇴모달에서 최종 탈퇴 버튼을 누르면 모달창이 닫히고 회원탈퇴 처리 후 adminMain 페이지로 이동
	$('#admibMemberOutOk-toggle').on('hidden.bs.modal', function () {
		location.href="/admin/memberOut?email=${mdto.email}";	 
 	    location.href="/admin/adminMain";
	})

		//재능 더보기
	    $("#totalent").on('click',function(){
			location.href="/admin/memberClass?email=${mdto.email}"
	      })
	    //커뮤니티 더보기
	    $("#tocommunity").on("click",function(){
	    	location.href="/admin/memberCommunity"
	    })
	    
	    //회원 정보 수정
	    $(".modify").on("click",function(){
	    	$(this).siblings(".editable").removeAttr("disabled");
	    	$(this).siblings(".editable").focus();
	    	$(this).closest(".rightc").siblings().find(".modify").css("display","none");
	    	$(this).closest(".rightc").siblings().find(".modifyType").css("display","none");
	    	$(this).css("display","none");
	    	$(this).siblings(".btn2").css("display","");
	    })
	    
	    //회원 정보 수정(타입)
		    $(".modifyType").on("click",function(){
		    	$(this).siblings(".editable").css("display","none");
		    	$(this).prev().css("display","");
		    	$(this).closest(".rightc").siblings().find(".modify").css("display","none");
		    	$(this).css("display","none");
		    	$(this).siblings(".btn2").css("display","");
		    })
			// 내 정보 변경 최종 취소 시 페이지 새로고침
			$(document).on("click", ".upcancel", function(){ // on 이벤트로 변경
				location.reload();
			});
		    
		 //회원정보 수정 시 유효성 검사
			$(".modifybtn").on('click',function(){
				let nickname = $("#modinickname").val();
				let nicknameRegex = /^[a-z0-9가-힣]{2,10}$/; //영어 소문자, 숫자 2~10글자
				let nicknameResult = nicknameRegex.test(nickname);
				let modiType = $(this).prev().val(); //변경할 타입
				let modiContents = $(this).prev().prev().prev().val(); //변경 내용
				let email = $("#memberEmail").text();
				
				if(!nicknameResult){
			    	$(this).siblings('.noticebox').css("display", "");
					$(this).siblings('.noticebox').css("color", "red");
					$(this).siblings('.noticebox').text("2~10자(영문 소문자,숫자)를 입력해주세요");
			        $("#modinickname").focus();
			        return false;
				}	
					if(nickname.replace(/\s|　/gi, "").length == 0){
			            $(this).siblings('.noticebox').css("display", "");
						$(this).siblings('.noticebox').css("color", "red");
						$(this).siblings('.noticebox').text("변경하실 닉네임을 입력해주세요.");
			            $("#modinickname").focus();
			            return false;
					} 	
			        
			        let phone = $("#modiphone").val();
				    let phoneRegex = /^010[0-9]{8}$/; //핸드폰 11자리
				    let phoneResult = phoneRegex.test(phone);
				    if(!phoneResult){
			            $(this).siblings('.noticebox').css("display", "");
						$(this).siblings('.noticebox').css("color", "red");
						$(this).siblings('.noticebox').text("휴대전화번호를 11자리로 작성해주세요.('-'미포함)");
			            $("#modiphone").focus();
			            return false;
			    	} 
				    
				    if(phone.replace(/\s|　/gi, "").length == 0){
				    	$(this).siblings('.noticebox').css("display", "");
						$(this).siblings('.noticebox').css("color", "red");
						$(this).siblings('.noticebox').text("변경하실 휴대전화번호를 입력해주세요.");
			            $("#modiphone").focus();
			            return false;
				    } 
				
				
				$.ajax({
					url:"/admin/memberUpdate",
					data:{"modiType":modiType,"modiContents":modiContents,"email":email}
				}).done(function(data){
					location.reload();
				})	    
			
			})

		    
			
	</script>
</body>
</html>    	
