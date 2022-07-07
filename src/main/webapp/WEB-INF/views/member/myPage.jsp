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
<!-- 부트스트랩  -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<!-- sweetalert  -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- input.css  -->
<link rel="stylesheet" href="/css/myPage.css">
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

/
*   div { /*
	border: 1px solid crimson;
	/*
}
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
				<!-- 첫번째 탭 : 홈 -->
				<div class="tab-content" id="v-pills-tabContent" style="width: 100%;">
					<div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab" style="width: 100%;">
						<div class="category">
							내 정보<a href="#profile-tab"><img id="toinfo" class="btns" src="/img/rightBtn.png"></a>
						</div>
						<div>
							<div class="box" style="background: #BDBDBD;">
								<c:choose>
									<c:when test="${myinfo.profile_img != null}">
										<img class="profile" src='/upload/${myinfo.profile_img}'>
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
									<div class="rightc">${myinfo.name}</div>
									<div class="rightc">${myinfo.email}</div>
									<div class="rightc">${myinfo.phone}</div>
									<div class="rightc">${myinfo.nickname}</div>
								</div>
							</div>
						</div>
						<div style="clear: both;"></div>
						<div class="category">
							클래스<a href="#talent1-tab"><img id="totalent" class="btns" src="/img/rightBtn.png"></a>
						</div>
						<c:choose>
							<c:when test="${empty buyclist}">
								<div class="info">
									<p>
										구매한 클래스가 없어요.<br> 지금 바로 클래스를 구매해보세요!
									</p>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach var="i" items="${buyclist}" end="1" varStatus="status">
									<div class="class">
										<div class="classdate">
											<fmt:formatDate value="${i.class_date}" type="both" pattern="yyyy-MM-dd" />
										</div>
										<div class="row2">
											<div class="left2">
												<img class="classimg" src="/img/class1.png">
											</div>
											<div class="right2">
												<div class="classrow1">${i.category1}</div>
												<div class="classrow2">
													${i.title} · <span class="creator">${i.creater_info}</span>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<div style="clear: both;"></div>
						<div class="category">
							커뮤니티<a href="#community1-tab"><img id="tocommunity" class="btns" src="/img/rightBtn.png"></a>
						</div>
						<div class="comucate">
							내가 쓴 글<span id="tomorepost" class="more">더보기 ></span>
						</div>
						<c:choose>
							<c:when test="${empty postlist}">
								<div class="info">
									<p>
										작성한 글이 없어요.<br> 지금 바로 글을 작성해보세요!
									</p>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach var="i" items="${postlist}" end="2" varStatus="status">
									<div class="mypost">
										<div class="postitle">${i.title}</div>
										<div class="postdetail">
											<c:if test="${fn:contains(i.board_seq, 'Q')}">궁금해요</c:if>
											<c:if test="${fn:contains(i.board_seq, 'H')}">도와주세요</c:if>
											<c:if test="${fn:contains(i.board_seq, 'S')}">도와드려요</c:if>
											<c:if test="${fn:contains(i.board_seq, 'D')}">일상</c:if>
											·
											<fmt:formatDate value="${i.write_date}" type="both" pattern="yyyy-MM-dd" />
											· ${i.view_count} · <i class="bi bi-emoji-smile-fill"></i> ${i.like_count} · <i class="bi bi-chat-dots-fill"></i> ${replycount[status.index]}
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<div class="comucate">
							내가 쓴 댓글<span id="tomorereply" class="more">더보기 ></span>
						</div>
						<c:choose>
							<c:when test="${empty replylist}">
								<div class="info">
									<p>
										작성한 댓글이 없어요.<br> 지금 바로 댓글을 작성해보세요!
									</p>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach var="i" items="${replylist}" end="2" varStatus="status">
									<div class="myreply">
										<div class="replytitle">
											<c:if test="${fn:contains(replyplist[status.index].board_seq, 'Q')}">궁금해요</c:if>
											<c:if test="${fn:contains(replyplist[status.index].board_seq, 'H')}">도와주세요</c:if>
											<c:if test="${fn:contains(replyplist[status.index].board_seq, 'S')}">도와드려요</c:if>
											<c:if test="${fn:contains(replyplist[status.index].board_seq, 'D')}">일상</c:if>
											· [원문] ${replyplist[status.index].title}
										</div>
										<div class="replydetail">
											${i.contents} <span class="like"><fmt:formatDate value="${i.write_date}" type="both" pattern="yyyy-MM-dd" /> · <i class="bi bi-emoji-smile-fill"></i> ${i.like_count} </span>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
					<!-- 두번째 탭 : 내 정보 -->
					<div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
						<div class="category">내 정보</div>
						<div>
							<form action="/myPage/updateImage" method="post" enctype="multipart/form-data">
								<div class="box" style="background: #BDBDBD;">
									<input type="hidden" value="${myinfo.email}" id="email" name="email">
									<c:choose>
										<c:when test="${myinfo.profile_img != null}">
											<img class="profile" src='/upload/${myinfo.profile_img}'>
										</c:when>
										<c:otherwise>
											<img class="profile" src="/img/defaultProfile.png">
										</c:otherwise>
									</c:choose>
								</div>
								<div class="filebox" align=center style="margin-top: 5px;">
									<label for="file">사진 변경</label> <input type="file" name="file" id="file" accept="image/*"><br>
									<c:choose>
										<c:when test="${myinfo.profile_img != null}">
											<input id="defaultimg" type='button' value='기본 이미지로 변경' />
										</c:when>
									</c:choose>
									<button class="btn" style="display: none;">변경</button>
									<button type="button" class="upcancel btn" style="display: none; margin-left: 10px;">취소</button>
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
									<div class="rightc">${myinfo.name}</div>
									<div class="rightc">${myinfo.email}</div>
									<form action="/myPage/updateInfo" method="post" id="infoform">
										<input type="hidden" value="${myinfo.email}" id="email" name="email">
										<div class="rightc">
											<input type="hidden" value="${myinfo.nickname}" size=8 disabled class="editable" name="nickname"> <input id="modiphone" type="text" value="${myinfo.phone}" size=8 maxlength=13 disabled class="editable" name="phone"><span class="modify"><i class="bi bi-pencil-fill"></i></span>
											<button type="button" class="btn2 modifybtn" style="display: none;">변경</button>
											<button type="button" class="btn2 upcancel" style="display: none; margin-top: 0px;">취소</button>
											<span class="noticebox" style="display: none;"></span>
										</div>
										<div class="rightc">
											<input type="hidden" value="${myinfo.phone}" size=8 maxlength=13 disabled class="editable" name="phone"> <input id="modinickname" type="text" value="${myinfo.nickname}" size=8 disabled class="editable" name="nickname"><span class="modify"><i class="bi bi-pencil-fill"></i></span>
											<button type="button" class="btn2 modifybtn" style="display: none;">변경</button>
											<button type="button" class="btn2 upcancel" style="display: none; margin-top: 0px;">취소</button>
											<span class="noticebox" style="display: none;"></span>
										</div>
									</form>
								</div>
								<div align=center>
									<a data-bs-toggle="modal" href="#memberOut-toggle" role="button" style="color: #6B54FF;">회원탈퇴</a>
								</div>
							</div>
						</div>
					</div>
					<!--  세번째 탭 : 구매한 클래스 -->
					<div class="tab-pane fade" id="v-pills-talent1" role="tabpanel" aria-labelledby="v-pills-talent1-tab">
						<div class="category">구매한 클래스</div>
						<c:choose>
							<c:when test="${empty buyclist}">
								<div class="info">
									<p>
										구매한 클래스가 없어요.<br> 지금 바로 클래스를 구매해보세요!
									</p>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach var="i" items="${buyclist}" varStatus="status">
									<div class="class">
										<div class="classdate">
											${i.class_date}
											<button class="goReview">리뷰 남기기</button>
										</div>
										<div class="row2">
											<div class="left2">
												<img class="classimg" src="/img/class1.png">
											</div>
											<div class="right2">
												<div class="classrow3">${i.category1}</div>
												<div class="classrow4">
													${i.title} · <span class="creator">${i.creater_info}</span>
												</div>
												<div class="classrow5">결제일자 : ${buydaylist[status.index]} · 금액 : ${i.price}</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
					<!-- 네번째 탭 : 좋아요한 클래스 -->
					<div class="tab-pane fade" id="v-pills-talent2" role="tabpanel" aria-labelledby="v-pills-talent2-tab">
						<div class="category">좋아요한 클래스</div>
						<div class="article-feed">
							<c:forEach var="i" items="${likeclass}">
								<div class="class">
									<div class="classdate">${i.class_date}</div>
									<div class="row2">
										<div class="left2">
											<img class="classimg" src="/img/class1.png">
										</div>
										<div class="right2">
											<div class="classrow1">${i.category1}<span class=like2><input type=hidden class="likeclass" value="${i.class_seq}"><i class="bi bi-heart-fill"></i></span>
											</div>
											<div class="classrow2">
												${i.title} · <span class="creator">${i.creater_info}</span>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<!-- 다섯번째 탭 등록한 클래스 -->
					<div class="tab-pane fade" id="v-pills-talent3" role="tabpanel" aria-labelledby="v-pills-talent3-tab">
						<div class="category">등록한 클래스</div>
						<c:choose>
							<c:when test="${empty rgclist}">
								<div class="info">
									<p>
										등록한 클래스가 없어요.<br> 지금 바로 클래스를 등록해보세요!
									</p>
								</div>
							</c:when>
							<c:otherwise>
								<div id="goaddclass" align=right>
									<a href="/class/write" style="color: #9381FF;">클래스 등록하러 가기</a>
								</div>
								<c:forEach var="i" items="${rgclist}" varStatus="status">
									<div class="class">
										<div class="classdate">
											<span class="regdate">등록 일자</span>
											<fmt:formatDate value="${i.reg_date}" type="both" pattern="yyyy-MM-dd" />
										</div>
										<div class="row2">
											<div class="left3">
												<img class="classimg" src="/img/class1.png">
											</div>
											<div class="center3">
												<div class="classrow6">${i.category1}</div>
												<div class="classrow7">
													<a href="/myPage/myClass?class_seq=${i.class_seq}">${i.title}</a>
												</div>
												<div class="classrow8">
													일정 :
													<fmt:formatDate value="${i.class_date}" type="both" pattern="yyyy-MM-dd" />
													· 금액 : ${i.price}원
												</div>
												<div class="classrow9">수강 신청 인원 : ${myClassStds[status.index]}명 · 별점 및 리뷰 : ${reviewdetail[status.index].avgstar}/5 (리뷰 ${reviewdetail[status.index].all}건)</div>
											</div>
											<div class="right3">
												<a href="/myPage/myClass?class_seq=${i.class_seq}"><img class="viewclass" src="/img/rightBtn.png"></a>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
					<!-- 여섯번째 탭 작성한 리뷰 -->
					<div class="tab-pane fade" id="v-pills-talent4" role="tabpanel" aria-labelledby="v-pills-talent4-tab">
						<div class="category">작성한 리뷰</div>
						<c:choose>
							<c:when test="${empty reviewlist}">
								<div class="info">
									<p>
										작성한 리뷰가 없어요.<br> 지금 바로 리뷰를 작성해보세요!
									</p>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach var="i" items="${reviewlist}" varStatus="status">
									<div class="class">
										<div class="classdate">
											<span class="regdate">작성 일자</span>
											<fmt:formatDate value="${i.write_date}" type="both" pattern="yyyy-MM-dd" />
										</div>
										<div class="row2">
											<div class="classdate2">
												<span class="starCountImg"><input type=hidden value="${i.stars}"></span><span class="starrate">(${i.stars}점/5점)</span>
											</div>
											<div class="classdate3">${i.contents}</div>
											<div class="left4">
												<img class="classimg2" src="/img/class1.png">
											</div>
											<div class="right4">
												<div class="classrow10">${reviewclist[status.index].category1}</div>
												<div class="classrow2">
													${reviewclist[status.index].title} · <span class="creator">${reviewclist[status.index].creater_info}</span>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
					<!-- 일곱번째탭 내가 쓴 글 -->
					<div class="tab-pane fade" id="v-pills-community1" role="tabpanel" aria-labelledby="v-pills-community1-tab">
						<div class="category">내가 쓴 글</div>
						<c:choose>
							<c:when test="${empty postlist}">
								<div class="info">
									<p>
										작성한 글이 없어요.<br> 지금 바로 글을 작성해보세요!
									</p>
								</div>
							</c:when>
							<c:otherwise>
								<div id="totalpost" align=right>작성한 글 : ${fn:length(postlist)} 건</div>
								<c:forEach var="i" items="${postlist}" varStatus="stat">
									<div class="post">
										<div>
											<span class="comucates"> <c:if test="${fn:contains(i.board_seq, 'Q')}">궁금해요</c:if> <c:if test="${fn:contains(i.board_seq, 'H')}">도와주세요</c:if> <c:if test="${fn:contains(i.board_seq, 'S')}">도와드려요</c:if> <c:if test="${fn:contains(i.board_seq, 'D')}">일상</c:if>
											</span>
										</div>
										<div class="row2">
											<div class="comuup">
												<div class="left5">
													<div class="classrow11">${i.title}</div>
													<div class="classrow12">${i.contents}</div>
												</div>
												<div class="right5">
													<img class="comuimg" src="/img/chimac.jpg"><br>
												</div>
												<div class="comudown">
													<div class="classrow13">
														<c:set var="tags" value="${fn:split(i.hash_tag, '#')}" />
														<c:forEach var="tag" items="${tags}" varStatus="status">
															<span style="margin-right: 5px;">#${tag}</span>
														</c:forEach>
													</div>
													<div class="classrow14">
														<i class="bi bi-emoji-smile-fill"></i> ${i.like_count} · <i class="bi bi-chat-dots-fill"></i> ${replycount[stat.index]}<span class="postdate"><fmt:formatDate value="${i.write_date}" type="both" pattern="yyyy-MM-dd" /></span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="tab-pane fade" id="v-pills-community2" role="tabpanel" aria-labelledby="v-pills-community2-tab">
						<div class="category">내가 쓴 댓글</div>
						<c:choose>
							<c:when test="${empty replylist}">
								<div class="info">
									<p>
										작성한 댓글이 없어요.<br> 지금 바로 댓글을 작성해보세요!
									</p>
								</div>
							</c:when>
							<c:otherwise>
								<div id="totalpost" align=right>작성한 댓글 : ${fn:length(replylist)}건</div>
								<c:forEach var="i" items="${replylist}" varStatus="status">
									<div class="reply">
										<div class="replyrow1">
											<c:if test="${fn:contains(replyplist[status.index].board_seq, 'Q')}">궁금해요</c:if>
											<c:if test="${fn:contains(replyplist[status.index].board_seq, 'H')}">도와주세요</c:if>
											<c:if test="${fn:contains(replyplist[status.index].board_seq, 'S')}">도와드려요</c:if>
											<c:if test="${fn:contains(replyplist[status.index].board_seq, 'D')}">일상</c:if>
											· [원문] ${replyplist[status.index].title}
										</div>
										<div class="replyrow2">${i.contents}</div>
										<div class="replyrow3">
											<span class="like"><fmt:formatDate value="${i.write_date}" type="both" pattern="yyyy-MM-dd" /> · <i class="bi bi-emoji-smile-fill"></i> ${i.like_count} </span>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
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
// 회원탈퇴모달에서 최종 탈퇴 버튼을 누르면 모달창이 닫히고 회원탈퇴 처리 후 index 페이지로 이동
$('#memberOutOk-toggle').on('hidden.bs.modal', function () {
	location.href="/myPage/memberOut";	 
    location.href="/";
})

let siteUrl = window.location.href.split("#").pop(); //활성화할 문자
let tabs = $(".tabs"); //세로탭 메뉴들
let tabs2 = $(".tabs2"); //가로탭 메뉴들
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

tabs2.on("click",function(){   //가로탭 메뉴들 전체에 클릭시 이벤트
	resetTab(); //선택된 탭 초기화
// 	$(this).children().addClass("active"); //클릭한 탭만 활성
	tabs2.css("border-bottom","none"); 
	$(this).css("border-bottom","4px solid #9381ff"); 
	$("#cate1").css("margin-bottom","0px");
	$("#cate2").css("margin-bottom","0px");
})

$('#talent1').on('toggle', function() {
	$("#cate1").css("margin-bottom","160px");
});
    
$('#community1').on('toggle', function() {
	$("#cate2").css("margin-bottom","80px");
});

//탭 세팅
function setting(siteUrl){
	if(siteUrl.split("-").length<2){   // 사이트에 최초 접속시 #탭id 가 없음, 활성화할 탭 id 넣어주기
    siteUrl="home-tab" // 첫번째 탭을 id에 넣어줌
	}
    $("#v-pills-"+siteUrl+"").addClass("active"); //url에 맞는 탭 활성화     
    $("#v-pills-"+siteUrl+"2").css("border-bottom","4px solid #9381ff");
    tabs_contents.removeClass("active"); //부트스트랩 탭 컨텐츠 버그방지용 초기화
    $("#v-pills-"+siteUrl.split("-").shift()+"").addClass("show active"); // url에 맞는 컨텐츠 활성화
    window.scrollTo({top:0, left:0, behavior:'auto'}) 
}
   
function resetTab(){ //선택된 탭 초기화	
	tabs.removeClass("active");
//     tabs2.removeClass("active");
    tabs2.css("border-bottom","none"); 
}
    
// 마이페이지 홈에서 내 정보로 가기 버튼 클릭 시 이벤트
$("#toinfo").on('click',function(){
	resetTab();
    $("#v-pills-profile-tab").addClass("active");
    $("#v-pills-profile-tab2").css("border-bottom","4px solid #9381ff");
    tabs_contents.removeClass("active");
    $("#v-pills-profile").addClass("show active");
    window.scrollTo({top:0, left:0, behavior:'auto'});
})
    
// 마이페이지 홈에서 클래스로 가기 버튼 클릭 시 이벤트
$("#totalent").on('click',function(){
	resetTab();
    $("#v-pills-talent1-tab").addClass("active");
    $("#v-pills-talent1-tab2").css("border-bottom","4px solid #9381ff");
    tabs_contents.removeClass("active");
    $("#v-pills-talent1").addClass("show active");
    document.getElementById("talent").open = true;
    window.scrollTo({top:0, left:0, behavior:'auto'});
})

// 마이페이지 홈에서 커뮤니티로 가기, 내가 쓴 글 더보기 버튼 클릭 시 이벤트
$("#tocommunity, #tomorepost").on('click',function(){
	resetTab();
    $("#v-pills-community1-tab").addClass("active");
    $("#v-pills-community1-tab2").css("border-bottom","4px solid #9381ff");
    tabs_contents.removeClass("active");
    $("#v-pills-community1").addClass("show active");
    document.getElementById("community").open = true;
    window.scrollTo({top:0, left:0, behavior:'auto'});
})

// 마이페이지 홈에서 내가 쓴 댓글 더보기 버튼 클릭 시 이벤트
$("#tomorereply").on('click',function(){
	resetTab();
    $("#v-pills-community2-tab").addClass("active");
    $("#v-pills-community2-tab2").css("border-bottom","4px solid #9381ff");
    tabs_contents.removeClass("active");
    $("#v-pills-community2").addClass("show active");
    document.getElementById("community").open = true;
    window.scrollTo({top:0, left:0, behavior:'auto'});
})

// details 태그 하나씩 열기 이벤트 
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

// 내 정보 각 항목별로 수정 버튼 클릭 시 이벤트
$(".modify").on('click',function(){
	$(this).siblings(".editable").removeAttr("disabled");
	$(this).siblings(".editable").focus();
	$(this).closest(".rightc").siblings().find(".modify").css("display","none");
	$(this).css("display","none");
	$(this).siblings(".btn2").css("display","");
})
	
// 파일 선택 시 미리보기
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

// 파일 선택 후 미리보기 가능한 유효한 이미지라면 변경, 취소 버튼만 선택 가능
var img = document.querySelector(".profile"),
observer = new MutationObserver((changes) => {
	changes.forEach(change => {
    	if(change.attributeName.includes('src')){
    		$("label").css("display","none");
    	    $("#defaultimg").css("display","none");
    	    $(".btn").css("display","");
        }
    });
});

observer.observe(img, {attributes : true});
  
// 내 정보 및 이미지 변경 최종 취소 시 페이지 새로고침
$(document).on("click", ".upcancel", function(){ // on 이벤트로 변경
	location.reload();
});

// 수정 완료 버튼 클릭 시 입력값 정규식 검사
$(".modifybtn").on('click',function(){
	let nickname = $("#modinickname").val();
	let nicknameRegex = /^[a-z0-9가-힣]{2,10}$/; //영어 소문자, 숫자 2~10글자
	let nicknameResult = nicknameRegex.test(nickname);

	if(!nicknameResult){
    	$(this).siblings('.noticebox').css("display", "");
		$(this).siblings('.noticebox').css("color", "red");
		$(this).siblings('.noticebox').text("2~10자(영문 소문자,숫자)를 입력해주세요");
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
            $(this).siblings('.noticebox').css("display", "");
			$(this).siblings('.noticebox').css("color", "red");
			$(this).siblings('.noticebox').text("변경하실 닉네임을 입력해주세요.");
            $("#modinickname").focus();
            return false;
		} 	
        
        let phone = $("#modiphone").val();
	    let phoneRegex = /^010[0-9]{8}$/; //핸드폰 11자리
	    let phoneResult = phoneRegex.test(phone);
	    if(!phoneResult){
            $(this).siblings('.noticebox').css("display", "");
			$(this).siblings('.noticebox').css("color", "red");
			$(this).siblings('.noticebox').text("휴대전화번호를 11자리로 작성해주세요.('-'미포함)");
            $("#modiphone").focus();
            return false;
    	} 
	    
	    if(phone.replace(/\s|　/gi, "").length == 0){
	    	$(this).siblings('.noticebox').css("display", "");
			$(this).siblings('.noticebox').css("color", "red");
			$(this).siblings('.noticebox').text("변경하실 휴대전화번호를 입력해주세요.");
            $("#modiphone").focus();
            return false;
	    } 
	
	$("#infoform").submit();
    return false;
})

// 기본 사진으로 변경 버튼 클릭 시 미리보기 이미지 기본으로 변경
$("#defaultimg").on('click',function(){
	$(this).css("display","none");
	$(".profile").attr("src", "/img/defaultProfile.png");	
})

// 별점
$('.starCountImg').each(function (index, item) {
    let star = "<i class='bi bi-star'></i>";
    let half = "<i class='bi bi-star-half'></i>";
    let fill = "<i class='bi bi-star-fill'></i>";

    let classTotalStar = $(this).children("input").val();
    console.log(classTotalStar);
    let stars="";
    
    if(classTotalStar<0.5){
        stars=star+star+star+star+star;
    }else if(classTotalStar<1){
        stars=half+star+star+star+star;
    }else if(classTotalStar<1.5){
        stars=fill+star+star+star+star;
    }else if(classTotalStar<2){
        stars=fill+half+star+star+star;
    }else if(classTotalStar<2.5){
        stars=fill+fill+star+star+star;
    }else if(classTotalStar<3){
        stars=fill+fill+half+star+star;
    }else if(classTotalStar<3.5){
        stars=fill+fill+fill+star+star;
    }else if(classTotalStar<4){
        stars=fill+fill+fill+half+star;
    }else if(classTotalStar<4.5){            
        stars=fill+fill+fill+fill+star;
    }else if(classTotalStar<5){
        stars=fill+fill+fill+fill+half;                
    }else if(classTotalStar==5){
        stars=fill+fill+fill+fill+fill;     
    }
    
    $(this).prepend(stars);
});

//찜하기 버튼 클릭 이벤트
$(".like2").on("click",function(){
    let target=$(this).children("i").attr("class");
    let parent_seq=$(this).children("input").val();

    if(target=="bi bi-heart-fill"){
        $(this).children("i").attr("class","bi bi-heart");
    	$(this).children("i").css("color","#959595");

        $.ajax({
			url:"/myPage/likeCancel",
			type:"get",
			data:{parent_seq:parent_seq}
		}).done(function(resp){
			if(resp = 1){
		         Swal.fire({                    
	             width:280,
	             html: "<span style='font-size:15px'><i class='bi bi-heart-fill' style='color:#FF781E'></i> 찜한 클래스에서 삭제됐어요.</span>",
	             showConfirmButton: false,
	             timer: 1000,
	             background:'#dbdbdb80',
	             backdrop:'transparent'
	         })
			}else{
				alert('찜 삭제 실패..')
		 	}
		});
        
        
//         Swal.fire({                    
//             width:250,
//             html: "<span style='font-size:15px'><i class='bi bi-heart-fill' style='color:#FF781E'></i> 찜하기에서 삭제됐어요.</span>",
//             showConfirmButton: false,
//             timer: 1000,
//             background:'#dbdbdb80',
//             backdrop:'transparent'
//         })
        setTimeout("location.reload()", 1000);
    }
})	
</script>
</html>