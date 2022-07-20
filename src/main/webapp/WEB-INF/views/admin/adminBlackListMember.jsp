
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<!-- 글씨체 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<!-- 스위트 얼럿 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
						회원 정보<a href='/admin/memberPage?email=${blackMember.EMAIL}'><img id="toinfo" class="btns" src="/img/rightBtn2.png"></a>
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
								<div class="rightc">${blackMember.NAME}</div>
								<div class="rightc">${blackMember.EMAIL}</div>
								<div class="rightc">${blackMember.PHONE}</div>
								<div class="rightc">${blackMember.NICKNAME}</div>
							</div>
						</div>
					</div>
					<div style="clear: both;"></div>
					<!-- 회원 신고현황 -->
					<div class="category">
						신고현황 : 총 ${blackMember.REPORT} 건
						<a href="/admin/memberReportList?email=${blackMember.EMAIL}&nowPage=1">
						<img id="toReportList1" class="btns"
							src="/img/rightBtn2.png">
						</a>
					</div>
					<div id="memberReportSum">
						<div>개요</div>
						<div id="memberReportOutline">
							<div class="row" id="sumHead">
								<div class="col-3">합계</div>
								<div class="col-3">게시글</div>
								<div class="col-3">댓글</div>
								<div class="col-3">리뷰</div>
							</div>
							<div class="row" id="sumMain">
								<div class="col-3">${blackMember.REPORT} 건</div>
								<div class="col-3">${reportCount.board} 건</div>
								<div class="col-3">${reportCount.reply} 건</div>
								<div class="col-3">${reportCount.review} 건</div>
							</div>
						<span id="rejectedReport">반려된 건 : ${blackMember.REJECT} 건</span>
						</div>
						<div class="reportList">
						<div>신고 받은 목록
						<a href="/admin/memberReportList?email=${blackMember.EMAIL}&nowPage=1">
						<span id="tomorepost" class="more">더보기 ></span></a></div>
							<div class="reportListHeaderContainer">
								<div class="row  reportListHeader">
									<div class="col-1 reportListHeader blackListnumber1">번호</div>
									<div class="col-6 reportListHeader">제목</div>
									<div class="col-3 reportListHeader">신고자</div>
									<div class="col-3 reportListHeader">비고</div>
								</div>
							</div>
							<div class="reportListWrapper">
							<c:if test="${empty rList}">
								<div class="info">
									<p style="text-align:center;">
									  신고 건이 없습니다.
									</p>
								</div>
							</c:if>
							<c:forEach var="i" items="${rList }" begin="0" end="2" varStatus="status">
								<div  class="row reportListContainer toBoard" >
									<input type="hidden" value="${i.state} " class="state">
									<input type="hidden" value="${i.parent_seq} " class="parent_seq">
									<input type="hidden" value="${boardNclass_seq[status.index]} " class="board_seq">
									<div class="col-1 reportListName detail blackListnumber center">${ status.index+1}</div>
									<div class="col-6 reportListName detail">${i.contents}</div>
									<div class="col-3 reportListName detail">${writerNreporter[status.index].reporter}</div>
									<div class="col-3 reportListName detail">${locations[status.index]}</div><!-- parent_Seq는 링크로 써야해서 쓸모없는 report_seq를 비고로 바꿈 -->
									<div class="col-6 reportListName center detail"  id="reportReason">${i.reason}</div>
									<div class="col-4 reportListName detail">신고일 : 
										<fmt:formatDate value="${i.report_date}" type="both" pattern="yy/MM/dd" />
									</div>
									<div class="col-2 reportListName detail">
										<c:choose>
											<c:when test="${i.state==2 }">
												삭제
											</c:when>
											<c:when test="${i.state==1 }">
												미처리
											</c:when>
											<c:otherwise>
												반려
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</c:forEach>	
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%-- 	<jsp:include page="/WEB-INF/views/common/pNav.jsp" /> --%>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>

		//신고리스트에서 디테일 뷰로 가기
		$(".toBoard").on("click",function(){
			let toLink = $(this).children(".parent_seq").val();
			let toParentLink = $(this).children(".board_seq").val();
			console.log(toLink)
			if($(this).children(".parent_seq").val().startsWith('c')){//parent_seq가 c로 시작하는 경우
				if($(this).children(".parent_seq").val().startsWith('cr')){//재능마켓-리뷰로 이동						
					if($(this).children(".state").val()==2){//리뷰-삭제처리된 경우
    		    		Swal.fire({
    	    	            icon: 'warning',
    	    	            title: '삭제 처리된 리뷰입니다.'
    	    	        })
						return false;
					}else{//리뷰- 삭제 안된경우
						location.href= '/class/detail?class_seq='+$(this).children('.board_seq').val();		
					
					}
				}else{//재능마켓인 경우
					location.href= '/class/detail?class_seq='+$(this).children(".parent_seq").val();	
				}
			}else if($(this).children(".parent_seq").val().startsWith('r')){//커뮤니티 댓글인 경우
				if($(this).children(".state").val()==2){//리뷰-삭제처리된 경우
		    		Swal.fire({
	    	            icon: 'warning',
	    	            title: '삭제 처리된 댓글입니다.'
	    	        })
					return false;
				}else{//리뷰- 삭제 안된경우
					location.href= '/community/detailView?seq='+$(this).children('.board_seq').val();		
				
				}
			}else{//커뮤니티 글인 경우
				location.href= '/community/detailView?seq='+$(this).children(".parent_seq").val();
			}
		})
		
	</script>
</body>
</html>
