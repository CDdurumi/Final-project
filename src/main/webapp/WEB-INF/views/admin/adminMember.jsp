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
<link rel="stylesheet" href="/css/admin/adminMember.css">
<link rel="stylesheet" href="/css/admin/adminCommon.css">
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/pNav.jsp" />


	<div class="container mainContent">
		<div id="adminHeader">관리자 페이지</div>
		<hr id="boundaryLine">
		<div class="d-flex align-items-start">
<!-- 				사이드 탭        ----------------------------->
			<div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
<!-- 				첫번째 탭 : 회원정보----------------------------->
				<a href="#adminMember-tab">
				<button class="nav-link active" id="v-pills-adminMember-tab" data-bs-toggle="pill" data-bs-target="#v-pills-adminMember" type="button" role="tab" aria-controls="v-pills-adminMember" aria-selected="true">회원정보관리</button></a>
<!-- 				두번째 탭 : 신고관리----------------------------->
				<details>
					<summary class="navi-link">신고관리</summary>
					<ul>
						<li class="reLi"><a href="#report1-tab">
						<button class="nav-link sub" id="v-pills-report1-tab" data-bs-toggle="pill" data-bs-target="#v-pills-report1" type="button" role="tab" aria-controls="v-pills-report1" aria-selected="false">
								<div>신고목록<div></div></button></a></li>
						<li class="reLi"><a href="#report2-tab">
						<button class="nav-link sub" id="v-pills-report2-tab" data-bs-toggle="pill" data-bs-target="#v-pills-report2" type="button" role="tab" aria-controls="v-pills-report2" aria-selected="false">
								<div>블랙리스트<div></div></button></a></li>
					</ul>
				</details>
<!-- 				세번째 탭 : 대시보드----------------------------->
				<a href="#dashBoard-tab">
					<button class="nav-link" id="v-pills-dashBoard-tab" data-bs-toggle="pill" data-bs-target="#v-pills-dashBoard" type="button" role="tab" aria-controls="v-pills-dashBoard" aria-selected="false">대시보드
					</button></a>
			</div>
