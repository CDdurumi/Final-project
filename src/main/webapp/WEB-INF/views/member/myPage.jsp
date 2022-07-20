<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="32x32" href="/img/favicon/favicon-32x32.png">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- 부트스트랩  -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<!-- sweetalert  -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<!-- input.css  -->
<link rel="stylesheet" href="/css/member/myPage.css">
<meta charset="UTF-8">
<title>[DOWA] 마이페이지</title>
<style>

/* div { */
/* 	border:1px solid crimson; */
/* } */
</style>
</head>
<body>
	<div class="container mainContent">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="contents">
			<div id="pageHeader">
				마이페이지<br>
				<hr>
			</div>
			<ul class="nav nav-pills nav-justified d-flex d-md-none" id="v-pills-tab2">
				<li class="nav-item"><a href="#home-tab"><button class="nav-link tabs2" id="v-pills-home-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">홈</button></a></li>
				<li class="nav-item"><a href="#profile-tab"><button class="nav-link tabs2" id="v-pills-profile-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">내 정보</button></a></li>
				<li id="cate1" class="nav-item"><details id="talent1">
						<summary style="padding: 0px; font-size: 14px; margin-bottom: 20px;">재능마켓</summary>
						<ul>
							<li><a href="#talent1-tab"><button class="nav-link tabs2" id="v-pills-talent1-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-talent1" type="button" role="tab" aria-controls="v-pills-talent1" aria-selected="false" style="color: #666666;">구매한 클래스</button></a></li>
							<li><a href="#talent2-tab"><button class="nav-link tabs2" id="v-pills-talent2-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-talent2" type="button" role="tab" aria-controls="v-pills-talent2" aria-selected="false" style="color: #666666;">찜한 클래스</button></a></li>
							<li><a href="#talent3-tab"><button class="nav-link tabs2" id="v-pills-talent3-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-talent3" type="button" role="tab" aria-controls="v-pills-talent3" aria-selected="false" style="color: #666666;">오픈한 클래스</button></a></li>
							<li><a href="#talent4-tab"><button class="nav-link tabs2" id="v-pills-talent4-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-talent4" type="button" role="tab" aria-controls="v-pills-talent4" aria-selected="false" style="color: #666666;">작성한 후기</button></a></li>
						</ul>
					</details></li>
				<li id="cate2" class="nav-item"><details id="community1">
						<summary style="padding: 0px; font-size: 14px; margin-bottom: 20px;">커뮤니티</summary>
						<ul>
							<li><a href="#community1-tab"><button class="nav-link tabs2" id="v-pills-community1-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-community1" type="button" role="tab" aria-controls="v-pills-community1" aria-selected="false" style="color: #666666;">내가 쓴 글</button></a></li>
							<li><a href="#community2-tab"><button class="nav-link tabs2" id="v-pills-community2-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-community2" type="button" role="tab" aria-controls="v-pills-community2" aria-selected="false" style="color: #666666;">내가 쓴 댓글</button></a></li>
						</ul>
					</details></li>
			</ul>
			<div class="d-flex align-items-start">
				<div class="nav flex-column nav-pills me-3 d-none d-md-flex" id="v-pills-tab" role="tablist" aria-orientation="vertical">
					<a href="#home-tab" style="width: 160px;">
						<button class="nav-link tabs" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">홈</button>
					</a> <a href="#profile-tab" style="width: 160px;">
						<button class="nav-link tabs" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">내 정보</button>
					</a>
					<details id="talent" style="width: 160px;">
						<summary>재능마켓</summary>
						<ul>
							<a href="#talent1-tab">
								<button class="nav-link tabs" id="v-pills-talent1-tab" data-bs-toggle="pill" data-bs-target="#v-pills-talent1" type="button" role="tab" aria-controls="v-pills-talent1" aria-selected="false">
									<li class="myli">구매한 클래스</li>
								</button>
							</a>
							<a href="#talent2-tab">
								<button class="nav-link tabs" id="v-pills-talent2-tab" data-bs-toggle="pill" data-bs-target="#v-pills-talent2" type="button" role="tab" aria-controls="v-pills-talent2" aria-selected="false">
									<li class="myli">찜한 클래스</li>
								</button>
							</a>
							<a href="#talent3-tab">
								<button class="nav-link tabs" id="v-pills-talent3-tab" data-bs-toggle="pill" data-bs-target="#v-pills-talent3" type="button" role="tab" aria-controls="v-pills-talent3" aria-selected="false">
									<li class="myli">오픈한 클래스</li>
								</button>
							</a>
							<a href="#talent4-tab">
								<button class="nav-link tabs" id="v-pills-talent4-tab" data-bs-toggle="pill" data-bs-target="#v-pills-talent4" type="button" role="tab" aria-controls="v-pills-talent4" aria-selected="false">
									<li class="myli">작성한 후기</li>
								</button>
							</a>
						</ul>
					</details>
					<details id="community" style="width: 160px;">
						<summary style="margin-top: 5px;">커뮤니티</summary>
						<ul>
							<a href="#community1-tab">
								<button class="nav-link tabs" id="v-pills-community1-tab" data-bs-toggle="pill" data-bs-target="#v-pills-community1" type="button" role="tab" aria-controls="v-pills-community1" aria-selected="false">
									<li class="myli">내가 쓴 글</li>
								</button>
							</a>
							<a href="#community2-tab">
								<button class="nav-link tabs" id="v-pills-community2-tab" data-bs-toggle="pill" data-bs-target="#v-pills-community2" type="button" role="tab" aria-controls="v-pills-community2" aria-selected="false">
									<li class="myli">내가 쓴 댓글</li>
								</button>
							</a>
						</ul>
					</details>
				</div>
				<!-- 첫번째 탭 : 홈 -->
				<div class="tab-content" id="v-pills-tabContent" style="width: calc(100% - 160px - 1rem);">
					<div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
						<div class="category">
							내 정보<a href="#profile-tab"><img id="toinfo" class="btns" src="/img/rightBtn.png"></a>
						</div>
						<div>
							<div class="box" style="background: #BDBDBD;">
								<c:choose>
									<c:when test="${myinfo.profile_img != null}">
										<img class="profile" src='/upload/${myinfo.profile_img}'>
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
									<div class="leftc">연락처</div>
									<div class="leftc">닉네임</div>
								</div>
								<div class="right">
									<div class="rightc">${myinfo.name}</div>
									<div class="rightc">${myinfo.email}</div>
									<div class="rightc">${myinfo.phone}</div>
									<div class="rightc">${myinfo.nickname}</div>
								</div>
							</div>
						</div>
						<div style="clear: both;"></div>
						<div class="category">
							클래스<a href="#talent1-tab"><img id="totalent" class="btns" src="/img/rightBtn.png"></a>
						</div>
						<c:choose>
							<c:when test="${empty buyclasslist}">
								<div class="info">
									<p>
										구매한 클래스가 없어요.<br> 지금 바로 클래스를 구매해보세요!
									</p>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach var="i" items="${buyclasslist}" end="1" varStatus="status">
									<div class="class">
										<div class="classdate">
											<fmt:formatDate value="${i.CLASS_DATE}" type="both" pattern="yyyy-MM-dd" />
										</div>
										<div class="row2">
											<div class="left2">
												<input type=hidden class="class_seq" value="${i.CLASS_SEQ}"><input type=hidden class="state" value="${i.STATE}"><img class="classimg" src="/upload/${mainpiclist[status.index].sys_name}">
											</div>
											<div class="right2">
												<div class="classrow1">${i.CATEGORY1}
													<c:if test="${i.CATEGORY2 != '' || i.CATEGORY2 ne null}"> · <span class="creator2">${i.CATEGORY2}</span>
													</c:if>
												</div>
												<div class="classrow2" style="height: 23%;">
													<input type=hidden class="class_seq" value="${i.CLASS_SEQ}"><input type=hidden class="state" value="${i.STATE}"><span class="classtitle">${i.TITLE}</span> · <span class="creator">${i.NICKNAME}</span>
												</div>
												<div class="stateinfo">
													<c:if test="${i.STATE eq 1}">
														<button disabled class='statebtn'>
															신고<span class='statetooltip'>다른 사용자에 의해 신고된 클래스입니다.</span>
														</button>
													</c:if>
													<c:if test="${i.STATE eq 2}">
														<button disabled class='statebtn'>
															삭제<span class='statetooltip'>관리자에 의해 삭제된 클래스입니다.</span>
														</button>
													</c:if>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<div style="clear: both;"></div>
						<div class="category">
							커뮤니티<a href="#community1-tab"><img id="tocommunity" class="btns" src="/img/rightBtn.png"></a>
						</div>
						<div class="comucate">
							내가 쓴 글<a href="#community1-tab"><span id="tomorepost" class="more">더보기 ></span></a>
						</div>
						<c:choose>
							<c:when test="${empty getpostlist}">
								<div class="info">
									<p>
										작성한 글이 없어요.<br> 지금 바로 글을 작성해보세요!
									</p>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach var="i" items="${getpostlist}" end="2" varStatus="status">
									<div class="mypost">
										<input type=hidden class="board_seq" value="${i.board_seq}"> <input type=hidden class="state" value="${i.state}">
										<div class="postitle">${i.title}</div>
										<div class="postdetail">
											<c:if test="${fn:contains(i.board_seq, 'q')}">궁금해요</c:if>
											<c:if test="${fn:contains(i.board_seq, 'h')}">도와주세요</c:if>
											<c:if test="${fn:contains(i.board_seq, 's')}">도와드려요</c:if>
											<c:if test="${fn:contains(i.board_seq, 'd')}">일상</c:if>
											·
											<fmt:formatDate value="${i.write_date}" type="both" pattern="yyyy-MM-dd HH:mm:ss" />
											· <i class="bi bi-eye-fill"></i> ${i.view_count} · <i class="bi bi-emoji-smile-fill"></i> ${i.like_count} · <i class="bi bi-chat-dots-fill"></i> ${getreplycount[status.index]}
										</div>
										<div class="stateinfo">
											<c:if test="${i.state eq 1}">
												<button disabled class='statebtn'>
													신고<span class='statetooltip'>다른 사용자에 의해 신고된 글입니다.</span>
												</button>
											</c:if>
											<c:if test="${i.state eq 2}">
												<button disabled class='statebtn'>
													삭제<span class='statetooltip'>관리자에 의해 삭제된 글입니다.</span>
												</button>
											</c:if>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<div class="comucate">
							내가 쓴 댓글<a href="#community2-tab"><span id="tomorereply" class="more">더보기 ></span></a>
						</div>
						<c:choose>
							<c:when test="${empty getreplylist}">
								<div class="info">
									<p>
										작성한 댓글이 없어요.<br> 지금 바로 댓글을 작성해보세요!
									</p>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach var="i" items="${getreplylist}" end="2" varStatus="status">
									<div class="myreply">
										<input type=hidden class="board_seq" value="${i.board_seq}"> <input type=hidden class="state" value="${i.state}"><input type=hidden class="board_state" value="${replypostlist[status.index].state}">
										<div class="replytitle">
											<c:if test="${fn:contains(replypostlist[status.index].board_seq, 'q')}">궁금해요</c:if>
											<c:if test="${fn:contains(replypostlist[status.index].board_seq, 'h')}">도와주세요</c:if>
											<c:if test="${fn:contains(replypostlist[status.index].board_seq, 's')}">도와드려요</c:if>
											<c:if test="${fn:contains(replypostlist[status.index].board_seq, 'd')}">일상</c:if>
											· [원문] ${replypostlist[status.index].title}
										</div>
										<div class="replydetail">
											<span style='font-size: 16px;'>${i.contents}</span> <span class="like"><fmt:formatDate value="${i.write_date}" type="both" pattern="yyyy-MM-dd HH:mm:ss" /> · <i class="bi bi-emoji-smile-fill"></i> ${i.like_count} </span>
										</div>
										<div class="stateinfo">
											<c:if test="${i.state eq 1}">
												<button disabled class='statebtn'>
													신고<span class='statetooltip'>다른 사용자에 의해 신고된 댓글입니다.</span>
												</button>
											</c:if>
											<c:if test="${i.state eq 2}">
												<button disabled class='statebtn'>
													삭제<span class='statetooltip'>관리자에 의해 삭제된 댓글입니다.</span>
												</button>
											</c:if>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
					<!-- 두번째 탭 : 내 정보 -->
					<div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
						<div class="category">내 정보</div>
						<div>
							<form action="/myPage/updateImage" method="post" enctype="multipart/form-data">
								<div class="box" style="background: #BDBDBD;">
									<input type="hidden" value="${myinfo.email}" id="email" name="email">
									<c:choose>
										<c:when test="${myinfo.profile_img != null}">
											<img class="profile" src='/upload/${myinfo.profile_img}'>
										</c:when>
										<c:otherwise>
											<img class="profile" src="/img/defaultProfile.png">
										</c:otherwise>
									</c:choose>
								</div>
								<div class="filebox" align=center style="margin-top: 5px;">
									<label for="file">사진 변경</label> <input type="file" name="file" id="file" accept="image/*"><br>
									<c:choose>
										<c:when test="${myinfo.profile_img != null}">
											<input id="defaultimg" type="reset" value='기본 이미지로 변경' />
										</c:when>
									</c:choose>
									<button class="btn" style="display: none;">변경</button>
									<button type="button" class="upcancel btn" style="display: none; margin-left: 10px;">취소</button>
								</div>
							</form>
							<div class="row1">
								<div class="left">
									<div class="leftc">이름</div>
									<div class="leftc">이메일</div>
									<div class="leftc leftc1">연락처</div>
									<div class="leftc leftc1">닉네임</div>
								</div>
								<div class="right">
									<div class="rightc">${myinfo.name}</div>
									<div class="rightc">${myinfo.email}</div>
									<form action="/myPage/updateInfo" method="post" id="infoform">
										<input type="hidden" value="${myinfo.email}" id="email" name="email">
										<div class="rightc rightc1">
											<input type="hidden" value="${myinfo.nickname}" size=8 disabled class="editable" name="nickname"> <input id="modiphone" type="text" value="${myinfo.phone}" size=18 maxlength=11 disabled class="editable" name="phone"><span class="modify"><i class="bi bi-pencil-fill"></i></span> <span class="rowchng">
												<button type="button" class="btn2 modifybtn" style="display: none; margin-top: 5px;">변경</button>
												<button type="button" class="btn2 upcancel" style="display: none; margin-top: 5px;">취소</button>
											</span>
										</div>
										<div class="rightc rightc1">
											<input type="hidden" value="${myinfo.phone}" size=8 disabled class="editable" name="phone"> <input id="modinickname" type="text" value="${myinfo.nickname}" size=18 maxlength=10 disabled class="editable" name="nickname"><span class="modify"><i class="bi bi-pencil-fill"></i></span> <span class="rowchng">
												<button type="button" class="btn2 modifybtn" style="display: none; margin-top: 5px;">변경</button>
												<button type="button" class="btn2 upcancel" style="display: none; margin-top: 5px;">취소</button>
											</span>
										</div>
									</form>
								</div>
								<div align=center>
									<c:if test="${myinfo.login_type eq 'D'}">
										<a data-bs-toggle="modal" href="#changePw-toggle" role="button" style="color: #6B54FF;">비밀번호 변경</a>
										<br>
										<br>
									</c:if>
									<c:if test="${myinfo.type ne 'A'}">
										<a data-bs-toggle="modal" href="#memberOut-toggle" role="button" style="color: crimson;">회원탈퇴</a>
									</c:if>
								</div>
							</div>
						</div>
					</div>
					<!-- 세번째 탭 : 구매한 클래스 -->
					<div class="tab-pane fade" id="v-pills-talent1" role="tabpanel" aria-labelledby="v-pills-talent1-tab"></div>
					<!-- 네번째 탭 : 찜한 클래스 -->
					<div class="tab-pane fade" id="v-pills-talent2" role="tabpanel" aria-labelledby="v-pills-talent2-tab"></div>
					<!-- 다섯번째 탭 등록한 클래스 -->
					<div class="tab-pane fade" id="v-pills-talent3" role="tabpanel" aria-labelledby="v-pills-talent3-tab"></div>
					<!-- 여섯번째 탭 작성한 후기 -->
					<div class="tab-pane fade" id="v-pills-talent4" role="tabpanel" aria-labelledby="v-pills-talent4-tab"></div>
					<!-- 일곱번째탭 내가 쓴 글 -->
					<div class="tab-pane fade" id="v-pills-community1" role="tabpanel" aria-labelledby="v-pills-community1-tab"></div>
					<div class="tab-pane fade" id="v-pills-community2" role="tabpanel" aria-labelledby="v-pills-community2-tab"></div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/member/changePw.jsp" />
	<jsp:include page="/WEB-INF/views/member/memberOut.jsp" />
	<jsp:include page="/WEB-INF/views/common/loginModal.jsp" />
	<jsp:include page="/WEB-INF/views/common/pNav.jsp" />
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
<script>
// 회원탈퇴모달에서 최종 탈퇴 버튼을 누르면 모달창이 닫히고 회원탈퇴 처리 후 index 페이지로 이동
$('#memberOutOk-toggle').on('hidden.bs.modal', function () {
// 	location.href="/myPage/memberOut";	 
    location.href="/";
})

