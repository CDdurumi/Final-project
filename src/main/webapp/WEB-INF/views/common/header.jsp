<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/css/header.css">

<title>header</title>

<script>
	function signOut() {
	    var auth2 = gapi.auth2.getAuthInstance();
	    auth2.signOut().then(function () {
	    });
	  }
	$(document).ready(function(){
		  function kakaoLogout() {
			  
		  }
		
		
		$(".kakao-logout").on("click", function(){
			Kakao.Auth.logout()
			
				$.ajax({
					url:"/login/kakaoLogout",
					type:"get",
					async: false
				}).done(function(resp){
				
					if(resp){
						alert("로그아웃 되었습니다.")
						location.href="/"
					}
				
				});
		});
	});
		
		


</script>	

</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
		<div class="container" id="naviContainer">
			<div id="header_logo">
				<a class="navbar-brand" href="/"><img src="/img/logo1.png" style="width: auto; height: 40px;"></a>
			</div>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item">
						<div class="pulse">
							<span data-tooltip="한번 배워볼까요?"><a class="nav-link" aria-current="page" href="/class/main">재능마켓</a></span>
						</div>
					</li>
					<li class="nav-item">
						<div class="pulse">
							<span data-tooltip="도움이 필요하다면?"><a class="nav-link" href="/community/main">커뮤니티</a></span>
						</div>
					</li>
					<li class="nav-item">
						<div class="pulse">
							<span data-tooltip="도와가 궁금하다면?"><a class="nav-link" href="/center/main">고객센터</a></span>
						</div>
					</li>
					<c:choose>
						<c:when test="${loginID != null}">
							<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 내 정보 </a>
								<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" id="header_dropdown_menu">
									<c:choose>
										<c:when test="${type == 'A'}">
											<li><a class="dropdown-item" href="/admin/adminMain">관리자페이지</a></li>
										</c:when>
									</c:choose>
									<li><a class="dropdown-item" href="/myPage/main">마이페이지</a></li>
									
									<c:choose>
										<c:when test="${login_type == 'D'}">
											<div class="shake">
												<li><a class="dropdown-item" href="/login/logout">로그아웃</a></li>
											</div>
										</c:when>
										<c:when test="${login_type == 'G'}">
											<div class="shake">
												<li><a class="dropdown-item" href="/login/logout" onclick="signOut();">로그아웃</a></li>
											</div>
										</c:when>										
										<c:when test="${login_type == 'K'}">
											<div class="shake">
												<li><a class="dropdown-item kakao-logout">로그아웃</a></li>
											</div>
										</c:when>										
									</c:choose>
									
								</ul>
							</li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link" data-bs-toggle="modal" href="#login-toggle" role="button">로그인</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>

	
	
	<script>
	
	// 	30일 후에 만료되는 쿠키를 저장하고 싶다면 setCookie('key', 'value', 30); 과 같이 실행하면 됩니다.
	//쿠키 저장
	// expiredays 는 일자 정수 - 365년 1년 쿠키
	function setCookie(key, value, expiredays) {
	    let todayDate = new Date();
	    todayDate.setDate(todayDate.getDate() + expiredays); // 현재 시각 + 일 단위로 쿠키 만료 날짜 변경
	    //todayDate.setTime(todayDate.getTime() + (expiredays * 24 * 60 * 60 * 1000)); // 밀리세컨드 단위로 쿠키 만료 날짜 변경
	    document.cookie = key + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
	}
	
	//쿠키 삭제
	//쿠키는 삭제가 없어서 현재 시각으로 만료 처리를 함.
// 	function delCookie(key){
// 	    let todayDate = new Date();
// 	    document.cookie = key + "=; path=/; expires=" + todayDate.toGMTString() + ";" // 현재 시각 이전이면 쿠키가 만료되어 사라짐.
// 	}
	
	// 쿠키 읽기
	function getCookie(key){
		key = new RegExp(key + '=([^;]*)'); // 쿠키들을 세미콘론으로 구분하는 정규표현식 정의
		return key.test(document.cookie) ? unescape(RegExp.$1) : ''; // 인자로 받은 키에 해당하는 키가 있으면 값을 반환
	}
	
	//쿠키 체크 - 있으면 true 없으면 false
	//getCookie() 에 의존
	function boolCheckCookie(key) {
	    return getCookie(key) != '' ? true : false;
	}
	
	//쿠키 체크 테스트 함수
	//getCookie() 에 의존
	function checkCookieTest(key) {
	    let val = getCookie(key);
	    if (val != "") {
	      return val;
	    } else {
	      val = prompt(key+" 쿠키의 값을 입력해주세요:", "");
	      if (val != "" && val != null) {
	        setCookie(key, val, 365);
	        return val;
	      }
	    }
	}
	
	
	$(".nav-link").on("click",function(){
		setCookie('hash', '0', 30);//쿠기 기본으로 셋.(detailVeiw 해시태그 검색 및 Main에서 검색했다는 의미 없애기)
	});
	$(".navbar-brand").on("click",function(){
		setCookie('hash', '0', 30);//쿠기 기본으로 셋.(detailVeiw 해시태그 검색 및 Main에서 검색했다는 의미 없애기)
	});
	$(".dropdown-item").on("click",function(){
		setCookie('hash', '0', 30);//쿠기 기본으로 셋.(detailVeiw 해시태그 검색 및 Main에서 검색했다는 의미 없애기)
	});
	
	
	</script>
	
</body>

</html>