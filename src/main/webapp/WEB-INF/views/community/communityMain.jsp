<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CommunityMain</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!--부트스트랩-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>

<!-- side_tap common -->
<link rel="stylesheet" href="/css/sideTab.css">

<!-- communityMain 전용 스타일 -->
<link rel="stylesheet" href="/css/communityMain.css">

<!-- input style -->
<link rel="stylesheet" href="/css/index.css">



<style>

</style>

<script>
	$(function(){


	})

</script>

</head>


<body>
<!-- Header -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/> 
<%-- <jsp:include page="/WEB-INF/views/common/pNav.jsp"/> --%>


<div class="container mainContent">


<!-- <button id="dumy">더미 만들기</button> -->
<script>
// 	$("#dumy").on("click", function(){
// 		location.href = "/community/dumy";
// 	})
</script>




	<div id="pageHeader">커뮤니티<input type="button" id="writeBtn" value="글쓰기"><br><hr></div>
	
	<!-- 가로형 카테고리 영역 -->
	<div id="horizonCategoryArea">
<!-- 		<button id="category1Btn" class="horizonCategory">전체보기</button> -->
<!-- 		<button id="category2Btn" class="horizonCategory">궁금해요</button> -->
<!-- 		<button id="category3Btn" class="horizonCategory">도와주세요</button> -->
<!-- 		<button id="category4Btn" class="horizonCategory">도와드려요</button> -->
<!-- 		<button id="category5Btn" class="horizonCategory">일상</button> -->
		
		<a href="#all-tab" class="horizonCategory">전체보기</a>
		<a href="#question-tab" class="horizonCategory">궁금해요</a>
		<a href="#help-tab" class="horizonCategory">도와주세요</a>
		<a href="#support-tab" class="horizonCategory">도와드려요</a>
		<a href="#daily-tab" class="horizonCategory">일상</a>		
	</div>
	
	
	
    <!-- 세로 탭 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
    <div class="d-flex align-items-start">
        <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <a href="#all-tab"><button class="nav-link" id="v-pills-all-tab" data-bs-toggle="pill" data-bs-target="#v-pills-all" type="button" role="tab" aria-controls="v-pills-all" aria-selected="true">전체보기</button></a>
            <a href="#question-tab"><button class="nav-link " id="v-pills-question-tab" data-bs-toggle="pill" data-bs-target="#v-pills-question" type="button" role="tab" aria-controls="v-pills-question" aria-selected="false">궁금해요</button></a>
            <a href="#help-tab"><button class="nav-link" id="v-pills-help-tab" data-bs-toggle="pill" data-bs-target="#v-pills-help" type="button" role="tab" aria-controls="v-pills-help" aria-selected="false">도와주세요</button></a>
            <a href="#support-tab"><button class="nav-link" id="v-pills-support-tab" data-bs-toggle="pill" data-bs-target="#v-pills-support" type="button" role="tab" aria-controls="v-pills-support" aria-selected="false">도와드려요</button></a>
            <a href="#daily-tab"><button class="nav-link" id="v-pills-daily-tab" data-bs-toggle="pill" data-bs-target="#v-pills-daily" type="button" role="tab" aria-controls="v-pills-daily" aria-selected="false">일상</button></a>
        </div>

        <!-- 탭 contents --------------------------------------------------------------------------------------------->
        <div class="tab-content" id="v-pills-tabContent" style="word-break:break-all; ">
            <!--전체보기 탭1----------------------------------------------------------------->
            <div class="tab-pane fade " id="v-pills-all" role="tabpanel" aria-labelledby="v-pills-all-tab">
                <div class="" >
                	<!-- 검색 입력창 영역 --------------------------------->
                    <div class="col-12 searchArea">
						<input type="text" placeholder="키워드와 #태그 모두 검색할 수 있어요." class="searchWord">
                    </div>

                    <!-- 공지사항 영역 ------------------------------------>
                    <div class="col-12 notice" >
						공지사항
                    </div>
                    
                    <!-- 라이오 박스 영역 ---------------------------------->
                    <div class="col-12 allCategoryRadioDiv">
						<input type=radio class="categoryRadioBox" id="AllCategoryRadioBox">&nbsp;진행중만
                    </div>
                    
                    <div id="allCategoryContentArea">
                    <!-- 게시글 영역 -------------------------------------->
<!-- 					<div class="boardArea"> -->
<!-- 					    카테고리 -->
<!-- 						<div class="category"> -->
<!-- 							카테고리 -->
<!-- 						</div> -->

<!-- 						<div class="boardCenterArea"> -->
<!-- 							<div class="boardCenter_leftArea"> -->
<!-- 								<div class="titleArea">제목</div> -->
<!-- 								<div class="contentArea">본문</div> -->
<!-- 								<div class="hashArea">해시태그</div> -->
<!-- 							</div> -->
<!-- 							<div class="boardCenter_rightArea"> -->
<!-- 								<div class="profile"> -->
<!-- 									<img class = "imgs" src="/img/logo.png">				 -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->

<!-- 						<div class="boardFooterArea"> -->
<!-- 							<div class="boardFoote_leftArea"> -->
<!-- 								좋아요, 댓글 수 -->
<!-- 							</div> -->
<!-- 							<div class="boardFoote_rightArea"> -->
<!-- 								등록 시간 -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->