let siteUrl = window.location.href.split("#").pop(); //활성화할 문자
let tabs = $(".tabs"); //세로탭 메뉴들
let tabs2 = $(".tabs2"); //가로탭 메뉴들
let tabs_contents = $("#v-pills-tabContent").children(); // 컨텐츠틀

setting(siteUrl); //사이트 접속 초기세팅
   
window.onpopstate = function(event) {   //주소변경감지 이벤트
	resetTab();
    siteUrl = window.location.href.split("#").pop();
    setting(siteUrl);
}

tabs.on("click",function(){   //세로탭 메뉴들 전체에 클릭시 이벤트
	resetTab(); //선택된 탭 초기화
    $(this).children().addClass("active"); //클릭한 탭만 활성
})

tabs2.on("click",function(){   //가로탭 메뉴들 전체에 클릭시 이벤트
	resetTab(); //선택된 탭 초기화
	tabs2.css("border-bottom","none"); 
	$(this).css("border-bottom","4px solid #9381ff"); 
})

//탭 세팅
function setting(siteUrl){
	if(siteUrl.split("-").length<2){   // 사이트에 최초 접속시 #탭id 가 없음, 활성화할 탭 id 넣어주기
    siteUrl="home-tab" // 첫번째 탭을 id에 넣어줌
	}
    $("#v-pills-"+siteUrl+"").addClass("active"); //url에 맞는 탭 활성화     
    $("#v-pills-"+siteUrl+"2").css("border-bottom","4px solid #9381ff");
    tabs_contents.removeClass("active"); //부트스트랩 탭 컨텐츠 버그방지용 초기화
    $("#v-pills-"+siteUrl.split("-").shift()+"").addClass("show active"); // url에 맞는 컨텐츠 활성화
    window.scrollTo({top:0, left:0, behavior:'auto'}) 
    
	 if(siteUrl=='talent1-tab'){
		 $("#v-pills-talent1").empty();
		 $("#v-pills-talent2").empty();
		 $("#v-pills-talent3").empty();
		 $("#v-pills-talent4").empty();
		 $("#v-pills-community1").empty();
		 $("#v-pills-community2").empty();
		 document.getElementById("talent").open = true;
	 	 talent1Tab('t1');
	 } else if(siteUrl=='talent2-tab'){
		 $("#v-pills-talent1").empty();
		 $("#v-pills-talent2").empty();
		 $("#v-pills-talent3").empty();
		 $("#v-pills-talent4").empty();
		 $("#v-pills-community1").empty();
		 $("#v-pills-community2").empty();
		 document.getElementById("talent").open = true;
	 	 talent2Tab('t2');
	 } else if(siteUrl=='talent3-tab'){
		 $("#v-pills-talent1").empty();
		 $("#v-pills-talent2").empty();
		 $("#v-pills-talent3").empty();
		 $("#v-pills-talent4").empty();
		 $("#v-pills-community1").empty();
		 $("#v-pills-community2").empty();
		 document.getElementById("talent").open = true;
	 	 talent3Tab('t3');
	 } else if(siteUrl=='talent4-tab'){
		 $("#v-pills-talent1").empty();
		 $("#v-pills-talent2").empty();
		 $("#v-pills-talent3").empty();
		 $("#v-pills-talent4").empty();
		 $("#v-pills-community1").empty();
		 $("#v-pills-community2").empty();
		 document.getElementById("talent").open = true;
	 	 talent4Tab('t4');
	 } else if(siteUrl=='community1-tab'){
		 $("#v-pills-talent1").empty();
		 $("#v-pills-talent2").empty();
		 $("#v-pills-talent3").empty();
		 $("#v-pills-talent4").empty();
		 $("#v-pills-community1").empty();
		 $("#v-pills-community2").empty();
		 document.getElementById("community").open = true;
	 	 community1Tab('c1');
	 } else if(siteUrl=='community2-tab'){
		 $("#v-pills-talent1").empty();
		 $("#v-pills-talent2").empty();
		 $("#v-pills-talent3").empty();
		 $("#v-pills-talent4").empty();
		 $("#v-pills-community1").empty();
		 $("#v-pills-community2").empty();
		 document.getElementById("community").open = true;
	 	 community2Tab('c2');
	 }
}

