<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="32x32" href="/img/favicon/favicon-32x32.png">
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
<link rel="stylesheet" href="/css/member/myPage.css">
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
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
							<li><a href="/myPage/main#talent2-tab"><button class="nav-link tabs2" id="v-pills-talent2-tab2" style="color: #666666;">찜한 클래스</button></a></li>
							<li><a href="/myPage/main#talent3-tab"><button class="nav-link tabs2" id="v-pills-talent3-tab2" style="color: #666666;">오픈한 클래스</button></a></li>
							<li><a href="/myPage/main#talent4-tab"><button class="nav-link tabs2" id="v-pills-talent4-tab2" style="color: #666666;">작성한 후기</button></a></li>
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
					<a href="/myPage/main#home-tab" style="width: 160px;">
						<button class="nav-link tabs" id="v-pills-home-tab">홈</button>
					</a> <a href="/myPage/main#profile-tab" style="width: 160px;">
						<button class="nav-link tabs" id="v-pills-profile-tab">내 정보</button>
					</a>
					<details id="talent" open style="width: 160px;">
						<summary>클래스</summary>
						<ul>
							<a href="/myPage/main#talent1-tab">
								<button class="nav-link tabs" id="v-pills-talent1-tab" style="border-bottom: 4px solid #9381ff;">
									<li class="myli">구매한 클래스</li>
								</button>
							</a>
							<a href="/myPage/main#talent2-tab">
								<button class="nav-link tabs" id="v-pills-talent2-tab">
									<li class="myli">찜한 클래스</li>
								</button>
							</a>
							<a href="/myPage/main#talent3-tab">
								<button class="nav-link tabs" id="v-pills-talent3-tab">
									<li class="myli">오픈한 클래스</li>
								</button>
							</a>
							<a href="/myPage/main#talent4-tab">
								<button class="nav-link tabs" id="v-pills-talent4-tab">
									<li class="myli">작성한 후기</li>
								</button>
							</a>
						</ul>
					</details>
					<details id="community" style="width: 160px;">
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
				<div id="v-pills-tabContent" style="width: calc(100% - 160px - 1rem);">
					<div>
						<div class="category">구매한 클래스</div>
						<div style="font-size: 20px; width: 90%; margin: auto; margin-top: 30px; margin-bottom: 15px;">구매 상세 내역</div>
						<c:if test="${mybuyclass[0].STATE != '2' && mybuyclass[0].STATE == '1'}">
							<div class="stateinfo" style="text-align: right; width: 96%;">
								<button disabled class="statebtn">
									신고<span class="statetooltip">다른 사용자에 의해 신고된 클래스입니다.</span>
								</button>
							</div>
						</c:if>
						<c:if test="${mybuyclass[0].STATE != '1' && mybuyclass[0].STATE == '2'}">
							<div class="stateinfo" style="text-align: right; width: 96%;">
								<button disabled class="statebtn">
									삭제<span class="statetooltip">관리자에 의해 삭제된 클래스입니다.</span>
								</button>
							</div>
						</c:if>
						<div class="categories" style="margin-top: 60px;">수강 신청 현황</div>
						<div class="detailrow1">
							<div class="detailleft">클래스 제목</div>
							<input type=hidden class="class_seq" value="${mybuyclass[0].CLASS_SEQ}"> <input type=hidden class="state" value="${mybuyclass[0].STATE}">
							<div id="classtitle2" class="detailright">${mybuyclass[0].TITLE}</div>
						</div>
						<div class="detailrow1">
							<div class="detailleft">클래스 일정</div>
							<div class="detailright">
								<fmt:formatDate value="${mybuyclass[0].CLASS_DATE}" type="both" pattern="yyyy-MM-dd" />
							</div>
						</div>
						<div class="detailrow1">
							<div class="detailleft">크리에이터</div>
							<div class="detailright">${mybuyclass[0].NICKNAME}</div>
						</div>
						<div class="categories">결제 현황</div>
						<div class="detailrow1">
							<div class="detailleft">결제 일자</div>
							<div class="detailright">${mybuyclass[0].buy_date}</div>
						</div>
						<div class="detailrow1">
							<div class="detailleft">결제 수단</div>
							<div class="detailright">
								<c:if test="${mybuyclass[0].TYPE eq 'K'}">
							카카오페이
							</c:if>
								<c:if test="${mybuyclass[0].TYPE eq 'N'}">
							네이버페이
							</c:if>
							</div>
						</div>
						<div class="detailrow1">
							<div class="detailleft">결제 금액</div>
							<div class="detailright">
								<fmt:formatNumber value="${mybuyclass[0].PRICE}" pattern="#,###" />
								원
							</div>
						</div>
						<c:if test="${mybuyclass[0].refund_state eq '환불'}">
							<div class="categories">환불 현황</div>
							<div class="detailrow1">
								<div class="detailleft">환불 여부</div>
								<div class="detailright">${mybuyclass[0].refund_state}</div>
							</div>
							<div class="detailrow1">
								<div class="detailleft">환불 금액</div>
								<div class="detailright">
									<fmt:formatNumber value="${mybuyclass[0].PRICE-mybuyclass[0].total}" pattern="#,###" />
									원
								</div>
							</div>
							<div class="detailrow1" style="margin-bottom: 30px;">
								<div class="detailleft">실제 결제 금액</div>
								<div class="detailright">
									<c:if test="${mybuyclass[0].refund_state eq '환불'}">
										<fmt:formatNumber value="${mybuyclass[0].total}" pattern="#,###" />원
							</c:if>
								</div>
							</div>
						</c:if>
						<c:if test="${mybuyclass[0].refund_state eq '결제완료'}">
						<div class="detailrow1" style="border:none;">
							<button class='goRefund' style="margin-top: 15px;">클래스 환불하기</button>
							<input type=hidden class="class_seq" value="${mybuyclass[0].CLASS_SEQ}">
							<input type=hidden class="class_date" value="${mybuyclass[0].CLASS_DATE}">
						</div>
						</c:if>
						<div style="clear: both;"></div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/loginModal.jsp" />
	<jsp:include page="/WEB-INF/views/common/pNav.jsp" />
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
<script>
$(document).on("click", "#classtitle2" ,function(){
	let class_seq = $(this).siblings(".class_seq").val();
	let state = $(this).siblings(".state").val();
		
	if(state == "2") {
		Swal.fire({                    
            width:400,
            html: "<span style='font-size:15px'>관리자에 의해 삭제된 클래스입니다.</span>",
            showConfirmButton: false,
            timer: 1000,
            background:'#dbdbdb90',
            backdrop:'transparent'
        })
		return false;
	}else {
		location.href="/class/detail?class_seq="+class_seq+"";
	}
})

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
</html>