<!-- 				탭 내용 ------------------------------------->
			<div class="tab-content" id="v-pills-tabContents">
				<div class="tab-pane fade show active " id="v-pills-adminMember" role="tabpanel" aria-labelledby="v-pills-adminMember-tab">
					<div id="adminMemberContainer" class="row pc-ver-list">
						<div id="adminMember" class='col-12'>회원 정보 관리</div>
						<div id="searchBox" class="col-12">
							<select id="searchSelect">
								<option value="회원번호">회원번호</option>
								<option value="이메일">이메일</option>
								<option value="성명">성명</option>
								<option value="닉네임">닉네임</option>
							</select> <input type="text" id="adminMemberSearch"
								placeholder="원하는 회원 검색"> <input type="button" value="검색"
								id="searchvalueBtn">
						</div>
						<div id="adminMemberList">
							<div class="row" id="listHeaderContainer">
								<div class="col-1 listHeader" id="member_seq">번호</div>
								<div class="col-3 listHeader">이메일</div>
								<div class="col-1 listHeader">성명</div>
								<div class="col-2 listHeader">닉네임</div>
								<div class="col-2 listHeader">회원등급</div>
								<div class="col-1 listHeader">신고수</div>
								<div class="col-2 listHeader">개설강의수</div>
							</div>
							<div class="row" id="listContainer">
								<div class="col-1 listName" id="member_seq">1</div>
								<div class="col-3 listName">nay199@naver.com</div>
								<div class="col-1 listName">노아영</div>
								<div class="col-2 listName">제리제리</div>
								<div class="col-2 listName">블랙리스트</div>
								<div class="col-1 listName">100</div>
								<div class="col-2 listName">12</div>
							</div>
							<div class="row" id="listContainer">
								<div class="col-1 listName" id="member_seq">1</div>
								<div class="col-3 listName">nay199@naver.com</div>
								<div class="col-1 listName">노아영</div>
								<div class="col-2 listName">제리제리</div>
								<div class="col-2 listName">블랙리스트</div>
								<div class="col-1 listName">100</div>
								<div class="col-2 listName">12</div>
							</div>
							<div class="row" id="listContainer">
								<div class="col-1 listName" id="member_seq">1</div>
								<div class="col-3 listName">nay199@naver.com</div>
								<div class="col-1 listName">노아영</div>
								<div class="col-2 listName">제리제리</div>
								<div class="col-2 listName">블랙리스트</div>
								<div class="col-1 listName">100</div>
								<div class="col-2 listName">12</div>
							</div>
							<div class="row" id="listContainer">
								<div class="col-1 listName" id="member_seq">1</div>
								<div class="col-3 listName">nay199@naver.com</div>
								<div class="col-1 listName">노아영</div>
								<div class="col-2 listName">제리제리</div>
								<div class="col-2 listName">블랙리스트</div>
								<div class="col-1 listName">100</div>
								<div class="col-2 listName">12</div>
							</div>



						</div>
						<div id="pagination">1 2 3 4 5 6 7 8 9 10 Next ></div>
					</div>
				</div>
				<div class="tab-pane fade" id="v-pills-report1" role="tabpanel"
					aria-labelledby="v-pills-report1-tab">신고관리</div>
				<div class="tab-pane fade" id="v-pills-report2" role="tabpanel"
					aria-labelledby="v-pills-report2-tab">블랙리스트</div>
				<div class="tab-pane fade" id="v-pills-dashBoard" role="tabpanel"
					aria-labelledby="v-pills-dashBoard-tab">대시보드</div>

			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/pNav.jsp" />
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
			// window.location.href;
			// location.href;
			//  document.URL; 사이트 주소불러오는 방법들

			let siteUrl = window.location.href.split("#"); // #을 기준으로 사이트 주소를 나눠서 siteUrl  배열타입 변수에 저장   siteUrl[1]에 활성화 해야할 문자가 들어있음
			console.log(window.location.href);
			console.log(siteUrl);
			let tab1 = $("#v-pills-adminMember-tab");
			let tab2 = $("#v-pills-report1-tab");
			let tab3 = $("#v-pills-report2-tab");
			let tab4 = $("#v-pills-dashBoard-tab");

			let tab1_contents = $("#v-pills-adminMember");
			let tab2_contents = $("#v-pills-report");
			let tab3_contents = $("#v-pills-report2");
			let tab4_contents = $("#v-pills-dashBoard");

			if (siteUrl[1] == 'adminMember-tab') {
				tab1.addClass('active');
				tab2.removeClass('active');
				tab3.removeClass('active');
				tab4.removeClass('active');

				tab1_contents.addClass('show active');
				tab2_contents.removeClass('show active');
				tab3_contents.removeClass('show active');
				tab4_contents.removeClass('show active');
			} else if (siteUrl[1] == 'report1-tab') {
				tab1.removeClass('active');
				tab2.addClass('active');
				tab3.removeClass('active');
				tab4.removeClass('active');

				tab1_contents.removeClass('show active');
				tab2_contents.addClass('show active');
				tab3_contents.removeClass('show active');
				tab4_contents.removeClass('show active');
			} else if (siteUrl[1] == 'report2-tab') {
				tab1.removeClass('active');
				tab2.removeClass('active');
				tab3.addClass('active');
				tab4.removeClass('active');

				tab1_contents.removeClass('show active');
				tab2_contents.addClass('show active');
				tab3_contents.addClass('show active');
				tab4_contents.removeClass('show active');
			}else if(siteUrl[1] == 'dashBoard-tab'){
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
			tab1.on('click', function() {
				tab2.removeClass('active');
				tab3.removeClass('active');
				tab4.removeClass('active');
			})
			tab2.on('click', function() {
				tab1.removeClass('active');
				tab3.removeClass('active');
				tab4.removeClass('active');
			})
			tab3.on('click', function() {
				tab1.removeClass('active');
				tab2.removeClass('active');
				tab4.removeClass('active');
			})
			
			tab4.on('click', function() {
				tab1.removeClass('active');
				tab2.removeClass('active');
				tab3.removeClass('active');
			})
		</script>
</body>
</html>