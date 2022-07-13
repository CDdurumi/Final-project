
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
<link rel="stylesheet" href="/css/admin/adminBlackListMember.css">
</head>
<body>




	<div class="container mainContent">

		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<jsp:include page="/WEB-INF/views/common/pNav.jsp" />
		<div id="adminHeader">관리자 페이지</div>
		<hr id="boundaryLine">
		<!-- 가로 탭 -->		
			<ul class="nav nav-pills nav-justified d-flex d-md-none" id="v-pills-tab2">
				<li class="nav-item"><a href="/admin/adminMain/#adminMember-tab"><button class="nav-link tabs2" id="v-pills-adminMember-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-adminMember" type="button" role="tab" aria-controls="v-pills-adminMember" aria-selected="true">회원정보</button></a></li>
				<li id="cate1" class="nav-item"><details id="hDetail">
						<summary style="padding: 0px; font-size: 14px; margin-bottom: 20px;">신고관리</summary>
						<ul  class="subMenu">
							<li><a href="/admin/adminMain/#report1-tab"><button class="nav-link tabs2" id="v-pills-report1-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-report1" type="button" role="tab" aria-controls="v-pills-report1" aria-selected="true" style="color: #666666;">신고목록</button></a></li>
							<li><a href="/admin/adminMain/#report2-tab"><button class="nav-link tabs2 active" id="v-pills-report2-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-report2" type="button" role="tab" aria-controls="v-pills-report2" aria-selected="true" style="color: #666666;">블랙리스트</button></a></li>
						</ul>
					</details></li>
				<li class="nav-item"><a href="/admin/adminMain/#dashBoard"><button class="nav-link tabs2" id="v-pills-dashBoard-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-dashBoard" type="button" role="tab" aria-controls="v-pills-adminMember" aria-selected="true">대시보드</button></a></li>
			</ul>
		<div class="d-flex align-items-start">
		<div class="d-flex align-items-start">
			<!-- 사이드 탭-->
			<div class="nav flex-column nav-pills d-none d-md-flex" id="v-pills-tab"
				role="tablist" aria-orientation="vertical">
				<!--첫번째 탭 : 회원정보 -->
				<a href="/admin/adminMain/#adminMember-tab"
					class="tapUrl firstDepthTab">
					<button class="nav-link" id="v-pills-adminMember-tab"
						data-bs-toggle="pill" data-bs-target="#v-pills-adminMember"
						type="button" role="tab" aria-controls="v-pills-adminMember"
						aria-selected="true">회원정보관리</button>
				</a>
				<!--두번째 탭 : 신고관리 -->
				<details open id="vDetail">
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
								<button class="nav-link sub  active" id="v-pills-report2-tab"
									data-bs-toggle="pill" data-bs-target="#v-pills-report2"
									type="button" role="tab" aria-controls="v-pills-report2"
									aria-selected="false">
									<div>블랙리스트</div>
								</button>
						</a></li>
					</ul>
				</details>
				<!--세번째 탭 : 대시보드 -->
				<a href="/admin/adminMain/#dashBoard" tapUrlfirstDepthTab">
					<button class="nav-link" id="v-pills-dashBoard-tab"
						data-bs-toggle="pill" data-bs-target="#v-pills-dashBoard"
						type="button" role="tab" aria-controls="v-pills-dashBoard"
						aria-selected="false">대시보드</button>
				</a>
			</div>
			<!-- 탭 페이지 -->
			<div class="tab-content" id="v-pills-tabContents">
				<!-- 탭 페이지 : 회원정보 상세 -->
				<div class="tab-pane fade show active" id="v-pills-home"
					role="tabpanel" aria-labelledby="v-pills-home-tab"
					style="width: 100%;">
					<!-- 회원 정보 -->
					<div class="category">
						회원 정보<img id="toinfo" class="btns" src="/img/rightBtn2.png">
					</div>
					<div>
						<div class="box" style="background: #BDBDBD;">
							<c:choose>
								<c:when test="${dto.profile_img != null}">
									<img class="profile" src="/img/defaultProfile.png">
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
								<div class="rightc">김제리</div>
								<div class="rightc">jerrykim@naver.com</div>
								<div class="rightc">010-0000-0000</div>
								<div class="rightc">제리제리</div>
							</div>
						</div>
					</div>
					<div style="clear: both;"></div>
					<!-- 회원 신고현황 -->
					<div class="category">
						신고현황 : 총 00건<img id="toReportList1" class="btns"
							src="/img/rightBtn2.png">
					</div>
					<div id="memberReportSum">
						<div id="memberReportOutline">
							<div class="row" id="sumHead">
								<div class="col-3">합계</div>
								<div class="col-3">게시글</div>
								<div class="col-3">댓글</div>
								<div class="col-3">리뷰</div>
							</div>
							<div class="row" id="sumMain">
								<div class="col-3">00건</div>
								<div class="col-3">00건</div>
								<div class="col-3">00건</div>
								<div class="col-3">00건</div>
							</div>
						<span id="rejectedReport">반려 : 00 건</span>
						</div>
						<div class="reportList">
						<div class="subTitle row">
						<div>신고 받은 목록 <span id="toReportList2" class="more">더보기 ></span></div>
						</div>
							<div class="row reportListHeaderContainer">
								<div class="reportListHeader">
									<div class="col-1 reportListHeader">번호</div>
									<div class="col-5 reportListHeader">제목</div>
									<div class="col-3 reportListHeader">작성자</div>
									<div class="col-3 reportListHeader">신고자</div>
								</div>
							</div>
							<div class="reportListContainer">
								<div  class="row">
									<div class="col-1 reportListName center">1</div>
									<div class="col-5 reportListName">신고신고신ㅅ</div>
									<div class="col-3 reportListName">nay199@naver.com</div>
									<div class="col-3 reportListName">nay199@naver.com</div>
									<div class="col-7 reportListName center" id="reportReason">부적절한 홍보게시판</div>
									<div class="col-5 reportListName">신고일 : 22/06/22</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/pNav.jsp" />
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
		$("#toReportList1").on('click', function() {
			location.href = "/admin/memberReportList";
		})

		
		$("#toReportList2").on("click", function() {
			location.href = "/admin/memberReportList";
		})
	</script>
</body>
</html>
