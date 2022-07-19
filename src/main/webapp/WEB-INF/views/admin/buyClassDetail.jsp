
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<!-- 부트스트랩  -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<!-- sweetalert  -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- css -->
<link rel="stylesheet" href="/css/admin/adminCommon.css">
<link rel="stylesheet" href="/css/admin/adminMember.css">
<!-- <link rel="stylesheet" href="/css/member/myPage.css"> -->
</head>

<body>

	<div class="container mainContent">

		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<jsp:include page="/WEB-INF/views/common/pNav.jsp" />

		<div id="adminHeader">관리자 페이지</div>
		<hr id="boundaryLine">
		<!-- 가로 탭 -->
		<ul class="nav nav-pills nav-justified d-flex d-md-none"
			id="v-pills-tab2">
			<li class="nav-item"><a href="/admin/adminMain/#adminMember-tab"><button
						class="nav-link tabs2  active" id="v-pills-adminMember-tab2"
						data-bs-toggle="pill" data-bs-target="#v-pills-adminMember"
						type="button" role="tab" aria-controls="v-pills-adminMember"
						aria-selected="true">회원정보</button></a></li>
			<li id="cate1" class="nav-item"><details id="hDetail">
					<summary
						style="padding: 0px; font-size: 14px; margin-bottom: 20px;">신고관리</summary>
					<ul class="subMenu">
						<li><a href="/admin/adminMain/#report1-tab"><button
									class="nav-link tabs2" id="v-pills-report1-tab2"
									data-bs-toggle="pill" data-bs-target="#v-pills-report1"
									type="button" role="tab" aria-controls="v-pills-report1"
									aria-selected="true" style="color: #666666;">신고목록</button></a></li>
						<li><a href="/admin/adminMain/#report2-tab"><button
									class="nav-link tabs2" id="v-pills-report2-tab2"
									data-bs-toggle="pill" data-bs-target="#v-pills-report2"
									type="button" role="tab" aria-controls="v-pills-report2"
									aria-selected="true" style="color: #666666;">블랙리스트</button></a></li>
					</ul>
				</details></li>
			<li class="nav-item"><a href="/admin/adminMain/#dashBoard"><button
						class="nav-link tabs2" id="v-pills-dashBoard-tab2"
						data-bs-toggle="pill" data-bs-target="#v-pills-dashBoard"
						type="button" role="tab" aria-controls="v-pills-adminMember"
						aria-selected="true">대시보드</button></a></li>
		</ul>
		<div class="d-flex align-items-start">
			<!-- 사이드 탭-->
			<div class="nav flex-column nav-pills  d-none d-md-flex"
				id="v-pills-tab" role="tablist" aria-orientation="vertical">
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
				<a href="/admin/adminMain/#dashBoard" >
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
						<a class="nav-link" href="/admin/memberClassTap1?email=${email}#section1-tab"><button
								class="classBtn  active" id="section1-tab-btn">구매한 재능</button></a>
					</div>
					<div class="classBtnWrapper">
						<a class="nav-link" href="/admin/memberClassTap1?email=${email}#section2-tab"><button
								class="classBtn" id="section2-tab-btn">찜한 재능</button></a>
					</div>
					<div class="classBtnWrapper">
						<a class="nav-link" href="/admin/memberClassTap1?email=${email}#section3-tab"><button
								class="classBtn" id="section3-tab-btn">오픈한 재능</button></a>
					</div>
					<div class="classBtnWrapper">
						<a class="nav-link" href="/admin/memberClassTap1?email=${email}#section4-tab"><button
								class="classBtn" id="section4-tab-btn">작성한 리뷰</button></a>
					</div>
				</div>
				<div class="tab-content">
				<!-- 오픈한 강의 상세보기 -->
				<div id="v-pills-tabContent">
					<div>
						<div class="category">구매한 클래스
						
						</div>
						<div style="font-size: 20px; width: 90%; margin: auto; margin-top: 30px; margin-bottom: 15px;">구매 상세 내역
						<br><a href='/class/detail?class_seq=${classInfo.PARENT_SEQ}'><span style="font-size:0.7em;">클래스보러가기 > </span></a>
						</div>
						<c:if test="${classInfo.CSTATE != '2' && classInfo.CSTATE == '1'}"> 
						<div class="stateinfo" style="text-align:right; width: 96%;"><button disabled class="statebtn">신고<span class="statetooltip">다른 사용자에 의해 신고된 클래스입니다.</span></button></div>
						</c:if>
						<c:if test="${classInfo.CSTATE != '1' && classInfo.CSTATE == '2'}"> 
						<div class="stateinfo" style="text-align:right; width: 96%;"><button disabled class="statebtn">삭제<span class="statetooltip">관리자에 의해 삭제된 클래스입니다.</span></button></div>
						</c:if>
						<div class="categories" style="margin-top:60px;">수강 신청 현황</div>
						<div class="detailrow1">
							<div class="detailleft1 detailleft">클래스 제목</div>
							<input type=hidden class="class_seq" value="${classInfo.PARENT_SEQ}">
							<input type=hidden class="state" value="${classInfo.CSTATE}">
							<div id="classtitle2" class="detailright1 detailright">${classInfo.TITLE}</div>
						</div>
						<div class="detailrow1">
							<div class="detailleft1 detailleft">클래스 일정</div>
							<div class="detailright1 detailright"><fmt:formatDate value="${classInfo.CLASS_DATE}" type="both" pattern="yyyy-MM-dd" /></div>
						</div>
						<div class="detailrow1">
							<div class="detailleft1 detailleft">크리에이터</div>
							<div class="detailright1 detailright">${classInfo.NICKNAME}</div>
						</div>
						<div class="categories">결제 현황</div>
						<div class="detailrow1">
							<div class="detailleft1 detailleft">결제 일자</div>
							<div class="detailright1 detailright">${classInfo.REG_DATE}</div>
						</div>
						<div class="detailrow1">
							<div class="detailleft1 detailleft">결제 수단</div>
							<div class="detailright1 detailright">
							<c:if test="${classInfo.TYPE eq 'K'}">
							카카오페이
							</c:if>
							<c:if test="${classInfo.TYPE eq 'N'}">
							네이버페이
							</c:if>
							</div>
						</div>
						<div class="detailrow1">
							<div class="detailleft1 detailleft">결제 금액</div>
							<div class="detailright1 detailright"><fmt:formatNumber value="${classInfo.CPRICE}" pattern="#,###" />원</div>
						</div>
						<div class="categories">환불 현황</div>
						<div class="detailrow1">
							<div class="detailleft1 detailleft">환불 여부</div>
							<div class="detailright1 detailright">${classInfo.STATE}</div>
						</div>
						<div class="detailrow1">
							<div class="detailleft1 detailleft">환불 금액</div>
							<div class="detailright1 detailright"><fmt:formatNumber value="${classInfo.CPRICE-classInfo.PRICE}" pattern="#,###" />원</div>
						</div>
						<div class="detailrow1" style="margin-bottom:30px;">
							<div class="detailleft1 detailleft">실제 결제 금액</div>			
							<div class="detailright1 detailright"><fmt:formatNumber value="${classInfo.PRICE}" pattern="#,###" />원
							<c:if test="${classInfo.state eq '환불'}">
							<fmt:formatNumber value="${classInfo.PRICE}" pattern="#,###" />원
							</c:if>
							</div>
							<c:if test="${classInfo.STATE eq '결제완료'}">
							<button class='goRefund' style="margin-top:15px;">클래스 환불하기</button>
							<input type=hidden class="class_seq" value ="${classInfo.PARENT_SEQ}">
							<input type=hidden class="class_date" value="${classInfo.CLASS_DATE}">
							</c:if>
						</div>
						<div style="clear: both;"></div>
					</div>
				</div>
				</div>
			</div>
		</div>
	</div>