<!--                     <div class="col-12 boardBoundaryLine" > -->
<!--   						<hr> -->
<!--                     </div> -->
					</div>  
				</div>
				
				
            </div>

            <!--궁금해요 탭2----------------------------------------------------------------->
            <div class="tab-pane fade" id="v-pills-question" role="tabpanel" aria-labelledby="v-pills-question-tab">

                	<!-- 검색 입력창 영역 --------------------------------->
                    <div class="col-12 searchArea">
						<input type="text" placeholder="키워드와 #태그 모두 검색할 수 있어요." class="searchWord">
                    </div>
                    <!-- 라이오 박스 공간 ---------------------------------->
                    <div class="col-12 allCategoryRadioDiv"></div>
                    
                    <!-- 게시글 전체 영역 -->
                    <div class="" id="questionCategoryContentArea">
                    </div>

            </div>

            <!--도와주세요 탭3----------------------------------------------------------------->      
            <div class="tab-pane fade" id="v-pills-help" role="tabpanel" aria-labelledby="v-pills-help-tab">
                	<!-- 검색 입력창 영역 --------------------------------->
                    <div class="col-12 searchArea">
						<input type="text" placeholder="키워드와 #태그 모두 검색할 수 있어요." class="searchWord">
                    </div>
                    
                    <!-- 라이오 박스 영역 ---------------------------------->
                    <div class="col-12 allCategoryRadioDiv">
						<input type=radio class="categoryRadioBox" id="helpCategoryRadioBox">&nbsp;진행중만
                    </div>
                    
                    <!-- 게시글 전체 영역 -->
                    <div class="" id="helpCategoryContentArea">
                    </div>

            </div>

            <!--도와드려요 탭4----------------------------------------------------------------->
            <div class="tab-pane fade" id="v-pills-support" role="tabpanel" aria-labelledby="v-pills-support-tab">
                
                	<!-- 검색 입력창 영역 --------------------------------->
                    <div class="col-12 searchArea">
						<input type="text" placeholder="키워드와 #태그 모두 검색할 수 있어요." class="searchWord">
                    </div>
                    <!-- 라이오 박스 공간 ---------------------------------->
                    <div class="col-12 allCategoryRadioDiv"></div>
                    
                    <!-- 게시글 전체 영역 -->
					<div class="" id="supportCategoryContentArea">
					</div>
            </div>

            <!--일상 탭5----------------------------------------------------------------->
            <div class="tab-pane fade" id="v-pills-daily" role="tabpanel" aria-labelledby="v-pills-daily-tab">

                	<!-- 검색 입력창 영역 --------------------------------->
                    <div class="col-12 searchArea">
						<input type="text" placeholder="키워드와 #태그 모두 검색할 수 있어요." class="searchWord">
                    </div>
                    <!-- 라이오 박스 공간 ---------------------------------->
                    <div class="col-12 allCategoryRadioDiv"></div>
                    
					<!-- 게시글 전체 영역 -->
                    <div class="" id="dailyCategoryContentArea">
                    </div>

            </div>

        </div>
		<!--  ------------------------------------------------------------------------------탭 contents--------------->
    </div>
    <!-------------------------------------------------------------------------------------------------------------------------세로 탭 -------------------------------------------------------->
</div>



<!-- Footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<!-- loginModal -->
<jsp:include page="/WEB-INF/views/common/loginModal.jsp" />



