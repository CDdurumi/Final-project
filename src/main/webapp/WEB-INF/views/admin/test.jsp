<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<div class="d-flex align-items-start">
			<!-- 사이드 탭-->
			<div class="nav flex-column nav-pills" id="v-pills-tab"
				role="tablist" aria-orientation="vertical">
				<!--첫번째 탭 : 회원정보 -->
				<a href="/admin/adminMain/#adminMember-tab"
					class="tapUrl firstDepthTab">
					<button class="nav-link active" id="v-pills-adminMember-tab"
						data-bs-toggle="pill" data-bs-target="#v-pills-adminMember"
						type="button" role="tab" aria-controls="v-pills-adminMember"
						aria-selected="true">회원정보관리</button>
				</a>
				<!--두번째 탭 : 신고관리 -->
				<details>
					<summary class="navi-link firstDepthTab">신고관리</summary>
					<ul>
						<li class="reLi"><a href="/admin/adminMain/#report1-tab"
							class="tapUrl">
								<button class="nav-link sub" id="v-pills-report1-tab"
									data-bs-toggle="pill" data-bs-target="#v-pills-report1"
									type="button" role="tab" aria-controls="v-pills-report1"
									aria-selected="false">
									<div>신고목록</div>
								</button>
						</a></li>
						<li class="reLi"><a href="/admin/adminMain/#report2-tab"
							class="tapUrl">
								<button class="nav-link sub" id="v-pills-report2-tab"
									data-bs-toggle="pill" data-bs-target="#v-pills-report2"
									type="button" role="tab" aria-controls="v-pills-report2"
									aria-selected="false">
									<div>블랙리스트</div>
								</button>
						</a></li>
					</ul>
				</details>
				<!--세번째 탭 : 대시보드 -->
				<a href="/class/write" tapUrlfirstDepthTab">
					<button class="nav-link" id="v-pills-dashBoard-tab"
						data-bs-toggle="pill" data-bs-target="#v-pills-dashBoard"
						type="button" role="tab" aria-controls="v-pills-dashBoard"
						aria-selected="false">대시보드</button>
				</a>
			</div>
			<div class="sub-tab-content" id="v-pills-tab">
				<!-- 탭 페이지 : 회원 클래스 목록 -->
				<ul class="nav nav-pills nav-justified d-flex" id="v-pills-tab">
					<li class="nav-item"><a href="#section1-tab"><button
								class="nav-link active classBtn" id="v-pills-section1-tab"
								data-bs-toggle="pill" data-bs-target="#v-pills-section1"
								type="button" role="tab">구매한 재능</button></a></li>
					<li class="nav-item"><a href="#section2-tab"><button
								class="nav-link classBtn" id="v-pills-section2-tab"
								data-bs-toggle="pill" data-bs-target="#v-pills-section2"
								type="button" role="tab">좋아요한 재능</button></a></li>
					<li class="nav-item"><a href="#section3-tab"><button
								class="nav-link classBtn" id="v-pills-section3-tab"
								data-bs-toggle="pill" data-bs-target="#v-pills-section3"
								type="button" role="tab">등록한 재능</button></a></li>
					<li class="nav-item"><a href="#section4-tab"><button
								class="nav-link classBtn" id="v-pills-section4-tab"
								data-bs-toggle="pill" data-bs-target="#v-pills-section4"
								type="button" role="tab">작성한 재능</button></a></li>
				</ul>
				<div class="tab-content" id="v-pills-tabContents">
					<div class="tab-pane fade show active " id="v-pills-section1"
						role="tabpanel" aria-labelledby="v-pills-section1-tab"><div>1번</div></div>
					<div class="tab-pane fade show active " id="v-pills-section2"
						role="tabpanel" aria-labelledby="v-pills-section2-tab"><div>2번</div></div>
					<div class="tab-pane fade show active " id="v-pills-section3"
						role="tabpanel" aria-labelledby="v-pills-section3-tab"><div>3번</div></div>
					<div class="tab-pane fade show active " id="v-pills-section4"
						role="tabpanel" aria-labelledby="v-pills-section4-tab"><div>4번</div></div>												
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/pNav.jsp" />
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>

	let siteUrl = window.location.href.split("#").pop();
	let tabs = $(".classBtn"); //세로탭 메뉴들
	let tabs_contents = $("#v-pills-tabContents").children(); // 컨텐츠틀
	
	setting(siteUrl); //사이트 접속 초기세팅
	
	window.onpopstate = function(event){
	      resetTab();
	      siteUrl = window.location.href.split("#").pop();
	      setting(siteUrl);
	}
	taps.on("click",function(){
		resetTap();
		$(this).children().addClass("active");
	})
	
	function setting(siteUrl){
		if(siteUrl.split("-").length<2){
			siteUrl= "section-1";
		}
		
		$("#v-pills-"+siteUrl+"").addClass("active"); //url에 맞는 탭 활성화      
	      tabs_contents.removeClass("show active"); //부트스트랩 탭 컨텐츠 버그방지용 초기화
	      $("#v-pills-"+siteUrl.split("-").shift()+"").addClass("show active"); // url에 맞는 컨텐츠 활성화
		console.log(siteUrl.split("-").shift());
	}
    
	function resetTab(){ //선택된 탭 초기화
    tabs.children().removeClass("active");
      }
    
	</script>
</body>
</html>