function getYear(date) {
	return date.getFullYear();
}

function getMonth(date) {
	return ('0' + (date.getMonth() + 1)).slice(-2);
}

function getDate(date) {
	return ('0' + date.getDate()).slice(-2);
}

function getHour(date) {
	return ('0' + date.getHours()).slice(-2); 
}

function getMin(date) {
	return ('0' + date.getMinutes()).slice(-2);
}

function getSec(date) {
	return ('0' + date.getSeconds()).slice(-2); 
}

function getTime(date) {
	return getYear(date) + "-" +getMonth(date) + "-" + getDate(date);
}

function getFullTime(date) {
	return getYear(date) + "-" +getMonth(date) + "-" + getDate(date) + " " + getHour(date) + ":" + getMin(date) + ":" + getSec(date);
}

function talent1Tab(category){
	$(window).off('scroll');//모든 탭 윈도우 스크롤 이벤트 끔.
	$("#v-pills-talent1").append("<div class='category'>구매한 클래스</div>");
	$("#v-pills-talent1").append("<div id='goaddclass'><a href='/class/main' style='color: #9381FF;'>클래스 구매하러 가기</a></div>");
	
       let page = 1;  //페이징과 같은 방식이라고 생각하면 된다.

       $(function(){
            getList(page);
            page++;
       })
    
       let timer = null;
       
       $(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.

	           const currentScroll = window.scrollY;
	           const windowHeight = window.innerHeight;
	           const bodyHeight = document.body.clientHeight;
	           const paddingBottom = 200;
	           
	           if(currentScroll + windowHeight + paddingBottom >= bodyHeight){
	        	   getList(page);
	        	   page++;
	        	   
	           }        
	});

      function getList(page){
          $.ajax({
              url:'/myPage/list',
              data : {cpage : page, category : category},
              dataType : 'json',
              async: false
            }).done(function(resp){
				let totalPage = resp[0].page;
				
				if(totalPage == 0){
					if(!$("#info1").length){
					$("#refundinfo").hide();
					$("#v-pills-talent1").append("<div id='info1' class='info'><p>구매한 클래스가 없어요.<br>지금 바로 클래스를 구매해보세요!</p></div>");	
					return false;
					}else {
						return false;
					}	
				}else if(totalPage < page && totalPage != 0) {	
					return false;
				}else {					
						for(let i = 0; i < resp[0].list.length; i++){
		         		let boardArea = $("<div class='class'>");
		         		let classdate = $("<div class='classdate'>");
		         		let realdate = new Date(resp[0].list[i].CLASS_DATE);
		         		classdate.append(getTime(realdate));
		         		
		         		let refund_state = resp[0].list[i].refund_state;
		         		if(refund_state == "환불") {
		         			classdate.append("<button disabled class='refundOk' style='background-color:#FFB17D; color:black;'>환불 완료</button>");
		         		}else {
		         			classdate.append("<a href='/class/detail?class_seq=" + resp[0].list[i].CLASS_SEQ + "#createrInfo'><input type=hidden class='state' value='" + resp[0].list[i].STATE + "'><button class='goReview'>후기 남기기</button></a>");	
		         		}
		         		boardArea.append(classdate);
		        		
		        		let row1 = $("<div class='row2'>");
		        		let row1_leftArea = $("<div class='left2'><a href='/myPage/myBuyClass?regstds_seq=" + resp[0].list[i].REGSTDS_SEQ + "'><img class='classimg' src='/upload/" + resp[0].piclist[i].sys_name + "'></a></div>");
		        		let row1_rightArea = $("<div class='right2'>");
		        		      		
						let category2 = resp[0].list[i].CATEGORY2;
		        		
		        		if(category2 == "" || category2 == null || category2 == undefined) {
			        		let right1 = $("<div class='classrow3'>" + resp[0].list[i].CATEGORY1 + "</div>");
			        		row1_rightArea.append(right1);
        				}else {
		        			let right1 = $("<div class='classrow3'>" + resp[0].list[i].CATEGORY1 + " · <span class='creator2'>" + category2 + "</span></div>");
			        		row1_rightArea.append(right1);
        				}
		        		
		        		let right2 = $("<div class='classrow4'><a href='/myPage/myBuyClass?regstds_seq=" + resp[0].list[i].REGSTDS_SEQ + "'><span class='classtitle'>" + resp[0].list[i].TITLE + "</span></a> · <span class='creator'>" + resp[0].list[i].NICKNAME + "</span></div>")
		        		
		        		let realprice = resp[0].list[i].PRICE;
		        		let price = realprice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		        		let right3 = $("<div class='classrow5'>결제일자 : " + resp[0].list[i].buy_date + " · 금액 : " + price + "원</div>")
		        		
		        		row1_rightArea.append(right2);
		        		row1_rightArea.append(right3);
		        		
		        		let stateinfo = $("<div class='stateinfo'>");
						let state = resp[0].list[i].STATE;
		        		
		        		if(state == "2") {
		        			let statebtn1 = $("<button disabled class='statebtn'>삭제<span class='statetooltip'>관리자에 의해 삭제된 클래스입니다.</span></button>");
		        			stateinfo.append(statebtn1);
		        			row1_rightArea.append(stateinfo);
		        		}else if(state == "1") {
		        			let statebtn2 = $("<button disabled class='statebtn'>신고<span class='statetooltip'>다른 사용자에 의해 신고된 클래스입니다.</span></button>");
		        			stateinfo.append(statebtn2);
		        			row1_rightArea.append(stateinfo);
		        		}
		        		
		        		row1.append(row1_leftArea);
		        		row1.append(row1_rightArea);
		        		
		        		boardArea.append(row1);
		        		$("#v-pills-talent1").append(boardArea);	
		             }					
				}   
				return false;
             })	   
       }
}

