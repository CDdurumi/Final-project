<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

/*  div {  */
/*  	border: 1px solid crimson;  */
/*  }  */
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div style="min-height: 100vh; margin-top: 200px;" class="contents">
			<div id="pageHeader">
				마이페이지<br>
				<hr>
			</div>
			<div class="d-flex align-items-start">
				<div class="nav flex-column nav-pills me-3 sticky-top" id="v-pills-tab" role="tablist" aria-orientation="vertical">
					<a href="#home-tab">
						<button class="nav-link active tabs" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">홈</button>
					</a> <a href="#profile-tab">
						<button class="nav-link tabs" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">내 정보</button>
					</a>
					<details id="talent">
						<summary>재능</summary>
						<ul>
							<a href="#talent1-tab">
								<button class="nav-link tabs" id="v-pills-talent1-tab" data-bs-toggle="pill" data-bs-target="#v-pills-talent1" type="button" role="tab" aria-controls="v-pills-talent1" aria-selected="false">
									<li class="myli">구매한 재능</li>
								</button>
							</a>
							<a href="#talent2-tab">
								<button class="nav-link tabs" id="v-pills-talent2-tab" data-bs-toggle="pill" data-bs-target="#v-pills-talent2" type="button" role="tab" aria-controls="v-pills-talent2" aria-selected="false">
									<li class="myli">좋아요한 재능</li>
								</button>
							</a>
							<a href="#talent3-tab">
								<button class="nav-link tabs" id="v-pills-talent3-tab" data-bs-toggle="pill" data-bs-target="#v-pills-talent3" type="button" role="tab" aria-controls="v-pills-talent3" aria-selected="false">
									<li class="myli">등록한 재능</li>
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
				<!-- 첫번째 탭 : 홈 -->
				<div class="tab-content" id="v-pills-tabContent" style="width: 100%;">
					<div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab" style="width: 100%;">
						<div class="category">
							내 정보<img id="toinfo" class="btns" src="/img/rightBtn.png">
						</div>
						<div>
							<div class="box" style="background: #BDBDBD;">
								<c:choose>
									<c:when test="${dto.profile_img != null}">
										<img class="profile" src='/upload/${dto.profile_img}'>
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
									<div class="rightc">${dto.name}</div>
									<div class="rightc">${dto.email}</div>
									<div class="rightc">${dto.phone}</div>
									<div class="rightc">${dto.nickname}</div>
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
					<!-- 두번째 탭 : 내 정보 -->
					<div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
						<div class="category">내 정보</div>
						<div>
						<form action="/myPage/updateImage" method="post" enctype="multipart/form-data">
							<div class="box" style="background: #BDBDBD;">
							<input type="hidden" value="${dto.email}" id="email" name="email">
								<c:choose>
									<c:when test="${dto.profile_img != null}">
										<img class="profile" src='/upload/${dto.profile_img}'>
									</c:when>
									<c:otherwise>
										<img class="profile" src="/img/defaultProfile.png">
									</c:otherwise>
								</c:choose>
							</div>
							<div class="filebox" align=center style="margin-top: 5px;">
								<label for="file">사진 변경</label> <input type="file" name="file" id="file" accept="image/*">
								<button class="btn" style="display: none;">변경</button>
								<button type="button" id="upcancel" class="btn" style="display: none; margin-left: 10px;">취소</button>
							</div>
						</form>
							<div class="row1">
								<div class="left">
									<div class="leftc">이름</div>
									<div class="leftc">이메일</div>
									<div class="leftc">휴대전화</div>
									<div class="leftc">닉네임</div>
								</div>
								<div class="right">
									<div class="rightc">${dto.name}</div>
									<div class="rightc">${dto.email}</div>
									<form action="/myPage/updateInfo" method="post" id="infoform">
										<input type="hidden" value="${dto.email}" id="email" name="email">
										<div class="rightc">
										 	<input type="hidden" value="${dto.nickname}" size=8 disabled class="editable" name="nickname"> 
											<input id="modiphone" type="text" value="${dto.phone}" size=8 maxlength=13 disabled class="editable" name="phone"><span class="modify"><i class="bi bi-pencil-fill"></i></span>
											<button type="button" class="btn2 modifybtn" style="display: none;">변경</button>
											<button type="button" id="upcancel" class="btn2" style="display: none;">취소</button>
											<span class="notice_box" style="display:none;"></span>
										</div>
										<div class="rightc">
											<input type="hidden" value="${dto.phone}" size=8 maxlength=13 disabled class="editable" name="phone">
											<input id="modinickname" type="text" value="${dto.nickname}" size=8 disabled class="editable" name="nickname"><span class="modify"><i class="bi bi-pencil-fill"></i></span>
											<button type="button" class="btn2 modifybtn" style="display: none;">변경</button>
											<button type="button" id="upcancel" class="btn2" style="display: none;">취소</button>
											<span class="notice_box" style="display:none;"></span>
										</div>
									</form>
								</div>
								<div align=center>
									<a data-bs-toggle="modal" href="#memberOut-toggle" role="button" style="color: #6B54FF;">회원탈퇴</a>
								</div>
							</div>
						</div>
					</div>
					<!--  세번째 탭 : 구매한 재능 -->
					<div class="tab-pane fade" id="v-pills-talent1" role="tabpanel" aria-labelledby="v-pills-talent1-tab">
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
					<!-- 네번째 탭 : 좋아요한 재능 -->
					<div class="tab-pane fade" id="v-pills-talent2" role="tabpanel" aria-labelledby="v-pills-talent2-tab">
						<div class="category">좋아요한 재능</div>
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
					<!-- 다섯번째 탭 등록한 재능 -->
					<div class="tab-pane fade" id="v-pills-talent3" role="tabpanel" aria-labelledby="v-pills-talent3-tab">
						<div class="category">등록한 재능</div>
						<div id="goaddclass" align=right>
							<a href="#" style="color: #9381FF;">재능 등록하러 가기</a>
						</div>
						<div class="class">
							<div class="classdate">
								<span class="regdate">등록 일자</span>2022.6.28
							</div>
							<div class="row2">
								<div class="left3">
									<img class="classimg" src="/img/class1.png">
								</div>
								<div class="center3">
									<div class="classrow6">1차 카테고리</div>
									<div class="classrow7">클래스명</div>
									<div class="classrow8">일정 : 2022.05.01 - 2022.06.20(10회) · 금액 : 50,400원</div>
									<div class="classrow9">회차 : 1회차 · 수강 신청 인원 : 48명 · 별점 및 리뷰 : 4.75/5 (리뷰 27건)</div>
								</div>
								<div class="right3">
									<img class="viewclass" src="/img/rightBtn.png">
								</div>
							</div>
						</div>
						<div class="class">
							<div class="classdate">
								<span class="regdate">등록 일자</span>2022.6.28
							</div>
							<div class="row2">
								<div class="left3">
									<img class="classimg" src="/img/class1.png">
								</div>
								<div class="center3">
									<div class="classrow6">1차 카테고리</div>
									<div class="classrow7">클래스명</div>
									<div class="classrow8">일정 : 2022.05.01 - 2022.06.20(10회) · 금액 : 50,400원</div>
									<div class="classrow9">회차 : 1회차 · 수강 신청 인원 : 48명 · 별점 및 리뷰 : 4.75/5 (리뷰 27건)</div>
								</div>
								<div class="right3">
									<img class="viewclass" src="/img/rightBtn.png">
								</div>
							</div>
						</div>
						<div class="class">
							<div class="classdate">
								<span class="regdate">등록 일자</span>2022.6.28
							</div>
							<div class="row2">
								<div class="left3">
									<img class="classimg" src="/img/class1.png">
								</div>
								<div class="center3">
									<div class="classrow6">1차 카테고리</div>
									<div class="classrow7">클래스명</div>
									<div class="classrow8">일정 : 2022.05.01 - 2022.06.20(10회) · 금액 : 50,400원</div>
									<div class="classrow9">회차 : 1회차 · 수강 신청 인원 : 48명 · 별점 및 리뷰 : 4.75/5 (리뷰 27건)</div>
								</div>
								<div class="right3">
									<img class="viewclass" src="/img/rightBtn.png">
								</div>
							</div>
						</div>
					</div>
					<!-- 등록한 강의 상세보기 -->
					<div class="tab-pane fade" id="v-pills-classdetail" role="tabpanel" aria-labelledby="v-pills-classdetail-tab">
						<div class="category">등록한 재능</div>
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
					<!-- 여섯번째 탭 작성한 리뷰 -->
					<div class="tab-pane fade" id="v-pills-talent4" role="tabpanel" aria-labelledby="v-pills-talent4-tab">
						<div class="category">작성한 리뷰</div>
						<div class="class">
							<div class="classdate">
								<span class="regdate">작성 일자</span>2022.6.28
							</div>
							<div class="row2">
								<div class="classdate2">
									<i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i> (5점/5점)
								</div>
								<div class="classdate2">아주 유익합니당!!!!!</div>
								<div class="left4">
									<img class="classimg2" src="/img/class1.png">
								</div>
								<div class="right4">
									<div class="classrow10">1차 카테고리</div>
									<div class="classrow2">
										클래스명 · <span class="creator">크리에이터명</span>
									</div>
								</div>
							</div>
						</div>
						<div class="class">
							<div class="classdate">
								<span class="regdate">작성 일자</span>2022.6.28
							</div>
							<div class="row2">
								<div class="classdate2">
									<i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i> (5점/5점)
								</div>
								<div class="classdate2">아주 유익합니당!!!!!</div>
								<div class="left4">
									<img class="classimg2" src="/img/class1.png">
								</div>
								<div class="right4">
									<div class="classrow10">1차 카테고리</div>
									<div class="classrow2">
										클래스명 · <span class="creator">크리에이터명</span>
									</div>
								</div>
							</div>
						</div>
						<div class="class">
							<div class="classdate">
								<span class="regdate">작성 일자</span>2022.6.28
							</div>
							<div class="row2">
								<div class="classdate2">
									<i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i> (5점/5점)
								</div>
								<div class="classdate2">아주 유익합니당!!!!!</div>
								<div class="left4">
									<img class="classimg2" src="/img/class1.png">
								</div>
								<div class="right4">
									<div class="classrow10">1차 카테고리</div>
									<div class="classrow2">
										클래스명 · <span class="creator">크리에이터명</span>
									</div>
								</div>
							</div>
						</div>
						<div class="class">
							<div class="classdate">
								<span class="regdate">작성 일자</span>2022.6.28
							</div>
							<div class="row2">
								<div class="classdate2">
									<i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i> (5점/5점)
								</div>
								<div class="classdate2">아주 유익합니당!!!!!</div>
								<div class="left4">
									<img class="classimg2" src="/img/class1.png">
								</div>
								<div class="right4">
									<div class="classrow10">1차 카테고리</div>
									<div class="classrow2">
										클래스명 · <span class="creator">크리에이터명</span>
									</div>
								</div>
							</div>
						</div>
						<div class="class">
							<div class="classdate">
								<span class="regdate">작성 일자</span>2022.6.28
							</div>
							<div class="row2">
								<div class="classdate2">
									<i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i> (5점/5점)
								</div>
								<div class="classdate2">아주 유익합니당!!!!!</div>
								<div class="left4">
									<img class="classimg2" src="/img/class1.png">
								</div>
								<div class="right4">
									<div class="classrow10">1차 카테고리</div>
									<div class="classrow2">
										클래스명 · <span class="creator">크리에이터명</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 일곱번째탭 내가 쓴 글 -->
					<div class="tab-pane fade" id="v-pills-community1" role="tabpanel" aria-labelledby="v-pills-community1-tab">
						<div class="category">내가 쓴 글</div>
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
					<div class="tab-pane fade" id="v-pills-community2" role="tabpanel" aria-labelledby="v-pills-community2-tab">
						<div class="category">내가 쓴 댓글</div>
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
			<jsp:include page="/WEB-INF/views/member/memberOut.jsp" />
			<jsp:include page="/WEB-INF/views/common/loginModal.jsp" />
			<jsp:include page="/WEB-INF/views/common/pNav.jsp" />
			<jsp:include page="/WEB-INF/views/common/footer.jsp" />
		</div>
	</div>
