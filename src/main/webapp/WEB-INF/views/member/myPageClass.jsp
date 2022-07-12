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
				<li class="nav-item"><a href="/myPage/main#home-tab"><button class="nav-link tabs2" id="v-pills-home-tab2">홈</button></a></li>
				<li class="nav-item"><a href="/myPage/main#profile-tab"><button class="nav-link tabs2" id="v-pills-profile-tab2">내 정보</button></a></li>
				<li id="cate1" class="nav-item"><details id="talent1">
						<summary style="padding: 0px; font-size: 14px; margin-bottom: 20px;">클래스</summary>
						<ul>
							<li><a href="/myPage/main#talent1-tab"><button class="nav-link tabs2" id="v-pills-talent1-tab2" style="color: #666666;">구매한 클래스</button></a></li>
							<li><a href="/myPage/main#talent2-tab"><button class="nav-link tabs2" id="v-pills-talent2-tab2" style="color: #666666;">좋아요한 클래스</button></a></li>
							<li><a href="/myPage/main#talent3-tab"><button class="nav-link tabs2" id="v-pills-talent3-tab2" style="color: #666666;">오픈한 클래스</button></a></li>
							<li><a href="/myPage/main#talent4-tab"><button class="nav-link tabs2" id="v-pills-talent4-tab2" style="color: #666666;">작성한 리뷰</button></a></li>
						</ul>
					</details></li>
				<li id="cate2" class="nav-item"><details id="community1">
						<summary style="padding: 0px; font-size: 14px; margin-bottom: 20px;">커뮤니티</summary>
						<ul>
							<li><a href="#community1-tab"><button class="nav-link tabs2" id="v-pills-community1-tab2" style="color: #666666;">내가 쓴 글</button></a></li>
							<li><a href="#community2-tab"><button class="nav-link tabs2" id="v-pills-community2-tab2" style="color: #666666;">내가 쓴 댓글</button></a></li>
						</ul>
					</details></li>
			</ul>
			<div class="d-flex align-items-start">
				<div class="nav flex-column nav-pills me-3 d-none d-md-flex" id="v-pills-tab" role="tablist" aria-orientation="vertical">
					<a href="/myPage/main#home-tab">
						<button class="nav-link tabs" id="v-pills-home-tab">홈</button>
					</a> <a href="/myPage/main#profile-tab">
						<button class="nav-link tabs" id="v-pills-profile-tab">내 정보</button>
					</a>
					<details id="talent" open>
						<summary>클래스</summary>
						<ul>
							<a href="/myPage/main#talent1-tab">
								<button class="nav-link tabs" id="v-pills-talent1-tab">
									<li class="myli">구매한 클래스</li>
								</button>
							</a>
							<a href="/myPage/main#talent2-tab">
								<button class="nav-link tabs" id="v-pills-talent2-tab">
									<li class="myli">좋아요한 클래스</li>
								</button>
							</a>
							<a href="/myPage/main#talent3-tab">
								<button class="nav-link tabs" id="v-pills-talent3-tab" style="border-bottom: 4px solid #9381ff;">
									<li class="myli">오픈한 클래스</li>
								</button>
							</a>
							<a href="/myPage/main#talent4-tab">
								<button class="nav-link tabs" id="v-pills-talent4-tab">
									<li class="myli">작성한 리뷰</li>
								</button>
							</a>
						</ul>
					</details>
					<details id="community">
						<summary style="margin-top: 5px;">커뮤니티</summary>
						<ul>
							<a href="/myPage/main#community1-tab">
								<button class="nav-link tabs" id="v-pills-community1-tab">
									<li class="myli">내가 쓴 글</li>
								</button>
							</a>
							<a href="/myPage/main#community2-tab">
								<button class="nav-link tabs" id="v-pills-community2-tab">
									<li class="myli">내가 쓴 댓글</li>
								</button>
							</a>
						</ul>
					</details>
				</div>
				<!-- 오픈한 강의 상세보기 -->
				<div style="width: 100%;">
					<div>
						<div class="category">오픈한 클래스</div>
						<div style="font-size: 20px; width: 90%; margin: auto; margin-top: 30px; margin-bottom: 30px;">강의 상세 내역</div>
						<div class="categories">수강 신청 현황</div>
						<div class="detailrow1">
							<div class="detailleft">클래스 제목</div>
							<div class="detailright">${classinfo[0].title}</div>
						</div>
						<div class="detailrow1">
							<div class="detailleft">수강 인원</div>
							<div class="detailright">${fn:length(regiinfo)}명</div>
						</div>
						<div class="detailrow2">
							<div class="detailleft">수강생 목록</div>
							<div class="detailright2">
								<div class="detailbox">
									<c:forEach var="i" items="${regiinfo}">
										<div class="detailrow3">
											<span class="detaildate"><fmt:formatDate value="${i.reg_date}" type="both" pattern="yyyy-MM-dd" /></span>${i.std_id}
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="categories">평가 현황</div>
						<div class="detailrow1">
							<div class="detailleft">별점</div>
							<c:set var="total" value="0" />
							<c:forEach var="i" items="${classreview}">
								<c:set var="total" value="${total + i.stars}" />
							</c:forEach>
							<div class="detailright">
								<c:choose>
									<c:when test="${fn:length(classreview) != 0}">
										<span class="starCountImg"><input type=hidden value="${total / fn:length(classreview)}"></span>
										<span class="starrate">(${total / fn:length(classreview)}점/5점)</span>
									</c:when>
									<c:otherwise>(0점/5점)</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div class="detailrow1">
							<div class="detailleft">리뷰 건수</div>
							<div class="detailright">${fn:length(classreview)}건</div>
						</div>
						<div class="detailrow2">
							<div class="detailleft">리뷰 목록</div>
							<div class="detailright2">
								<div class="detailbox">
									<c:forEach var="i" items="${classreview}">
										<div class="detailrow4">
											<div class="row4up">
												<i class="bi bi-star-fill"></i> ${i.stars}점 · ${i.contents}
											</div>
											<div class="row4down">
												<fmt:formatDate value="${i.write_date}" type="both" pattern="yyyy-MM-dd" />
												· ${i.std_id}
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="categories">판매 현황</div>
						<div class="detailrow1">
							<div class="detailleft">판매 금액</div>
							<div class="detailright"><fmt:formatNumber value="${classinfo[0].price}" groupingUsed="true"/>원</div>
						</div>
						<div class="detailrow1">
							<div class="detailleft">누적 판매 금액</div>
							<div class="detailright"><fmt:formatNumber value="${fn:length(regiinfo) * classinfo[0].price}" groupingUsed="true"/>원</div>
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

	//별점
	$('.starCountImg').each(function(index, item) {
		let star = "<i class='bi bi-star'></i>";
		let half = "<i class='bi bi-star-half'></i>";
		let fill = "<i class='bi bi-star-fill'></i>";

		let classTotalStar = $(this).children("input").val();
		console.log(classTotalStar);
		let stars = "";

		if (classTotalStar < 0.5) {
			stars = star + star + star + star + star;
		} else if (classTotalStar < 1) {
			stars = half + star + star + star + star;
		} else if (classTotalStar < 1.5) {
			stars = fill + star + star + star + star;
		} else if (classTotalStar < 2) {
			stars = fill + half + star + star + star;
		} else if (classTotalStar < 2.5) {
			stars = fill + fill + star + star + star;
		} else if (classTotalStar < 3) {
			stars = fill + fill + half + star + star;
		} else if (classTotalStar < 3.5) {
			stars = fill + fill + fill + star + star;
		} else if (classTotalStar < 4) {
			stars = fill + fill + fill + half + star;
		} else if (classTotalStar < 4.5) {
			stars = fill + fill + fill + fill + star;
		} else if (classTotalStar < 5) {
			stars = fill + fill + fill + fill + half;
		} else if (classTotalStar == 5) {
			stars = fill + fill + fill + fill + fill;
		}

		$(this).prepend(stars);
	});
</script>
</html>