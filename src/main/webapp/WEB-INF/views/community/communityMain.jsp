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
	               data : {cpage : page, category : ''},
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
					             })done(function(resp){
					            	 if(resp != ''){
						        		let profile = $('<div class="profile">');//대표 이미지 영역
						        		profile.append('<img class = "imgs" src="/img/logo.png">');
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
		
		
		
		
// 		let board = $("<div class='co1-12 board'>");//게시글 박스 영역 co1-12
// 		let row = $("<div class='row h-100'>");//게시글 박스 영역 row
		
// 		///////////카테고리 분류//////////
// 		let categoryArea = $("<div class='col-12 categoryArea'>");
// 		categoryArea.append("카테고리");
// 		///////////제목,본문///////////
// 		let title_contentsArea = $("<div class='col-10 title_contentsArea'>");
// 		let title_contentsArea_row = $("<div class='row h-100'>");
// 		let title = $("<div class='col-12 title'>");
// 		title.append("제목");
// 		let contents = $("<div class='col-12 contents'>");
// 		contents.append("본문");
		
// 		title_contentsArea_row.append(title);//제목
// 		title_contentsArea_row.append(contents);//본문
		
// 		title_contentsArea.append(title_contentsArea_row);
// 		///////////대표 이미지//////////
// 		let profileArea = $("<div class='col-2 profileArea'>");
// 		profileArea.append("사진");
// 		///////////해시 태그//////////
// 		let hashtagArea = $("<div class='col-12 hashtagArea'>");
// 		hashtagArea.append("해시태그");
// 		///////////좋아요, 댓글 수//////////	
// 		let good_replyArea = $("<div class='col-10 good_replyArea'>");
// 		good_replyArea.append("좋아요, 댓글");
// 		///////////등록 시간//////////
// 		let reg_date = $("<div class='col-2 reg_date'>");
// 		reg_date.append("등록시간");
		
		
// 		row.append(categoryArea);//카테고리 영역 append
// 		row.append(title_contentsArea);//제목,본문 영역 append
// 		row.append(profileArea);//대표 이미지 영역 append
// 		row.append(hashtagArea);//해시 태그 영역 append
// 		row.append(good_replyArea);//좋아요, 댓글 수 영역 append
// 		row.append(reg_date);//등록시간 영역 append
		
// 		board.append(row);//게시글 박스 영역 co1-12에/ 게시글 박스 영역 row/ append
// 		$("#allCategoryContentArea").append(board);//게시글 박승 영역을 전체 Content영역에 append
// 		$("#allCategoryContentArea").append("<div class='col-12 boardBoundaryLine'><hr></div>");//게시글 바운더리 영역 삽입

	
		///////////////////////////////////////////////////////////////////////////////////////
// 		let boardArea = $("<div class='boardArea'>");//게시글 박스 영역
// 		//////카테고리//////
// 		let category = $("<div class='category'>");
// 		category.append("카테고리")
// 		//////제목, 본문, 프로필//////
// 		let boardCenterArea = $("<div class='boardCenterArea'>");//제목,본문,프로필 전체 영역
	
// 		let boardCenter_leftArea = $("<div class='boardCenter_leftArea'>");//왼쪽 제목, 본문, 해시태그 영역
// 		let titleArea = $("<div class='titleArea'>");//제목
// 		titleArea.append("제목");
// 		let contentArea = $("<div class='contentArea'>");//본문
// 		contentArea.append("본문");
// 		let hashArea = $("<div class='hashArea'>");	//해시태그
// 		hashArea.append("해시태그");
// 		boardCenter_leftArea.append(titleArea);//제목, 본문, 해시태그 영역에---제목 영역 삽입
// 		boardCenter_leftArea.append(contentArea);//제목, 본문, 해시태그 영역---본문 영역 삽입
// 		boardCenter_leftArea.append(hashArea);//제목, 본문, 해시태그 영역---해시태그 영역 삽입
			
// 		let boardCenter_rightArea = $("<div class='boardCenter_rightArea'>");//오른쪽 대표 이미지 영역
// 		let profile = $('<div class="profile">');//대표 이미지 영역
// 		profile.append('<img class = "imgs" src="/img/logo.png">');
// 		boardCenter_rightArea.append(profile);
			
// 		boardCenterArea.append(boardCenter_leftArea);//제목,본문,해시태그,프로필 전체 영역에---왼쪽 제목,본문,해시태그 영역 삽입
// 		boardCenterArea.append(boardCenter_rightArea);//제목,본문,해시태그,프로필 전체 영역에---오른쪽 대표 이미지 영역 삽입

// 		//////좋아요 댓글 수, 등록시간////// 
// 		let boardFooterArea = $("<div class='boardFooterArea'>");//좋아요 댓글 수, 등록시간 전체 영역
// 		let boardFoote_leftArea = $("<div class='boardFoote_leftArea'>");//좋아요, 댓글 영역
// 		boardFoote_leftArea.append("좋아요, 댓글 수");
// 		let boardFoote_rightArea = $("<div class='boardFoote_rightArea'>");//등록 시간 영역
// 		boardFoote_rightArea.append("등록 시간");
		
// 		boardFooterArea.append(boardFoote_leftArea);//좋아요 댓글 수, 등록시간 전체 영역에---좋아요, 댓글 영역 삽입
// 		boardFooterArea.append(boardFoote_rightArea);//좋아요 댓글 수, 등록시간 전체 영역에---등록 시간 영역 삽입

		
// 		////////////게시글 박스 영역에, 각 영역 삽입////////////////
// 		boardArea.append(category);
// 		boardArea.append(boardCenterArea);
// 		boardArea.append(boardCenterArea);
// 		boardArea.append(boardFooterArea);

// 		$("#allCategoryContentArea").append(boardArea);//게시글 박스 영역을, 전체 Content영역에 append
// 		$("#allCategoryContentArea").append("<div class='col-12 boardBoundaryLine'><hr></div>");//게시글 바운더리 영역 삽입
	
	
	
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
            <a href="#all-tab"><button class="nav-link active" id="v-pills-all-tab" data-bs-toggle="pill" data-bs-target="#v-pills-all" type="button" role="tab" aria-controls="v-pills-all" aria-selected="true">전체보기</button></a>
            <a href="#question-tab"><button class="nav-link " id="v-pills-question-tab" data-bs-toggle="pill" data-bs-target="#v-pills-question" type="button" role="tab" aria-controls="v-pills-question" aria-selected="false">궁금해요</button></a>
            <a href="#help-tab"><button class="nav-link" id="v-pills-help-tab" data-bs-toggle="pill" data-bs-target="#v-pills-help" type="button" role="tab" aria-controls="v-pills-help" aria-selected="false">도와주세요</button></a>
            <a href="#support-tab"><button class="nav-link" id="v-pills-support-tab" data-bs-toggle="pill" data-bs-target="#v-pills-support" type="button" role="tab" aria-controls="v-pills-support" aria-selected="false">도와드려요</button></a>
            <a href="#daily-tab"><button class="nav-link" id="v-pills-daily-tab" data-bs-toggle="pill" data-bs-target="#v-pills-daily" type="button" role="tab" aria-controls="v-pills-daily" aria-selected="false">일상</button></a>
        </div>

        <!-- 탭 contents --------------------------------------------------------------------------------------------->
        <div class="tab-content" id="v-pills-tabContent" style="word-break:break-all; ">
            <!--전체보기 탭1----------------------------------------------------------------->
            <div class="tab-pane fade show active" id="v-pills-all" role="tabpanel" aria-labelledby="v-pills-all-tab">
                <div class="" id="allCategoryContentArea">
                	<!-- 검색 입력창 영역 --------------------------------->
                    <div class="col-12 searchArea">
						<input type="text" placeholder="키워드와 #태그 모두 검색할 수 있어요." class="searchWord">
                    </div>

                    <!-- 공지사항 영역 ------------------------------------>
                    <div class="col-12 notice" >
						공지사항
                    </div>
                    
                    <!-- 라이오 박스 영역 ---------------------------------->
                    <div class="col-12" id="allCategoryRadioDiv">
						<input type=radio id="allCategoryRadioBox">&nbsp;진행중만
                    </div>
                    
                    <!-- 게시글 영역 -------------------------------------->
<!--                     <div class="col-12 board"> -->
<!-- 						<div class="row h-100"> -->
<!-- 							<div class="col-12 categoryArea"> -->
<!-- 								카테고리 -->
<!-- 							</div> -->
							
							
<!-- 							제목,본문 -->
<!-- 							<div class="col-10 title_contentsArea"> -->
<!-- 								<div class="row h-100"> -->
<!-- 									<div class="col-12 title"> -->
<!-- 										제목 -->
<!-- 									</div> -->
<!-- 									<div class="col-12 contents"> -->
<!-- 										본문 -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							사진 -->
<!-- 							<div class="col-2 profileArea"> -->
<!-- 								사진 -->
<!-- 							</div> -->
							
<!-- 							해시태그 -->
<!-- 							<div class="col-12 hashtagArea"> -->
<!-- 								해시태그 -->
<!-- 							</div> -->
							
<!-- 							좋아요, 댓글 -->
<!-- 							<div class="col-10 good_replyArea"> -->
<!-- 								좋아요, 댓글 -->
<!-- 							</div> -->
							
<!-- 							등록 시간 -->
<!-- 							<div class="col-2 reg_date"> -->
<!-- 								등록시간 -->
<!-- 							</div> -->
							
<!-- 						</div> -->

<!--                     </div> -->
                    
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

            <!--궁금해요 탭2----------------------------------------------------------------->
            <div class="tab-pane fade" id="v-pills-question" role="tabpanel" aria-labelledby="v-pills-question-tab">
            	dddddddddddddddddddddddddddddddddddddddddddddddddd
            </div>

            <!--도와주세요 탭3----------------------------------------------------------------->      
            <div class="tab-pane fade" id="v-pills-help" role="tabpanel" aria-labelledby="v-pills-help-tab">도와주세요</div>

            <!--도와드려요 탭4----------------------------------------------------------------->
            <div class="tab-pane fade" id="v-pills-support" role="tabpanel" aria-labelledby="v-pills-support-tab">도와드려요</div>

            <!--일상 탭5----------------------------------------------------------------->
            <div class="tab-pane fade" id="v-pills-daily" role="tabpanel" aria-labelledby="v-pills-daily-tab">일상</div>

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
// 		alert("진행중 체크여부 : "+$("#allCategoryRadioBox").is(':checked'));
  	})
  
  	
  	//라디오 박스 체크박스처럼 작동하게. 선택,해제 가능하게
  	let checked = false;
	$("#allCategoryRadioBox").on("click", function(){
		
		if(checked){
			$("#allCategoryRadioBox").prop('checked', false);
			checked = false;
		}else{
			$("#allCategoryRadioBox").prop('checked', true);
			checked = true;
		}
		
	})


</script>


</body>

</html>