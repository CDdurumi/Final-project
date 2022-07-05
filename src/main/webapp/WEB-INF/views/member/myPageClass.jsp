<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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

/*   div {   */
/*   	border: 1px solid crimson;   */
/*   }   */
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="contents">
			<div id="pageHeader">
				마이페이지<br>
				<hr>
			</div>
			<ul class="nav nav-pills nav-justified d-flex d-md-none" id="v-pills-tab2">
				<li class="nav-item"><a href="#home-tab"><button class="nav-link tabs2" id="v-pills-home-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">홈</button></a></li>
				<li class="nav-item"><a href="#profile-tab"><button class="nav-link tabs2" id="v-pills-profile-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">내 정보</button></a></li>
				<li id="cate1" class="nav-item"><details id="talent1">
						<summary style="padding: 0px; font-size: 14px; margin-bottom: 20px;">클래스</summary>
						<ul>
							<li><a href="#talent1-tab"><button class="nav-link tabs2" id="v-pills-talent1-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-talent1" type="button" role="tab" aria-controls="v-pills-talent1" aria-selected="false" style="color: #666666;">구매한 클래스</button></a></li>
							<li><a href="#talent2-tab"><button class="nav-link tabs2" id="v-pills-talent2-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-talent2" type="button" role="tab" aria-controls="v-pills-talent2" aria-selected="false" style="color: #666666;">좋아요한 클래스</button></a></li>
							<li><a href="#talent3-tab"><button class="nav-link tabs2" id="v-pills-talent3-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-talent3" type="button" role="tab" aria-controls="v-pills-talent3" aria-selected="false" style="color: #666666;">등록한 클래스</button></a></li>
							<li><a href="#talent4-tab"><button class="nav-link tabs2" id="v-pills-talent4-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-talent4" type="button" role="tab" aria-controls="v-pills-talent4" aria-selected="false" style="color: #666666;">작성한 리뷰</button></a></li>
						</ul>
					</details></li>
				<li id="cate2" class="nav-item"><details id="community1">
						<summary style="padding: 0px; font-size: 14px; margin-bottom: 20px;">커뮤니티</summary>
						<ul>
							<li><a href="#community1-tab"><button class="nav-link tabs2" id="v-pills-community1-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-community1" type="button" role="tab" aria-controls="v-pills-community1" aria-selected="false" style="color: #666666;">내가 쓴 글</button></a></li>
							<li><a href="#community2-tab"><button class="nav-link tabs2" id="v-pills-community2-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-community2" type="button" role="tab" aria-controls="v-pills-community2" aria-selected="false" style="color: #666666;">내가 쓴 댓글</button></a></li>
						</ul>
					</details></li>
			</ul>
			<div class="d-flex align-items-start">
				<div class="nav flex-column nav-pills me-3 d-none d-md-flex" id="v-pills-tab" role="tablist" aria-orientation="vertical">
					<a href="#home-tab">
						<button class="nav-link tabs" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">홈</button>
					</a> <a href="#profile-tab">
						<button class="nav-link tabs" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">내 정보</button>
					</a>
					<details id="talent">
						<summary>클래스</summary>
						<ul>
							<a href="#talent1-tab">
								<button class="nav-link tabs" id="v-pills-talent1-tab" data-bs-toggle="pill" data-bs-target="#v-pills-talent1" type="button" role="tab" aria-controls="v-pills-talent1" aria-selected="false">
									<li class="myli">구매한 클래스</li>
								</button>
							</a>
							<a href="#talent2-tab">
								<button class="nav-link tabs" id="v-pills-talent2-tab" data-bs-toggle="pill" data-bs-target="#v-pills-talent2" type="button" role="tab" aria-controls="v-pills-talent2" aria-selected="false">
									<li class="myli">좋아요한 클래스</li>
								</button>
							</a>
							<a href="#talent3-tab">
								<button class="nav-link tabs" id="v-pills-talent3-tab" data-bs-toggle="pill" data-bs-target="#v-pills-talent3" type="button" role="tab" aria-controls="v-pills-talent3" aria-selected="false">
									<li class="myli">등록한 클래스</li>
								</button>
							</a>
							<a href="#talent4-tab">
								<button class="nav-link tabs" id="v-pills-talent4-tab" data-bs-toggle="pill" data-bs-target="#v-pills-talent4" type="button" role="tab" aria-controls="v-pills-talent4" aria-selected="false">
									<li class="myli">작성한 리뷰</li>
								</button>
							</a>
						</ul>
					</details>
					<details id="community">
						<summary style="margin-top: 5px;">커뮤니티</summary>
						<ul>
							<a href="#community1-tab">
								<button class="nav-link tabs" id="v-pills-community1-tab" data-bs-toggle="pill" data-bs-target="#v-pills-community1" type="button" role="tab" aria-controls="v-pills-community1" aria-selected="false">
									<li class="myli">내가 쓴 글</li>
								</button>
							</a>
							<a href="#community2-tab">
								<button class="nav-link tabs" id="v-pills-community2-tab" data-bs-toggle="pill" data-bs-target="#v-pills-community2" type="button" role="tab" aria-controls="v-pills-community2" aria-selected="false">
									<li class="myli">내가 쓴 댓글</li>
								</button>
							</a>
						</ul>
					</details>
				</div>
				<!-- 등록한 강의 상세보기 -->
				<div class="tab-content" id="v-pills-tabContent" style="width: 100%;">
					<div class="tab-pane" id="v-pills-classdetail">
						<div class="category">등록한 클래스</div>
						<div style="font-size: 20px; width: 90%; margin: auto; margin-top: 30px; margin-bottom: 30px;">강의 상세 내역</div>
						<div class="categories">수강 신청 현황</div>
						<div class="detailrow1">
							<div class="detailleft">클래스 제목</div>
							<div class="detailright">이모티콘 작가와 함께, 쉽게 배우는 이모티콘</div>
						</div>
						<div class="detailrow1">
							<div class="detailleft">수강 인원</div>
							<div class="detailright">48명</div>
						</div>
						<div class="detailrow2">
							<div class="detailleft">수강생 목록</div>
							<div class="detailright2">
								<div class="detailbox">
									<div class="detailrow3">
										<span class="detaildate">2022-06-01</span>이지은
									</div>
									<div class="detailrow3">
										<span class="detaildate">2022-06-01</span>이지은
									</div>
									<div class="detailrow3">
										<span class="detaildate">2022-06-01</span>이지은
									</div>
									<div class="detailrow3">
										<span class="detaildate">2022-06-01</span>이지은
									</div>
									<div class="detailrow3">
										<span class="detaildate">2022-06-01</span>이지은
									</div>
									<div class="detailrow3">
										<span class="detaildate">2022-06-01</span>이지은
									</div>
									<div class="detailrow3">
										<span class="detaildate">2022-06-01</span>이지은
									</div>
									<div class="detailrow3">
										<span class="detaildate">2022-06-01</span>이지은
									</div>
								</div>
							</div>
						</div>
						<div class="categories">평가 현황</div>
						<div class="detailrow1">
							<div class="detailleft">별점</div>
							<div class="detailright">4.75점 / 5점</div>
						</div>
						<div class="detailrow1">
							<div class="detailleft">리뷰 건수</div>
							<div class="detailright">27건</div>
						</div>
						<div class="detailrow2">
							<div class="detailleft">리뷰 목록</div>
							<div class="detailright2">
								<div class="detailbox">
									<div class="detailrow4">
										<div class="row4up">
											<i class="bi bi-star-fill"></i> 5점 · 너무 유익했어요
										</div>
										<div class="row4down">2022-06-01 · 이지은</div>
									</div>
									<div class="detailrow4">
										<div class="row4up">
											<i class="bi bi-star-fill"></i> 5점 · 너무 유익했어요
										</div>
										<div class="row4down">2022-06-01 · 이지은</div>
									</div>
									<div class="detailrow4">
										<div class="row4up">
											<i class="bi bi-star-fill"></i> 5점 · 너무 유익했어요
										</div>
										<div class="row4down">2022-06-01 · 이지은</div>
									</div>
									<div class="detailrow4">
										<div class="row4up">
											<i class="bi bi-star-fill"></i> 5점 · 너무 유익했어요
										</div>
										<div class="row4down">2022-06-01 · 이지은</div>
									</div>
									<div class="detailrow4">
										<div class="row4up">
											<i class="bi bi-star-fill"></i> 5점 · 너무 유익했어요
										</div>
										<div class="row4down">2022-06-01 · 이지은</div>
									</div>
									<div class="detailrow4">
										<div class="row4up">
											<i class="bi bi-star-fill"></i> 5점 · 너무 유익했어요
										</div>
										<div class="row4down">2022-06-01 · 이지은</div>
									</div>
									<div class="detailrow4">
										<div class="row4up">
											<i class="bi bi-star-fill"></i> 5점 · 너무 유익했어요
										</div>
										<div class="row4down">2022-06-01 · 이지은</div>
									</div>
								</div>
							</div>
						</div>
						<div class="categories">판매 현황</div>
						<div class="detailrow1">
							<div class="detailleft">판매 금액</div>
							<div class="detailright">50,400원</div>
						</div>
						<div class="detailrow1">
							<div class="detailleft">누적 판매 금액</div>
							<div class="detailright">500,400원</div>
						</div>
						<div style="clear: both;"></div>
					</div>
				</div>
			</div>
			<jsp:include page="/WEB-INF/views/common/loginModal.jsp" />
			<jsp:include page="/WEB-INF/views/common/pNav.jsp" />
			<jsp:include page="/WEB-INF/views/common/footer.jsp" />
		</div>
	</div>
</body>
<script>
</script>
</html>