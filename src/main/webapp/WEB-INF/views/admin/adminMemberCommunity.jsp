
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="32x32" href="/img/favicon/favicon-32x32.png">
<title>[DOWA] 관리자 페이지</title>
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
				<!-- 가로 탭 -->		
			<ul class="nav nav-pills nav-justified d-flex d-md-none" id="v-pills-tab2">
				<li class="nav-item"><a href="/admin/adminMain/#adminMember-tab"><button class="nav-link tabs2  active" id="v-pills-adminMember-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-adminMember" type="button" role="tab" aria-controls="v-pills-adminMember" aria-selected="true">회원정보</button></a></li>
				<li id="cate1" class="nav-item"><details id="hDetail">
						<summary style="padding: 0px; font-size: 14px; margin-bottom: 20px;">신고관리</summary>
						<ul  class="subMenu">
							<li><a href="/admin/adminMain/#report1-tab"><button class="nav-link tabs2" id="v-pills-report1-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-report1" type="button" role="tab" aria-controls="v-pills-report1" aria-selected="true" style="color: #666666;">신고목록</button></a></li>
							<li><a href="/admin/adminMain/#report2-tab"><button class="nav-link tabs2" id="v-pills-report2-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-report2" type="button" role="tab" aria-controls="v-pills-report2" aria-selected="true" style="color: #666666;">블랙리스트</button></a></li>
						</ul>
					</details></li>
				<li class="nav-item"><a href="/admin/adminMain/#dashBoard"><button class="nav-link tabs2" id="v-pills-dashBoard-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-dashBoard" type="button" role="tab" aria-controls="v-pills-adminMember" aria-selected="true">대시보드</button></a></li>
			</ul>
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
					<div class="classBtnWrapper">
						<a class="nav-link" href="#section1-tab"><button
								class="classBtn communityBtn active" id="section1-tab-btn">제리제리님이 쓴 글</button></a>
					</div>
					<div class="classBtnWrapper">
						<a class="nav-link" href="#section2-tab"><button
								class="classBtn communityBtn" id="section2-tab-btn">제리제리님이 쓴 댓글</button></a>
					</div>
				</div>
				<div class="tab-content">
<!-- 1페이지 : 내가 쓴 글 -->
					<div class="tab-pane fade show active" id="section1-tab">
						<div class="category">제리제리님이 쓴 글</div>
						<div id="totalpost" align=right>작성한 글 : 81건</div>
						<div class="post">
							<div>
								<span class="comucates">일상</span>
							</div>
							<div class="row2">
								<div class="comuup">
									<div class="left5">
										<div class="classrow11">치맥 맛있어용</div>
										<div class="classrow12">와 진짜 대존맛이에여ㅠㅠㅠㅠㅠㅠㅠ저두 먹고싶어여ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ</div>
									</div>
									<div class="right5">
										<img class="comuimg" src="/img/chimac.jpg"><br>
									</div>
									<div class="comudown">
										<div class="classrow13">#해쉬태그1 #해쉬태그2</div>
										<div class="classrow14">
											<i class="bi bi-emoji-smile-fill"></i> 좋아요 수 · <i class="bi bi-chat-dots-fill"></i> 댓글 수<span class="postdate">2022.06.30</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="post">
							<div>
								<span class="comucates">일상</span>
							</div>
							<div class="row2">
								<div class="comuup">
									<div class="left5">
										<div class="classrow11">치맥 맛있어용</div>
										<div class="classrow12">와 진짜 대존맛이에여ㅠㅠㅠㅠㅠㅠㅠ저두 먹고싶어여ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ</div>
									</div>
									<div class="right5">
										<img class="comuimg" src="/img/chimac.jpg"><br>
									</div>
									<div class="comudown">
										<div class="classrow13">#해쉬태그1 #해쉬태그2</div>
										<div class="classrow14">
											<i class="bi bi-emoji-smile-fill"></i> 좋아요 수 · <i class="bi bi-chat-dots-fill"></i> 댓글 수<span class="postdate">2022.06.30</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="post">
							<div>
								<span class="comucates">일상</span>
							</div>
							<div class="row2">
								<div class="comuup">
									<div class="left5">
										<div class="classrow11">치맥 맛있어용</div>
										<div class="classrow12">와 진짜 대존맛이에여ㅠㅠㅠㅠㅠㅠㅠ저두 먹고싶어여ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ</div>
									</div>
									<div class="right5">
										<img class="comuimg" src="/img/chimac.jpg"><br>
									</div>
									<div class="comudown">
										<div class="classrow13">#해쉬태그1 #해쉬태그2</div>
										<div class="classrow14">
											<i class="bi bi-emoji-smile-fill"></i> 좋아요 수 · <i class="bi bi-chat-dots-fill"></i> 댓글 수<span class="postdate">2022.06.30</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="post">
							<div>
								<span class="comucates">일상</span>
							</div>
							<div class="row2">
								<div class="comuup">
									<div class="left5">
										<div class="classrow11">치맥 맛있어용</div>
										<div class="classrow12">와 진짜 대존맛이에여ㅠㅠㅠㅠㅠㅠㅠ저두 먹고싶어여ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ</div>
									</div>
									<div class="right5">
										<img class="comuimg" src="/img/chimac.jpg"><br>
									</div>
									<div class="comudown">
										<div class="classrow13">#해쉬태그1 #해쉬태그2</div>
										<div class="classrow14">
											<i class="bi bi-emoji-smile-fill"></i> 좋아요 수 · <i class="bi bi-chat-dots-fill"></i> 댓글 수<span class="postdate">2022.06.30</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
