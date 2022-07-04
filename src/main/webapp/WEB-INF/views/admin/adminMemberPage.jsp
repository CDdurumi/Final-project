
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




	<div class="container mainContent">
	
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/common/pNav.jsp" />
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
				<a href="/class/write"tapUrl firstDepthTab">
					<button class="nav-link" id="v-pills-dashBoard-tab" data-bs-toggle="pill" data-bs-target="#v-pills-dashBoard" type="button" role="tab" aria-controls="v-pills-dashBoard" aria-selected="false">대시보드</button>
				</a>
			</div>
<!-- 탭 페이지 -->
			<div class="tab-content" id="v-pills-tabContents">
<!-- 탭 페이지 : 회원정보 상세 -->
					<div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab" style="width: 100%;">
<!-- 회원 정보 -->						
						<div class="category">
							회원 정보<img id="toinfo" class="btns" src="/img/rightBtn.png">
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
						<div class="category">
							재능<img id="totalent" class="btns" src="/img/rightBtn.png">
						</div>
						<div class="class">
							<div class="classdate">2022.6.28</div>
							<div class="row2">
								<div class="left2">
									<img class="classimg" src="/img/class1.png">
								</div>
								<div class="right2">
									<div class="classrow1">1차 카테고리</div>
									<div class="classrow2">
										클래스명 · <span class="creator">크리에이터명</span>
									</div>
								</div>
							</div>
						</div>
						<div class="class">
							<div class="classdate">2022.6.28</div>
							<div class="row2">
								<div class="left2">
									<img class="classimg" src="/img/class1.png">
								</div>
								<div class="right2">
									<div class="classrow1">1차 카테고리</div>
									<div class="classrow2">
										클래스명 · <span class="creator">크리에이터명</span>
									</div>
								</div>
							</div>
						</div>
						<div style="clear: both;"></div>
<!-- 커뮤니티 -->
						<div class="category">
							커뮤니티<img id="tocommunity" class="btns" src="/img/rightBtn.png">
						</div>
						<div class="comucate">
							내가 쓴 글<span id="tomorepost" class="more">더보기 ></span>
						</div>
						<div class="mypost">
							<div class="postitle">글 제목</div>
							<div class="postdetail">
								카테고리 · 작성일 · 조회 · <i class="bi bi-emoji-smile-fill"></i> 좋아요 수 · <i class="bi bi-chat-dots-fill"></i> 댓글 수
							</div>
						</div>
						<div class="mypost">
							<div class="postitle">글 제목</div>
							<div class="postdetail">
								카테고리 · 작성일 · 조회 · <i class="bi bi-emoji-smile-fill"></i> 좋아요 수 · <i class="bi bi-chat-dots-fill"></i> 댓글 수
							</div>
						</div>
						<div class="mypost">
							<div class="postitle">글 제목</div>
							<div class="postdetail">
								카테고리 · 작성일 · 조회 · <i class="bi bi-emoji-smile-fill"></i> 좋아요 수 · <i class="bi bi-chat-dots-fill"></i> 댓글 수
							</div>
						</div>
						<div class="comucate">
							내가 쓴 댓글<span id="tomorereply" class="more">더보기 ></span>
						</div>
						<div class="myreply">
							<div class="replytitle">카테고리 · [원문] 본문 제목</div>
							<div class="replydetail">
								댓글 내용 <span class="like">작성일 · <i class="bi bi-emoji-smile-fill"></i> 좋아요 수
								</span>
							</div>
						</div>
						<div class="myreply">
							<div class="replytitle">카테고리 · [원문] 본문 제목</div>
							<div class="replydetail">
								댓글 내용 <span class="like">작성일 · <i class="bi bi-emoji-smile-fill"></i> 좋아요 수
								</span>
							</div>
						</div>
						<div class="myreply" style="margin-bottom: 50px;">
							<div class="replytitle">카테고리 · [원문] 본문 제목</div>
							<div class="replydetail">
								댓글 내용 <span class="like">작성일 · <i class="bi bi-emoji-smile-fill"></i> 좋아요 수
								</span>
							</div>
						</div>
					</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/pNav.jsp" />
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
	    $("#totalent").on('click',function(){
			location.href="/admin/memberClass"
	      })	
	</script>
</body>
</html>    	
