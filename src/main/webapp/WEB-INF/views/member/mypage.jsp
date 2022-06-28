<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!--  부트스트랩-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!--  부트스트랩-->
<!-- input.css  -->

<!-- 스타일 -->
<style>
@charset "UTF-8";
div {
 border:1px solid crimson;
}

</style>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="/css/mypage.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container">
		<div class="d-flex align-items-start">
			<div class="nav flex-column nav-pills me-3" id="v-pills-tab"
				role="tablist" aria-orientation="vertical">
				<a href="#home-tab">
				<button class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">홈</button></a> 
				<a href="#profile-tab">
				<button class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">내 정보</button></a>
				<a href="#talent-tab">
				<button class="nav-link" id="v-pills-talent-tab" data-bs-toggle="pill" data-bs-target="#v-pills-talent" type="button" role="tab" aria-controls="v-pills-talent" aria-selected="false">
				<details>
        		<summary>재능마켓</summary>
      			  <ul>
           			 <li>구매한 재능</li>
           			 <li>좋아요한 재능</li>
           			 <li>등록한 재능</li>
           			 <li>작성한 리뷰</li>
        			</ul>
     			 </details>
				</button></a>
				<a href="#community-tab">
				<button class="nav-link" id="v-pills-community-tab" data-bs-toggle="pill" data-bs-target="#v-pills-community" type="button" role="tab" aria-controls="v-pills-community" aria-selected="false">
				<details>
        		<summary>커뮤니티</summary>
      			  <ul>
           			 <li>내가 쓴 글</li>
           			 <li>내가 쓴 댓글</li>
        			</ul>
     			 </details>
				</button></a>
			</div>
			<div class="tab-content" id="v-pills-tabContent">
				<div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">탭1</div>
				<div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">탭2</div>
				<div class="tab-pane fade" id="v-pills-talent" role="tabpanel" aria-labelledby="v-pills-talent-tab">탭3</div>
				<div class="tab-pane fade" id="v-pills-community" role="tabpanel" aria-labelledby="v-pills-community-tab">탭4</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
<script>
// window.location.href;
// location.href;
//  document.URL; 사이트 주소불러오는 방법들

let siteUrl = window.location.href.split("#"); // #을 기준으로 사이트 주소를 나눠서 siteUrl  배열타입 변수에 저장   siteUrl[1]에 활성화 해야할 문자가 들어있음
let tab1 = $("#v-pills-home-tab");
let tab2 = $("#v-pills-profile-tab");
let tab3 = $("#v-pills-talent-tab");
let tab4 = $("#v-pills-community-tab");

let tab1_contents = $("#v-pills-home");
let tab2_contents = $("#v-pills-profile");
let tab3_contents = $("#v-pills-talent");
let tab4_contents = $("#v-pills-community");

if (siteUrl[1] == 'home-tab') {
  tab1.addClass('active');
  tab2.removeClass('active');
  tab3.removeClass('active');
  tab4.removeClass('active');

  tab1_contents.addClass('show active');
  tab2_contents.removeClass('show active');
  tab3_contents.removeClass('show active');
  tab4_contents.removeClass('show active');
}
else if (siteUrl[1] == 'profile-tab') {
  tab1.removeClass('active');
  tab2.addClass('active');
  tab3.removeClass('active');
  tab4.removeClass('active');

  tab1_contents.removeClass('show active');
  tab2_contents.addClass('show active');
  tab3_contents.removeClass('show active');
  tab4_contents.removeClass('show active');
}
else if (siteUrl[1] == 'talent-tab') {
  tab1.removeClass('active');
  tab2.removeClass('active');
  tab3.addClass('active');
  tab4.removeClass('active');

  tab1_contents.removeClass('show active');
  tab2_contents.removeClass('show active');
  tab3_contents.addClass('show active');
  tab4_contents.removeClass('show active');
}
else if (siteUrl[1] == 'community-tab') {
	  tab1.removeClass('active');
	  tab2.removeClass('active');
	  tab3.removeClass('active');
	  tab4.addClass('active');
	  
	  tab1_contents.removeClass('show active');
	  tab2_contents.removeClass('show active');
	  tab3_contents.removeClass('show active');
	  tab4_contents.addClass('show active');
	}

// 부트스트랩 탭메뉴 버그 방지  
tab1.on('click',function(){
  tab2.removeClass('active');
  tab3.removeClass('active');
  tab4.removeClass('active');
})
tab2.on('click',function(){
  tab1.removeClass('active');
  tab3.removeClass('active');
  tab4.removeClass('active');
})
tab3.on('click',function(){
  tab1.removeClass('active');
  tab2.removeClass('active');
  tab4.removeClass('active');
})
tab4.on('click',function(){
  tab1.removeClass('active');
  tab2.removeClass('active');
  tab3.removeClass('active');
})
</script>
</html>