
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

<!-- 메인의 신고리스트를 가져왔으므로 해당 css 파일도 공유 -->
<link rel="stylesheet" href="/css/admin/adminMain_ReportList.css">
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
							<li><a href="/admin/adminMain/#report1-tab"><button class="nav-link tabs2 " id="v-pills-report1-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-report1" type="button" role="tab" aria-controls="v-pills-report1" aria-selected="true" style="color: #666666;">신고목록</button></a></li>
							<li><a href="/admin/adminMain/#report2-tab"><button class="nav-link tabs2 active" id="v-pills-report2-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-report2" type="button" role="tab" aria-controls="v-pills-report2" aria-selected="true" style="color: #666666;">블랙리스트</button></a></li>
						</ul>
					</details></li>
				<li class="nav-item"><a href="/admin/adminMain/#dashBoard"><button class="nav-link tabs2" id="v-pills-dashBoard-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-dashBoard" type="button" role="tab" aria-controls="v-pills-adminMember" aria-selected="true">대시보드</button></a></li>
			</ul>
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
				<details id="vDetail" open>
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
								<button class="nav-link sub active" id="v-pills-report2-tab"
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
			<!-- 탭 페이지 -->
			<div class="tab-content" id="v-pills-tabContents">
				<!-- 탭 페이지 : 회원정보 상세 -->
				<div class="tab-pane fade show active" id="reportListWrapper"
					role="tabpanel">
					<div class="reportTitle col-12" id="reportTitle">제리제리님의 신고 현황</div>
					<div id="reportDetail">총 00 건의 신고 기록이 있습니다.</div>
					<!-- 신고관리 카테고리 분류 -->
					<div class="reportHeaderBox memberReportList" class="row">
						<div class="reportFilterBox col-5">
							<select id="reportFilter1" class="reportFilter">
								<option value="게시글">게시글</option>
								<option value="댓글">댓글</option>
								<option value="리뷰">리뷰</option>
							</select> <select id="reportFilter2" class="reportFilter">
								<option>클래스</option>
								<option>커뮤니티</option>
							</select>
						</div>
						<div class="reportSearchBox col-7">
							<select id="reportFilter3" class="reportFilter">
								<option value="작성자">작성자</option>
								<option value="제목">제목</option>
								<option value="내용">내용</option>
							</select> <input type="text" id="report1_Search"> <input
								type="button" value="검색" class="reportSearchBtn">
						</div>
					</div>
					<div id="memberReportSum">
						<div class="row reportListsumHead" id="sumHead">
							<div class="col-3">합계</div>
							<div class="col-3">게시글</div>
							<div class="col-3">댓글</div>
							<div class="col-3">리뷰</div>
						</div>
						<div class="row reportListsumHead" id="sumMain">
							<div class="col-3">00건</div>
							<div class="col-3">00건</div>
							<div class="col-3">00건</div>
							<div class="col-3">00건</div>
						</div>
						<span> 반려된 건 : 00 건</span>

						<div id="reportContainer" class="row pc-ver-list detail">
							<div class="reportList memberReportList" id=reportMemberList">
								<div class="row reportListHeaderContainer detail">
									<div class="reportListHeader reportListHeaderLeft">
										<input type="checkBox" id="reportList1AllCheck">
									</div>
									<div class="reportListHeaderRight">
										<div class="col-1 reportListHeader detail">번호</div>
										<div class="col-5 reportListHeader detail">제목</div>
										<div class="col-3 reportListHeader detail">작성자</div>
										<div class="col-3 reportListHeader detail">신고자</div>
										<!-- 									<div class="col-2 reportListHeader">신고일자</div> -->
									</div>
								</div>
								<div class="reportListContainer">
									<div class="reportListName reportListLeft detail center">
										<input type="checkBox" class="listCheck">
									</div>
									<div class="reportListRight row">
										<div class="col-1 reportListName  detail center">1</div>
										<div class="col-5 reportListName  detail">신고신고신ㅅ</div>
										<div class="col-3 reportListName  detail">nay199@naver.com</div>
										<div class="col-3 reportListName  detail">nay199@naver.com</div>
										<div class="col-7 reportListName  detail center" id="reportReason">부적절한
											홍보게시판</div>
										<div class="col-5 reportListName detail">신고일 : 22/06/22</div>
									</div>
								</div>
							</div>
							<div class="selectBtnsBottom col-12">
								<!-- adminMain-Repor.css -->
								<button class="selectBtn" id="selectBtn1">신고반려</button>
								<button class="selectBtn" id="selectBtn2">선택삭제</button>
								<button class="selectBtn" id="selectBtn2">모두삭제</button>
							</div>
							<div class="page">1 2 3 4 5 6 7 8 9 10 Next ></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/pNav.jsp" />
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
		$("#totalent").on('click', function() {
			location.href = "/admin/memberClass"
		})

		$("#tocommunity").on("click", function() {
			location.href = "/admin/memberCommunity"
		})
	</script>
</body>
</html>
