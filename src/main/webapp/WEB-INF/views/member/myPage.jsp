<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <!-- input.css  -->
    <link rel="stylesheet" href="/css/myPage.css">
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

  div {     
  border : 1px solid crimson;     
  }     
</style>
</head>
<body>
	<div class="container">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div style="min-height:100vh; margin-top:200px;" class="contents">
	<div id="pageHeader">마이페이지<br><hr></div>
		<div class="d-flex align-items-start">
			<div class="nav flex-column nav-pills me-3 sticky-top" id="v-pills-tab" role="tablist" aria-orientation="vertical">
				<a href="#home-tab">
				<button class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">홈</button></a> 
				<a href="#profile-tab">
				<button class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">내 정보</button></a>
				<details id="talent">
        		<summary>재능</summary>
      			  <ul>
      			<a href="#talent-tab">
				<button class="nav-link" id="v-pills-talent1-tab" data-bs-toggle="pill" data-bs-target="#v-pills-talent1" type="button" role="tab" aria-controls="v-pills-talent1" aria-selected="false">
           			 <li class="myli">구매한 재능</li>
           		</button>
           		<button class="nav-link" id="v-pills-talent2-tab" data-bs-toggle="pill" data-bs-target="#v-pills-talent2" type="button" role="tab" aria-controls="v-pills-talent2" aria-selected="false">
           			 <li class="myli">좋아요한 재능</li>
           		</button>
           		<button class="nav-link" id="v-pills-talent3-tab" data-bs-toggle="pill" data-bs-target="#v-pills-talent3" type="button" role="tab" aria-controls="v-pills-talent3" aria-selected="false">
           			 <li class="myli">등록한 재능</li>
           		</button>
           		<button class="nav-link" id="v-pills-talent4-tab" data-bs-toggle="pill" data-bs-target="#v-pills-talent4" type="button" role="tab" aria-controls="v-pills-talent4" aria-selected="false">
           			 <li class="myli">작성한 리뷰</li>
           		</button></a>
        			</ul>
     			 </details>
				<details id="community">
        		<summary style="margin-top:5px;">커뮤니티</summary>
      			  <ul>
      			  <a href="#community-tab">
				<button class="nav-link" id="v-pills-community1-tab" data-bs-toggle="pill" data-bs-target="#v-pills-community1" type="button" role="tab" aria-controls="v-pills-community1" aria-selected="false">
           			 <li class="myli">내가 쓴 글</li>
           		</button>
           		<button class="nav-link" id="v-pills-community2-tab" data-bs-toggle="pill" data-bs-target="#v-pills-community2" type="button" role="tab" aria-controls="v-pills-community2" aria-selected="false">
           			 <li class="myli">내가 쓴 댓글</li>
           		</button></a>
        			</ul>
     			 </details>		
			</div>
			<!-- 첫번째 탭 : 홈 -->
			<div class="tab-content" id="v-pills-tabContent" style="width:100%;">
				<div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab" style="width:100%;">
				<div class="category">내 정보<img id="toinfo" class="btns" src="/img/rightBtn.png"></div>
				<div>
				<div class="box" style="background: #BDBDBD;">
    			<img class="profile" src="/img/defaultProfile.png">
				</div>
				<div class="row1">
				<div class="left">
				<div class="leftc">이름</div>
				<div class="leftc">이메일</div>
				<div class="leftc">휴대전화</div>
				<div class="leftc">닉네임</div>
				</div>
				<div class="right">
				<div class="rightc">홍길동</div>
				<div class="rightc">abc@abc.com</div>
				<div class="rightc">010-1234-1234</div>
				<div class="rightc">수박냠냠</div>
				</div>
				</div>
				</div>
				<div style="clear:both;"></div>
				<div class="category">재능<img id="totalent" class="btns" src="/img/rightBtn.png"></div>
				<div class="class">
				<div class="classdate">2022.6.28</div>
				<div class="row2">
				<div class="left2">
				<img class="classimg" src="/img/class1.png">
				</div>
				<div class="right2">
				<div class="classrow1">1차 카테고리</div>
				<div class="classrow2">클래스명 · <span class="creator">크리에이터명</span></div>
				</div>
				</div>
				</div>
				<div class="class">
				<div class="classdate">2022.6.28</div>
				<div class="row2">
				<div class="left2">
				<img class="classimg" src="/img/class1.png">
				</div>
				<div class="right2">
				<div class="classrow1">1차 카테고리</div>
				<div class="classrow2">클래스명 · <span class="creator">크리에이터명</span></div>
				</div>
				</div>
				</div>
				<div style="clear:both;"></div>
				<div class="category">커뮤니티<img id="tocommunity" class="btns" src="/img/rightBtn.png"></div>
				<div class="comucate">내가 쓴 글<span class="more">더보기 ></span></div>
				<div class="mypost">
				<div class="postitle">글 제목</div>
				<div class="postdetail">카테고리 · 작성일 · 조회 · <i class="bi bi-emoji-smile-fill"></i> 좋아요 수 · <i class="bi bi-chat-dots-fill"></i> 댓글 수</div>
				</div>
				<div class="mypost">
				<div class="postitle">글 제목</div>
				<div class="postdetail">카테고리 · 작성일 · 조회 · <i class="bi bi-emoji-smile-fill"></i> 좋아요 수 · <i class="bi bi-chat-dots-fill"></i> 댓글 수</div></div>
				<div class="mypost">
				<div class="postitle">글 제목</div>
				<div class="postdetail">카테고리 · 작성일 · 조회 · <i class="bi bi-emoji-smile-fill"></i> 좋아요 수 · <i class="bi bi-chat-dots-fill"></i> 댓글 수</div></div>
				<div class="comucate">내가 쓴 댓글<span class="more">더보기 ></span></div>
				<div class="myreply">
				<div class="replytitle">카테고리 · [원문] 본문 제목</div>
				<div class="replydetail">댓글 내용     <span class="like">작성일 · <i class="bi bi-emoji-smile-fill"></i> 좋아요 수</span></div>
				</div>
				<div class="myreply"><div class="replytitle">카테고리 · [원문] 본문 제목</div>
				<div class="replydetail">댓글 내용     <span class="like">작성일 · <i class="bi bi-emoji-smile-fill"></i> 좋아요 수</span></div>
				</div>
				<div class="myreply" style="margin-bottom:50px;"><div class="replytitle">카테고리 · [원문] 본문 제목</div>
				<div class="replydetail">댓글 내용     <span class="like">작성일 · <i class="bi bi-emoji-smile-fill"></i> 좋아요 수</span></div>
				</div>
				</div>
				<!-- 두번째 탭 : 내 정보 -->
				<div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
				<div class="category">내 정보</div>
				<div>
				<div class="box" style="background: #BDBDBD;">
    			<img class="profile" src="/img/defaultProfile.png">
				</div>
				<div class="filebox" align=center style="margin-top:5px;"><label for="image">사진 변경</label><input type="file" name="image" id="image"></div>
				<div class="row1">
				<div class="left">
				<div class="leftc">이름</div>
				<div class="leftc">이메일</div>
				<div class="leftc">휴대전화</div>
				<div class="leftc">닉네임</div>
				</div>
				<div class="right">
				<div class="rightc">홍길동</div>
				<div class="rightc">abc@abc.com</div>
				<div class="rightc"><input type="text" value="010-1234-1234" size=8 maxlength=13 disabled class="editable" name="phone"><span class="modify"><i class="bi bi-pencil-fill"></i></span></div>
				<div class="rightc"><input type="text" value="수박냠냠" size=8 disabled class="editable" name="phone"><span class="modify"><i class="bi bi-pencil-fill"></i></span></div>
				</div>
				<div align=center><a data-bs-toggle="modal" href="#memberOut-toggle" role="button" style="color: #6B54FF;">회원탈퇴</a></div>
				</div>
				</div>
				</div>
				<!--  세번째 탭 : 구매한 재능 -->
				<div class="tab-pane fade" id="v-pills-talent1" role="tabpanel" aria-labelledby="v-pills-talent1-tab">
				<div class="category">구매한 재능</div>
				<div class="class">
				<div class="classdate">2022.6.28<button class="goReview">리뷰 남기기</button></div>
				<div class="row2">
				<div class="left2">
				<img class="classimg" src="/img/class1.png">
				</div>
				<div class="right2">
				<div class="classrow3">1차 카테고리</div>
				<div class="classrow4">클래스명 · <span class="creator">크리에이터명</span></div>
				<div class="classrow5">결제일자 : 2022.05.20    ·   금액 : 50,400원</div>
				</div>
				</div>
				</div>
				<div class="class">
				<div class="classdate">2022.6.28<button class="goReview">리뷰 남기기</button></div>
				<div class="row2">
				<div class="left2">
				<img class="classimg" src="/img/class1.png">
				</div>
				<div class="right2">
				<div class="classrow3">1차 카테고리</div>
				<div class="classrow4">클래스명 · <span class="creator">크리에이터명</span></div>
				<div class="classrow5">결제일자 : 2022.05.20    ·   금액 : 50,400원</div>
				</div>
				</div>
				</div>
				<div class="class">
				<div class="classdate">2022.6.28<button class="goReview">리뷰 남기기</button></div>
				<div class="row2">
				<div class="left2">
				<img class="classimg" src="/img/class1.png">
				</div>
				<div class="right2">
				<div class="classrow3">1차 카테고리</div>
				<div class="classrow4">클래스명 · <span class="creator">크리에이터명</span></div>
				<div class="classrow5">결제일자 : 2022.05.20    ·   금액 : 50,400원</div>
				</div>
				</div>
				</div>
				</div>
				<!-- 네번째 탭 : 좋아요한 재능 -->
				<div class="tab-pane fade" id="v-pills-talent2" role="tabpanel" aria-labelledby="v-pills-talent2-tab">
				<div class="category">좋아요한 재능</div>
				<div class="class">
				<div class="classdate">2022.6.28<button class="goReview">리뷰 남기기</button></div>
				<div class="row2">
				<div class="left2">
				<img class="classimg" src="/img/class1.png">
				</div>
				<div class="right2">
				<div class="classrow3">1차 카테고리</div>
				<div class="classrow4">클래스명 · <span class="creator">크리에이터명</span></div>
				<div class="classrow5">결제일자 : 2022.05.20    ·   금액 : 50,400원</div>
				</div>
				</div>
				</div>
				<div class="class">
				<div class="classdate">2022.6.28<button class="goReview">리뷰 남기기</button></div>
				<div class="row2">
				<div class="left2">
				<img class="classimg" src="/img/class1.png">
				</div>
				<div class="right2">
				<div class="classrow3">1차 카테고리</div>
				<div class="classrow4">클래스명 · <span class="creator">크리에이터명</span></div>
				<div class="classrow5">결제일자 : 2022.05.20    ·   금액 : 50,400원</div>
				</div>
				</div>
				</div>
				<div class="class">
				<div class="classdate">2022.6.28<button class="goReview">리뷰 남기기</button></div>
				<div class="row2">
				<div class="left2">
				<img class="classimg" src="/img/class1.png">
				</div>
				<div class="right2">
				<div class="classrow3">1차 카테고리</div>
				<div class="classrow4">클래스명 · <span class="creator">크리에이터명</span></div>
				<div class="classrow5">결제일자 : 2022.05.20    ·   금액 : 50,400원</div>
				</div>
				</div>
				</div>
				</div>
				<!-- 다섯번째 탭 등록한 재능 -->
				<div class="tab-pane fade" id="v-pills-talent3" role="tabpanel" aria-labelledby="v-pills-talent3-tab">
				<div class="category">등록한 재능</div>
				<div id="goaddclass" align=right><a href="#" style="color:#9381FF;">재능 등록하러 가기</a></div>
				<div class="class">
				<div class="classdate"><span class="regdate">등록 일자</span>2022.6.28</div>
				<div class="row2">
				<div class="left3">
				<img class="classimg" src="/img/class1.png">
				</div>
				<div class="center3">
				<div class="classrow6">1차 카테고리</div>
				<div class="classrow7">클래스명</div>
				<div class="classrow8">일정 : 2022.05.01 - 2022.06.20(10회) · 금액 : 50,400원</div>
				<div class="classrow9">회차 : 1회차 · 수강 신청 인원 : 48명 · 별점 및 리뷰 : 4.75/5 (리뷰 27건)</div>
				</div>
				<div class="right3"><img class="viewclass" src="/img/rightBtn.png"></div>
				</div>
				</div>
				<div class="class">
				<div class="classdate"><span class="regdate">등록 일자</span>2022.6.28</div>
				<div class="row2">
				<div class="left3">
				<img class="classimg" src="/img/class1.png">
				</div>
				<div class="center3">
				<div class="classrow6">1차 카테고리</div>
				<div class="classrow7">클래스명</div>
				<div class="classrow8">일정 : 2022.05.01 - 2022.06.20(10회) · 금액 : 50,400원</div>
				<div class="classrow9">회차 : 1회차 · 수강 신청 인원 : 48명 · 별점 및 리뷰 : 4.75/5 (리뷰 27건)</div>
				</div>
				<div class="right3"><img class="viewclass" src="/img/rightBtn.png"></div>
				</div>
				</div>
				<div class="class">
				<div class="classdate"><span class="regdate">등록 일자</span>2022.6.28</div>
				<div class="row2">
				<div class="left3">
				<img class="classimg" src="/img/class1.png">
				</div>
				<div class="center3">
				<div class="classrow6">1차 카테고리</div>
				<div class="classrow7">클래스명</div>
				<div class="classrow8">일정 : 2022.05.01 - 2022.06.20(10회) · 금액 : 50,400원</div>
				<div class="classrow9">회차 : 1회차 · 수강 신청 인원 : 48명 · 별점 및 리뷰 : 4.75/5 (리뷰 27건)</div>
				</div>
				<div class="right3"><img class="viewclass" src="/img/rightBtn.png"></div>
				</div>
				</div>
				</div>
				<!-- 등록한 강의 상세보기 -->
				<div class="tab-pane fade" id="v-pills-classdetail" role="tabpanel" aria-labelledby="v-pills-classdetail-tab">
				<div class="category">등록한 재능</div>
				<div style="font-size:20px; margin-left:30px; margin-top:30px; margin-bottom:30px;">강의 상세 내역</div>
				<div class="categories">수강 신청 현황</div>
				<div class="categories">평가 현황</div>
				<div class="categories">판매 현황</div>
				</div>
				<div class="tab-pane fade" id="v-pills-talent4" role="tabpanel" aria-labelledby="v-pills-talent4-tab">탭3-4</div>
				<div class="tab-pane fade" id="v-pills-community1" role="tabpanel" aria-labelledby="v-pills-community1-tab">탭4-1</div>
				<div class="tab-pane fade" id="v-pills-community2" role="tabpanel" aria-labelledby="v-pills-community2-tab">탭4-2</div>
			</div>
		</div>
  </div>
  <jsp:include page="/WEB-INF/views/member/memberOut.jsp" />
  <jsp:include page="/WEB-INF/views/common/loginModal.jsp" />
  <jsp:include page="/WEB-INF/views/common/pNav.jsp" />
  <jsp:include page="/WEB-INF/views/common/footer.jsp" />
  </div>