</body>
<script>
// window.location.href;
// location.href;
//  document.URL; 사이트 주소불러오는 방법들
$('#memberOutOk-toggle').on('hidden.bs.modal', function () {
	 
	location.href="/myPage/memberOut";
	 
    location.href="/";
})

let siteUrl = window.location.href.split("#").pop(); //활성화할 문자
    let tabs = $("#v-pills-tab").find(".tabs"); //세로탭 메뉴들
    let tabs_contents = $("#v-pills-tabContent").children(); // 컨텐츠틀
    setting(siteUrl); //사이트 접속 초기세팅
    
    window.onpopstate = function(event) {   //주소변경감지 이벤트
      resetTab();
      siteUrl = window.location.href.split("#").pop();
      setting(siteUrl);
      if(siteUrl.includes('talent')) {
          document.getElementById("talent").open = true;
        }else if (siteUrl.includes('community')) {
          document.getElementById("community").open = true;
        }else {
          document.getElementById("talent").open = false;
          document.getElementById("community").open = false;
        }
    }

    tabs.on("click",function(){   //세로탭 메뉴들 전체에 클릭시 이벤트
      resetTab(); //선택된 탭 초기화
      $(this).children().addClass("active"); //클릭한 탭만 활성
    })
    
    $("#toinfo").on('click',function(){
      resetTab();
      $("#v-pills-profile-tab").addClass("active");
      tabs_contents.removeClass("active");
      $("#v-pills-profile").addClass("show active");
    })
    
    $("#totalent").on('click',function(){
      resetTab();
      $("#v-pills-talent1-tab").addClass("active");
      tabs_contents.removeClass("active");
      $("#v-pills-talent1").addClass("show active");
      document.getElementById("talent").open = true;
    })

    $("#tocommunity, #tomorepost").on('click',function(){
      resetTab();
      $("#v-pills-community1-tab").addClass("active");
      tabs_contents.removeClass("active");
      $("#v-pills-community1").addClass("show active");
      document.getElementById("community").open = true;
    })

    $("#tomorereply").on('click',function(){
      resetTab();
      $("#v-pills-community2-tab").addClass("active");
      tabs_contents.removeClass("active");
      $("#v-pills-community2").addClass("show active");
      document.getElementById("community").open = true;
    })

    //탭 세팅
    function setting(siteUrl){
      if(siteUrl.split("-").length<2){   // 사이트에 최초 접속시 #탭id 가 없음, 활성화할 탭 id 넣어주기
        siteUrl="home-tab" // 첫번째 탭을 id에 넣어줌
      }
      $("#v-pills-"+siteUrl+"").addClass("active"); //url에 맞는 탭 활성화      
      tabs_contents.removeClass("active"); //부트스트랩 탭 컨텐츠 버그방지용 초기화
      $("#v-pills-"+siteUrl.split("-").shift()+"").addClass("show active"); // url에 맞는 컨텐츠 활성화
      window.scrollTo({top:0, left:0, behavior:'auto'}) 
    }
   
    function resetTab(){ //선택된 탭 초기화
      tabs.removeClass("active");
    }