function talent2Tab(category){
	$(window).off('scroll');//모든 탭 윈도우 스크롤 이벤트 끔.
	$("#v-pills-talent2").append("<div class='category'>찜한 클래스</div>");
	
       let page = 1;  //페이징과 같은 방식이라고 생각하면 된다.

       $(function(){
            getList(page);
            page++;
       })
    
       let timer = null;
       
       $(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.

	           const currentScroll = window.scrollY;
	           const windowHeight = window.innerHeight;
	           const bodyHeight = document.body.clientHeight;
	           const paddingBottom = 200;
	           
	           if(currentScroll + windowHeight + paddingBottom >= bodyHeight){
	        	   getList(page);
	        	   page++;
	        	   
	           }        
	});
    			           
      function getList(page){

           $.ajax({
               url:'/myPage/list',
               data : {cpage : page, category : category},
               dataType : 'json',
               async: false
             }).done(function(resp){
				let totalPage = resp[0].page;
				
				if(totalPage == 0){
					if(!$("#info2").length){
					$("#v-pills-talent2").append("<div id='info2' class='info'><p>찜한 클래스가 없어요.<br>지금 바로 클래스를 찜해보세요!</p></div>");	
					$("#v-pills-talent2").append("<div id='goaddclass'><a href='/class/write' style='color: #9381FF;'>클래스 찜하러 가기</a></div>");
					return false;
					}else {
						return false;
					}	
				}else if(totalPage < page && totalPage != 0) {	
					return false;
				}else {
						for(let i = 0; i < resp[0].list.length; i++){
		         		let boardArea = $("<div class='class'>");
		         		let classdate = $("<div class='classdate'>");
		         		let realdate = new Date(resp[0].list[i].CLASS_DATE);
		         		classdate.append(getTime(realdate));
		         		boardArea.append(classdate);
		        		
		        		let row1 = $("<div class='row2'>");
		        		let row1_leftArea = $("<div class='left2'><input type=hidden class='class_seq' value='" + resp[0].list[i].CLASS_SEQ + "'><input type=hidden class='state' value='" + resp[0].list[i].STATE + "'><img class='classimg' src='/upload/" + resp[0].piclist[i].sys_name + "'></a></div>");
		        		let row1_rightArea = $("<div class='right2'>");
		        		
		        		let category2 = resp[0].list[i].CATEGORY2;
		        		
		        		if(category2 == "" || category2 == null || category2 == undefined) {
		        			let right1 = $("<div class='classrow1'>" + resp[0].list[i].CATEGORY1 + "<span class=like2><input type=hidden class='likeclass' value =" + resp[0].list[i].CLASS_SEQ +"><i class='bi bi-heart-fill'></i><span></div>");
			        		row1_rightArea.append(right1);
        				}else {
        					let right1 = $("<div class='classrow1'>" + resp[0].list[i].CATEGORY1 + " · <span class='creator2'>" + category2 + "</span><span class=like2><input type=hidden class='likeclass' value =" + resp[0].list[i].CLASS_SEQ +"><i class='bi bi-heart-fill'></i><span></div>");
			        		row1_rightArea.append(right1);
        				}
		
		        		let right2 = $("<div class='classrow15'><input type=hidden class='class_seq' value='" + resp[0].list[i].CLASS_SEQ + "'><input type=hidden class='state' value='" + resp[0].list[i].STATE + "'><span class='classtitle'>" + resp[0].list[i].TITLE + "</span> · <span class='creator'>" + resp[0].list[i].NICKNAME + "</span></div>")
		        		row1_rightArea.append(right2);
		        		
		        		let stateinfo = $("<div class='stateinfo'>");
						let state = resp[0].list[i].STATE;
		        		
		        		if(state == "2") {
		        			let statebtn1 = $("<button disabled class='statebtn' style='margin-left:50px;'>삭제<span class='statetooltip'>관리자에 의해 삭제된 클래스입니다.</span></button>");
		        			stateinfo.append(statebtn1);
		        			row1_rightArea.append(stateinfo);
		        		}else if(state == "1") {
		        			let statebtn2 = $("<button disabled class='statebtn'>신고<span class='statetooltip'>다른 사용자에 의해 신고된 클래스입니다.</span></button>");
		        			stateinfo.append(statebtn2);
		        			row1_rightArea.append(stateinfo);
		        		}
		        		
		        		row1.append(row1_leftArea);
		        		row1.append(row1_rightArea);
		        		
		        		boardArea.append(row1);
		        		$("#v-pills-talent2").append(boardArea);		
		             }					
				}          
             })	   
       }
}