</body>
<script>
// window.location.href;
// location.href;
//  document.URL; 사이트 주소불러오는 방법들
$('#memberOutOk-toggle').on('hidden.bs.modal', function () {
  location.href="/";
})

let siteUrl = window.location.href.split("#"); // #을 기준으로 사이트 주소를 나눠서 siteUrl  배열타입 변수에 저장   siteUrl[1]에 활성화 해야할 문자가 들어있음
let tab1 = $("#v-pills-home-tab");
let tab2 = $("#v-pills-profile-tab");
let tab3 = $("#v-pills-talent1-tab");
let tab4 = $("#v-pills-talent2-tab");
let tab5 = $("#v-pills-talent3-tab");
let tab6 = $("#v-pills-talent4-tab");
let tab7 = $("#v-pills-community1-tab");
let tab8 = $("#v-pills-community2-tab");
let tab9 = $("#v-pills-classdetail-tab");

let tab1_contents = $("#v-pills-home");
let tab2_contents = $("#v-pills-profile");
let tab3_contents = $("#v-pills-talent1");
let tab4_contents = $("#v-pills-talent2");
let tab5_contents = $("#v-pills-talent3");
let tab6_contents = $("#v-pills-talent4");
let tab7_contents = $("#v-pills-community1");
let tab8_contents = $("#v-pills-community2");
let tab9_contents = $("#v-pills-classdetail");