// $(".viewclass").on('click',function(){
// 	 tab1.removeClass('active');
// 	 tab2.removeClass('active');
// 	 tab3.removeClass('active');
// 	 tab4.removeClass('active');
// 	 tab6.removeClass('active');
// 	 tab7.removeClass('active');
// 	 tab8.removeClass('active');
	 
// 	 tab1_contents.removeClass('show active');
// 	 tab2_contents.removeClass('show active');
// 	 tab3_contents.removeClass('show active');
// 	 tab4_contents.removeClass('show active');
// 	 tab5_contents.removeClass('show active');
// 	 tab6_contents.removeClass('show active');
// 	 tab7_contents.removeClass('show active');
// 	 tab8_contents.removeClass('show active');
// 	 tab9_contents.addClass('show active');
// 	 window.scrollTo({top:0, left:0, behavior:'auto'}) 
// })

window.addEventListener('DOMContentLoaded', function(){
    document.querySelectorAll('details').forEach(function(item){
        item.addEventListener("toggle", event => {
        let toggled = event.target;
        if (toggled.attributes.open) {/* 열었으면 */
          /* 나머지 다른 열린 아이템을 닫음 */
          document.querySelectorAll('details[open]').forEach(function(opened){
              if(toggled != opened) /* 현재 열려있는 요소가 아니면 */
                opened.removeAttribute('open'); /* 열림 속성 삭제 */
          });
        }
      })
    });
});
	
	$(".modify").on('click',function(){
		$(this).siblings(".editable").removeAttr("disabled");
		$(this).siblings(".editable").focus();
		$(this).closest(".rightc").siblings().find(".modify").css("display","none");
		$(this).css("display","none");
		$(this).siblings(".btn2").css("display","");
	})
	
	 $('#file').on('change', function() {
        ext = $(this).val().split('.').pop().toLowerCase(); //확장자
        
        //배열에 추출한 확장자가 존재하는지 체크
        if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
            resetFormElement($(this)); //폼 초기화
            alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
        } else {
            file = $('#file').prop("files")[0];
            blobURL = window.URL.createObjectURL(file);
            $('.box img').attr('src', blobURL);
            $('.box').slideDown(); //업로드한 이미지 미리보기 
            $(this).slideUp(); //파일 양식 감춤
        }
    });
    
