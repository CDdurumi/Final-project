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
		
		let board = $("<div class='co1-12 board'>");//게시글 박스 영역 co1-12
		let row = $("<div class='row h-100'>");//게시글 박스 영역 row
		
		///////////카테고리 분류//////////
		let categoryArea = $("<div class='col-12 categoryArea'>");
		categoryArea.append("카테고리");
		///////////제목,본문///////////
		let title_contentsArea = $("<div class='col-10 title_contentsArea'>");
		let title_contentsArea_row = $("<div class='row h-100'>");
		let title = $("<div class='col-12 title'>");
		title.append("제목");
		let contents = $("<div class='col-12 contents'>");
		contents.append("본문");
		
		title_contentsArea_row.append(title);//제목
		title_contentsArea_row.append(contents);//본문
		
		title_contentsArea.append(title_contentsArea_row);
		///////////대표 이미지//////////
		let profileArea = $("<div class='col-2 profileArea'>");
		profileArea.append("사진");
		///////////해시 태그//////////
		let hashtagArea = $("<div class='col-12 hashtagArea'>");
		hashtagArea.append("해시태그");
		///////////좋아요, 댓글 수//////////	
		let good_replyArea = $("<div class='col-10 good_replyArea'>");
		good_replyArea.append("좋아요, 댓글");
		///////////등록 시간//////////
		let reg_date = $("<div class='col-2 reg_date'>");
		reg_date.append("등록시간");
		
		
		row.append(categoryArea);//카테고리 영역 append
		row.append(title_contentsArea);//제목,본문 영역 append
		row.append(profileArea);//대표 이미지 영역 append
		row.append(hashtagArea);//해시 태그 영역 append
		row.append(good_replyArea);//좋아요, 댓글 수 영역 append
		row.append(reg_date);//등록시간 영역 append
		
		board.append(row);//게시글 박스 영역 co1-12에/ 게시글 박스 영역 row/ append
		board.append("<hr>");
		$("#allCategoryContentArea").append(board);//게시글 박승 영역을 전체 Content영역에 append
	})

</script>

</head>


<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/> 
<jsp:include page="/WEB-INF/views/common/pNav.jsp"/>


<div class="container mainContent">


	<div id="pageHeader">커뮤니티<input type="button" id="writeBtn" value="글쓰기"><br><hr></div>
	
	<!-- 가로형 카테고리 영역 -->
	<div id="horizonCategoryArea">
		<button id="category1Btn" class="horizonCategory">전체보기</button>
		<button id="category2Btn" class="horizonCategory">궁금해요</button>
		<button id="category3Btn" class="horizonCategory">도와주세요</button>
		<button id="category4Btn" class="horizonCategory">도와드려요</button>
		<button id="category5Btn" class="horizonCategory">일상</button>
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
                <div class="row" id="allCategoryContentArea">
                	<!-- 검색 입력창 영역 --------------------------------->
                    <div class="col-12 searchArea">
						<input type="text" placeholder="키워드와 #태그 모두 검색할 수 있어요." class="searchWord">
                    </div>

                    <!-- 공지사항 영역 ------------------------------------>
                    <div class="col-12 notice">
						공지사항
                    </div>
                    
                    <!-- 라이오 박스 영역 ---------------------------------->
                    <div class="col-12" id="allCategoryRadioDiv">
						<input type=radio id="allCategoryRadioBox">&nbsp;진행중만
                    </div>
                    
                    <!-- 게시글 영역 -------------------------------------->
                    <div class="col-12 board">
						<div class="row h-100">
							<div class="col-12 categoryArea">
								카테고리
							</div>
							
							
							<!-- 제목,본문 -->
							<div class="col-10 title_contentsArea">
								<div class="row h-100">
									<div class="col-12 title">
										제목
									</div>
									<div class="col-12 contents">
										본문
									</div>
								</div>
							</div>
							<!-- 사진 -->
							<div class="col-2 profileArea">
								사진
							</div>
							
							<!-- 해시태그 -->
							<div class="col-12 hashtagArea">
								해시태그
							</div>
							
							<!-- 좋아요, 댓글 -->
							<div class="col-10 good_replyArea">
								좋아요, 댓글
							</div>
							
							<!-- 등록 시간 -->
							<div class="col-2 reg_date">
								등록시간
							</div>
						</div>
						
						<hr>
                    </div>
                    
                    
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
<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"/> --%>
<!-- loginModal -->
<jsp:include page="/WEB-INF/views/common/loginModal.jsp" />



