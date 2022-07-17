
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
								class="classBtn active" id="section1-tab-btn">구매한 재능</button></a>
					</div>
					<div class="classBtnWrapper">
						<a class="nav-link" href="#section2-tab"><button
								class="classBtn" id="section2-tab-btn">찜한 재능</button></a>
					</div>
					<div class="classBtnWrapper">
						<a class="nav-link" href="#section3-tab"><button
								class="classBtn" id="section3-tab-btn">오픈한 재능</button></a>
					</div>
					<div class="classBtnWrapper">
						<a class="nav-link" href="#section4-tab"><button
								class="classBtn" id="section4-tab-btn">작성한 리뷰</button></a>
					</div>
				</div>
				<div class="tab-content">
					<!-- 1페이지 : 구매한 재능 -->
					<div class="tab-pane fade show active" id="section1-tab">
						<div class="category">${mdto.name}님이 구매한 재능</div>
							<div id="buyClassContainer"></div>
							<div class="pageWrapper">
								<div class="page info" id="buyclassPage">
								</div>
							</div>
					</div>
					<!-- 두번째 페이지 : 좋아요한 재능 -->
					<div class="tab-pane fade" id="section2-tab">
						<div class="category">${mdto.name}님이 찜한 클래스</div>
						<div id="goodClassContainer"></div>
						<div class="pageWrapper">
							<div class="page info" id="goodClassPage"></div>
						</div>
					</div>
					<!-- 세번째 페이지 : 등록한 재능 -->
					<div class="tab-pane fade" id="section3-tab">
						<div class="category">${mdto.name}님이 오픈한 클래스</div>
						<div id="openClassContainer"></div>
						<div class="pageWrapper">
							<div class="page info" id="openClassPage"></div>
						</div>
					</div>
					<!-- 등록한 강의 상세보기 -->
					<div class="tab-pane fade" id="v-pills-classdetail" role="tabpanel"
						aria-labelledby="v-pills-classdetail-tab">
						<div class="category">${mdto.name}님이 오픈한 클래스</div>
						<div
							style="font-size: 20px; width: 90%; margin: auto; margin-top: 30px; margin-bottom: 30px;">강의
							상세 내역</div>
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
					<!-- 네번째 페이지 : 작성한 리뷰 -->
					<div class="tab-pane fade" id="section4-tab">
						<div class="category">${mdto.name}님이 작성한 리뷰</div>
						<div id="reviewContainer">
						<div class="class classReview">
							<div class="classdate">
								2022.6.28
							</div >
							<div class="classdate2">d</div>
							<div class="classdate3">d</div>
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
						<div class="pageWrapper">
							<div class="page info" id="reviewPage"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		let siteUrl = window.location.href.split("#").pop();
		let tabs = $(".classBtn"); //
		let tabs_contents = $(".tab-content").children(); // 컨텐츠틀
		setting(siteUrl); //사이트 접속 초기세팅
		let email = '${mdto.email}';

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
			tabs.removeClass("active");
			$("#" + siteUrl + "-btn").addClass("active"); //url에 맞는 탭 활성화      
			tabs_contents.removeClass("show active"); //부트스트랩 탭 컨텐츠 버그방지용 초기화
			$("#" + siteUrl).addClass("show active"); // url에 맞는 컨텐츠 활성화
		
			if(siteUrl == "section1-tab"){
				buyClassTap('${mdto.email}', 1)
			}else if(siteUrl=="section2-tab"){
				goodClassTap('${mdto.email}', 1)
			}else if(siteUrl=="section3-tab"){
				openClassTap('${mdto.email}', 1)
			}else if(siteUrl=="section4-tab"){
				reviewTap('${mdto.email}', 1)
			}
				
			

		}

		function resetTab() { //선택된 탭 초기화
			tabs.removeClass("active");
		}

		//구매한 재능 탭
		function buyClassTap(email, nowPage) {

			let buyClassContainer = $("#buyClassContainer")
			buyClassContainer.text('');
			$("#buyclassPage").text('');
			
			
			if (nowPage == '') {
				nowPage = 1;
			}
			
			$.ajax({
					url : "/admin/buyClassList",
					data : {
							"email" : email,
							"nowPage" : nowPage
						},
						dataType : "json"
					})
					.done(
							function(data) {
								let page = JSON.parse(data[0]);
								let buyClassList = JSON.parse(data[1]);
								let buydayList = JSON.parse(data[2]);
								console.log("buydayList :"+ buydayList);
								let mainImgList = JSON.parse(data[3]);
								let class_date = JSON.parse(data[4]);
								let creatorNickname = JSON.parse(data[5]);
								
								if(buyClassList.length==0){
									$("#buyclassPage").append("<div class='noClass' style='font-size:20px'>구매한 클래스가 없습니다.</div>")
								}
								
								for (let i = 0; i < buyClassList.length; i++) {
									let date = new Date(buydayList[i]);
									let reg_date = getTime(date);
									let price = buyClassList[i].price;
									let price1 = price.toLocaleString('ko-KR')
									
									
									let classLink = $("<a href='/class/detail?class_seq="+buyClassList[i].class_seq+"'>")
									let buyclassbox = $("<div class='class'>")
									let classdate = $("<div class='classdate'>수업일 : "+class_date[i]+"</div>");
									let row2 = $("<div class='row2'>");
									let left2 = $("<div class='left2'><img class='classimg' src='/upload/"+mainImgList[i].sys_name+"'></div>");
									let right2 = $("<div class='right2'>")
									let classrow3 = $("<div class='classrow3'>"+ buyClassList[i].category1+"·<span class='cate2'>"+buyClassList[i].category2+"</span><div>")
									let classrow4 = $("<div class='classrow4'>"+ buyClassList[i].title+ "· <span class='creator'>"+creatorNickname[i]+"</span></div>");
									let classrow5 =$("<div class='classrow5'>"+reg_date+" 구매 · "+ price1 + "원</div>");
								 	
									if(buyClassList[i].state==2){//삭제처리된 게시글 표시
										classdate.append("<span style='font-size:0.7em;'>   (신고로 인한 삭제처리)</span>");
									}
									
								
									right2.append(classrow3);
									right2.append(classrow4);
									right2.append(classrow5);
									row2.append(left2);
									row2.append(right2);
									buyclassbox.append(classdate);
									buyclassbox.append(row2);
									classLink.append(buyclassbox);
									buyClassContainer.append(classLink);
								}
								

							//페이지 
							
							if(buyClassList.length!=0){
				    			if(page.startPage!=1){
				    				$("#buyclassPage").append("<div class='movePage' id='buyClassPrevBtn'>Prev</div>");
				    			}else{
				    				$("#buyclassPage").append("<div class='movePage none' style='color:#d3d3d3'>Prev</div>")
				    			}
				    			for(let i=page.startPage;i<=page.endPage;i++){
				    				if(page.nowPage==i){
				    					$("#buyclassPage").append("<div class='nowPage buyClassPageBtn'>"+i+"</div>")	
				    				}else{
				    					$("#buyclassPage").append("<div class='nomalPage buyClassPageBtn'>"+i+"</div>")
				    				}
				    			}
				    			if(page.endPage<page.lastPage){
				    				$("#buyclassPage").append("<div class='movePage' id='buyClassNextBtn'>Next</div>");
				    			}else{
				    				$("#buyclassPage").append("<div class='movePage none' style='color:#d3d3d3'>Next</div>");
				    			}
				    			
				    			//페이지 이동
				        		$(".buyClassPageBtn").on("click",function(){
				            		let nowPage= $(this).text();
				            		buyClassTap(email,nowPage)
				            	})
				            	
				            	//이전 페이지
				            	$("#buyClassPrevBtn").on("click",function(){
				        			let nowPage= page.startPage-1;
				        			buyClassTap(email,nowPage)
				            	})
				 	          	//다음 페이지
				            	$("#buyClassNextBtn").on("click",function(){
				        			let nowPage= page.endPage+1;
				        			buyClassTap(email,nowPage)
				            	})
							}

							
							})

		}
		
		//좋아요한 재능 탭

		function goodClassTap(email, nowPage) {

			let goodClassContainer = $("#goodClassContainer")
			goodClassContainer.text('');
			$("#goodClassPage").text('');
			
			
			if (nowPage == '') {
				nowPage = 1;
			}
			
			$.ajax({
					url : "/admin/goodClass",
					data : {
							"email" : email,
							"nowPage" : nowPage
						},
						dataType : "json"
					})
					.done(
							function(data) {
								let page = JSON.parse(data[0]);
								console.log("페이치 :"+ page);
								let goodCList = JSON.parse(data[1]);
								let mainImgList = JSON.parse(data[2]);
								let class_dateList = JSON.parse(data[3]);
								let nicknameList= JSON.parse(data[4]);
					
								if(goodCList.length==0){
									$("#goodClassPage").append("<div class='noClass' style='font-size:20px'>찜한 클래스가 없습니다.</div>")
								}
								
								for (let i = 0; i < goodCList.length; i++) {
	
									let classLink = $("<a href='/class/detail?class_seq="+goodCList[i].class_seq+"'>")
									let goodclassbox = $("<div class='class'>")
									let classdate = $("<div class='classdate'>수업일 : "+class_dateList[i]+"</div>");
									let row2 = $("<div class='row2'>");
									let left2 = $("<div class='left2'><img class='classimg' src='/upload/"+mainImgList[i].sys_name+"'></div>");
									let right2 = $("<div class='right2'>")
									let classrow3 = $("<div class='classrow3'>"+ goodCList[i].category1+"·<span class='cate2'>"+goodCList[i].category2+"</span><div>")
									let classrow4 = $("<div class='classrow4'>"+ goodCList[i].title+ "· <span class='creator'>"+nicknameList[i]+"</span></div>");
									let classrow5 =$("<div class='classrow5'>"+ goodCList[i].price+ "원</div>");
								 
									if(goodCList[i].state==2){//삭제처리된 게시글 표시
										classdate.append("<span style='font-size:0.7em;'>   (신고로 인한 삭제처리)</span>");
									}
									
									
								
									right2.append(classrow3);
									right2.append(classrow4);
									right2.append(classrow5);
									row2.append(left2);
									row2.append(right2);
									goodclassbox.append(classdate);
									goodclassbox.append(row2);
									classLink.append(goodclassbox);
									goodClassContainer.append(classLink);
								}
								
// 								<div class="classdate">
// 								2022.6.28
// 								<button class="goReview">리뷰 남기기</button>
// 							</div>
// 							<div class="row2">
// 								<div class="left2">
// 									<img class="classimg" src="/img/class1.png">
// 								</div>
// 								<div class="right2">
// 									<div class="classrow3">1차 카테고리</div>
// 									<div class="classrow4">
// 										클래스명 · <span class="creator">크리에이터명</span>
// 									</div>
// 									<div class="classrow5">결제일자 : 2022.05.20 · 금액 : 50,400원</div>
// 								</div>
// 							</div>

							//페이지 
							
							if(goodCList.length!=0){
				    			if(page.startPage!=1){
				    				$("#goodClassPage").append("<div class='movePage' id='goodClassPrevBtn'>Prev</div>");
				    			}else{
				    				$("#goodClassPage").append("<div class='movePage none' style='color:#d3d3d3'>Prev</div>")
				    			}
				    			for(let i=page.startPage;i<=page.endPage;i++){
				    				if(page.nowPage==i){
				    					$("#goodClassPage").append("<div class='nowPage goodClassPageBtn'>"+i+"</div>")	
				    				}else{
				    					$("#goodClassPage").append("<div class='nomalPage goodClassPageBtn'>"+i+"</div>")
				    				}
				    			}
				    			if(page.endPage<page.lastPage){
				    				$("#goodClassPage").append("<div class='movePage' id='goodClassNextBtn'>Next</div>");
				    			}else{
				    				$("#goodClassPage").append("<div class='movePage none' style='color:#d3d3d3'>Next</div>");
				    			}
				    			
				    			//페이지 이동
				        		$(".goodClassPageBtn").on("click",function(){
				            		let nowPage= $(this).text();
				            		goodClassTap(email, nowPage)
				            	})
				            	
				            	//이전 페이지
				            	$("goodClassPrevBtn").on("click",function(){
				        			let nowPage= page.startPage-1;
				        			goodClassTap(email, nowPage)
				            	})
				 	          	//다음 페이지
				            	$("#goodClassNextBtn").on("click",function(){
				        			let nowPage= page.endPage+1;
				        			goodClassTap(email, nowPage)
				            	})
							}

							
							})

		}
		//오픈한 재능 탭
		function openClassTap(email, nowPage) {

			let openClassContainer = $("#openClassContainer")
			openClassContainer.text('');
			$("#openClassPage").text('');
			
			
			if (nowPage == '') {
				nowPage = 1;
			}
			
			$.ajax({
					url : "/admin/openClass",
					data : {
							"email" : email,
							"nowPage" : nowPage
						},
						dataType : "json"
					})
					.done(function(data) {
						let page = JSON.parse(data[0]);
						let openClassList = JSON.parse(data[1]);
						let mainImgList = JSON.parse(data[2]);
						let class_dateList = JSON.parse(data[3]);
						
						if(openClassList.length==0){
							$("openClassList").append("<div class='noClass' style='font-size:20px'>오픈한 클래스가 없습니다.</div>")
						}
						
						for (let i = 0; i < openClassList.length; i++) {
							let price = openClassList[i].PRICE;
							let price1 = price.toLocaleString('ko-KR')
							
							
							let classLink = $("<a href='/class/detail?class_seq="+openClassList[i].CLASS_SEQ+"'>")
							let openclassbox = $("<div class='class'>")
							let classdate = $("<div class='classdate'>수업일 : "+class_dateList[i]+"</div>");
							let row2 = $("<div class='row2'>");
							let left2 = $("<div class='left2'><img class='classimg' src='/upload/"+mainImgList[i].sys_name+"'></div>");
							let right2 = $("<div class='right2'>")
							let classrow3 = $("<div class='classrow3'>"+ openClassList[i].CATEGORY1+"·<span class='cate2'>"+openClassList[i].CATEGORY2+"</span><div>")
							let classrow4 = $("<div class='classrow4'>"+ openClassList[i].TITLE+ "· <span class='creator'>"+openClassList[i].NICKNAME+"</span></div>");
							let classrow5 =$("<div class='classrow5'>"+ price1 + "원</div>");
							let classrow6 =$("<div class='classrow_plus'>수강 신청 인원 : "+ openClassList[i].STD_COUNT+"명 · 별점 및 리뷰 : "+openClassList[i].STAR_COUNT+"/5 (리뷰 "+openClassList[i].REVIEW_COUNT+"건)</div>");
							if(openClassList[i].STATE==2){//삭제처리된 게시글 표시
								classdate.append("<span style='font-size:0.7em;'>   (신고로 인한 삭제처리)</span>");
							}
							
						
							right2.append(classrow3);
							right2.append(classrow4);
							right2.append(classrow5);
							right2.append(classrow6);
							row2.append(left2);
							row2.append(right2);
							openclassbox.append(classdate);
							openclassbox.append(row2);
							classLink.append(openclassbox);
							openClassContainer.append(classLink);
						}
						

							//페이지 
							
							if(openClassList.length!=0){
				    			if(page.startPage!=1){
				    				$("#openClassPage").append("<div class='movePage' id='openClassPrevBtn'>Prev</div>");
				    			}else{
				    				$("#openClassPage").append("<div class='movePage none' style='color:#d3d3d3'>Prev</div>")
				    			}
				    			for(let i=page.startPage;i<=page.endPage;i++){
				    				if(page.nowPage==i){
				    					$("#openClassPage").append("<div class='nowPage openClassPageBtn'>"+i+"</div>")	
				    				}else{
				    					$("#openClassPage").append("<div class='nomalPage openClassPageBtn'>"+i+"</div>")
				    				}
				    			}
				    			if(page.endPage<page.lastPage){
				    				$("#openClassPage").append("<div class='movePage' id='openClassNextBtn'>Next</div>");
				    			}else{
				    				$("#openClassPage").append("<div class='movePage none' style='color:#d3d3d3'>Next</div>");
				    			}
				    			
				    			//페이지 이동
				        		$(".openClassPageBtn").on("click",function(){
				            		let nowPage= $(this).text();
				            		openClassTap(email,nowPage)
				            	})
				            	
				            	//이전 페이지
				            	$("#openClassPrevBtn").on("click",function(){
				        			let nowPage= page.startPage-1;
				        			openClassTap(email,nowPage)
				            	})
				 	          	//다음 페이지
				            	$("#openClassNextBtn").on("click",function(){
				        			let nowPage= page.endPage+1;
				        			openClassTap(email,nowPage)
				            	})
							}

							
							})

		}		

		//작성힌 리뷰탭
		function reviewTap(email, nowPage) {

			let openClassContainer = $("#openClassContainer")
			openClassContainer.text('');
			$("#openClassPage").text('');
			
			
			if (nowPage == '') {
				nowPage = 1;
			}
			
			$.ajax({
					url : "/admin/writeReview",
					data : {
							"email" : email,
							"nowPage" : nowPage
						},
						dataType : "json"
					})
					.done(function(data) {
						let page = JSON.parse(data[0]);
						let reviewList = JSON.parse(data[1]);
						let mainImgList = JSON.parse(data[2]);
						let class_dateList = JSON.parse(data[3]);
						console.log(data)

						



							
							})

		}	
		
		
		function getYear(date) {
		    return date.getFullYear();
		}

		function getMonth(date) {
		    return ('0' + (date.getMonth() + 1)).slice(-2);
		}

		function getDate(date) {
		    return ('0' + date.getDate()).slice(-2);
		}

		function getHour(date) {
		    return ('0' + date.getHours()).slice(-2); 
		}

		function getMin(date) {
		    return ('0' + date.getMinutes()).slice(-2);
		}

		function getSec(date) {
		    return ('0' + date.getSeconds()).slice(-2); 
		}

		function getTime(date) {
		    return getYear(date) + "-" +getMonth(date) + "-" + getDate(date);
		}

		function getFullTime(date) {
		    return getYear(date) + "-" +getMonth(date) + "-" + getDate(date) + " " + getHour(date) + ":" + getMin(date) + ":" + getSec(date);
		}
	</script>
	<jsp:include page="/WEB-INF/views/common/pNav.jsp" />
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
