
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
<!-- 부트스트랩  -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<!-- css -->
<link rel="stylesheet" href="/css/admin/adminCommon.css">
<link rel="stylesheet" href="/css/admin/adminMember.css">
<!-- <link rel="stylesheet" href="/css/member/myPage.css"> -->
</head>

<body>

	<div class="container mainContent">

		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<jsp:include page="/WEB-INF/views/common/pNav.jsp" />

		<div id="adminHeader">관리자 페이지</div>
		<hr id="boundaryLine">
		<!-- 가로 탭 -->
		<ul class="nav nav-pills nav-justified d-flex d-md-none"
			id="v-pills-tab2">
			<li class="nav-item"><a href="/admin/adminMain/#adminMember-tab"><button
						class="nav-link tabs2  active" id="v-pills-adminMember-tab2"
						data-bs-toggle="pill" data-bs-target="#v-pills-adminMember"
						type="button" role="tab" aria-controls="v-pills-adminMember"
						aria-selected="true" style="border-bottom:4px solid #9381ff">회원정보</button></a></li>
			<li id="cate1" class="nav-item"><details id="hDetail">
					<summary
						style="padding: 0px; font-size: 14px; margin-bottom: 20px;">신고관리</summary>
					<ul class="subMenu">
						<li><a href="/admin/adminMain/#report1-tab"><button
									class="nav-link tabs2" id="v-pills-report1-tab2"
									data-bs-toggle="pill" data-bs-target="#v-pills-report1"
									type="button" role="tab" aria-controls="v-pills-report1"
									aria-selected="true" style="color: #666666;">신고목록</button></a></li>
						<li><a href="/admin/adminMain/#report2-tab"><button
									class="nav-link tabs2" id="v-pills-report2-tab2"
									data-bs-toggle="pill" data-bs-target="#v-pills-report2"
									type="button" role="tab" aria-controls="v-pills-report2"
									aria-selected="true" style="color: #666666;">블랙리스트</button></a></li>
					</ul>
				</details></li>
			<li class="nav-item"><a href="/admin/adminMain/#dashBoard"><button
						class="nav-link tabs2" id="v-pills-dashBoard-tab2"
						data-bs-toggle="pill" data-bs-target="#v-pills-dashBoard"
						type="button" role="tab" aria-controls="v-pills-adminMember"
						aria-selected="true">대시보드</button></a></li>
		</ul>
		<div class="d-flex align-items-start">
			<!-- 사이드 탭-->
			<div class="nav flex-column nav-pills  d-none d-md-flex"
				id="v-pills-tab" role="tablist" aria-orientation="vertical">
				<!--첫번째 탭 : 회원정보 -->
				<a href="/admin/adminMain/#adminMember-tab"
					class="tapUrl firstDepthTab">
					<button class="nav-link active" id="v-pills-adminMember-tab"
						data-bs-toggle="pill" data-bs-target="#v-pills-adminMember"
						type="button" role="tab" aria-controls="v-pills-adminMember"
						aria-selected="true">회원정보관리</button>
				</a>
				<!--두번째 탭 : 신고관리 -->
				<details id="vDetail">
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
				<a href="/admin/adminMain/#dashBoard" >
					<button class="nav-link" id="v-pills-dashBoard-tab"
						data-bs-toggle="pill" data-bs-target="#v-pills-dashBoard"
						type="button" role="tab" aria-controls="v-pills-dashBoard"
						aria-selected="false">대시보드</button>
				</a>
			</div>
			<!--가로 탭 : (depth2)클래스 관련 탭 -->
			<div class="tab-contents" id="v-pills-tabContents">

				<div class="tab-content">


				<div id="classBtns" class="btnForPc">
					<div class="classBtnWrapper ">
						<a class="nav-link" href="/admin/memberClassTap1?email=${classDetail.CREATER_ID}#section1-tab"><button
								class="classBtn" id="section1-tab-btn">구매한 클래스</button></a>
					</div>
					<div class="classBtnWrapper">
						<a class="nav-link" href="/admin/memberClassTap1?email=${classDetail.CREATER_ID}#section2-tab"><button
								class="classBtn" id="section2-tab-btn">찜한 클래스</button></a>
					</div>
					<div class="classBtnWrapper">
						<a class="nav-link" href="/admin/memberClassTap1?email=${classDetail.CREATER_ID}#section3-tab"><button
								class="classBtn  active" id="section3-tab-btn">오픈한 클래스</button></a>
					</div>
					<div class="classBtnWrapper">
						<a class="nav-link" href="/admin/memberClassTap1?email=${classDetail.CREATER_ID}#section4-tab"><button
								class="classBtn" id="section4-tab-btn">작성한 리뷰</button></a>
					</div>
				</div>
				<div class="row" style="text-align:center">
					<div class="classBtnWrapper col-5 d-lg-none">
						<a class="nav-link" href="/admin/memberClassTap1?email=${classDetail.CREATER_ID}#section1-tab"><button
								class="classBtn" id="section1-tab-btn">구매한 클래스</button></a>
					</div>
					<div class="classBtnWrapper col-5 d-lg-none">
						<a class="nav-link" href="/admin/memberClassTap1?email=${classDetail.CREATER_ID}#section2-tab"><button
								class="classBtn" id="section2-tab-btn">찜한 클래스</button></a>
					</div>
					<div class="classBtnWrapper col-5 d-lg-none">
						<a class="nav-link" href="/admin/memberClassTap1?email=${classDetail.CREATER_ID}#section3-tab"><button
								class="classBtn  active" id="section3-tab-btn">오픈한 클래스</button></a>
					</div>
					<div class="classBtnWrapper col-5 d-lg-none">
						<a class="nav-link" href="/admin/memberClassTap1?email=${classDetail.CREATER_ID}#section4-tab"><button
								class="classBtn" id="section4-tab-btn">작성한 리뷰</button></a>
					</div>
				</div>

					<!-- 등록한 강의 상세보기 -->
					<div class="tab-pane fade active show" id="v-pills-classdetail" role="tabpanel"
						aria-labelledby="v-pills-classdetail-tab">
						<div class="category">오픈한 클래스 상세</div>
						<div
							style="font-size: 20px; width: 90%; margin: auto; margin-top: 30px; margin-bottom: 30px;">강의
							상세 내역</div>
						<div class="categories">수강 신청 현황</div>
						<div class="detailrow1">
							<div class="detailleft">클래스 제목</div>
							<div class="detailright">${classDetail.TITLE}	
							<c:if test="${classDetail.STATE==2}"><span style='font-size:0.7em;'>   (신고로 인한 삭제처리)</span></c:if>
							<c:if test="${classDetail.STATE!=2}">
							<a href='/class/detail?class_seq=${classDetail.CLASS_SEQ}'>
							<span style='font-size:0.7em;color:red;'> 바로가기 > </span>
							</a>
							</c:if>
							</div>
						</div>
						<div class="detailrow1">
							<div class="detailleft">수강 인원</div>
							<div class="detailright">${classDetail.NSTD_COUNT} 명</div>
						</div>
						<div class="detailrow2">
							<div class="detailleft">수강생</div>
							<div class="detailright2">
								<div class="detailbox">
								
								<c:forEach var="s" items="${classStd}">
									<div class="detailrow3">
										<span class="detaildate">
										${s.REG_DATE}
										</span>${s.NAME} <span style="font-size:0.7em;color:#666666">(${s.STATE}/	
										<fmt:formatNumber value="${s.PRICE}" pattern="#,###" />원 결제)<span>
									</div>
								</c:forEach>
								</div>
							</div>
						</div>
						<div class="categories">평가 현황</div>
						<div class="detailrow1">
							<div class="detailleft">별점</div>
							<div class="detailright">${classDetail.NAVGSTAR}점 / 5점</div>
						</div>
						<div class="detailrow1">
							<div class="detailleft">리뷰 건수</div>
							<div class="detailright">${classDetail.NREVIEW_COUNT}건</div>
						</div>
						<div class="detailrow2">
							<div class="detailleft">리뷰 목록</div>
							<div class="detailright2">
								<div class="detailbox">
									<c:forEach var="r" items="${classReview}">
										<div class="detailrow4">
											<div class="row4up">
												<i class="bi bi-star-fill"></i> ${r.STARS }점 · ${r.CONTENTS}
											</div>
											<div class="row4down">${r.WRITE_DATE} · ${r.NICKNAME}</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="categories">판매 현황</div>
						<div class="detailrow1">
							<div class="detailleft">판매 금액</div>
							<div class="detailright">
							<fmt:formatNumber value="${classDetail.PRICE}" pattern="#,###" />원</div>
						</div>
						<div class="detailrow1">
							<div class="detailleft">누적 금액</div>
							<div class="detailright"><fmt:formatNumber value="${classDetail.NEARN}" pattern="#,###" />원</div>
						</div>
						<div style="clear: both;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
			console.log(JSON.parse(${classDetail}))
	</script>
<%-- 	<jsp:include page="/WEB-INF/views/common/pNav.jsp" /> --%>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
