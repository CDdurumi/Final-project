<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
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
<link rel="stylesheet" href="/css/myPage.css">
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

/
*   div { /*
	border: 1px solid crimson;
	/*
}
</style>
</head>
<body>
	<div class="container">
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
						<summary style="padding: 0px; font-size: 14px; margin-bottom: 20px;">클래스</summary>
						<ul>
							<li><a href="#talent1-tab"><button class="nav-link tabs2" id="v-pills-talent1-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-talent1" type="button" role="tab" aria-controls="v-pills-talent1" aria-selected="false" style="color: #666666;">구매한 클래스</button></a></li>
							<li><a href="#talent2-tab"><button class="nav-link tabs2" id="v-pills-talent2-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-talent2" type="button" role="tab" aria-controls="v-pills-talent2" aria-selected="false" style="color: #666666;">찜한 클래스</button></a></li>
							<li><a href="#talent3-tab"><button class="nav-link tabs2" id="v-pills-talent3-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-talent3" type="button" role="tab" aria-controls="v-pills-talent3" aria-selected="false" style="color: #666666;">등록한 클래스</button></a></li>
							<li><a href="#talent4-tab"><button class="nav-link tabs2" id="v-pills-talent4-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-talent4" type="button" role="tab" aria-controls="v-pills-talent4" aria-selected="false" style="color: #666666;">작성한 리뷰</button></a></li>
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
					<a href="#home-tab">
						<button class="nav-link tabs" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">홈</button>
					</a> <a href="#profile-tab">
						<button class="nav-link tabs" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">내 정보</button>
					</a>
					<details id="talent">
						<summary>클래스</summary>
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
									<li class="myli">등록한 클래스</li>
								</button>
							</a>
							<a href="#talent4-tab">
								<button class="nav-link tabs" id="v-pills-talent4-tab" data-bs-toggle="pill" data-bs-target="#v-pills-talent4" type="button" role="tab" aria-controls="v-pills-talent4" aria-selected="false">
									<li class="myli">작성한 리뷰</li>
								</button>
							</a>
						</ul>
					</details>
					<details id="community">
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
				<div class="tab-content" id="v-pills-tabContent" style="width: 100%;">
					<div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab" style="width: 100%;">
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
									<div class="leftc">휴대전화</div>
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
							<c:when test="${empty buyclist}">
								<div class="info">
									<p>
										구매한 클래스가 없어요.<br> 지금 바로 클래스를 구매해보세요!
									</p>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach var="i" items="${buyclist}" end="1" varStatus="status">
									<div class="class">
										<div class="classdate">
											<fmt:formatDate value="${i.class_date}" type="both" pattern="yyyy-MM-dd" />
										</div>
										<div class="row2">
											<div class="left2">
												<img class="classimg" src="/img/class1.png">
											</div>
											<div class="right2">
												<div class="classrow1">${i.category1}</div>
												<div class="classrow2">
													${i.title} · <span class="creator">${i.creater_info}</span>
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
							내가 쓴 글<span id="tomorepost" class="more">더보기 ></span>
						</div>
						<c:choose>
							<c:when test="${empty postlist}">
								<div class="info">
									<p>
										작성한 글이 없어요.<br> 지금 바로 글을 작성해보세요!
									</p>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach var="i" items="${postlist}" end="2" varStatus="status">
									<div class="mypost">
										<div class="postitle">${i.title}</div>
										<div class="postdetail">
											<c:if test="${fn:contains(i.board_seq, 'Q')}">궁금해요</c:if>
											<c:if test="${fn:contains(i.board_seq, 'H')}">도와주세요</c:if>
											<c:if test="${fn:contains(i.board_seq, 'S')}">도와드려요</c:if>
											<c:if test="${fn:contains(i.board_seq, 'D')}">일상</c:if>
											·
											<fmt:formatDate value="${i.write_date}" type="both" pattern="yyyy-MM-dd" />
											· ${i.view_count} · <i class="bi bi-emoji-smile-fill"></i> ${i.like_count} · <i class="bi bi-chat-dots-fill"></i> ${replycount[status.index]}
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<div class="comucate">
							내가 쓴 댓글<span id="tomorereply" class="more">더보기 ></span>
						</div>
						<c:choose>
							<c:when test="${empty replylist}">
								<div class="info">
									<p>
										작성한 댓글이 없어요.<br> 지금 바로 댓글을 작성해보세요!
									</p>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach var="i" items="${replylist}" end="2" varStatus="status">
									<div class="myreply">
										<div class="replytitle">
											<c:if test="${fn:contains(replyplist[status.index].board_seq, 'Q')}">궁금해요</c:if>
											<c:if test="${fn:contains(replyplist[status.index].board_seq, 'H')}">도와주세요</c:if>
											<c:if test="${fn:contains(replyplist[status.index].board_seq, 'S')}">도와드려요</c:if>
											<c:if test="${fn:contains(replyplist[status.index].board_seq, 'D')}">일상</c:if>
											· [원문] ${replyplist[status.index].title}
										</div>
										<div class="replydetail">
											${i.contents} <span class="like"><fmt:formatDate value="${i.write_date}" type="both" pattern="yyyy-MM-dd" /> · <i class="bi bi-emoji-smile-fill"></i> ${i.like_count} </span>
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
											<input id="defaultimg" type='button' value='기본 이미지로 변경' />
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
									<div class="leftc">휴대전화</div>
									<div class="leftc">닉네임</div>
								</div>
								<div class="right">
									<div class="rightc">${myinfo.name}</div>
									<div class="rightc">${myinfo.email}</div>
									<form action="/myPage/updateInfo" method="post" id="infoform">
										<input type="hidden" value="${myinfo.email}" id="email" name="email">
										<div class="rightc">
											<input type="hidden" value="${myinfo.nickname}" size=8 disabled class="editable" name="nickname"> <input id="modiphone" type="text" value="${myinfo.phone}" size=8 maxlength=13 disabled class="editable" name="phone"><span class="modify"><i class="bi bi-pencil-fill"></i></span>
											<button type="button" class="btn2 modifybtn" style="display: none;">변경</button>
											<button type="button" class="btn2 upcancel" style="display: none; margin-top: 0px;">취소</button>
											<span class="noticebox" style="display: none;"></span>
										</div>
										<div class="rightc">
											<input type="hidden" value="${myinfo.phone}" size=8 maxlength=13 disabled class="editable" name="phone"> <input id="modinickname" type="text" value="${myinfo.nickname}" size=8 disabled class="editable" name="nickname"><span class="modify"><i class="bi bi-pencil-fill"></i></span>
											<button type="button" class="btn2 modifybtn" style="display: none;">변경</button>
											<button type="button" class="btn2 upcancel" style="display: none; margin-top: 0px;">취소</button>
											<span class="noticebox" style="display: none;"></span>
										</div>
									</form>
								</div>
								<div align=center>
									<a data-bs-toggle="modal" href="#memberOut-toggle" role="button" style="color: #6B54FF;">회원탈퇴</a>
								</div>
							</div>
						</div>
					</div>
					<!--  세번째 탭 : 구매한 클래스 -->
					<div class="tab-pane fade" id="v-pills-talent1" role="tabpanel" aria-labelledby="v-pills-talent1-tab">
					</div>
					<!-- 네번째 탭 : 찜한 클래스 -->
					<div class="tab-pane fade" id="v-pills-talent2" role="tabpanel" aria-labelledby="v-pills-talent2-tab">
					</div>
					<!-- 다섯번째 탭 등록한 클래스 -->
					<div class="tab-pane fade" id="v-pills-talent3" role="tabpanel" aria-labelledby="v-pills-talent3-tab">
					</div>
					<!-- 여섯번째 탭 작성한 리뷰 -->
					<div class="tab-pane fade" id="v-pills-talent4" role="tabpanel" aria-labelledby="v-pills-talent4-tab">
					</div>
					<!-- 일곱번째탭 내가 쓴 글 -->
					<div class="tab-pane fade" id="v-pills-community1" role="tabpanel" aria-labelledby="v-pills-community1-tab">
					</div>
					<div class="tab-pane fade" id="v-pills-community2" role="tabpanel" aria-labelledby="v-pills-community2-tab">
					</div>
				</div>
			</div>
			<jsp:include page="/WEB-INF/views/member/memberOut.jsp" />
			<jsp:include page="/WEB-INF/views/common/loginModal.jsp" />
			<jsp:include page="/WEB-INF/views/common/pNav.jsp" />
			<jsp:include page="/WEB-INF/views/common/footer.jsp" />
		</div>
	</div>
</body>
<script>
// 회원탈퇴모달에서 최종 탈퇴 버튼을 누르면 모달창이 닫히고 회원탈퇴 처리 후 index 페이지로 이동
$('#memberOutOk-toggle').on('hidden.bs.modal', function () {
	location.href="/myPage/memberOut";	 
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
    
    if(siteUrl.includes('talent')) {
    	document.getElementById("talent").open = true;
    }else if (siteUrl.includes('community')) {
        document.getElementById("community").open = true;
    }else {
        document.getElementById("talent").open = false;
        document.getElementById("community").open = false;
    }
}
    
tabs.on("click",function(){   //세로탭 메뉴들 전체에 클릭시 이벤트
	resetTab(); //선택된 탭 초기화
    $(this).children().addClass("active"); //클릭한 탭만 활성
})

tabs2.on("click",function(){   //가로탭 메뉴들 전체에 클릭시 이벤트
	resetTab(); //선택된 탭 초기화
	tabs2.css("border-bottom","none"); 
	$(this).css("border-bottom","4px solid #9381ff"); 
	$("#cate1").css("margin-bottom","0px");
	$("#cate2").css("margin-bottom","0px");
})

$('#talent1').on('toggle', function() {
	$("#cate1").css("margin-bottom","160px");
});
    
$('#community1').on('toggle', function() {
	$("#cate2").css("margin-bottom","80px");
});

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
	 	 talent1Tab('t1');
	 } else if(siteUrl=='talent2-tab'){
		 $("#v-pills-talent1").empty();
		 $("#v-pills-talent2").empty();
		 $("#v-pills-talent3").empty();
		 $("#v-pills-talent4").empty();
		 $("#v-pills-community1").empty();
		 $("#v-pills-community2").empty();
	 	 talent2Tab('t2');
	 } else if(siteUrl=='talent3-tab'){
		 $("#v-pills-talent1").empty();
		 $("#v-pills-talent2").empty();
		 $("#v-pills-talent3").empty();
		 $("#v-pills-talent4").empty();
		 $("#v-pills-community1").empty();
		 $("#v-pills-community2").empty();
	 	 talent3Tab('t3');
	 } else if(siteUrl=='talent4-tab'){
		 $("#v-pills-talent1").empty();
		 $("#v-pills-talent2").empty();
		 $("#v-pills-talent3").empty();
		 $("#v-pills-talent4").empty();
		 $("#v-pills-community1").empty();
		 $("#v-pills-community2").empty();
	 	 talent4Tab('t4');
	 } else if(siteUrl=='community1-tab'){
		 $("#v-pills-talent1").empty();
		 $("#v-pills-talent2").empty();
		 $("#v-pills-talent3").empty();
		 $("#v-pills-talent4").empty();
		 $("#v-pills-community1").empty();
		 $("#v-pills-community2").empty();
	 	 community1Tab('c1');
	 } else if(siteUrl=='community2-tab'){
		 $("#v-pills-talent1").empty();
		 $("#v-pills-talent2").empty();
		 $("#v-pills-talent3").empty();
		 $("#v-pills-talent4").empty();
		 $("#v-pills-community1").empty();
		 $("#v-pills-community2").empty();
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
	
       let page = 1;  //페이징과 같은 방식이라고 생각하면 된다.

       $(function(){
            getList(page);
            page++;
            console.log(page);
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
	        	   
//		               if (!timer) {
//		                   timer = setTimeout(() => {
//		                       timer = null;

//		                       getList(page);
//								page++;
//		                   }, 500);
//		               }
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
					$("#v-pills-talent1").append("<div id='info1' class='info'><p>구매한 클래스가 없어요.<br>지금 바로 클래스를 구매해보세요!</p></div>");	
					event.preventDefault();
					event.stopPropagation();
					return false;
					}else {
						event.preventDefault();
						event.stopPropagation();
						return false;
					}	
				}else if(totalPage < page && totalPage != 0) {	
					event.preventDefault();
					event.stopPropagation();
					return false;
				}else {

					var d = new Date();
					 
					var year = d.getFullYear(); // 년, 2015
					var month = (d.getMonth() + 1); // 월, 11[1을 더해야함. 유일하게 조심해야할 부분. 1월은 0이다.]
					var date = d.getDate(); // 일, 14
					 
					var hour = d.getHours(); // 시, 10
					var min = d.getMinutes(); // 분, 35
					var sec = d.getSeconds(); // 초, 42
					 
					var day = d.getDay(); // 요일, 숫자로 출력됨(0~6), 일요일(0)부터 시작해서 토요일(6)에 끝남
					출처: https://nine01223.tistory.com/139 [스프링연구소(spring-lab):티스토리]
					
					
					
						for(let i = 0; i < resp[0].list.length; i++){
		            	console.log('나와랏' + resp[0].list[i].CLASS_DATE);
						console.log('나와랏2' + resp[0].list[i].CLASS_DATE + resp[0].list[i].CATEGORY1 + resp[0].list[i].TITLE + resp[0].list[i].CREATER_INFO);
		         		let boardArea = $("<div class='class'>");
		         		let classdate = $("<div class='classdate'>");
		         		let realdate = new Date(resp[0].list[i].CLASS_DATE);
		         		classdate.append(getTime(realdate));
		         		classdate.append("<button class='goReview'>리뷰 남기기</button>");
		         		boardArea.append(classdate);
		        		
		        		let row1 = $("<div class='row2'>");
		        		let row1_leftArea = $("<div class='left2'><img class='classimg' src='/img/class1.png'><div>");
		        		let row1_rightArea = $("<div class='right2'>");
		        		let right1 = $("<div class='classrow3'>" + resp[0].list[i].CATEGORY1 + "</div>");
		        		let right2 = $("<div class='classrow4'>" + resp[0].list[i].TITLE + " · <span class='creator'>" + resp[0].list[i].CREATER_INFO + "</span></div>")
		        		
		        		let buydate = new Date(resp[0].list[i].buy_date);
		        		let right3 = $("<div class='classrow5'>결제일자 : " + getFullTime(buydate) + " · 금액 : " + resp[0].list[i].PRICE + "</div>")

		        		row1_rightArea.append(right1);
		        		row1_rightArea.append(right2);
		        		row1_rightArea.append(right3);
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
            console.log(page);
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
	        	   
//		               if (!timer) {
//		                   timer = setTimeout(() => {
//		                       timer = null;

//		                       getList(page);
//								page++;
//		                   }, 500);
//		               }
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
					event.preventDefault();
					event.stopPropagation();
					return false;
					}else {
						event.preventDefault();
						event.stopPropagation();
						return false;
					}	
				}else if(totalPage < page && totalPage != 0) {	
					event.preventDefault();
					event.stopPropagation();
					
					return false;
				}else {
						for(let i = 0; i < resp[0].list.length; i++){
		            	console.log('나와랏' + resp[0].list[i].class_date);
						console.log('나와랏2' + resp[0].list[i].class_date + resp[0].list[i].category1 + resp[0].list[i].title + resp[0].list[i].creater_info);
		         		let boardArea = $("<div class='class'>");
		         		let classdate = $("<div class='classdate'>");
		         		let realdate = new Date(resp[0].list[i].class_date);
		         		classdate.append(getTime(realdate));
		         		boardArea.append(classdate);
		        		
		        		let row1 = $("<div class='row2'>");
		        		let row1_leftArea = $("<div class='left2'><img class='classimg' src='/img/class1.png'><div>");
		        		let row1_rightArea = $("<div class='right2'>");
		        		let right1 = $("<div class='classrow1'>" + resp[0].list[i].category1 + "<span class=like2><input type=hidden class='likeclass' value =" + resp[0].list[i].class_seq +"><i class='bi bi-heart-fill'></i><span></div>");
		        		let right2 = $("<div class='classrow2'>" + resp[0].list[i].title + " · <span class='creator'>" + resp[0].list[i].creater_info + "</span></div>")

		        		row1_rightArea.append(right1);
		        		row1_rightArea.append(right2);
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
	$("#v-pills-talent3").append("<div class='category'>등록한 클래스</div>");
	$("#v-pills-talent3").append("<div id='goaddclass'><a href='/class/write' style='color: #9381FF;'>클래스 등록하러 가기</a></div>");
	
       let page = 1;  //페이징과 같은 방식이라고 생각하면 된다.

       $(function(){
            getList(page);
            page++;
            console.log(page);
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
	        	   
//		               if (!timer) {
//		                   timer = setTimeout(() => {
//		                       timer = null;

//		                       getList(page);
//								page++;
//		                   }, 500);
//		               }
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
					event.preventDefault();
					event.stopPropagation();
					return false;
					}else {
						event.preventDefault();
						event.stopPropagation();
						return false;
					}	
				}else if(totalPage < page && totalPage != 0) {	
					event.preventDefault();
					event.stopPropagation();
					
					return false;
				}else {
		             for(let i = 0; i < resp[0].list.length; i++){

			         		let boardArea = $("<div class='class'>");
			         		let classdate = $("<div class='classdate'>");
			         		let regdate = $("<span class='regdate'>등록일자</span>");
			         		let realdate = new Date(resp[0].list[i].REG_DATE);
			         		classdate.append(regdate);
			         		classdate.append(getFullTime(realdate));
			         		boardArea.append(classdate);
			        		
			        		let row1 = $("<div class='row2'>");
			        		let row1_leftArea = $("<div class='left3'><img class='classimg2' src='/img/class1.png'></div>");
			        		let row1_centerArea = $("<div class='center3'>");
			        		let center1 = $("<div class='classrow6'>" + resp[0].list[i].CATEGORY1 + "</div>");
			        		let center2 = $("<div class='classrow7'>");
			        		let center2_1 = $("<a href='/myPage/myClass?class_seq=" + resp[0].list[i].CLASS_SEQ + "'>" + resp[0].list[i].TITLE + "</a>");
			        		
			        		let mydate = new Date(resp[0].list[i].CLASS_DATE);
			        		let center3 = $("<div class='classrow8'>일정 : " + getTime(mydate) + " · 금액 : " + resp[0].list[i].PRICE + "원</div>");
			          		let center4 = $("<div class='classrow9'>수강 신청 인원 : -명 · 별점 및 리뷰 : " + resp[0].list[i].avgstar + "/5 (리뷰 " + resp[0].list[i].all + "건)</div>")
			        		let right1 = $("<div class='right3'>");
			        		let right1_1 = $("<a href='/myPage/myClass?class_seq=" + resp[0].list[i].CLASS_SEQ + "'><img class='viewclass' src='/img/rightBtn.png'></a>");
			        		
			        			
			           		row1_centerArea.append(center1);
			           		center2.append(center2_1);
			           		row1_centerArea.append(center2);
			           		row1_centerArea.append(center3);
			           		row1_centerArea.append(center4);
			           		
			           		right1.append(right1_1);
			        				        	
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
	$("#v-pills-talent4").append("<div class='category'>작성한 리뷰</div>");
	
       let page = 1;  //페이징과 같은 방식이라고 생각하면 된다.

       $(function(){
            getList(page);
            page++;
            console.log(page);
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
	        	   
//		               if (!timer) {
//		                   timer = setTimeout(() => {
//		                       timer = null;

//		                       getList(page);
//								page++;
//		                   }, 500);
//		               }
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
					$("#v-pills-talent4").append("<div id='info4' class='info'><p>작성한 리뷰가 없어요.<br>지금 바로 리뷰를 작성해보세요!</p></div>");	
					event.preventDefault();
					event.stopPropagation();
					return false;
					}else {
						event.preventDefault();
						event.stopPropagation();
						return false;
					}	
				}else if(totalPage < page && totalPage != 0) {	
					event.preventDefault();
					event.stopPropagation();


					return false;
				}else {
		             for(let i = 0; i < resp[0].list.length; i++){
		            	let boardArea = $("<div class='class'>");
		         		let classdate = $("<div class='classdate'>");
		         		let regdate = $("<span class='regdate'>");
		         		let realdate = new Date(resp[0].list[i].WRITE_DATE);
		         		regdate.append(getFullTime(realdate));
		         		classdate.append(regdate);
		         		boardArea.append(classdate);
		        		
		        		let row1 = $("<div class='row2'>");
		        		let row1_leftArea = $("<div class='classdate2'>");
		        		let star = $("<span class='starCountImg'>");
		        		star.append("<input type=hidden value='" + resp[0].list[i].STARS + "'></span><span class='starrate'>(" + resp[0].list[i].STARS + "점/5점)");
		        		let row1_rightArea = $("<div class='classdate3'>" + resp[0].list[i].CONTENTS + "</div>");
		        		let row2_rightArea = $("<div class='left4'><img class='classimg2' src='/img/class1.png'></div>");
		        		let row3_rightArea = $("<div class='right4'>");
		        		let right1 = $("<div class='classrow10'>" + resp[0].list[i].CATEGORY1 + "</div>");
		        		let right2 = $("<div class='classrow2'>" + resp[0].list[i].TITLE + " · <span class='creator'>" + resp[0].list[i].CREATER_INFO + "</span></div>");

		        		row1_leftArea.append(star);
		        		row3_rightArea.append(right1);
		        		row3_rightArea.append(right2);
		        		
		        		
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
		              console.log(classTotalStar);
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
            console.log(page);
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
	        	   
//		               if (!timer) {
//		                   timer = setTimeout(() => {
//		                       timer = null;

//		                       getList(page);
//								page++;
//		                   }, 500);
//		               }
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
				console.log("토탈페이지 : " + totalPage);
				
				if(totalPage == 0){
					if(!$("#info5").length){
					$("#v-pills-community1").append("<div id='info5' class='info'><p>작성한 글이 없어요.<br>지금 바로 글을 작성해보세요!</p></div>");	
					event.preventDefault();
					event.stopPropagation();
					return false;
					}else {
						event.preventDefault();
						event.stopPropagation();
						return false;
					}	
				}else if(totalPage < page && totalPage != 0) {	
					event.preventDefault();
					event.stopPropagation();
					return false;
				}else {
						if(!$("#totalpost").length){
							$("#v-pills-community1").append("<div id='totalpost' align=right>작성한 글 : " + totalPage + "건</div>");	
						}
						
						for(let i = 0; i < resp[0].list.length; i++){
		            	
		         		let boardArea = $("<div class='post'>");
		         	
						let row1 = $("<div>");
						
						let category = resp[0].list[i].BOARD_SEQ.charAt(0);
		        		let realcate = "";
		        		
		        		if(category === 'Q') {
		        			realcate = '궁금해요';
		        		}else if(category === 'H') {
		        			realcate = '도와주세요';
		        		}else if(category === 'S') {
		        			realcate = '도와드려요';
        				}else {
        					realcate = '일상';
        				}
		        		
						let row1_1 = $("<span class='comucates'>" + realcate + "</span>");
						row1.append(row1_1);
        				
						let row2 = $("<div class='row2'>");
        				let row2_1 = $("<div class='comuup'>");
        				let row2_2 = $("<div class='left5'>");
        				let row2_2_1 = $("<div class='classrow11'>" + resp[0].list[i].TITLE + "</div>");
        				let row2_2_2 = $("<div class='classrow12'>" + resp[0].list[i].CONTENTS + "</div>");
        				row2_2.append(row2_2_1);
        				row2_2.append(row2_2_2);
        				
        				let row2_3 = $("<div class='right5'><img class='comuimg' src='/img/chimac.jpg'><br></div>");
        				
        				let row3 = $("<div class='comudown'>");
        				let row3_1 = $("<div class='classrow13'>");
        				
        				
        				let tags = resp[0].list[i].HASH_TAG.substring(1);
        				const tag = tags.split('#');
        				        				
        				for (let j = 0; j < tag.length; j++) {
        					let hash = $("<span style='margin-right:5px;'>#" + tag[j] + "</span>");
        					console.log(j + "번째 태그 모음 : " + tag[j]);
        					row3_1.append(hash);
        				}
        				
        				let row3_2 = $("<div class='classrow14'>");
        				let row3_2_1 = $("<i class='bi bi-emoji-smile-fill'></i>" + resp[0].list[i].LIKE_COUNT + " · <i class='bi bi-chat-dots-fill'></i>" + resp[0].list[i].all + "<span class='postdate'>" + resp[0].list[i].write_date + "<span>");
        				
        				row3_2.append(row3_2_1);
        				
		        		row3.append(row3_1);
		        		row3.append(row3_2);
		        		
		        		row2_1.append(row2_2);
		        		row2_1.append(row2_3);
		        		row2_1.append(row2_3);
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
            console.log(page);
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
	        	   
//		               if (!timer) {
//		                   timer = setTimeout(() => {
//		                       timer = null;

//		                       getList(page);
//								page++;
//		                   }, 500);
//		               }
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
				console.log("토탈페이지 : " + totalPage);
				
				if(totalPage == 0){
					if(!$("#info6").length){
					$("#v-pills-community2").append("<div id='info6' class='info'><p>작성한 댓글이 없어요.<br>지금 바로 댓글을 작성해보세요!</p></div>");	
					event.preventDefault();
					event.stopPropagation();
					return false;
					}else {
						event.preventDefault();
						event.stopPropagation();
						return false;
					}	
				}else if(totalPage < page && totalPage != 0) {	
					event.preventDefault();
					event.stopPropagation();
					return false;
				}else {
						if(!$("#totalpost").length){
							$("#v-pills-community2").append("<div id='totalpost' align=right>작성한 댓글 : " + totalPage + "건</div>");	
						}
						for(let i = 0; i < resp[0].list.length; i++){
		            	
		         		let boardArea = $("<div class='reply'>");
		         		
// 		         		let classdate = $("<div class='classdate'>");
// 		         		let realdate = new Date(resp[0].list[i].CLASS_DATE);
// 		         		classdate.append(realdate);
// 		         		classdate.append("<button class='goReview'>리뷰 남기기</button>");
// 		         		boardArea.append(classdate);
		        				        		
		        		let category = resp[0].list[i].BOARD_SEQ.charAt(0);
		        		console.log("카테" + category);
		        		let realcate = "";
		        		
		        		if(category === 'Q') {
		        			realcate = '궁금해요';
		        		}else if(category === 'H') {
		        			realcate = '도와주세요';
		        		}else if(category === 'S') {
		        			realcate = '도와드려요';
        				}else {
        					realcate = '일상';
        				}
		        			
        				let row1 = $("<div class='replyrow1'>" + realcate + " · [원문] " + resp[0].list[i].TITLE + "</div>");
        				let row2 = $("<div class='replyrow2'>" + resp[0].list[i].CONTENTS + "</div>");
		        		let row3 = $("<div class='replyrow3'>");
		        		
		        		let row3_1 = $("<span class='like'>" + resp[0].list[i].write_date + " · <i class='bi bi-emoji-smile-fill'></i>" + resp[0].list[i].LIKE_COUNT + "</span>");
		        		
		        		row3.append(row3_1);
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

// 마이페이지 홈에서 내 정보로 가기 버튼 클릭 시 이벤트
$("#toinfo").on('click',function(){
	resetTab();
    $("#v-pills-profile-tab").addClass("active");
    $("#v-pills-profile-tab2").css("border-bottom","4px solid #9381ff");
    tabs_contents.removeClass("active");
    $("#v-pills-profile").addClass("show active");
    window.scrollTo({top:0, left:0, behavior:'auto'});
})
    
// 마이페이지 홈에서 클래스로 가기 버튼 클릭 시 이벤트
$("#totalent").on('click',function(){
	resetTab();
    $("#v-pills-talent1-tab").addClass("active");
    $("#v-pills-talent1-tab2").css("border-bottom","4px solid #9381ff");
    tabs_contents.removeClass("active");
    $("#v-pills-talent1").addClass("show active");
    document.getElementById("talent").open = true;
    window.scrollTo({top:0, left:0, behavior:'auto'});
})

// 마이페이지 홈에서 커뮤니티로 가기, 내가 쓴 글 더보기 버튼 클릭 시 이벤트
$("#tocommunity, #tomorepost").on('click',function(){
	resetTab();
    $("#v-pills-community1-tab").addClass("active");
    $("#v-pills-community1-tab2").css("border-bottom","4px solid #9381ff");
    tabs_contents.removeClass("active");
    $("#v-pills-community1").addClass("show active");
    document.getElementById("community").open = true;
    window.scrollTo({top:0, left:0, behavior:'auto'});
})

// 마이페이지 홈에서 내가 쓴 댓글 더보기 버튼 클릭 시 이벤트
$("#tomorereply").on('click',function(){
	resetTab();
    $("#v-pills-community2-tab").addClass("active");
    $("#v-pills-community2-tab2").css("border-bottom","4px solid #9381ff");
    tabs_contents.removeClass("active");
    $("#v-pills-community2").addClass("show active");
    document.getElementById("community").open = true;
    window.scrollTo({top:0, left:0, behavior:'auto'});
})

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
	$(this).siblings(".btn2").css("display","");
})
	
// 파일 선택 시 미리보기
$('#file').on('change', function() {
    ext = $(this).val().split('.').pop().toLowerCase(); //확장자

    //배열에 추출한 확장자가 존재하는지 체크
    if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
    	resetFormElement($(this)); //폼 초기화
        alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
    } else {
   		file = $('#file').prop("files")[0];
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
  
// 내 정보 및 이미지 변경 최종 취소 시 페이지 새로고침
$(document).on("click", ".upcancel", function(){ // on 이벤트로 변경
	location.reload();
});

// 수정 완료 버튼 클릭 시 입력값 정규식 검사
$(".modifybtn").on('click',function(){
	let nickname = $("#modinickname").val();
	let nicknameRegex = /^[a-z0-9가-힣]{2,10}$/; //영어 소문자, 숫자 2~10글자
	let nicknameResult = nicknameRegex.test(nickname);

	if(!nicknameResult){
    	$(this).siblings('.noticebox').css("display", "");
		$(this).siblings('.noticebox').css("color", "red");
		$(this).siblings('.noticebox').text("2~10자(영문 소문자,숫자)를 입력해주세요");
        $("#modinickname").focus();
        return false;
// 	}	
	} else {
		$.ajax({
			url:"/signup/nickNameCheck",
			type:"get",
			data:{nickname:nickname}
		}).done(function(resp){
			let result = JSON.parse(resp);
			
			if(result == true){
				alert('이미 사용중인 닉네임입니다.')
				return false;
			}else{
				alert('변경 가능한 닉네임입니다.')
		 	}
		});
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
	
	$("#infoform").submit();
    return false;
})

// 기본 사진으로 변경 버튼 클릭 시 미리보기 이미지 기본으로 변경
$("#defaultimg").on('click',function(){
	$(this).css("display","none");
	$(".profile").attr("src", "/img/defaultProfile.png");	
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
	             background:'#dbdbdb80',
	             backdrop:'transparent'
	         })
			}else{
				alert('찜 삭제 실패..')
		 	}
		});
        setTimeout("location.reload()", 1000);
    }
})	
</script>
</html>