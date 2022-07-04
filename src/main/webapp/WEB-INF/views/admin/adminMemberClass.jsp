
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
			<div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
<!--첫번째 탭 : 회원정보 -->
				<a href="/admin/adminMain/#adminMember-tab" class="tapUrl firstDepthTab">
					<button class="nav-link active" id="v-pills-adminMember-tab" data-bs-toggle="pill" data-bs-target="#v-pills-adminMember" type="button" role="tab" aria-controls="v-pills-adminMember" aria-selected="true">회원정보관리</button>
				</a>
<!--두번째 탭 : 신고관리 -->
				<details>
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
				<a href="/class/write"tapUrl firstDepthTab"> <button class="nav-link" id="v-pills-dashBoard-tab" data-bs-toggle="pill" data-bs-target="#v-pills-dashBoard" type="button" role="tab" aria-controls="v-pills-dashBoard" aria-selected="false">대시보드</button>
				</a>
			</div>
<!-- 탭 페이지 -->
			<div class="tab-content" id="v-pills-tabContents">
<!-- 탭 페이지 : 회원 클래스 목록 -->
				<div id="classBtns">
					<button class="classBtn active" id="classBtn1">구매한 재능</button>
					<button class="classBtn" id="classBtn2">등록한 재능</button>
					<button class="classBtn" id="classBtn3">좋아요한 재능</button>
					<button class="classBtn" id="classBtn4">작성한 리뷰</button>		
				</div>
				<div id="section1">
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
				<div id="section2">
					<div>
						2번
					</div>
				</div>
				<div id="section3">
					<div>3번</div>
				</div>
				<div id="section4">
					<div>
						4번
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/pNav.jsp" />
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
		$("#classBtn1").on("click",function(){
			$("#classBtn1").addClass("active");
			$("#classBtn2").removeClass("active");
			$("#classBtn3").removeClass("active");
			$("#classBtn4").removeClass("active");
			
			$("#section1").css("display","block");
			$("#section2").css("display","none");
			$("#section3").css("display","none");
			$("#section4").css("display","none");
		})
		$("#classBtn2").on("click",function(){
			$("#classBtn1").removeClass("active");
			$("#classBtn2").addClass("active");
			$("#classBtn3").removeClass("active");
			$("#classBtn4").removeClass("active");
			
			$("#section1").css("display","none");
			$("#section2").css("display","block");
			$("#section3").css("display","none");
			$("#section4").css("display","none");
		})
		$("#classBtn3").on("click",function(){			
			$("#classBtn1").removeClass("active");
			$("#classBtn2").removeClass("active");
			$("#classBtn3").addClass("active");
			$("#classBtn4").removeClass("active");
			
			$("#section1").css("display","none");
			$("#section2").css("display","none");
			$("#section3").css("display","block");
			$("#section4").css("display","none");
		})
		$("#classBtn4").on("click",function(){
			$("#classBtn1").removeClass("active");
			$("#classBtn2").removeClass("active");
			$("#classBtn3").removeClass("active");
			$("#classBtn4").addClass("active");
			
			$("#section1").css("display","none");
			$("#section2").css("display","none");
			$("#section3").css("display","none");
			$("#section4").css("display","block");
		})
	</script>
</body>
</html>    	
