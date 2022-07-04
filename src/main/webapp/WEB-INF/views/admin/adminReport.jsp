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
<link rel="stylesheet" href="/css/sideTab.css">
<link rel="stylesheet" href="/css/admin/adminMember.css">
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/pNav.jsp" />


	<div class="container">
		<div id="adminHeader">관리자 페이지</div>
		<hr id="boundaryLine">
		<div class="d-flex align-items-start">
			<div class="nav flex-column nav-pills" id="v-pills-tab"
				role="tablist" aria-orientation="vertical">

				<a href="#home-tab"><button class="nav-link active"
						id="v-pills-home-tab" data-bs-toggle="pill"
						data-bs-target="#v-pills-home" type="button" role="tab"
						aria-controls="v-pills-home" aria-selected="true">회원정보관리</button></a>
				<a href="#profile-tab"><button class="nav-link "
						id="v-pills-profile-tab" data-bs-toggle="pill"
						data-bs-target="#v-pills-profile" type="button" role="tab"
						aria-controls="v-pills-profile" aria-selected="false">
						<details>
							<summary>신고관리</summary>
							<ul>
								<li>신고목록</li>
								<li>블랙리스트</li>
							</ul>
						</details>
					</button></a> <a href="#contact-tab"><button class="nav-link"
						id="v-pills-messages-tab" data-bs-toggle="pill"
						data-bs-target="#v-pills-messages" type="button" role="tab"
						aria-controls="v-pills-messages" aria-selected="false">대시보드</button></a>
			</div>
			<div class="tab-content" id="v-pills-tabContents">
				<div class="tab-pane fade show active " id="v-pills-home"
					role="tabpanel" aria-labelledby="v-pills-home-tab">
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
						<div id="pagination">1 2 3 4 5 6</div>
					</div>
				</div>
				<div class="tab-pane fade" id="v-pills-profile" role="tabpanel"
					aria-labelledby="v-pills-profile-tab">신고관리</div>
				<div class="tab-pane fade" id="v-pills-messages" role="tabpanel"
					aria-labelledby="v-pills-messages-tab">대시보드</div>

			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/pNav.jsp" />
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>