var img = document.querySelector(".profile"),
observer = new MutationObserver((changes) => {
  changes.forEach(change => {
      if(change.attributeName.includes('src')){
    	  $("label").css("display","none");
    	  $(".btn").css("display","");
      }
  });
});

observer.observe(img, {attributes : true});
  
$(document).on("click", "#upcancel", function(){ // on 이벤트로 변경
	location.reload();
});

$(".modifybtn").on('click',function(){
	
	let nickname = $("#modinickname").val();
	let nicknameRegex = /^[a-z0-9가-힣]{2,10}$/; //영어 소문자, 숫자 2~10글자
	let nicknameResult = nicknameRegex.test(nickname);

	if(!nicknameResult){
        $(this).siblings('.notice_box').css("display", "");
		$(this).siblings('.notice_box').css("color", "red");
		$(this).siblings('.notice_box').text("2~10자(영문 소문자,숫자)를 입력해주세요");
        $("#modinickname").focus();
        return false;
		}
// 	} else {
// 		$.ajax({
// 			url:"/signup/nickNameCheck",
// 			type:"get",
// 			data:{nickname:nickname}
// 		}).done(function(resp){
// 			let result = JSON.parse(resp);
// 			console.log("AJAX 결과: "+result);
			
// 			if(result == true){
// 				alert('이미 사용중인 닉네임입니다.')
// 			}else{
// 				alert('사용 가능한 닉네임입니다.')
// 		 	}
// 		});
// 	}
		if(nickname.replace(/\s|　/gi, "").length == 0){
            $(this).siblings('.notice_box').css("display", "");
			$(this).siblings('.notice_box').css("color", "red");
			$(this).siblings('.notice_box').text("변경하실 닉네임을 입력해주세요.");
            $("#modinickname").focus();
            return false;
		} 	
        
        let phone = $("#modiphone").val();
	    let phoneRegex = /^010[0-9]{8}$/; //핸드폰 11자리
	    let phoneResult = phoneRegex.test(phone);
	    if(!phoneResult){
            $(this).siblings('.notice_box').css("display", "");
			$(this).siblings('.notice_box').css("color", "red");
			$(this).siblings('.notice_box').text("휴대전화번호를 11자리로 작성해주세요.('-'미포함)");
            $("#modiphone").focus();
            return false;
    	} 
	    
	    if(phone.replace(/\s|　/gi, "").length == 0){
	    	$(this).siblings('.notice_box').css("display", "");
			$(this).siblings('.notice_box').css("color", "red");
			$(this).siblings('.notice_box').text("변경하실 휴대전화번호를 입력해주세요.");
            $("#modiphone").focus();
            return false;
	    } 
	
	$("#infoform").submit();
    return false;
})

</script>
</html>