<script>
function getYear(date) {
	return date.getFullYear();
}

function getMonth(date) {
	return ('0' + (date.getMonth() + 1)).slice(-2);
}

function getDate(date) {
	return ('0' + date.getDate()).slice(-2);
}

$(".goRefund").on("click",function(){			
	let class_seq = $(this).siblings(".class_seq").val();
	let class_date = $(this).siblings(".class_date").val();
	
	let today = new Date();
	class_date = new Date(class_date);
	
	console.log('날짜 비교 : ' + (class_date>today));
	
	if(class_date > today) {
		Swal.fire({                    
            width:1000,
            html: "<span style='font-size:18px'>환불 정책에 따라 클래스 일정 하루 전날까지 환불 요청이 가능합니다.<br><br>- 클래스 일정 7일 전까지 취소 시 : 전액 환불<br>- 클래스 일정 3일 전까지 취소 시 : 결제 요금의 50% 환불<br>- 클래스 일정 전날까지 취소 시 : 결제 요금의 30% 환불<br>- 클래스 일정 당일 이후 : 취소/환불 불가<br><br>정말 환불하시겠어요?</span>",
            showCancelButton: true,
            background:'#dbdbdb',
            backdrop:'transparent',
            confirmButtonColor: '#9381ff',
            confirmButtonText: '확인',
            cancelButtonText: '취소',    
        }).then((result) => {
            if (result.isConfirmed) {
               location.href="/class/toRefund?class_seq=" + class_seq + "";
            }else {
               return false;
         }
        })
        
        return false;
	}else {
		Swal.fire({                    
            width:800,
            html: "<span style='font-size:18px'>현재 클래스 일정 당일 이후로 환불이 불가합니다.<br><br>클래스 결제 관련 문제가 있으신 경우 관리자에게 문의하세요.</span>",
            showConfirmButton: false,
            timer: 2000,
            background:'#dbdbdb',
            backdrop:'transparent'
        })
	}
	})
</script>
	<jsp:include page="/WEB-INF/views/common/pNav.jsp" />
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
