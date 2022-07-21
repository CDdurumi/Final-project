
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
<!-- 부트스트랩  -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
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
						aria-selected="true" style="border-bottom:4px solid #9381ff">회원정보</button></a></li>
			<li id="cate1" class="nav-item"><details id="hDetail">
					<summary
						style="padding: 0px; font-size: 14px; margin-bottom: 20px;" >신고관리</summary>
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

				<div id="classBtns" class="btnForPc">
					<div class="classBtnWrapper">
						<a class="nav-link" href="#section1-tab"><button
								class="classBtn active" id="section1-tab-btn">구매한 클래스</button></a>
					</div>
					<div class="classBtnWrapper">
						<a class="nav-link" href="#section2-tab"><button
								class="classBtn" id="section2-tab-btn">찜한 클래스</button></a>
					</div>
					<div class="classBtnWrapper">
						<a class="nav-link" href="#section3-tab"><button
								class="classBtn" id="section3-tab-btn">오픈한 클래스</button></a>
					</div>
					<div class="classBtnWrapper">
						<a class="nav-link" href="#section4-tab"><button
								class="classBtn" id="section4-tab-btn">작성한 리뷰</button></a>
					</div>
				</div>
				<div class="row" id="classBtn2">
					<div class="classBtnWrapper col-5 d-lg-none">
						<a class="nav-link" href="#section1-tab"><button
								class="classBtn active" id="section1-tab-btn2">구매한 클래스</button></a>
					</div>
					<div class="classBtnWrapper col-5 d-lg-none">
						<a class="nav-link" href="#section2-tab"><button
								class="classBtn" id="section2-tab-btn2">찜한 클래스</button></a>
					</div>
					<div class="classBtnWrapper col-5 d-lg-none">
						<a class="nav-link" href="#section3-tab"><button
								class="classBtn" id="section3-tab-btn2">오픈한 클래스</button></a>
					</div>
					<div class="classBtnWrapper col-5 d-lg-none">
						<a class="nav-link" href="#section4-tab"><button
								class="classBtn" id="section4-tab-btn2">작성한 리뷰</button></a>
					</div>
				</div>

				<div class="tab-content">
					<!-- 1페이지 : 구매한 재능 -->
					<div class="tab-pane fade show active" id="section1-tab">
						<div class="category">${mdto.name}님이 구매한 클래스</div>
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
					<!-- 네번째 페이지 : 작성한 리뷰 -->
					<div class="tab-pane fade" id="section4-tab">
						<div class="category">${mdto.name}님이 작성한 리뷰</div>
						<div id="memberReviewContainer"></div>
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
			$("#" + siteUrl + "-btn").addClass("active");
			$("#" + siteUrl + "-btn2").addClass("active");//url에 맞는 탭 활성화      
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
// 								let buydayList = JSON.parse(data[2]);
// 								console.log("buydayList :"+ buydayList);
								let mainImgList = JSON.parse(data[2]);
								let class_date = JSON.parse(data[3]);
								
								if(buyClassList.length==0){
									$("#buyclassPage").append("<div class='noClass' style='font-size:20px'>구매한 클래스가 없습니다.</div>")
								}
								
								for (let i = 0; i < buyClassList.length; i++) {

									let price = buyClassList[i].PRICE;
									let price1 = price.toLocaleString('ko-KR')
									let toemail = '${mdto.email}';
									
									let classLink = $("<a href='/admin/buyClassDetail?email=${mdto.email}&regstds_seq="+buyClassList[i].REGSTDS_SEQ+"'>")
									let buyclassbox = $("<div class='class'>")
									let classdate = $("<div class='classdate'>수업일 : "+class_date[i]+"</div>");
									let row2 = $("<div class='row2'>");
									let left2 = $("<div class='left2'><img class='classimg' src='/upload/"+mainImgList[i].sys_name+"'></div>");
									let right2 = $("<div class='right2'>")
									let classrow3 = $("<div class='classrow3'>"+ buyClassList[i].CATEGORY1+"·<span class='cate2'>"+buyClassList[i].CATEGORY2+"</span><div>")
									let classrow4 = $("<div class='classrow4'>"+ buyClassList[i].TITLE+ "· <span class='creator'>"+buyClassList[i].CRENICKNAME+"</span></div>");
									let classrow5 =$("<div class='classrow5'>"+buyClassList[i].BUY_DATE+" 구매 · "+ price1 + "원</div>");
								 	
									if(buyClassList[i].STATE==2){//삭제처리된 게시글 표시
										classdate.append("<span style='font-size:0.7em;'>   (신고로 인한 삭제처리)</span>");
									}
									
									if(buyClassList[i].RSTATE=='환불'){
										
										classdate.append("<span style='font-size:0.8em;color:red;'>(환불)</span>");
									
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
								let goodCList = JSON.parse(data[1]);
								let mainImgList = JSON.parse(data[2]);
								let class_dateList = JSON.parse(data[3]);
					
								if(goodCList.length==0){
									$("#goodClassPage").append("<div class='noClass' style='font-size:20px'>찜한 클래스가 없습니다.</div>")
								}
								
								for (let i = 0; i < goodCList.length; i++) {
									let price = goodCList[i].PRICE;
									let price1 = price.toLocaleString('ko-KR')
									
									
									let classLink = $("<a href='/class/detail?class_seq="+goodCList[i].CLASS_SEQ+"'>")
									let goodclassbox = $("<div class='class'>")
									let classdate = $("<div class='classdate'>수업일 : "+class_dateList[i]+"</div>");
									let row2 = $("<div class='row2'>");
									let left2 = $("<div class='left2'><img class='classimg' src='/upload/"+mainImgList[i].sys_name+"'></div>");
									let right2 = $("<div class='right2'>")
									let classrow3 = $("<div class='classrow3'>"+ goodCList[i].CATEGORY1+"·<span class='cate2'>"+goodCList[i].CATEGORY2+"</span><div>")
									let classrow4 = $("<div class='classrow4'>"+ goodCList[i].TITLE+ "· <span class='creator'>"+goodCList[i].TITLE+"</span></div>");
									let classrow5 =$("<div class='classrow5'>"+ price+ "원</div>");
								 
									if(goodCList[i].STATE==2){//삭제처리된 게시글 표시
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
							$("#openClassPage").append("<div class='noClass' style='font-size:20px'>오픈한 클래스가 없습니다.</div>")
						}
						
						for (let i = 0; i < openClassList.length; i++) {
							let price = openClassList[i].PRICE;
							let price1 = price.toLocaleString('ko-KR')

						
							let classLink = $("<a href='/admin/memberClassDetail?class_seq="+openClassList[i].CLASS_SEQ+"'>")
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

			let reviewContainer = $("#memberReviewContainer")
			reviewContainer.text('');
			$("#reviewPage").text('');
			
			
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
						
						if(reviewList.length==0){
							$("#reviewPage").append("<div class='noClass' style='font-size:20px'>작성한 리뷰가 없습니다.</div>")
						}
						
						for (let i = 0; i < reviewList.length; i++) {
							let price = reviewList[i].PRICE;
							let price1 = price.toLocaleString('ko-KR')
							
							
							let classLink = $("<a href='/class/detail?class_seq="+reviewList[i].CLASS_SEQ+"'></a>")
							let reviewbox = $("<div class='class reviewBox'></div>")
							let classdate = $("<div class='classdate'>수업일 : "+class_dateList[i]+"</div>");
							let row = $("<div class='row'></div>");
							let classdate2 = $("<div class='classdate2 instar'></div>");
							let stopstar = $("<span class='stopstar'></span>")
							let starcount = $("<input type='hidden' value="+reviewList[i].STAR_COUNT+">")
							let starrate = $("<span class='starrate'>("+reviewList[i].STAR_COUNT+"점/5점)</span>")
							let classdate3 = $("<div class='classdate3'>"+reviewList[i].RCONTENTS+"</div>");
							let row2 = $("<div class='row2'></div>");
							let left2 = $("<div class='left2'><img class='classimg' src='/upload/"+mainImgList[i].sys_name+"'></div>");
							let right2 = $("<div class='right2'></div>")
							let classrow3 = $("<div class='classrow3'>"+ reviewList[i].CATEGORY1+"·<span class='cate2'>"+reviewList[i].CATEGORY2+"</span></div>")
							let classrow4 = $("<div class='classrow4'>"+ reviewList[i].TITLE+ "· <span class='creator'>"+reviewList[i].CREATERNICK+"</span></div>");
							let classrow5 =$("<div class='classrow5'>"+ price1 + "원</div>");
							if(reviewList[i].CSTATE==2 || reviewList[i].RSTATE ==2){//삭제처리된 게시글 표시
								classdate.append("<span style='font-size:0.7em;'>   (신고로 인한 삭제처리)</span>");
							}
							
							right2.append(classrow3);
							right2.append(classrow4);
							right2.append(classrow5);
							row2.append(left2);
							row2.append(right2);
							stopstar.append(starcount)
							stopstar.append(starrate);
							classdate2.append(stopstar);
							
							row.append(classdate2)
							row.append(classdate3)
							reviewbox.append(classdate);
							reviewbox .append(row);
							reviewbox .append(row2);
							classLink.append(reviewbox);
							reviewContainer.append(classLink);
			
							


						}
				          // 별점
				          $('.stopstar').each(function (index, item) {
				              let star = "<i class='bi bi-star'></i>";
				              let half = "<i class='bi bi-star-half'></i>";
				              let fill = "<i class='bi bi-star-fill'></i>";

				              let classTotalStar = $(this).children("input").val();
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
				          
							//페이지 
							
							if(reviewList.length!=0){
				    			if(page.startPage!=1){
				    				$("#reviewPage").append("<div class='movePage' id='reviewPrevBtn'>Prev</div>");
				    			}else{
				    				$("#reviewPage").append("<div class='movePage none' style='color:#d3d3d3'>Prev</div>")
				    			}
				    			for(let i=page.startPage;i<=page.endPage;i++){
				    				if(page.nowPage==i){
				    					$("#reviewPage").append("<div class='nowPage reviewPageBtn'>"+i+"</div>")	
				    				}else{
				    					$("#reviewPage").append("<div class='nomalPage reviewPageBtn'>"+i+"</div>")
				    				}
				    			}
				    			if(page.endPage<page.lastPage){
				    				$("#reviewPage").append("<div class='movePage' id='reviewNextBtn'>Next</div>");
				    			}else{
				    				$("#reviewPage").append("<div class='movePage none' style='color:#d3d3d3'>Next</div>");
				    			}
				    			
				    			//페이지 이동
				        		$(".reviewPageBtn").on("click",function(){
				            		let nowPage= $(this).text();
				            		reviewTap(email, nowPage)
				            	})
				            	
				            	//이전 페이지
				            	$("#reviewPrevBtn").on("click",function(){
				        			let nowPage= page.startPage-1;
				        			reviewTap(email, nowPage)
				            	})
				 	          	//다음 페이지
				            	$("#reviewNextBtn").on("click",function(){
				        			let nowPage= page.endPage+1;
				        			reviewTap(email, nowPage)
				            	})
							}
				          

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
<%-- 	<jsp:include page="/WEB-INF/views/common/pNav.jsp" /> --%>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