<!-- 두번째 페이지 : 내가 쓴 댓글 -->
					<div class="tab-pane fade" id="section2-tab">
					<div class="category">제리제리님이 쓴 댓글</div>
						<div id="totalpost" align=right>작성한 댓글 : 136건</div>
						<div class="reply">
							<div class="replyrow1">카테고리 · [원문] 본문 제목</div>
							<div class="replyrow2">댓글 내용</div>
							<div class="replyrow3">
								<span class="like">작성일 · <i class="bi bi-emoji-smile-fill"></i> 좋아요 수
								</span>
							</div>
						</div>
						<div class="reply">
							<div class="replyrow1">카테고리 · [원문] 본문 제목</div>
							<div class="replyrow2">댓글 내용</div>
							<div class="replyrow3">
								<span class="like">작성일 · <i class="bi bi-emoji-smile-fill"></i> 좋아요 수
								</span>
							</div>
						</div>
						<div class="reply">
							<div class="replyrow1">카테고리 · [원문] 본문 제목</div>
							<div class="replyrow2">댓글 내용</div>
							<div class="replyrow3">
								<span class="like">작성일 · <i class="bi bi-emoji-smile-fill"></i> 좋아요 수
								</span>
							</div>
						</div>
						<div class="reply">
							<div class="replyrow1">카테고리 · [원문] 본문 제목</div>
							<div class="replyrow2">댓글 내용</div>
							<div class="replyrow3">
								<span class="like">작성일 · <i class="bi bi-emoji-smile-fill"></i> 좋아요 수
								</span>
							</div>
						</div>
						<div class="reply">
							<div class="replyrow1">카테고리 · [원문] 본문 제목</div>
							<div class="replyrow2">댓글 내용</div>
							<div class="replyrow3">
								<span class="like">작성일 · <i class="bi bi-emoji-smile-fill"></i> 좋아요 수
								</span>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		let siteUrl = window.location.href.split("#").pop();
		let tabs = $(".classBtn"); //세로탭 메뉴들
		let tabs_contents = $(".tab-content").children(); // 컨텐츠틀
		setting(siteUrl); //사이트 접속 초기세팅

		window.onpopstate = function(event) {
			resetTab();
			siteUrl = window.location.href.split("#").pop();
			setting(siteUrl);
		}

		tabs.on("click", function() { //세로탭 메뉴들 전체에 클릭시 이벤트
			resetTab(); //선택된 탭 초기화
			$(this).addClass("active"); //클릭한 탭만 활성
			setTimeout(function() {
				window.scrollTo(0, 0);
			}, 2);
		})

		function setting(siteUrl) {
			if (siteUrl.split("-").length < 2) {
				siteUrl = "section1-tab";
			}

			$("#" + siteUrl + "-btn").addClass("active"); //url에 맞는 탭 활성화      
			tabs_contents.removeClass("show active"); //부트스트랩 탭 컨텐츠 버그방지용 초기화
			$("#" + siteUrl).addClass("show active"); // url에 맞는 컨텐츠 활성화
		}

		function resetTab() { //선택된 탭 초기화
			tabs.removeClass("active");

		}
	</script>
	<jsp:include page="/WEB-INF/views/common/pNav.jsp" />
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
