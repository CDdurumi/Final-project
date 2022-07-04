
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

	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/pNav.jsp" />


	<div class="container mainContent">
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
				<a href="/class/write"tapUrlfirstDepthTab">
					<button class="nav-link" id="v-pills-dashBoard-tab"
						data-bs-toggle="pill" data-bs-target="#v-pills-dashBoard"
						type="button" role="tab" aria-controls="v-pills-dashBoard"
						aria-selected="false">대시보드</button>
				</a>
			</div>
<!--가로 탭 : (depth2)클래스 관련 탭 -->
			<div class="tab-contents" id="v-pills-tabContents">

				<div id="classBtns">
					<div class="classBtnWrapper"><a class="nav-link" href="#section1-tab"><button
							class="classBtn active" id="section1-tab-btn">구매한 재능</button></a></div> 
					<div class="classBtnWrapper"><a class="nav-link" href="#section2-tab"><button class="classBtn"
							id="section2-tab-btn">등록한 재능</button></a></div> 
					<div class="classBtnWrapper"><a class="nav-link" href="#section3-tab"><button class="classBtn"
							id="section3-tab-btn">좋아요한 재능</button></a></div> 
					<div class="classBtnWrapper"><a class="nav-link" href="#section4-tab"><button class="classBtn"
							id="section4-tab-btn">작성한 리뷰</button></a></div>
				</div>
				<div class="tab-content">
					<div class="tab-pane fade show active" id="section1-tab">
<div class="category">구매한 재능</div>
					<div class="class">
						<div class="classdate">
							2022.6.28
							<button class="goReview">리뷰 남기기</button>
						</div>
						<div class="row2">
							<div class="left2">
								<img class="classimg" src="/img/class1.png">
							</div>
							<div class="right2">
								<div class="classrow3">1차 카테고리</div>
								<div class="classrow4">
									클래스명 · <span class="creator">크리에이터명</span>
								</div>
								<div class="classrow5">결제일자 : 2022.05.20 · 금액 : 50,400원</div>
							</div>
						</div>
					</div>
					<div class="class">
						<div class="classdate">
							2022.6.28
							<button class="goReview">리뷰 남기기</button>
						</div>
						<div class="row2">
							<div class="left2">
								<img class="classimg" src="/img/class1.png">
							</div>
							<div class="right2">
								<div class="classrow3">1차 카테고리</div>
								<div class="classrow4">
									클래스명 · <span class="creator">크리에이터명</span>
								</div>
								<div class="classrow5">결제일자 : 2022.05.20 · 금액 : 50,400원</div>
							</div>
						</div>
					</div>
					<div class="class">
						<div class="classdate">
							2022.6.28
							<button class="goReview">리뷰 남기기</button>
						</div>
						<div class="row2">
							<div class="left2">
								<img class="classimg" src="/img/class1.png">
							</div>
							<div class="right2">
								<div class="classrow3">1차 카테고리</div>
								<div class="classrow4">
									클래스명 · <span class="creator">크리에이터명</span>
								</div>
								<div class="classrow5">결제일자 : 2022.05.20 · 금액 : 50,400원</div>
							</div>
						</div>
					</div>
					</div>
					<div class="tab-pane fade" id="section2-tab">
						<div style="width=100%">2번</div>

					</div>
					<div class="tab-pane fade" id="section3-tab">
						<div>2번</div>
					</div>
					<div class="tab-pane fade" id="section4-tab">
						<div>4번</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/pNav.jsp" />
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
	
	
	let siteUrl = window.location.href.split("#").pop();
	let tabs = $(".classBtn"); //세로탭 메뉴들
	let tabs_contents = $(".tab-content").children(); // 컨텐츠틀
	
	setting(siteUrl); //사이트 접속 초기세팅

	window.onpopstate = function(event){
	      resetTab();
	      siteUrl = window.location.href.split("#").pop();
	      setting(siteUrl);
	}
	
	tabs.on("click",function(){   //세로탭 메뉴들 전체에 클릭시 이벤트
		resetTab(); //선택된 탭 초기화
	    $(this).addClass("active"); //클릭한 탭만 활성
	    window.scrollTo({top:0, left:0, behavior:'auto'});
	    console.log("안먹음?");
	})

	
	function setting(siteUrl){
		if(siteUrl.split("-").length<2){
			siteUrl= "section1-tab";
		}
		
		$("#" + siteUrl + "-btn").addClass("active"); //url에 맞는 탭 활성화      
	      tabs_contents.removeClass("show active"); //부트스트랩 탭 컨텐츠 버그방지용 초기화
	      $("#" + siteUrl).addClass("show active"); // url에 맞는 컨텐츠 활성화
	}
    
	function resetTab(){ //선택된 탭 초기화
    tabs.removeClass("active");
      }

	</script>
</body>
</html>