if (siteUrl[1] == 'home-tab') {
  tab1.addClass('active');
  tab2.removeClass('active');
  tab3.removeClass('active');
  tab4.removeClass('active');
  tab5.removeClass('active');
  tab6.removeClass('active');
  tab7.removeClass('active');
  tab8.removeClass('active');

  tab1_contents.addClass('show active');
  tab2_contents.removeClass('show active');
  tab3_contents.removeClass('show active');
  tab4_contents.removeClass('show active');
  tab5_contents.removeClass('show active');
  tab6_contents.removeClass('show active');
  tab7_contents.removeClass('show active');
  tab8_contents.removeClass('show active');
}
else if (siteUrl[1] == 'profile-tab') {
  tab1.removeClass('active');
  tab2.addClass('active');
  tab3.removeClass('active');
  tab4.removeClass('active');
  tab5.removeClass('active');
  tab6.removeClass('active');
  tab7.removeClass('active');
  tab8.removeClass('active');

  tab1_contents.removeClass('show active');
  tab2_contents.addClass('show active');
  tab3_contents.removeClass('show active');
  tab4_contents.removeClass('show active');
  tab5_contents.removeClass('show active');
  tab6_contents.removeClass('show active');
  tab7_contents.removeClass('show active');
  tab8_contents.removeClass('show active');
}
else if (siteUrl[1] == 'talent1-tab') {
  tab1.removeClass('active');
  tab2.removeClass('active');
  tab3.addClass('active');
  tab4.removeClass('active');
  tab5.removeClass('active');
  tab6.removeClass('active');
  tab7.removeClass('active');
  tab8.removeClass('active');
  
  tab1_contents.removeClass('show active');
  tab2_contents.removeClass('show active');
  tab3_contents.addClass('show active');
  tab4_contents.removeClass('show active');
  tab5_contents.removeClass('show active');
  tab6_contents.removeClass('show active');
  tab7_contents.removeClass('show active');
  tab8_contents.removeClass('show active');
}
else if (siteUrl[1] == 'talent2-tab') {
	  tab1.removeClass('active');
	  tab2.removeClass('active');
	  tab3.removeClass('active');
	  tab4.addClass('active');
	  tab5.removeClass('active');  
	  tab6.removeClass('active');
	  tab7.removeClass('active');
	  tab8.removeClass('active');

	  tab1_contents.removeClass('show active');
	  tab2_contents.removeClass('show active');
	  tab4_contents.addClass('show active');
	  tab5_contents.removeClass('show active');
	  tab3_contents.removeClass('show active');
	  tab6_contents.removeClass('show active');
	  tab7_contents.removeClass('show active');
	  tab8_contents.removeClass('show active');
	}