<script>
	// window.location.href;
	// location.href;
	//  document.URL; 사이트 주소불러오는 방법들
	
	
	
	let siteUrl = window.location.href.split("#"); // #을 기준으로 사이트 주소를 나눠서 siteUrl  배열타입 변수에 저장   siteUrl[1]에 활성화 해야할 문자가 들어있음
	let tab1 = $("#v-pills-all-tab");
	let tab2 = $("#v-pills-question-tab");
	let tab3 = $("#v-pills-help-tab");
	let tab4 = $("#v-pills-support-tab");
	let tab5 = $("#v-pills-daily-tab");
	
	
	
	let tab1_contents = $("#v-pills-all");
	let tab2_contents = $("#v-pills-question");
	let tab3_contents = $("#v-pills-help");
	let tab4_contents = $("#v-pills-support");
	let tab5_contents = $("#v-pills-daily");
	
	if (siteUrl[1] == 'all-tab') {//전체보기 탭 활성화
	  tab1.addClass('active');
	  tab2.removeClass('active');
	  tab3.removeClass('active');
	  tab4.removeClass('active');
	  tab5.removeClass('active');
	
	  tab1_contents.addClass('show active');
	  tab2_contents.removeClass('show active');
	  tab3_contents.removeClass('show active');
	  tab4_contents.removeClass('show active');
	  tab5_contents.removeClass('show active');
	}
	else if (siteUrl[1] == 'question-tab') {//궁금해요 탭 활성화
	  tab1.removeClass('active');
	  tab2.addClass('active');
	  tab3.removeClass('active');
	  tab4.removeClass('active');
	  tab5.removeClass('active');
	
	  tab1_contents.removeClass('show active');
	  tab2_contents.addClass('show active');
	  tab3_contents.removeClass('show active');
	  tab4_contents.removeClass('show active');
	  tab5_contents.removeClass('show active');
	}
	else if (siteUrl[1] == 'help-tab') {//도와주세요 탭 활성화
	  tab1.removeClass('active');
	  tab2.removeClass('active');
	  tab3.addClass('active');
	  tab4.removeClass('active');
	  tab5.removeClass('active');
	
	  tab1_contents.removeClass('show active');
	  tab2_contents.removeClass('show active');
	  tab3_contents.addClass('show active');
	  tab4_contents.removeClass('show active');
	  tab5_contents.removeClass('show active');
	}
	else if (siteUrl[1] == 'support-tab') {//도와드려요 탭 활성화
	  tab1.removeClass('active');
	  tab2.removeClass('active');
	  tab3.removeClass('active');
	  tab4.addClass('active');
	  tab5.removeClass('active');
	
	  tab1_contents.removeClass('show active');
	  tab2_contents.removeClass('show active');
	  tab3_contents.removeClass('show active');
	  tab4_contents.addClass('show active');
	  tab5_contents.removeClass('show active');
	}
	else if (siteUrl[1] == 'daily-tab') {//일상 탭 활성화
	  tab1.removeClass('active');
	  tab2.removeClass('active');
	  tab3.removeClass('active');
	  tab4.removeClass('active');
	  tab5.addClass('active');
	
	  tab1_contents.removeClass('show active');
	  tab2_contents.removeClass('show active');
	  tab3_contents.removeClass('show active');
	  tab4_contents.removeClass('show active');
	  tab5_contents.addClass('show active');
	}
	
	// 부트스트랩 탭메뉴 버그 방지  
	tab1.on('click',function(){
	  tab2.removeClass('active');
	  tab3.removeClass('active');
	  tab4.removeClass('active');
	  tab5.removeClass('active');
	  window.scrollTo({top:0, left:0, behavior:'auto'});
	})
	tab2.on('click',function(){
	  tab1.removeClass('active');
	  tab3.removeClass('active');
	  tab4.removeClass('active');
	  tab5.removeClass('active');
	  window.scrollTo({top:0, left:0, behavior:'auto'});
	})
	tab3.on('click',function(){
	  tab1.removeClass('active');
	  tab2.removeClass('active');
	  tab4.removeClass('active');
	  tab5.removeClass('active');
	  window.scrollTo({top:0, left:0, behavior:'auto'});
	})
	tab4.on('click',function(){
	  tab1.removeClass('active');
	  tab2.removeClass('active');
	  tab3.removeClass('active');
	  tab5.removeClass('active');
	  window.scrollTo({top:0, left:0, behavior:'auto'});
	})
	tab5.on('click',function(){
	  tab1.removeClass('active');
	  tab2.removeClass('active');
	  tab3.removeClass('active');
	  tab4.removeClass('active');
	  window.scrollTo({top:0, left:0, behavior:'auto'});
	})
  
	
	//가로 카테고리 선택 시 처리(탭 영역 내용 보이게)
	$("#category1Btn").on("click", function(){//전체보기 내용
		tab1_contents.addClass('show active');
		tab2_contents.removeClass('show active');
		tab3_contents.removeClass('show active');
		tab4_contents.removeClass('show active');
		tab5_contents.removeClass('show active');
		window.scrollTo({top:0, left:0, behavior:'auto'});
	})
	$("#category2Btn").on("click", function(){//궁금해요 내용
		tab1_contents.removeClass('show active');
		tab2_contents.addClass('show active');
		tab3_contents.removeClass('show active');
		tab4_contents.removeClass('show active');
		tab5_contents.removeClass('show active');
		window.scrollTo({top:0, left:0, behavior:'auto'});
	})
	$("#category3Btn").on("click", function(){//도와주세요 내용
		tab1_contents.removeClass('show active');
		tab2_contents.removeClass('show active');
		tab3_contents.addClass('show active');
		tab4_contents.removeClass('show active');
		tab5_contents.removeClass('show active');
		window.scrollTo({top:0, left:0, behavior:'auto'});
	})
	$("#category2Btn").on("click", function(){//도와드려요 내용
		tab1_contents.removeClass('show active');
		tab2_contents.removeClass('show active');
		tab3_contents.removeClass('show active');
		tab4_contents.addClass('show active');
		tab5_contents.removeClass('show active');
		window.scrollTo({top:0, left:0, behavior:'auto'});
	})
	$("#category5Btn").on("click", function(){//일상 내용
		tab1_contents.removeClass('show active');
		tab2_contents.removeClass('show active');
		tab3_contents.removeClass('show active');
		tab4_contents.removeClass('show active');
		tab5_contents.addClass('show active');
		window.scrollTo({top:0, left:0, behavior:'auto'});
	})
	
	
	
	
	
  
	//글쓰기 버튼 클릭 시 
  	$("#writeBtn").on("click",function(){
  		alert("미완성")
		alert("진행중 체크여부 : "+$("#allCategoryRadioBox").is(':checked'));
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