function talent3Tab(category){
	$(window).off('scroll');//모든 탭 윈도우 스크롤 이벤트 끔.
	$("#v-pills-talent3").append("<div class='category'>오픈한 클래스</div>");
	$("#v-pills-talent3").append("<div id='goaddclass'><a href='/class/write' style='color: #9381FF;'>클래스 오픈하러 가기</a></div>");
	
       let page = 1;  //페이징과 같은 방식이라고 생각하면 된다.

       $(function(){
            getList(page);
            page++;
       })
    
       let timer = null;
       
       $(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.

	           const currentScroll = window.scrollY;
	           const windowHeight = window.innerHeight;
	           const bodyHeight = document.body.clientHeight;
	           const paddingBottom = 200;
	           
	           if(currentScroll + windowHeight + paddingBottom >= bodyHeight){
	        	   getList(page);
	        	   page++;
	        	   
	           }        
	});
    			           
      function getList(page){

          $.ajax({
              url:'/myPage/list',
              data : {cpage : page, category : category},
              dataType : 'json',
              async: false
            }).done(function(resp){
				let totalPage = resp[0].page;

				if(totalPage == 0){
					if(!$("#info3").length){
					$("#v-pills-talent3").append("<div id='info3' class='info'><p>등록한 클래스가 없어요.<br>지금 바로 클래스를 등록해보세요!</p></div>");	
					return false;
					}else {
						return false;
					}	
				}else if(totalPage < page && totalPage != 0) {	
					return false;
				}else {
		             for(let i = 0; i < resp[0].list.length; i++){

			         		let boardArea = $("<div class='class'>");
			         		let classdate = $("<div class='classdate'>");
			         		let regdate = $("<span class='regdate'>등록일자</span>");
			         		classdate.append(resp[0].list[i].reg_date);
			         		boardArea.append(classdate);
			        		let row1 = $("<div class='row2'>");
			        		let row1_leftArea = $("<div class='left3'><a href='/myPage/myOpenClass?class_seq=" + resp[0].list[i].CLASS_SEQ + "'><img class='classimg' src='/upload/" + resp[0].piclist[i].sys_name + "'></a></div>");
			        		let row1_centerArea = $("<div class='center3'>");
			        		let center1 = $("<div class='classrow6'>" + resp[0].list[i].CATEGORY1 + " · <span class='creator2'>" + resp[0].list[i].CATEGORY2 + "</span></div>");
			        		let center2 = $("<div class='classrow7'>");
			        		let center2_1 = $("<a href='/myPage/myOpenClass?class_seq=" + resp[0].list[i].CLASS_SEQ + "'>" + resp[0].list[i].TITLE + "</a>");
			        		
			        		let mydate = new Date(resp[0].list[i].CLASS_DATE);
			        		
			        		let realprice = resp[0].list[i].PRICE;
			        		let price = realprice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			        		
			        		let center3 = $("<div class='classrow8'>일정 : " + getTime(mydate) + " · 금액 : " + price + "원</div>");
			          		let center4 = $("<div class='classrow9'>수강 신청 인원 : " + resp[0].stdcount[i].stdcount + "명 · 별점 및 후기 : " + parseFloat(resp[0].list[i].avgstar.toFixed(1)) + "/5 (후기 " + resp[0].list[i].all + "건)</div>")
			        		let right1 = $("<div class='right3'>");
			        			
			           		row1_centerArea.append(center1);
			           		center2.append(center2_1);
			           		row1_centerArea.append(center2);
			           		row1_centerArea.append(center3);
			           		row1_centerArea.append(center4);
			        				        	
			        		row1.append(row1_leftArea);
			        		row1.append(row1_centerArea);
			        		row1.append(right1);
			        	
			        		boardArea.append(row1);
			        		$("#v-pills-talent3").append(boardArea);		
		             }					
				}    
				return false;
             })	   
       }
}

function talent4Tab(category){
	$(window).off('scroll');//모든 탭 윈도우 스크롤 이벤트 끔.
	$("#v-pills-talent4").append("<div class='category'>작성한 후기</div>");
	
       let page = 1;  //페이징과 같은 방식이라고 생각하면 된다.

       $(function(){
            getList(page);
            page++;
       })
    
       let timer = null;
       
       $(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.

	           const currentScroll = window.scrollY;
	           const windowHeight = window.innerHeight;
	           const bodyHeight = document.body.clientHeight;
	           const paddingBottom = 200;
	           
	           if(currentScroll + windowHeight + paddingBottom >= bodyHeight){
	        	   getList(page);
	        	   page++;

	           }        
	});
    			           
      function getList(page){

    	  $.ajax({
              url:'/myPage/list',
              data : {cpage : page, category : category},
              dataType : 'json',
              async: false
            }).done(function(resp){
				let totalPage = resp[0].page;

				if(totalPage == 0){
					if(!$("#info4").length){
					$("#v-pills-talent4").append("<div id='info4' class='info'><p>작성한 후기가 없어요.<br>지금 바로 후기를 작성해보세요!</p></div>");	
					return false;
					}else {
						return false;
					}	
				}else if(totalPage < page && totalPage != 0) {	
					return false;
				}else {
		             for(let i = 0; i < resp[0].list.length; i++){
		            	let boardArea = $("<div class='class2'>");
		         		let classdate = $("<div class='classdate'>");
		         		let regdate = $("<span class='regdate'>");
		         		regdate.append(resp[0].list[i].write_date);
		         		classdate.append(regdate);
		         		boardArea.append(classdate);
		        		
		        		let row1 = $("<div class='row2'>");
		        		let row1_leftArea = $("<div class='classdate2'>");
		        		let star = $("<span class='starCountImg'>");
		        		star.append("<input type=hidden value='" + resp[0].list[i].STARS + "'></span><span class='starrate'>(" + resp[0].list[i].STARS + "점/5점)");
		        		let row1_rightArea = $("<div class='classdate3'><input type=hidden class='class_seq' value='" + resp[0].list[i].PARENT_SEQ  + "'><input type=hidden class='state' value='" + resp[0].list[i].STATE + "'><input type=hidden class='class_state' value='" + resp[0].list[i].class_state + "'>" + resp[0].list[i].CONTENTS + "</div>");
		        		let row2_rightArea = $("<div class='left4'><input type=hidden class='class_seq' value='" + resp[0].list[i].PARENT_SEQ  + "'><input type=hidden class='state' value='" + resp[0].list[i].class_state + "'><img class='classimg2' src='/upload/" + resp[0].piclist[i].sys_name + "'></div>");
		        		let row3_rightArea = $("<div class='right4'>");
		        		
						row1_leftArea.append(star);
		        		
						let category2 = resp[0].list[i].CATEGORY2;
		        		if(category2 == "" || category2 == null || category2 == undefined) {
		        			let right1 = $("<div class='classrow10'>" + resp[0].list[i].CATEGORY1 + "</div>");
		        			row3_rightArea.append(right1);
        				}else {
							let right1 = $("<div class='classrow10'>" + resp[0].list[i].CATEGORY1 + " · <span class='creator2'>" + category2 + "</span></div>");
							row3_rightArea.append(right1);
        				}
		        		
		        		let right2 = $("<div class='classrow15' style='margin-bottom:0px;'><input type=hidden class='class_seq' value='" + resp[0].list[i].PARENT_SEQ  + "'><input type=hidden class='state' value='" + resp[0].list[i].class_state + "'><span class='classtitle'>" + resp[0].list[i].TITLE + "</span> · <span class='creator'>" + resp[0].list[i].NICKNAME + "</span></div>");
		        		row3_rightArea.append(right2);
		        		
		        		let stateinfo = $("<div class='stateinfo'>");
						let state = resp[0].list[i].STATE;
		        		
		        		if(state == "2") {
		        			let statebtn1 = $("<button disabled class='statebtn' style='margin-right:20px;'>삭제<span class='statetooltip'>관리자에 의해 삭제된 후기입니다.</span></button>");
		        			stateinfo.append(statebtn1);
		        			row3_rightArea.append(stateinfo);
		        		}else if(state == "1") {
		        			let statebtn2 = $("<button disabled class='statebtn' style='margin-right:20px;'>신고<span class='statetooltip'>다른 사용자에 의해 신고된 후기입니다.</span></button>");
		        			stateinfo.append(statebtn2);
		        			row3_rightArea.append(stateinfo);
		        		}
		        		
		        		row1.append(row1_leftArea);
		        		row1.append(row1_rightArea);
		        		row1.append(row2_rightArea);
		        		row1.append(row3_rightArea);
		        		
		        		boardArea.append(row1);
		        		$("#v-pills-talent4").append(boardArea);	
		             }		
		             
		          // 별점
		          $('.starCountImg').each(function (index, item) {
		              let star = "<i class='bi bi-star'></i>";
		              let half = "<i class='bi bi-star-half'></i>";
		              let fill = "<i class='bi bi-star-fill'></i>";

		              let classTotalStar = $(this).children("input").val();
		              let stars="";
		              
		              if(classTotalStar<0.5){
		                  stars=star+star+star+star+star;
		              }else if(classTotalStar<1){
		                  stars=half+star+star+star+star;
		              }else if(classTotalStar<1.5){
		                  stars=fill+star+star+star+star;
		              }else if(classTotalStar<2){
		                  stars=fill+half+star+star+star;
		              }else if(classTotalStar<2.5){
		                  stars=fill+fill+star+star+star;
		              }else if(classTotalStar<3){
		                  stars=fill+fill+half+star+star;
		              }else if(classTotalStar<3.5){
		                  stars=fill+fill+fill+star+star;
		              }else if(classTotalStar<4){
		                  stars=fill+fill+fill+half+star;
		              }else if(classTotalStar<4.5){            
		                  stars=fill+fill+fill+fill+star;
		              }else if(classTotalStar<5){
		                  stars=fill+fill+fill+fill+half;                
		              }else if(classTotalStar==5){
		                  stars=fill+fill+fill+fill+fill;     
		              }
		              
		              $(this).prepend(stars);
		              $(this).attr("class","stopstar");
		          });
				}          
             })	   
       }
}