else if (siteUrl[1] == 'talent3-tab') {
	  tab1.removeClass('active');
	  tab2.removeClass('active');
	  tab3.removeClass('active');
	  tab4.removeClass('active');
	  tab5.addClass('active');
	  tab6.removeClass('active');
	  tab7.removeClass('active');
	  tab8.removeClass('active');

	  tab1_contents.removeClass('show active');
	  tab2_contents.removeClass('show active');
	  tab3_contents.removeClass('show active');
	  tab4_contents.removeClass('show active');
	  tab5_contents.addClass('show active');
	  tab6_contents.removeClass('show active');
	  tab7_contents.removeClass('show active');
	  tab8_contents.removeClass('show active');
	}
else if (siteUrl[1] == 'talent4-tab') {
	  tab1.removeClass('active');
	  tab2.removeClass('active');
	  tab3.removeClass('active');
	  tab4.removeClass('active');
	  tab5.removeClass('active');
	  tab6.addClass('active');
	  tab7.removeClass('active');
	  tab8.removeClass('active');

	  tab1_contents.removeClass('show active');
	  tab2_contents.removeClass('show active');
	  tab3_contents.removeClass('show active');
	  tab4_contents.removeClass('show active');
	  tab5_contents.removeClass('show active');
	  tab6_contents.addClass('show active');  
	  tab7_contents.removeClass('show active');
	  tab8_contents.removeClass('show active');
	}