<script>

	// window.location.href;
	// location.href;
	//  document.URL; 사이트 주소불러오는 방법들
	
	let siteUrl = window.location.href.split("#").pop(); //활성화할 문자
	let tabs = $("#v-pills-tab").children(); //세로탭 메뉴들
	let tabs_contents = $("#v-pills-tabContent").children(); // 컨텐츠틀
	
	setting(siteUrl); //사이트 접속 초기세팅
	
	window.onpopstate = function(event) {   //주소변경감지 이벤트
	  resetTab();
	  siteUrl = window.location.href.split("#").pop();
	  setting(siteUrl);
	}

	
	tabs.on("click",function(){   //세로탭 메뉴들 전체에 클릭시 이벤트
	  resetTab(); //선택된 탭 초기화
	  $(this).children().addClass("active"); //클릭한 탭만 활성
	})
	
	//탭 세팅
	function setting(siteUrl){
	  if(siteUrl.split("-").length<2){   // 사이트에 최초 접속시 #탭id 가 없음, 활성화할 탭 id 넣어주기
	    siteUrl="all-tab" // 첫번째 탭을 id에 넣어줌
	  }
	  
      if(siteUrl=='all-tab'){
    		//전체보기 탭 내용 구성 함수 호출.
    		allTab('','');
        }else if(siteUrl=='question-tab'){
    		//궁금해요 탭 내용 구성 함수 호출.
    		questionTab('q','');
        }else if(siteUrl=='help-tab'){
    		//도와주세요 탭 내용 구성 함수 호출.
    		helpTab('h','');
        }else if(siteUrl=='support-tab'){
    		//도와드려요 탭 내용 구성 함수 호출.
    		supportTab('s','');
        }else if(siteUrl=='daily-tab'){
    		//일상 탭 내용 구성 함수 호출.
    		dailyTab('d','');
        }	  
	  
	  $("#v-pills-"+siteUrl+"").addClass("active"); //url에 맞는 탭 활성화      
	  tabs_contents.removeClass("active"); //부트스트랩 탭 컨텐츠 버그방지용 초기화
	  $("#v-pills-"+siteUrl.split("-").shift()+"").addClass("show active"); // url에 맞는 컨텐츠 활성화
	}
	
	function resetTab(){ //선택된 탭 초기화
	  tabs.children().removeClass("active");
	}
  
	//////////////////////////////////////////////////////////////////////탭 설정/////////////
	
	//글쓰기 버튼 클릭 시 
  	$("#writeBtn").on("click",function(){
  		location.href = "/community/boardWrite";
// 		alert("진행중 체크여부 : "+$(".categoryRadioBox").is(':checked'));
  	})
  
  	
  	//전체 카테고리 라디오 박스 체크박스처럼 작동하게. 선택,해제 가능하게
  	let a11_checked = false;
	$("#allCategoryRadioBox").on("click", function(){
		alert(222)
		if(a11_checked){//체크가 되어 있을 때 해제 하는,
			$(this).prop('checked', false);
			a11_checked = false;
// 			allTab('h','');
		}else{//체크가 안 되어 있을 때 선택하는.
			alert(111)
			$(this).prop('checked', true);
			a11_checked = true;
// 			allTab('h','N');
		}
		
	})
	

	
  	//도와주세요 카테고리 라디오 박스 체크박스처럼 작동하게. 선택,해제 가능하게
  	let help_checked = false;
	$("#helpCategoryRadioBox").on("click", function(){
		
		if(help_checked){//체크가 되어 있을 때 해제 하는,
			$(this).prop('checked', false);
			help_checked = false;
			helpTab('h','');
		}else{//체크가 안 되어 있을 때 선택하는.
			$(this).prop('checked', true);
			help_checked = true;
			helpTab('h','N');
		}
		
	})
	


	
	
	
	
	
	
	

	
	
	
	
	
	//탭 별 content 구성 함수///////////////////////////////////////////////////////////////////////////////////////////////////
	//전체보기 탭 내용 구성 함수
	function allTab(category, progress){
		$(window).off('scroll');//모든 탭 윈도우 스크롤 이벤트 끔.
		$("#allCategoryContentArea").children().remove();
		
	       let page = 1;  //페이징과 같은 방식이라고 생각하면 된다.

	       $(function(){
	            getList(page);
	            page++;
//	             console.log(page);
	       })
	    
 
	       let timer = null;
	       
	       $(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.

		           const currentScroll = window.scrollY;
		           const windowHeight = window.innerHeight;
		           const bodyHeight = document.body.clientHeight;
		           const paddingBottom = 200;
		           
		           if(currentScroll + windowHeight + paddingBottom >= bodyHeight){
		        	   getList(page);
		        	   page++;
		        	   
// 		               if (!timer) {
// 		                   timer = setTimeout(() => {
// 		                       timer = null;

// 		                       getList(page);
// 								page++;
// 		                   }, 500);
// 		               }
		           }

	           
		});
	    			       
	       
	      function getList(pape){

	           $.ajax({
	                url:'/community/list',
	                type:'POST',
	               data : {cpage : page, category : category , progress : progress},
	               dataType : 'json',
	               async: false
	             }).done(function(resp){
					let list = JSON.parse(resp[0]) // 
	            	let totalPage = resp[1]
	            	console.log("전체보기 토탈 페이지 : "+totalPage);
	            	console.log("전체보기 현재 페이지 : "+page);
					
					if(totalPage<pape){
// 						alert("마지막 페이지 입니다.");
						return false;
					}else{
						
						 
			             for(let i = 0; i < list.length; i++){

			            	//카테고리 분류 작업
			            	let gubun;//카테고리 구분
			            	if(list[i].board_seq.substr(0,1) == 'q'){
			            		gubun = '궁금해요'
			            	}else if(list[i].board_seq.substr(0,1) == 'h'){
			            		gubun = '도와주세요'
			            	}else if(list[i].board_seq.substr(0,1) == 's'){
			            		gubun = '도와드려요'
			            	}else if(list[i].board_seq.substr(0,1) == 'd'){
			            		gubun = '일상'
			            	}

			         		let boardArea = $("<div class='boardArea'>");//게시글 박스 영역
			        		//////카테고리//////
			        		let category = $("<div class='category'>");
			        		category.append("<span class = 'gubun'>"+gubun+"</span>")
			        		//////제목, 본문, 해시태그, 프로필//////
			        		let boardCenterArea = $("<div class='boardCenterArea'>");//제목,본문,해시태그,프로필 전체 영역
			        		
			        		let boardCenter_leftArea = $("<div class='boardCenter_leftArea'>");//왼쪽 제목, 본문, 해시태그 영역
			        		let titleArea = $("<div class='titleArea'>");//제목
			        		titleArea.append(list[i].title);
			        		let contentArea = $("<div class='contentArea'>");//본문
			        		contentArea.append(list[i].contents);
			        		let hashArea = $("<div class='hashArea'>");	//해시태그
			            	//해시태그 영역에 span태그로 해시태그 분리해서 넣기
			            	let hashString ='';
			            	if(list[i].hash_tag != null){
				            	let hashArr = list[i].hash_tag.split("#");//#개준으로 배열로 나누기
	        					hashArr.splice(0,1);//배열에서 맨 앞 ''인 배열 빼기
				                for(let i=0; i<hashArr.length; i++){
				                	hashArea.append("<span class = 'hashSpan'>#"+hashArr[i]+"</span>");
				                }
			            	}else{
			            		hashArea.append("<span class = 'hashSpan'>#</span>");
			            	}	
			        		boardCenter_leftArea.append(titleArea);//제목, 본문, 해시태그 영역에---제목 영역 삽입
			        		boardCenter_leftArea.append(contentArea);//제목, 본문, 해시태그 영역---본문 영역 삽입
			        		boardCenter_leftArea.append(hashArea);//제목, 본문, 해시태그 영역---해시태그 영역 삽입

			        		let boardCenter_rightArea = $("<div class='boardCenter_rightArea'>");//오른쪽 대표 이미지 영역
				  	           $.ajax({
					                url:'/community/profile',
					                type:'POST',
					               data : {parent_seq : list[i].board_seq},
// 					               dataType : 'json',
					               async: false
					             }).done(function(resp){
					            	 console.log(resp);
					            	 if(resp != ''){
						        		let profile = $('<div class="profile">');//대표 이미지 영역
						        		profile.append('<img class = "imgs" src="'+resp+'">');
						        		boardCenter_rightArea.append(profile); 
					            	 }
					             })
			        		
			        		boardCenterArea.append(boardCenter_leftArea);//제목,본문,해시태그,프로필 전체 영역에---왼쪽 제목,본문,해시태그 영역 삽입
			        		boardCenterArea.append(boardCenter_rightArea);//제목,본문,해시태그,프로필 전체 영역에---오른쪽 대표 이미지 영역 삽입
			        		

			        		
			        		//////좋아요 댓글 수, 등록시간////// 
			        		let boardFooterArea = $("<div class='boardFooterArea'>");//좋아요 댓글 수, 등록시간 전체 영역
			        		boardFooterArea.append("<span class = 'goodCountSpan'>좋아요 수</span>");
			        		boardFooterArea.append("<span class = 'replyCountSpan'>댓글 수</span>");
			        		boardFooterArea.append("<span class = 'regDate'>등록 시간</span>");

			        		
			        		////////////게시글 박스 영역에, 각 영역 삽입////////////////
			        		boardArea.append(category);
			        		boardArea.append(boardCenterArea);
			        		boardArea.append(boardCenterArea);
			        		boardArea.append(boardFooterArea);

			        		$("#allCategoryContentArea").append(boardArea);//게시글 박스 영역을, 전체 Content영역에 append
			        		$("#allCategoryContentArea").append("<div class='col-12 boardBoundaryLine'><hr></div>");//게시글 바운더리 영역 삽입
			            	 
			             }
						
					}

	               
	               
	             })
	    	   
	       }
		
	}
	//궁금해요 탭 내용 구성 함수
	function questionTab(category, progress){
		$(window).off('scroll');//모든 탭 윈도우 스크롤 이벤트 끔.
		$("#questionCategoryContentArea").children().remove();
		
	       let page = 1;  //페이징과 같은 방식이라고 생각하면 된다.

	       $(function(){
	            getList(page);
	            page++;
//	             console.log(page);
	       })
	    
 
	       let timer = null;
	       
	       $(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.

		           const currentScroll = window.scrollY;
		           const windowHeight = window.innerHeight;
		           const bodyHeight = document.body.clientHeight;
		           const paddingBottom = 200;
		           
		           if(currentScroll + windowHeight + paddingBottom >= bodyHeight){
		        	   getList(page);
		        	   page++;
		        	   
// 		               if (!timer) {
// 		                   timer = setTimeout(() => {
// 		                       timer = null;

// 		                       getList(page);
// 								page++;
// 		                   }, 500);
// 		               }
		           }

	           
		});
	    			       
	       
	      function getList(pape){

	           $.ajax({
	                url:'/community/list',
	                type:'POST',
	               data : {cpage : page, category : category , progress : progress},
	               dataType : 'json',
	               async: false
	             }).done(function(resp){
					let list = JSON.parse(resp[0]) // 
	            	let totalPage = resp[1]
	            	console.log("궁금해요 토탈 페이지 : "+totalPage);
	            	console.log("궁금해요 현재 페이지 : "+page);
					
					if(totalPage<pape){
// 						alert("마지막 페이지 입니다.");
						return false;
					}else{
						
						 
			             for(let i = 0; i < list.length; i++){

			            	//카테고리 분류 작업
			            	let gubun;//카테고리 구분
			            	if(list[i].board_seq.substr(0,1) == 'q'){
			            		gubun = '궁금해요'
			            	}else if(list[i].board_seq.substr(0,1) == 'h'){
			            		gubun = '도와주세요'
			            	}else if(list[i].board_seq.substr(0,1) == 's'){
			            		gubun = '도와드려요'
			            	}else if(list[i].board_seq.substr(0,1) == 'd'){
			            		gubun = '일상'
			            	}

			         		let boardArea = $("<div class='boardArea'>");//게시글 박스 영역
			        		//////카테고리//////
			        		let category = $("<div class='category'>");
			        		category.append("<span class = 'gubun'>"+gubun+"</span>")
			        		//////제목, 본문, 해시태그, 프로필//////
			        		let boardCenterArea = $("<div class='boardCenterArea'>");//제목,본문,해시태그,프로필 전체 영역
			        		
			        		let boardCenter_leftArea = $("<div class='boardCenter_leftArea'>");//왼쪽 제목, 본문, 해시태그 영역
			        		let titleArea = $("<div class='titleArea'>");//제목
			        		titleArea.append(list[i].title);
			        		let contentArea = $("<div class='contentArea'>");//본문
			        		contentArea.append(list[i].contents);
			        		let hashArea = $("<div class='hashArea'>");	//해시태그
			            	//해시태그 영역에 span태그로 해시태그 분리해서 넣기
			            	let hashString ='';
			            	if(list[i].hash_tag != null){
				            	let hashArr = list[i].hash_tag.split("#");//#개준으로 배열로 나누기
	        					hashArr.splice(0,1);//배열에서 맨 앞 ''인 배열 빼기
				                for(let i=0; i<hashArr.length; i++){
				                	hashArea.append("<span class = 'hashSpan'>#"+hashArr[i]+"</span>");
				                }
			            	}else{
			            		hashArea.append("<span class = 'hashSpan'>#</span>");
			            	}	
			        		boardCenter_leftArea.append(titleArea);//제목, 본문, 해시태그 영역에---제목 영역 삽입
			        		boardCenter_leftArea.append(contentArea);//제목, 본문, 해시태그 영역---본문 영역 삽입
			        		boardCenter_leftArea.append(hashArea);//제목, 본문, 해시태그 영역---해시태그 영역 삽입

			        		let boardCenter_rightArea = $("<div class='boardCenter_rightArea'>");//오른쪽 대표 이미지 영역
				  	           $.ajax({
					                url:'/community/profile',
					                type:'POST',
					               data : {parent_seq : list[i].board_seq},
// 					               dataType : 'json',
					               async: false
					             }).done(function(resp){
					            	 console.log(resp);
					            	 if(resp != ''){
						        		let profile = $('<div class="profile">');//대표 이미지 영역
						        		profile.append('<img class = "imgs" src="'+resp+'">');
						        		boardCenter_rightArea.append(profile); 
					            	 }
					             })
			        		
			        		boardCenterArea.append(boardCenter_leftArea);//제목,본문,해시태그,프로필 전체 영역에---왼쪽 제목,본문,해시태그 영역 삽입
			        		boardCenterArea.append(boardCenter_rightArea);//제목,본문,해시태그,프로필 전체 영역에---오른쪽 대표 이미지 영역 삽입
			        		

			        		
			        		//////좋아요 댓글 수, 등록시간////// 
			        		let boardFooterArea = $("<div class='boardFooterArea'>");//좋아요 댓글 수, 등록시간 전체 영역
			        		boardFooterArea.append("<span class = 'goodCountSpan'>좋아요 수</span>");
			        		boardFooterArea.append("<span class = 'replyCountSpan'>댓글 수</span>");
			        		boardFooterArea.append("<span class = 'regDate'>등록 시간</span>");

			        		
			        		////////////게시글 박스 영역에, 각 영역 삽입////////////////
			        		boardArea.append(category);
			        		boardArea.append(boardCenterArea);
			        		boardArea.append(boardCenterArea);
			        		boardArea.append(boardFooterArea);

			        		$("#questionCategoryContentArea").append(boardArea);//게시글 박스 영역을, 전체 Content영역에 append
			        		$("#questionCategoryContentArea").append("<div class='col-12 boardBoundaryLine'><hr></div>");//게시글 바운더리 영역 삽입
			            	 
			             }
						
					}

	               
	               
	             })
	    	   
	       }
	}
	//도와주세요 탭 내용 구성 함수
	function helpTab(category, progress){
		$(window).off('scroll');//모든 탭 윈도우 스크롤 이벤트 끔.
		$("#helpCategoryContentArea").children().remove();
		
	       let page = 1;  //페이징과 같은 방식이라고 생각하면 된다.

	       $(function(){
	            getList(page);
	            page++;
//	             console.log(page);
	       })
	    

	       let timer = null;
	       
	       $(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.

		           const currentScroll = window.scrollY;
		           const windowHeight = window.innerHeight;
		           const bodyHeight = document.body.clientHeight;
		           const paddingBottom = 200;
		           
		           if(currentScroll + windowHeight + paddingBottom >= bodyHeight){
		        	   getList(page);
		        	   page++;
		        	   
//		               if (!timer) {
//		                   timer = setTimeout(() => {
//		                       timer = null;

//		                       getList(page);
//								page++;
//		                   }, 500);
//		               }
		           }

	           
		});
	    			       
	       
	      function getList(pape){

	           $.ajax({
	                url:'/community/list',
	                type:'POST',
	               data : {cpage : page, category : category, progress : progress},
	               dataType : 'json',
	               async: false
	             }).done(function(resp){
					let list = JSON.parse(resp[0]) // 
	            	let totalPage = resp[1]
	            	console.log("도와주세요 토탈 페이지 : "+totalPage);
	            	console.log("도와주세요 현재 페이지 : "+page);
					
					if(totalPage<pape){
//						alert("마지막 페이지 입니다.");
						return false;
					}else{
						
						 
			             for(let i = 0; i < list.length; i++){

			            	//카테고리 분류 작업
			            	let gubun;//카테고리 구분
			            	if(list[i].board_seq.substr(0,1) == 'q'){
			            		gubun = '궁금해요'
			            	}else if(list[i].board_seq.substr(0,1) == 'h'){
			            		gubun = '도와주세요'
			            	}else if(list[i].board_seq.substr(0,1) == 's'){
			            		gubun = '도와드려요'
			            	}else if(list[i].board_seq.substr(0,1) == 'd'){
			            		gubun = '일상'
			            	}

			         		let boardArea = $("<div class='boardArea'>");//게시글 박스 영역
			        		//////카테고리//////
			        		let category = $("<div class='category'>");
			        		category.append("<span class = 'gubun'>"+gubun+"</span>")
			        		//////제목, 본문, 해시태그, 프로필//////
			        		let boardCenterArea = $("<div class='boardCenterArea'>");//제목,본문,해시태그,프로필 전체 영역
			        		
			        		let boardCenter_leftArea = $("<div class='boardCenter_leftArea'>");//왼쪽 제목, 본문, 해시태그 영역
			        		let titleArea = $("<div class='titleArea'>");//제목
			        		titleArea.append(list[i].title);
			        		let contentArea = $("<div class='contentArea'>");//본문
			        		contentArea.append(list[i].contents);
			        		let hashArea = $("<div class='hashArea'>");	//해시태그
			            	//해시태그 영역에 span태그로 해시태그 분리해서 넣기
			            	let hashString ='';
			            	if(list[i].hash_tag != null){
				            	let hashArr = list[i].hash_tag.split("#");//#개준으로 배열로 나누기
	        					hashArr.splice(0,1);//배열에서 맨 앞 ''인 배열 빼기
				                for(let i=0; i<hashArr.length; i++){
				                	hashArea.append("<span class = 'hashSpan'>#"+hashArr[i]+"</span>");
				                }
			            	}else{
			            		hashArea.append("<span class = 'hashSpan'>#</span>");
			            	}	
			        		boardCenter_leftArea.append(titleArea);//제목, 본문, 해시태그 영역에---제목 영역 삽입
			        		boardCenter_leftArea.append(contentArea);//제목, 본문, 해시태그 영역---본문 영역 삽입
			        		boardCenter_leftArea.append(hashArea);//제목, 본문, 해시태그 영역---해시태그 영역 삽입

			        		let boardCenter_rightArea = $("<div class='boardCenter_rightArea'>");//오른쪽 대표 이미지 영역
				  	           $.ajax({
					                url:'/community/profile',
					                type:'POST',
					               data : {parent_seq : list[i].board_seq},
//					               dataType : 'json',
					               async: false
					             }).done(function(resp){
					            	 console.log(resp);
					            	 if(resp != ''){
						        		let profile = $('<div class="profile">');//대표 이미지 영역
						        		profile.append('<img class = "imgs" src="'+resp+'">');
						        		boardCenter_rightArea.append(profile); 
					            	 }
					             })
			        		
			        		boardCenterArea.append(boardCenter_leftArea);//제목,본문,해시태그,프로필 전체 영역에---왼쪽 제목,본문,해시태그 영역 삽입
			        		boardCenterArea.append(boardCenter_rightArea);//제목,본문,해시태그,프로필 전체 영역에---오른쪽 대표 이미지 영역 삽입
			        		

			        		
			        		//////좋아요 댓글 수, 등록시간////// 
			        		let boardFooterArea = $("<div class='boardFooterArea'>");//좋아요 댓글 수, 등록시간 전체 영역
			        		boardFooterArea.append("<span class = 'goodCountSpan'>좋아요 수</span>");
			        		boardFooterArea.append("<span class = 'replyCountSpan'>댓글 수</span>");
			        		boardFooterArea.append("<span class = 'regDate'>등록 시간</span>");

			        		
			        		////////////게시글 박스 영역에, 각 영역 삽입////////////////
			        		boardArea.append(category);
			        		boardArea.append(boardCenterArea);
			        		boardArea.append(boardCenterArea);
			        		boardArea.append(boardFooterArea);

			        		$("#helpCategoryContentArea").append(boardArea);//게시글 박스 영역을, 전체 Content영역에 append
			        		$("#helpCategoryContentArea").append("<div class='col-12 boardBoundaryLine'><hr></div>");//게시글 바운더리 영역 삽입
			            	 
			             }
						
					}

	               
	               
	             })
	    	   
	       }
	}
	//도와드려요 탭 내용 구성 함수
	function supportTab(category, progress){
		$(window).off('scroll');//모든 탭 윈도우 스크롤 이벤트 끔.
		$("#supportCategoryContentArea").children().remove();
		
	       let page = 1;  //페이징과 같은 방식이라고 생각하면 된다.

	       $(function(){
	            getList(page);
	            page++;
//	             console.log(page);
	       })
	    

	       let timer = null;
	       
	       $(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.

		           const currentScroll = window.scrollY;
		           const windowHeight = window.innerHeight;
		           const bodyHeight = document.body.clientHeight;
		           const paddingBottom = 200;
		           
		           if(currentScroll + windowHeight + paddingBottom >= bodyHeight){
		        	   getList(page);
		        	   page++;
		        	   
//		               if (!timer) {
//		                   timer = setTimeout(() => {
//		                       timer = null;

//		                       getList(page);
//								page++;
//		                   }, 500);
//		               }
		           }

	           
		});
	    			       
	       
	      function getList(pape){

	           $.ajax({
	                url:'/community/list',
	                type:'POST',
	               data : {cpage : page, category : category , progress : progress},
	               dataType : 'json',
	               async: false
	             }).done(function(resp){
					let list = JSON.parse(resp[0]) // 
	            	let totalPage = resp[1]
	            	console.log("궁금해요 토탈 페이지 : "+totalPage);
	            	console.log("궁금해요 현재 페이지 : "+page);
					
					if(totalPage<pape){
//						alert("마지막 페이지 입니다.");
						return false;
					}else{
						
						 
			             for(let i = 0; i < list.length; i++){

			            	//카테고리 분류 작업
			            	let gubun;//카테고리 구분
			            	if(list[i].board_seq.substr(0,1) == 'q'){
			            		gubun = '궁금해요'
			            	}else if(list[i].board_seq.substr(0,1) == 'h'){
			            		gubun = '도와주세요'
			            	}else if(list[i].board_seq.substr(0,1) == 's'){
			            		gubun = '도와드려요'
			            	}else if(list[i].board_seq.substr(0,1) == 'd'){
			            		gubun = '일상'
			            	}

			         		let boardArea = $("<div class='boardArea'>");//게시글 박스 영역
			        		//////카테고리//////
			        		let category = $("<div class='category'>");
			        		category.append("<span class = 'gubun'>"+gubun+"</span>")
			        		//////제목, 본문, 해시태그, 프로필//////
			        		let boardCenterArea = $("<div class='boardCenterArea'>");//제목,본문,해시태그,프로필 전체 영역
			        		
			        		let boardCenter_leftArea = $("<div class='boardCenter_leftArea'>");//왼쪽 제목, 본문, 해시태그 영역
			        		let titleArea = $("<div class='titleArea'>");//제목
			        		titleArea.append(list[i].title);
			        		let contentArea = $("<div class='contentArea'>");//본문
			        		contentArea.append(list[i].contents);
			        		let hashArea = $("<div class='hashArea'>");	//해시태그
			            	//해시태그 영역에 span태그로 해시태그 분리해서 넣기
			            	let hashString ='';
			            	if(list[i].hash_tag != null){
				            	let hashArr = list[i].hash_tag.split("#");//#개준으로 배열로 나누기
	        					hashArr.splice(0,1);//배열에서 맨 앞 ''인 배열 빼기
				                for(let i=0; i<hashArr.length; i++){
				                	hashArea.append("<span class = 'hashSpan'>#"+hashArr[i]+"</span>");
				                }
			            	}else{
			            		hashArea.append("<span class = 'hashSpan'>#</span>");
			            	}	
			        		boardCenter_leftArea.append(titleArea);//제목, 본문, 해시태그 영역에---제목 영역 삽입
			        		boardCenter_leftArea.append(contentArea);//제목, 본문, 해시태그 영역---본문 영역 삽입
			        		boardCenter_leftArea.append(hashArea);//제목, 본문, 해시태그 영역---해시태그 영역 삽입

			        		let boardCenter_rightArea = $("<div class='boardCenter_rightArea'>");//오른쪽 대표 이미지 영역
				  	           $.ajax({
					                url:'/community/profile',
					                type:'POST',
					               data : {parent_seq : list[i].board_seq},
//					               dataType : 'json',
					               async: false
					             }).done(function(resp){
					            	 console.log(resp);
					            	 if(resp != ''){
						        		let profile = $('<div class="profile">');//대표 이미지 영역
						        		profile.append('<img class = "imgs" src="'+resp+'">');
						        		boardCenter_rightArea.append(profile); 
					            	 }
					             })
			        		
			        		boardCenterArea.append(boardCenter_leftArea);//제목,본문,해시태그,프로필 전체 영역에---왼쪽 제목,본문,해시태그 영역 삽입
			        		boardCenterArea.append(boardCenter_rightArea);//제목,본문,해시태그,프로필 전체 영역에---오른쪽 대표 이미지 영역 삽입
			        		

			        		
			        		//////좋아요 댓글 수, 등록시간////// 
			        		let boardFooterArea = $("<div class='boardFooterArea'>");//좋아요 댓글 수, 등록시간 전체 영역
			        		boardFooterArea.append("<span class = 'goodCountSpan'>좋아요 수</span>");
			        		boardFooterArea.append("<span class = 'replyCountSpan'>댓글 수</span>");
			        		boardFooterArea.append("<span class = 'regDate'>등록 시간</span>");

			        		
			        		////////////게시글 박스 영역에, 각 영역 삽입////////////////
			        		boardArea.append(category);
			        		boardArea.append(boardCenterArea);
			        		boardArea.append(boardCenterArea);
			        		boardArea.append(boardFooterArea);

			        		$("#supportCategoryContentArea").append(boardArea);//게시글 박스 영역을, 전체 Content영역에 append
			        		$("#supportCategoryContentArea").append("<div class='col-12 boardBoundaryLine'><hr></div>");//게시글 바운더리 영역 삽입
			            	 
			             }
						
					}

	               
	               
	             })
	    	   
	       }
	}
	//일상 탭 내용 구성 함수
	function dailyTab(category, progress){
		$(window).off('scroll');//모든 탭 윈도우 스크롤 이벤트 끔.
		$("#dailyCategoryContentArea").children().remove();
		
	       let page = 1;  //페이징과 같은 방식이라고 생각하면 된다.

	       $(function(){
	            getList(page);
	            page++;
//	             console.log(page);
	       })
	    

	       let timer = null;
	       
	       $(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.

		           const currentScroll = window.scrollY;
		           const windowHeight = window.innerHeight;
		           const bodyHeight = document.body.clientHeight;
		           const paddingBottom = 200;
		           
		           if(currentScroll + windowHeight + paddingBottom >= bodyHeight){
		        	   getList(page);
		        	   page++;
		        	   
//		               if (!timer) {
//		                   timer = setTimeout(() => {
//		                       timer = null;

//		                       getList(page);
//								page++;
//		                   }, 500);
//		               }
		           }

	           
		});
	    			       
	       
	      function getList(pape){

	           $.ajax({
	                url:'/community/list',
	                type:'POST',
	               data : {cpage : page, category : category , progress : progress},
	               dataType : 'json',
	               async: false
	             }).done(function(resp){
					let list = JSON.parse(resp[0]) // 
	            	let totalPage = resp[1]
	            	console.log("일상 토탈 페이지 : "+totalPage);
	            	console.log("일상 현재 페이지 : "+page);
					
					if(totalPage<pape){
//						alert("마지막 페이지 입니다.");
						return false;
					}else{
						
						 
			             for(let i = 0; i < list.length; i++){

			            	//카테고리 분류 작업
			            	let gubun;//카테고리 구분
			            	if(list[i].board_seq.substr(0,1) == 'q'){
			            		gubun = '궁금해요'
			            	}else if(list[i].board_seq.substr(0,1) == 'h'){
			            		gubun = '도와주세요'
			            	}else if(list[i].board_seq.substr(0,1) == 's'){
			            		gubun = '도와드려요'
			            	}else if(list[i].board_seq.substr(0,1) == 'd'){
			            		gubun = '일상'
			            	}

			         		let boardArea = $("<div class='boardArea'>");//게시글 박스 영역
			        		//////카테고리//////
			        		let category = $("<div class='category'>");
			        		category.append("<span class = 'gubun'>"+gubun+"</span>")
			        		//////제목, 본문, 해시태그, 프로필//////
			        		let boardCenterArea = $("<div class='boardCenterArea'>");//제목,본문,해시태그,프로필 전체 영역
			        		
			        		let boardCenter_leftArea = $("<div class='boardCenter_leftArea'>");//왼쪽 제목, 본문, 해시태그 영역
			        		let titleArea = $("<div class='titleArea'>");//제목
			        		titleArea.append(list[i].title);
			        		let contentArea = $("<div class='contentArea'>");//본문
			        		contentArea.append(list[i].contents);
			        		let hashArea = $("<div class='hashArea'>");	//해시태그
			            	//해시태그 영역에 span태그로 해시태그 분리해서 넣기
			            	let hashString ='';
			            	if(list[i].hash_tag != null){
				            	let hashArr = list[i].hash_tag.split("#");//#개준으로 배열로 나누기
	        					hashArr.splice(0,1);//배열에서 맨 앞 ''인 배열 빼기
				                for(let i=0; i<hashArr.length; i++){
				                	hashArea.append("<span class = 'hashSpan'>#"+hashArr[i]+"</span>");
				                }
			            	}else{
			            		hashArea.append("<span class = 'hashSpan'>#</span>");
			            	}	
			        		boardCenter_leftArea.append(titleArea);//제목, 본문, 해시태그 영역에---제목 영역 삽입
			        		boardCenter_leftArea.append(contentArea);//제목, 본문, 해시태그 영역---본문 영역 삽입
			        		boardCenter_leftArea.append(hashArea);//제목, 본문, 해시태그 영역---해시태그 영역 삽입

			        		let boardCenter_rightArea = $("<div class='boardCenter_rightArea'>");//오른쪽 대표 이미지 영역
				  	           $.ajax({
					                url:'/community/profile',
					                type:'POST',
					               data : {parent_seq : list[i].board_seq},
//					               dataType : 'json',
					               async: false
					             }).done(function(resp){
					            	 console.log(resp);
					            	 if(resp != ''){
						        		let profile = $('<div class="profile">');//대표 이미지 영역
						        		profile.append('<img class = "imgs" src="'+resp+'">');
						        		boardCenter_rightArea.append(profile); 
					            	 }
					             })
			        		
			        		boardCenterArea.append(boardCenter_leftArea);//제목,본문,해시태그,프로필 전체 영역에---왼쪽 제목,본문,해시태그 영역 삽입
			        		boardCenterArea.append(boardCenter_rightArea);//제목,본문,해시태그,프로필 전체 영역에---오른쪽 대표 이미지 영역 삽입
			        		

			        		
			        		//////좋아요 댓글 수, 등록시간////// 
			        		let boardFooterArea = $("<div class='boardFooterArea'>");//좋아요 댓글 수, 등록시간 전체 영역
			        		boardFooterArea.append("<span class = 'goodCountSpan'>좋아요 수</span>");
			        		boardFooterArea.append("<span class = 'replyCountSpan'>댓글 수</span>");
			        		boardFooterArea.append("<span class = 'regDate'>등록 시간</span>");

			        		
			        		////////////게시글 박스 영역에, 각 영역 삽입////////////////
			        		boardArea.append(category);
			        		boardArea.append(boardCenterArea);
			        		boardArea.append(boardCenterArea);
			        		boardArea.append(boardFooterArea);

			        		$("#dailyCategoryContentArea").append(boardArea);//게시글 박스 영역을, 전체 Content영역에 append
			        		$("#dailyCategoryContentArea").append("<div class='col-12 boardBoundaryLine'><hr></div>");//게시글 바운더리 영역 삽입
			            	 
			             }
						
					}

	               
	               
	             })
	    	   
	       }
	}
	//////////////////////////////////////////////////////////////////////////////////////////////////////탭 별 content 구성 함수////
</script>


</body>

</html>