function community1Tab(category){
	$(window).off('scroll');//모든 탭 윈도우 스크롤 이벤트 끔.
	$("#v-pills-community1").append("<div class='category'>내가 쓴 글</div>");
	
       let page = 1;  //페이징과 같은 방식이라고 생각하면 된다.

       $(function(){
            getList(page);
            page++;
       })
    
       let timer = null;
       
       $(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.

	           const currentScroll = window.scrollY;
	           const windowHeight = window.innerHeight;
	           const bodyHeight = document.body.clientHeight;
	           const paddingBottom = 200;
	           
	           if(currentScroll + windowHeight + paddingBottom >= bodyHeight){
	        	   getList(page);
	        	   page++;
	        	   
	           }        
	});
    			           
      function getList(page){

          $.ajax({
              url:'/myPage/list',
              data : {cpage : page, category : category},
              dataType : 'json',
              async: false
            }).done(function(resp){
				let totalPage = resp[0].page;

				if(totalPage == 0){
					if(!$("#info5").length){
					$("#v-pills-community1").append("<div id='info5' class='info'><p>작성한 글이 없어요.<br>지금 바로 글을 작성해보세요!</p></div>");	
					return false;
					}else {
						return false;
					}	
				}else if(totalPage < page && totalPage != 0) {	
					return false;
				}else {
						if(!$("#totalpost").length){
							$("#v-pills-community1").append("<div id='totalpost' align=right>작성한 글 : " + totalPage + "건</div>");	
						}
						
						for(let i = 0; i < resp[0].list.length; i++){

		         		let boardArea = $("<div class='post'><input type=hidden class='board_seq' value='" + resp[0].list[i].BOARD_SEQ + "'><input type=hidden class='state' value='" + resp[0].list[i].STATE + "'>");
		         	
						let row1 = $("<div>");
						
						let category = resp[0].list[i].BOARD_SEQ.charAt(0);
		        		let realcate = "";
		        		
		        		if(category === 'q') {
		        			realcate = '궁금해요';
		        		}else if(category === 'h') {
		        			realcate = '도와주세요';
		        		}else if(category === 's') {
		        			realcate = '도와드려요';
        				}else {
        					realcate = '일상';
        				}
		        		
						let row1_1 = $("<span class='comucates'>" + realcate + "</span>");
						row1.append(row1_1);
						
						let state = resp[0].list[i].STATE;
		        		
		        		if(state == "2") {
		        			let statebtn1 = $("<button disabled class='statebtn' style='margin-top:15px;'>삭제<span class='statetooltip'>관리자에 의해 삭제된 글입니다.</span></button>");
		        			row1.append(statebtn1);
		        		}else if(state == "1") {
		        			let statebtn2 = $("<button disabled class='statebtn' style='margin-top:15px;'>신고<span class='statetooltip'>다른 사용자에 의해 신고된 글입니다.</span></button>");
		        			row1.append(statebtn2);
		        		}
        				
						let row2 = $("<div class='row2'>");
        				let row2_1 = $("<div class='comuup'>");
        				let row2_2 = $("<div class='left5'>");
        				let row2_2_1 = $("<div class='classrow11'>" + resp[0].list[i].TITLE + "</div>");
        				let row2_2_2 = $("<div class='classrow12'>" + resp[0].list[i].CONTENTS + "</div>");
        				row2_2.append(row2_2_1);
        				row2_2.append(row2_2_2);
        			        					
        				let row3 = $("<div class='comudown'>");
        				let row3_1 = $("<div class='classrow13'>");
        				
        				let tags = resp[0].list[i].HASH_TAG.substring(1);
        				const tag = tags.split('#');
        				        				
        				for (let j = 0; j < tag.length; j++) {
        					let hash = $("<span style='margin-right:5px;'>#" + tag[j] + "</span>");
        					row3_1.append(hash);
        				}
        				
        				let row3_2 = $("<div class='classrow14'>");
        				let row3_2_1 = $("<i class='bi bi-eye-fill'></i> " + resp[0].list[i].VIEW_COUNT + " · <i class='bi bi-emoji-smile-fill'></i> " + resp[0].list[i].LIKE_COUNT + " · <i class='bi bi-chat-dots-fill'></i> " + resp[0].list[i].all + "<span class='postdate'>" + resp[0].list[i].write_date + "<span>");
        				
        				row3_2.append(row3_2_1);
        				
		        		row3.append(row3_1);
		        		row3.append(row3_2);
		        		
		        		row2_1.append(row2_2);
		        		
						let picname = resp[0].list[i].SYS_NAME;
        				
        				if(!picname){
        					let row2_3 = $("<div class='right5'><img class='comuimg' src='/img/white.jpg'></div>");	
        					row2_1.append(row2_3);
        				}else {
        					let row2_3 = $("<div class='right5'><a href='/community/detailView?seq=" + resp[0].list[i].BOARD_SEQ + "'><img class='comuimg' src='/community/" + picname + "'></a></div>");
        					row2_1.append(row2_3);
        				}
		        		
		        		row2_1.append(row3);
		        		row2.append(row2_1);
		        		boardArea.append(row1);
		        		boardArea.append(row2);
		        		$("#v-pills-community1").append(boardArea);	
		             }					
				}   
				return false;
             })	   
       }
}