else if (siteUrl[1] == 'community1-tab') {
	  tab1.removeClass('active');
	  tab2.removeClass('active');
	  tab3.removeClass('active');
	  tab4.removeClass('active');
	  tab5.removeClass('active');
	  tab6.removeClass('active');
	  tab7.addClass('active');
	  tab8.removeClass('active');
	  
	  tab1_contents.removeClass('show active');
	  tab2_contents.removeClass('show active');
	  tab3_contents.removeClass('show active');
	  tab4_contents.removeClass('show active');
	  tab5_contents.removeClass('show active');
	  tab6_contents.removeClass('show active');
	  tab7_contents.addClass('show active');
	  tab8_contents.removeClass('show active');
	}
else if (siteUrl[1] == 'community2-tab') {
	  tab1.removeClass('active');
	  tab2.removeClass('active');
	  tab3.removeClass('active');
	  tab4.removeClass('active');
	  tab5.removeClass('active');
	  tab6.removeClass('active');
	  tab7.removeClass('active');
	  tab8.addClass('active');
	  
	  tab1_contents.removeClass('show active');
	  tab2_contents.removeClass('show active');
	  tab3_contents.removeClass('show active');
	  tab4_contents.removeClass('show active');
	  tab5_contents.removeClass('show active');
	  tab6_contents.removeClass('show active');
	  tab7_contents.removeClass('show active');
	  tab8_contents.addClass('show active');	  
	}