function community2Tab(category){
	$(window).off('scroll');//모든 탭 윈도우 스크롤 이벤트 끔.
	$("#v-pills-community2").append("<div class='category'>내가 쓴 댓글</div>");
	
       let page = 1;  //페이징과 같은 방식이라고 생각하면 된다.

       $(function(){
            getList(page);
            page++;
       })
    
       let timer = null;
       
       $(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.

	           const currentScroll = window.scrollY;
	           const windowHeight = window.innerHeight;
	           const bodyHeight = document.body.clientHeight;
	           const paddingBottom = 200;
	           
	           if(currentScroll + windowHeight + paddingBottom >= bodyHeight){
	        	   getList(page);
	        	   page++;
	           }        
	});
    			           
      function getList(page){

          $.ajax({
              url:'/myPage/list',
              data : {cpage : page, category : category},
              dataType : 'json',
              async: false
            }).done(function(resp){
				let totalPage = resp[0].page;
				
				if(totalPage == 0){
					if(!$("#info6").length){
					$("#v-pills-community2").append("<div id='info6' class='info'><p>작성한 댓글이 없어요.<br>지금 바로 댓글을 작성해보세요!</p></div>");	
					return false;
					}else {
						return false;
					}	
				}else if(totalPage < page && totalPage != 0) {	
					return false;
				}else {
						if(!$("#totalpost").length){
							$("#v-pills-community2").append("<div id='totalpost' align=right>작성한 댓글 : " + totalPage + "건</div>");	
						}
						for(let i = 0; i < resp[0].list.length; i++){
		            	
		         		let boardArea = $("<div class='reply'><input type=hidden class='board_seq' value='" + resp[0].list[i].BOARD_SEQ + "'><input type=hidden class='state' value='" + resp[0].list[i].STATE +"'><input type=hidden class='board_state' value='" + resp[0].list[i].board_state + "'>");
		        				        		
		        		let category = resp[0].list[i].BOARD_SEQ.charAt(0);
		        		let realcate = "";
		        		
		        		if(category === 'q') {
		        			realcate = '궁금해요';
		        		}else if(category === 'h') {
		        			realcate = '도와주세요';
		        		}else if(category === 's') {
		        			realcate = '도와드려요';
        				}else {
        					realcate = '일상';
        				}
		        			
        				let row1 = $("<div class='replyrow1'>" + realcate + " · [원문] " + resp[0].list[i].TITLE + "</div>");
        				let row2 = $("<div class='replyrow2'>" + resp[0].list[i].CONTENTS + "</div>");
		        		let row3 = $("<div class='replyrow3'>");
		        		
		        		let row3_1 = $("<span class='like'>" + resp[0].list[i].write_date + " · <i class='bi bi-emoji-smile-fill'></i> " + resp[0].list[i].LIKE_COUNT + "</span>");
		        		
		        		row3.append(row3_1);
		        		
		        		let state = resp[0].list[i].STATE;
		        		
		        		if(state == "2") {
		        			let statebtn1 = $("<button disabled class='statebtn' style='margin-right:10px;'>삭제<span class='statetooltip'>관리자에 의해 삭제된 글입니다.</span></button>");
		        			row3.append(statebtn1);
		        		}else if(state == "1") {
		        			let statebtn2 = $("<button disabled class='statebtn' style='margin-right:10px;'>신고<span class='statetooltip'>다른 사용자에 의해 신고된 글입니다.</span></button>");
		        			row3.append(statebtn2);
		        		}
		        		
		        		boardArea.append(row1);
		        		boardArea.append(row2);
		        		boardArea.append(row3);
		        		$("#v-pills-community2").append(boardArea);	
		             }					
				}   
				return false;
             })	   
       }
}

function resetTab(){ //선택된 탭 초기화	
	$("#v-pills-talent1").empty();
	$("#v-pills-talent2").empty();
	$("#v-pills-talent3").empty();
	$("#v-pills-talent4").empty();
	$("#v-pills-community1").empty();
	$("#v-pills-community2").empty();
	tabs.removeClass("active");
    tabs2.css("border-bottom","none"); 
}

// details 태그 하나씩 열기 이벤트 
window.addEventListener('DOMContentLoaded', function(){
	document.querySelectorAll('details').forEach(function(item){
    	item.addEventListener("toggle", event => {
        	let toggled = event.target;
        	if (toggled.attributes.open) {/* 열었으면 */
          	/* 나머지 다른 열린 아이템을 닫음 */
          		document.querySelectorAll('details[open]').forEach(function(opened){
              		if(toggled != opened) /* 현재 열려있는 요소가 아니면 */
                	opened.removeAttribute('open'); /* 열림 속성 삭제 */
          		});
        	}
      })
    });
});

// 내 정보 각 항목별로 수정 버튼 클릭 시 이벤트
$(".modify").on('click',function(){
	$(this).siblings(".editable").removeAttr("disabled");
	$(this).siblings(".editable").focus();
	$(this).closest(".rightc").siblings().find(".modify").css("display","none");
	$(this).css("display","none");
	$(this).siblings(".rowchng").find(".btn2").css("display","");
	
	if(!$("#modiphone").is(":disabled")){
	$(window).resize(function() {
		if($(window).width() < 992) { 		
			$(".leftc1").css("height","65px");
			$(".rightc1").css("height","65px");
		}else {
			$(".leftc1").css("height","50px");
			$(".rightc1").css("height","50px");
		}
	});
	}
})

// 파일 선택 시 미리보기
$('#file').on('change', function() {
    ext = $(this).val().split('.').pop().toLowerCase(); //확장자

    //배열에 추출한 확장자가 존재하는지 체크
    if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
    	Swal.fire({                    
            width:600,
            html: "<span style='font-size:15px'>gif, png, jpg, jpeg 형식의 이미지 파일만 업로드 가능합니다!</span>",
            showConfirmButton: false,
            timer: 1800,
            background:'#dbdbdb',
            backdrop:'transparent'
        })
    	resetFormElement($(this)); //폼 초기화
    } else {
   		file = $('#file').prop("files")[0];
   		
   		if(file.size> (10*1024*1024)) {
   			Swal.fire({                    
   	            width:600,
   	            html: "<span style='font-size:15px; padding-top:25px;'>10MB 이하의 파일만 등록할 수 있습니다!<br>현재 파일 용량 : " + (Math.round(file.size / 1024 / 1024 * 100) / 100) + "MB</span>",
   	            showConfirmButton: false,
   	            timer: 1800,
   	            background:'#dbdbdb',
   	            backdrop:'transparent'
   	        })
   			resetFormElement($(this)); //폼 초기화	
   		}
        blobURL = window.URL.createObjectURL(file);
        $('.box img').attr('src', blobURL);
        $('.box').slideDown(); //업로드한 이미지 미리보기 
        $(this).slideUp(); //파일 양식 감춤
    }
});

// 파일 선택 후 미리보기 가능한 유효한 이미지라면 변경, 취소 버튼만 선택 가능
var img = document.querySelector(".profile"),
observer = new MutationObserver((changes) => {
	changes.forEach(change => {
    	if(change.attributeName.includes('src')){
    		$("label").css("display","none");
    	    $("#defaultimg").css("display","none");
    	    $(".btn").css("display","");
        }
    });
});

observer.observe(img, {attributes : true});
  

//기본 사진으로 변경 버튼 클릭 시 미리보기 이미지 기본으로 변경
$("#defaultimg").on('click',function(){
	$(this).css("display","none");
	$(".profile").attr("src", "/img/defaultProfile.png");
	resetFormElement($("#file"));
})

// 내 정보 및 이미지 변경 최종 취소 시 페이지 새로고침
$(document).on("click", ".upcancel", function(){ // on 이벤트로 변경
	location.reload();
// location.href="#profile-tab";
});

// 수정 완료 버튼 클릭 시 입력값 정규식 검사
$(".modifybtn").on('click',function(){
	let nickname = $("#modinickname").val();
	let nicknameRegex = /^[a-z0-9가-힣]{2,10}$/; //영어 소문자, 숫자 2~10글자
	let nicknameResult = nicknameRegex.test(nickname);

	if(!$("#modinickname").is(":disabled")) {
		
		if(nickname.replace(/\s|　/gi, "").length == 0){
			Swal.fire({                    
	             width:400,
	             html: "<span style='font-size:15px'>변경하실 닉네임을 입력해주세요.</span>",
	             showConfirmButton: false,
	             timer: 1500,
	             background:'#dbdbdb',
	             backdrop:'transparent'
	         })
            $("#modinickname").focus();
            return false;
		} 	
		
	if(!nicknameResult){
		Swal.fire({                    
            width:400,
            html: "<span style='font-size:15px'>닉네임은 2-10자(영문 소문자,숫자)로 입력해주세요.</span>",
            showConfirmButton: false,
            timer: 1500,
            background:'#dbdbdb',
            backdrop:'transparent'
        })
        $("#modinickname").focus();
        return false;
	} else {
		$.ajax({
			url:"/signup/nickNameCheck",
			type:"get",
			data:{nickname:nickname}
		}).done(function(resp){
			let result = JSON.parse(resp);
			
			if(result == true){
				Swal.fire({                    
		            width:400,
		            html: "<span style='font-size:15px'>이미 사용중인 닉네임입니다.</span>",
		            showConfirmButton: false,
		            timer: 1500,
		            background:'#dbdbdb',
		            backdrop:'transparent'
		        })
				return false;
			}else{
				$("#infoform").submit();
		 	}
		});	
	}
        
	}else {	
        let phone = $("#modiphone").val();
	    let phoneRegex = /^010[0-9]{8}$/; //핸드폰 11자리
	    let phoneResult = phoneRegex.test(phone);
	    
	    if(phone.replace(/\s|　/gi, "").length == 0){
				 Swal.fire({                    
	             width:400,
	             html: "<span style='font-size:15px'>변경하실 휴대폰 번호를 입력해주세요.</span>",
	             showConfirmButton: false,
	             timer: 1500,
	             background:'#dbdbdb',
	             backdrop:'transparent'
	         })
            $("#modiphone").focus();
            return false;
	    } 
	    
	    if(!phoneResult){          
            Swal.fire({                    
	             width:500,
	             html: "<span style='font-size:15px'>휴대폰 번호는 숫자 11자리로 작성해주세요. ('-' 미포함)</span>",
	             showConfirmButton: false,
	             timer: 1500,
	             background:'#dbdbdb',
	             backdrop:'transparent'
	         })
	        $("#modiphone").focus();
            return false;
	    }else {
	    	$.ajax({
				url:"/login/phoneCheck",
				type:"get",
				data:{phone:phone}
			}).done(function(resp){
				let result = JSON.parse(resp);
				if(result == true){
					Swal.fire({                    
			             width:500,
			             html: "<span style='font-size:15px'>이미 가입된 연락처입니다.</span>",
			             showConfirmButton: false,
			             timer: 1500,
			             background:'#dbdbdb',
			             backdrop:'transparent'
			         })
			         $("#modiphone").focus();
			         return false;
				}else {
					$("#infoform").submit();
				}
			});
	    }   	
	}
})

//찜하기 버튼 클릭 이벤트
$(document).on("click", ".like2", function(){
    let target=$(this).children("i").attr("class");
    let parent_seq=$(this).children("input").val();

    if(target=="bi bi-heart-fill"){
        $(this).children("i").attr("class","bi bi-heart");
    	$(this).children("i").css("color","#959595");

        $.ajax({
			url:"/myPage/likeCancel",
			type:"get",
			data:{parent_seq:parent_seq}
		}).done(function(resp){
			if(resp = 1){
		         Swal.fire({                    
	             width:280,
	             html: "<span style='font-size:15px'><i class='bi bi-heart-fill' style='color:#FF781E'></i> 찜한 클래스에서 삭제됐어요.</span>",
	             showConfirmButton: false,
	             timer: 1000,
	             background:'#dbdbdb',
	             backdrop:'transparent'
	         })
			}else{
				Swal.fire({                    
		             width:280,
		             html: "<span style='font-size:15px'>찜 삭제에 실패했어요..</span>",
		             showConfirmButton: false,
		             timer: 1000,
		             background:'#dbdbdb',
		             backdrop:'transparent'
		         })
		 	}
		});
        setTimeout("location.reload()", 1000);
    }
})	

// 메인화면에서 게시글 디테일
$(document).on("click", ".mypost" ,function(){
		let seq = $(this).find(".board_seq").val();
		let state = $(this).find(".state").val();
			
		if(state == "2") {
			Swal.fire({                    
	            width:400,
	            html: "<span style='font-size:15px'>관리자에 의해 삭제된 글입니다.</span>",
	            showConfirmButton: false,
	            timer: 1000,
	            background:'#dbdbdb',
	            backdrop:'transparent'
	        })
	        return false;
		}else {
			//조회 수 up
			$.ajax({
			     url:'/community/viewCount',
			     data:{seq : seq},
			     type:'POST',
			     async: false
			  })
			
			//디테일 페이지 이동
			location.href = "/community/detailView?seq="+seq+"";
		}
		})
		
// 메인화면에서 댓글 디테일
$(document).on("click", ".myreply" ,function(){
		let seq = $(this).find(".board_seq").val();
		let state = $(this).find(".state").val();
		let board_state = $(this).find(".board_state").val();
			
		if(board_state == "2") {
			Swal.fire({                    
	            width:400,
	            html: "<span style='font-size:15px'>관리자에 의해 삭제된 글입니다.</span>",
	            showConfirmButton: false,
	            timer: 1000,
	            background:'#dbdbdb',
	            backdrop:'transparent'
	        })
	        return false;
			}else if(state == "2"){
			Swal.fire({                    
	            width:400,
	            html: "<span style='font-size:15px'>관리자에 의해 삭제된 댓글입니다.</span>",
	            showConfirmButton: false,
	            timer: 1000,
	            background:'#dbdbdb',
	            backdrop:'transparent'
	        })
	        return false;
		}else {
			//조회 수 up
			$.ajax({
			     url:'/community/viewCount',
			     data:{seq : seq},
			     type:'POST',
			     async: false
			  })
			
			//디테일 페이지 이동
			location.href = "/community/detailView?seq="+seq+"";
		}
		})
		
$(document).on("click", ".post" ,function(){
		let seq = $(this).find(".board_seq").val();
		let state = $(this).find(".state").val();
			
			if(state == "2") {
				Swal.fire({                    
		            width:400,
		            html: "<span style='font-size:15px'>관리자에 의해 삭제된 글입니다.</span>",
		            showConfirmButton: false,
		            timer: 1000,
		            background:'#dbdbdb',
		            backdrop:'transparent'
		        })
		        return false;
			}else {
				
			//조회 수 up
			$.ajax({
			     url:'/community/viewCount',
			     data:{seq : seq},
			     type:'POST',
			     async: false
			  })
			
			//디테일 페이지 이동
			location.href = "/community/detailView?seq="+seq+"";
			}
		})
		
		$(document).on("click", ".reply" ,function(){
		let seq = $(this).find(".board_seq").val();
		let state = $(this).find(".state").val();
		let board_state = $(this).find(".board_state").val();
			
		if(board_state == "2"){
			Swal.fire({                    
	            width:400,
	            html: "<span style='font-size:15px'>관리자에 의해 삭제된 글입니다.</span>",
	            showConfirmButton: false,
	            timer: 1000,
	            background:'#dbdbdb',
	            backdrop:'transparent'
	        })
	        return false;
		}else if(state == "2"){
			Swal.fire({                    
	            width:400,
	            html: "<span style='font-size:15px'>관리자에 의해 삭제된 댓글입니다.</span>",
	            showConfirmButton: false,
	            timer: 1000,
	            background:'#dbdbdb',
	            backdrop:'transparent'
	        })
	        return false;
		}else {
			//조회 수 up
			$.ajax({
			     url:'/community/viewCount',
			     data:{seq : seq},
			     type:'POST',
			     async: false
			  })
			
			//디테일 페이지 이동
			location.href = "/community/detailView?seq="+seq+"";
		}		
		})
		
$(document).on("click", ".classimg, .classtitle, .classimg2, .goReview" ,function(){
		let class_seq = $(this).siblings(".class_seq").val();
		let state = $(this).siblings(".state").val();
			
		if(state == "2") {
			Swal.fire({                    
	            width:400,
	            html: "<span style='font-size:15px'>관리자에 의해 삭제된 클래스입니다.</span>",
	            showConfirmButton: false,
	            timer: 1000,
	            background:'#dbdbdb',
	            backdrop:'transparent'
	        })
			return false;
		}else {
			location.href="/class/detail?class_seq="+class_seq+"";
		}
		})
		
$(document).on("click", ".classdate3" ,function(){
		let class_seq = $(this).find(".class_seq").val();
		let state = $(this).find(".state").val();
		let class_state = $(this).find(".class_state").val();
		
		if(class_state == "2") {
			Swal.fire({                    
	            width:400,
	            html: "<span style='font-size:15px'>관리자에 의해 삭제된 클래스입니다.</span>",
	            showConfirmButton: false,
	            timer: 1000,
	            background:'#dbdbdb',
	            backdrop:'transparent'
	        })
	        return false;
		}else if(state == "2") {
			Swal.fire({                    
	            width:400,
	            html: "<span style='font-size:15px'>관리자에 의해 삭제된 후기입니다.</span>",
	            showConfirmButton: false,
	            timer: 1000,
	            background:'#dbdbdb',
	            backdrop:'transparent'
	        })
		}else {
			location.href="/class/detail?class_seq="+class_seq+"";
		}
		})
		
</script>
</html>