else if (siteUrl[1] == 'classdetail-tab') {
	  tab1.removeClass('active');
	  tab2.removeClass('active');
	  tab3.removeClass('active');
	  tab4.removeClass('active');
	  tab5.removeClass('active');
	  tab6.removeClass('active');
	  tab7.removeClass('active');
	  tab8.removeClass('active');
	  tab9.addClass('active');
	  
	  tab1_contents.removeClass('show active');
	  tab2_contents.removeClass('show active');
	  tab3_contents.removeClass('show active');
	  tab4_contents.removeClass('show active');
	  tab5_contents.removeClass('show active');
	  tab6_contents.removeClass('show active');
	  tab7_contents.removeClass('show active');
	  tab8_contents.removeClass('show active');
	  tab9_contents.addClass('show active');	  
	}

// 부트스트랩 탭메뉴 버그 방지  
tab1.on('click',function(){
  tab2.removeClass('active');
  tab3.removeClass('active');
  tab4.removeClass('active');
  tab5.removeClass('active');
  tab6.removeClass('active');
  tab7.removeClass('active');
  tab8.removeClass('active');
  const All_Details = document.querySelectorAll('details');
  All_Details.forEach(deet=>{
      deet.open = false
    });
  window.scrollTo({top:0, left:0, behavior:'auto'})
})
tab2.on('click',function(){
  tab1.removeClass('active');
  tab3.removeClass('active');
  tab4.removeClass('active');
  tab5.removeClass('active');
  tab6.removeClass('active');
  tab7.removeClass('active');
  tab8.removeClass('active');
  const All_Details = document.querySelectorAll('details');
  All_Details.forEach(deet=>{
      deet.open = false
    });
  window.scrollTo({top:0, left:0, behavior:'auto'})
})
tab3.on('click',function(){
  tab1.removeClass('active');
  tab2.removeClass('active');
  tab4.removeClass('active');
  tab5.removeClass('active');
  tab6.removeClass('active');
  tab7.removeClass('active');
  tab8.removeClass('active');
  window.scrollTo({top:0, left:0, behavior:'auto'})
})
tab4.on('click',function(){
  tab1.removeClass('active');
  tab2.removeClass('active');
  tab3.removeClass('active');
  tab5.removeClass('active');
  tab6.removeClass('active');
  tab7.removeClass('active');
  tab8.removeClass('active');
  window.scrollTo({top:0, left:0, behavior:'auto'})
})
tab5.on('click',function(){
  tab1.removeClass('active');
  tab2.removeClass('active');
  tab3.removeClass('active');
  tab4.removeClass('active');
  tab6.removeClass('active');
  tab7.removeClass('active');
  tab8.removeClass('active');
  tab5_contents.addClass('show active');
  window.scrollTo({top:0, left:0, behavior:'auto'})
})
tab6.on('click',function(){
  tab1.removeClass('active');
  tab2.removeClass('active');
  tab3.removeClass('active');
  tab4.removeClass('active');
  tab5.removeClass('active');
  tab7.removeClass('active');
  tab8.removeClass('active');
  window.scrollTo({top:0, left:0, behavior:'auto'})
})
tab7.on('click',function(){
  tab1.removeClass('active');
  tab2.removeClass('active');
  tab3.removeClass('active');
  tab4.removeClass('active');
  tab5.removeClass('active');
  tab6.removeClass('active'); 
  tab8.removeClass('active');
  window.scrollTo({top:0, left:0, behavior:'auto'})
})
tab8.on('click',function(){
  tab1.removeClass('active');
  tab2.removeClass('active');
  tab3.removeClass('active');
  tab4.removeClass('active');
  tab5.removeClass('active');
  tab6.removeClass('active'); 
  tab7.removeClass('active');
  window.scrollTo({top:0, left:0, behavior:'auto'})
})
$(".viewclass").on('click',function(){
	 tab1.removeClass('active');
	 tab2.removeClass('active');
	 tab3.removeClass('active');
	 tab4.removeClass('active');
	 tab6.removeClass('active');
	 tab7.removeClass('active');
	 tab8.removeClass('active');
	 
	 tab1_contents.removeClass('show active');
	 tab2_contents.removeClass('show active');
	 tab3_contents.removeClass('show active');
	 tab4_contents.removeClass('show active');
	 tab5_contents.removeClass('show active');
	 tab6_contents.removeClass('show active');
	 tab7_contents.removeClass('show active');
	 tab8_contents.removeClass('show active');
	 tab9_contents.addClass('show active');
	 window.scrollTo({top:0, left:0, behavior:'auto'}) 
})

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

$("#toinfo").on('click',function(){
	tab1.removeClass('active');
	  tab2.addClass('active');
	  tab3.removeClass('active');
	  tab4.removeClass('active');
	  tab5.removeClass('active');
	  tab6.removeClass('active');
	  tab7.removeClass('active');
	  tab8.removeClass('active');

	  tab1_contents.removeClass('show active');
	  tab2_contents.addClass('show active');
	  tab3_contents.removeClass('show active');
	  tab4_contents.removeClass('show active');
	  tab5_contents.removeClass('show active');
	  tab6_contents.removeClass('show active');
	  tab7_contents.removeClass('show active');
	  tab8_contents.removeClass('show active');
	  window.scrollTo({top:0, left:0, behavior:'auto'})
	})
	
	$("#totalent").on('click',function(){
		  document.getElementById("talent").open = true;
		  tab1.removeClass('active');
		  tab2.removeClass('active');
		  tab3.addClass('active');
		  tab4.removeClass('active');
		  tab5.removeClass('active');
		  tab6.removeClass('active');
		  tab7.removeClass('active');
		  tab8.removeClass('active');
		  		  
		  tab1_contents.removeClass('show active');
		  tab2_contents.removeClass('show active');
		  tab3_contents.addClass('show active');
		  tab4_contents.removeClass('show active');
		  tab5_contents.removeClass('show active');
		  tab6_contents.removeClass('show active');
		  tab7_contents.removeClass('show active');
		  tab8_contents.removeClass('show active');
		  
		  window.scrollTo({top:0, left:0, behavior:'auto'})
		  
	})
	
	$("#tocommunity").on('click',function(){
		  document.getElementById("community").open = true;
		  tab1.removeClass('active');
		  tab2.removeClass('active');
		  tab3.removeClass('active');
		  tab4.removeClass('active');
		  tab5.removeClass('active');
		  tab6.removeClass('active');
		  tab7.addClass('active');
		  tab8.removeClass('active');
		  
		  tab1_contents.removeClass('show active');
		  tab2_contents.removeClass('show active');
		  tab3_contents.removeClass('show active');
		  tab4_contents.removeClass('show active');
		  tab5_contents.removeClass('show active');
		  tab6_contents.removeClass('show active');
		  tab7_contents.addClass('show active');
		  tab8_contents.removeClass('show active'); 
		  window.scrollTo({top:0, left:0, behavior:'auto'})
	})
	
	$(".modify").on('click',function(){
		$(this).siblings(".editable").removeAttr("disabled");
		$(this).siblings(".editable").focus();
		$(this).closest(".rightc").siblings().find(".modify").css("display","none");	
	})
	
	 $('#image').on('change', function() {
        
        ext = $(this).val().split('.').pop().toLowerCase(); //확장자
        
        //배열에 추출한 확장자가 존재하는지 체크
        if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
            resetFormElement($(this)); //폼 초기화
            window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
        } else {
            file = $('#image').prop("files")[0];
            blobURL = window.URL.createObjectURL(file);
            $('.box img').attr('src', blobURL);
            $('.box').slideDown(); //업로드한 이미지 미리보기 
            $(this).slideUp(); //파일 양식 감춤
        }
    });
    
</script>
</html>