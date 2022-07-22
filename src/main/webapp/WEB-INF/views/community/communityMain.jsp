<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="32x32" href="/img/favicon/favicon-32x32.png">
<title>[DOWA] 커뮤니티</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!--부트스트랩-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>


<!-- side_tap common -->
<link rel="stylesheet" href="/css/sideTab.css">

<!-- communityMain 전용 스타일 -->
<link rel="stylesheet" href="/css/community/communityMain.css">

<!-- input style -->
<link rel="stylesheet" href="/css/index.css">

<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

<!--알람 팝업-->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
/* 	div{border: 1px solid black} */

</style>

<script>

	$(function(){
		
		// window.location.href;
		// location.href;
		//  document.URL; 사이트 주소불러오는 방법들
		
		let siteUrl = window.location.href.split("#").pop(); //활성화할 문자
		let tabs = $("#v-pills-tab").children(); //세로탭 메뉴들
		let tabs2 = $("#horizonCategoryArea").children(); //가로탭 메뉴들
		let tabs_contents = $("#v-pills-tabContent").children(); // 컨텐츠틀
		
		setting(siteUrl); //사이트 접속 초기세팅
		
		window.onpopstate = function(event) {   //주소변경감지 이벤트
		  resetTab();
		  siteUrl = window.location.href.split("#").pop();
		  setting(siteUrl);
		}


		tabs.on("click",function(){   //세로탭 메뉴들 전체에 클릭시 이벤트
		  $(".searchWord").val("");//검색창 클린
		  resetTab(); //선택된 탭 초기화
		  $(this).children().addClass("active"); //클릭한 탭만 활성
		  setCookie('hash', '0', 30)//쿠기 기본으로 셋.(detailVeiw 해시태그 검색 및 Main에서 검색했다는 의미 없애기)
		})
		
		
		tabs2.on("click",function(){   //가로탭 메뉴들 전체에 클릭시 이벤트
		  $(".searchWord").val("");//검색창 클린
		  resetTab(); //선택된 탭 초기화
		  $(this).children().addClass("active"); //클릭한 탭만 활성
		  setCookie('hash', '0', 30)//쿠기 기본으로 셋.(detailVeiw 해시태그 검색 및 Main에서 검색했다는 의미 없애기)
// 	 		console.log(getCookie('hash'));
		})		
		
		
		
		//탭 세팅
		
		function setting(siteUrl){
		  if(siteUrl.split("-").length<2){   // 사이트에 최초 접속시 #탭id 가 없음, 활성화할 탭 id 넣어주기
		    siteUrl="all-tab" // 첫번째 탭을 id에 넣어줌
		  }		  
		  
	      if(siteUrl=='all-tab'){
	    	  	
				window.scrollTo({top:0, left:0, behavior:'auto'});
	    	  	$(".notice").css("display","block");//공지글 보이게
	 			$("#allCategoryRadioBox").prop('checked', false);//라디오박스 체크 해제
	 			a11_checked = false;
				
	 			if(hash_tag != "null" && getCookie('hash') == '1'){//detailView에서 해시태그 클릭 했을 때 사용.
					let serachContents = '${hash_tag}';
					$(".searchWord").val(serachContents);//검색창에 해시 태그 셋팅
					//전체보기 탭 내용 구성 함수 호출.
					allTab('',serachContents);
					hash_tag = "null";//detailView 에서 넘어온 해시태그 다 사용했음.
	 			}else if(getCookie('hash') == '2'){
	 				let serachContents = getCookie('serachContents');
	 				$("#allSearchWord").val(serachContents);
	 				allTab('',serachContents);
	 			}else{//커뮤니티 멘으로 이동했을 때 기본적으로 리스트 불러올 때 사용.
	 				//전체보기 탭 내용 구성 함수 호출.
		    		allTab('','');
		    		setCookie('hash', '0', 30)//detailView에서 hashtag 검색한 거라는 의미 없애기(쿠키에 저장해서 판단)
	 			}
	 			
	        }else if(siteUrl=='question-tab'){
				window.scrollTo({top:0, left:0, behavior:'auto'});
				if(getCookie('hash') == '2'){
	 				let serachContents = getCookie('serachContents');
	 				$("#questionSearchWord").val(serachContents);
	 				questionTab('q',serachContents);
				}else{
		    		//궁금해요 탭 내용 구성 함수 호출.
		    		questionTab('q','');
				}

	        }else if(siteUrl=='help-tab'){
				window.scrollTo({top:0, left:0, behavior:'auto'});
	 			$("#helpCategoryRadioBox").prop('checked', false);//라디오박스 체크 해제
	 			help_checked = false;
	 			
				if(getCookie('hash') == '2'){
	 				let serachContents = getCookie('serachContents');
	 				$("#helpSearchWord").val(serachContents);
	 				helpTab('h',serachContents);
				}else{
		    		//도와주세요 탭 내용 구성 함수 호출.
		    		helpTab('h','');
				}

	        }else if(siteUrl=='support-tab'){
				window.scrollTo({top:0, left:0, behavior:'auto'});
				if(getCookie('hash') == '2'){
	 				let serachContents = getCookie('serachContents');
	 				$("#supportSearchWord").val(serachContents);
	 				supportTab('s',serachContents);
				}else{
		    		//도와드려요 탭 내용 구성 함수 호출.
		    		supportTab('s','');
				}

	        }else if(siteUrl=='daily-tab'){
				window.scrollTo({top:0, left:0, behavior:'auto'});
				if(getCookie('hash') == '2'){
	 				let serachContents = getCookie('serachContents');
	 				$("#dailySearchWord").val(serachContents);
	 				dailyTab('d',serachContents);
				}else{
		    		//일상 탭 내용 구성 함수 호출.
		    		dailyTab('d','');
				}
	        }	  
		  
		  $("#v-pills-"+siteUrl+"").addClass("active"); //url에 맞는 탭 활성화
		  $("#v-pills-"+siteUrl+"2").addClass("active"); 
		  tabs_contents.removeClass("active"); //부트스트랩 탭 컨텐츠 버그방지용 초기화
		  $("#v-pills-"+siteUrl.split("-").shift()+"").addClass("show active"); // url에 맞는 컨텐츠 활성화
		 
		}
		
		function resetTab(){ //선택된 탭 초기화
		  tabs.children().removeClass("active");
		  tabs2.children().removeClass("active");
		}
	  
		//////////////////////////////////////////////////////////////////////탭 설정/////////////
		
		
		//게시글 클릭 시 디테일 페이지로 가기 위한 이벤트//////////////////////////////////////////////////////
		$(".categoryContentArea").on("click", ".boardArea" ,function(){
			let seq = $(this).find(".board_seq").val();
			//조회 수 up
			$.ajax({
			     url:'/community/viewCount',
			     data:{seq : seq},
			     type:'POST',
			     async: false
			  })
			
			//디테일 페이지 이동
			location.href = "/community/detailView?seq="+seq+"";
		})
		

		//공지사항 클릭 시////////////////////////////////////////////////////////////////////////
		$(".notice").on("click", function(){
			location.href = "/guide";			
		})
		
		
	

	})

</script>

</head>


<body>
<!-- Header -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/> 
<jsp:include page="/WEB-INF/views/common/pNav.jsp"/>


<div class="container mainContent">


<!-- <button id="dumy">더미 만들기</button> -->
<script>
// 	$("#dumy").on("click", function(){
// 		location.href = "/community/dumy";
// 	})
</script>




	<div id="pageHeader">커뮤니티<input type="button" id="toWriteBtn" value="글쓰기"><br><hr></div>
	
	<!-- 가로형 카테고리 영역 -->
	<div id="horizonCategoryArea">
	
		<a href="#all-tab"><button class="nav-link horizonCategory" id="v-pills-all-tab2"  type="button"><img src="/img/community/all.png"><br>전체</button></a>
		<a href="#question-tab"><button class="nav-link horizonCategory" id="v-pills-question-tab2" type="button"><img src="/img/community/ask.png"><br>궁금</button></a>
        <a href="#help-tab"><button class="nav-link horizonCategory" id="v-pills-help-tab2" type="button" ><img src="/img/community/mhelpme2.png"><br>도와</button></a>
        <a href="#support-tab"><button class="nav-link horizonCategory" id="v-pills-support-tab2" type="button" ><img src="/img/community/mhelpyou2.png"><br>줄게</button></a>
        <a href="#daily-tab"><button class="nav-link horizonCategory" id="v-pills-daily-tab2"  type="button" ><img src="/img/community/daily.png"><br>일상</button></a>	
	
	
	
<!-- 		<a href="#all-tab"><button class="nav-link horizonCategory" id="v-pills-all-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-all" type="button" role="tab" aria-controls="v-pills-all" aria-selected="true"><img src="/img/community/all.png"><br>전체</button></a> -->
<!-- 		<a href="#question-tab"><button class="nav-link horizonCategory" id="v-pills-question-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-question" type="button" role="tab" aria-controls="v-pills-question" aria-selected="false"><img src="/img/community/ask.png"><br>궁금</button></a> -->
<!--         <a href="#help-tab"><button class="nav-link horizonCategory" id="v-pills-help-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-help" type="button" role="tab" aria-controls="v-pills-help" aria-selected="false"><img src="/img/community/mhelpme2.png"><br>도와</button></a> -->
<!--         <a href="#support-tab"><button class="nav-link horizonCategory" id="v-pills-support-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-support" type="button" role="tab" aria-controls="v-pills-support" aria-selected="false"><img src="/img/community/mhelpyou2.png"><br>줄게</button></a> -->
<!--         <a href="#daily-tab"><button class="nav-link horizonCategory" id="v-pills-daily-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-daily" type="button" role="tab" aria-controls="v-pills-daily" aria-selected="false"><img src="/img/community/daily.png"><br>일상</button></a>	 -->
	</div>
	
	
	
    <!-- 세로 탭 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
    <div class="d-flex align-items-start">
        <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <a href="#all-tab"><button class="nav-link" id="v-pills-all-tab" data-bs-toggle="pill" data-bs-target="#v-pills-all" type="button" role="tab" aria-controls="v-pills-all" aria-selected="true"><img src="/img/community/all.png">전체</button></a>
            <a href="#question-tab"><button class="nav-link " id="v-pills-question-tab" data-bs-toggle="pill" data-bs-target="#v-pills-question" type="button" role="tab" aria-controls="v-pills-question" aria-selected="false"><img src="/img/community/ask.png">궁금해요</button></a>
            <a href="#help-tab"><button class="nav-link" id="v-pills-help-tab" data-bs-toggle="pill" data-bs-target="#v-pills-help" type="button" role="tab" aria-controls="v-pills-help" aria-selected="false"><img src="/img/community/helpme.png">도와주세요</button></a>
            <a href="#support-tab"><button class="nav-link" id="v-pills-support-tab" data-bs-toggle="pill" data-bs-target="#v-pills-support" type="button" role="tab" aria-controls="v-pills-support" aria-selected="false"><img src="/img/community/helpyou.png">도와드려요</button></a>
            <a href="#daily-tab"><button class="nav-link" id="v-pills-daily-tab" data-bs-toggle="pill" data-bs-target="#v-pills-daily" type="button" role="tab" aria-controls="v-pills-daily" aria-selected="false"><img src="/img/community/daily.png">일상</button></a>
        </div>

        <!-- 탭 contents --------------------------------------------------------------------------------------------->
        <div class="tab-content" id="v-pills-tabContent" style="word-break:break-all; ">
            <!--전체보기 탭1----------------------------------------------------------------->
            <div class="tab-pane fade " id="v-pills-all" role="tabpanel" aria-labelledby="v-pills-all-tab">
                <div>
                	<!-- 검색 입력창 영역 --------------------------------->
                    <div class="col-12 searchArea">
                    	<i class="bi bi-search"></i>
						<input type="text" placeholder="키워드와 #태그 모두 검색할 수 있어요." class="searchWord" id="allSearchWord">
						<i class="bi bi-x-circle-fill"></i>
                    </div>

                    <!-- 공지사항 영역 ------------------------------------>
                    <div class="col-12 notice" >
						<img src="/img/index/carousel1.jpg">
<!-- 						<img src="/img/index/guideImg.png"> -->
                    </div>
                    
                    <!-- 라이오 박스 영역 ---------------------------------->
                    <div class="col-12 allCategoryRadioDiv">
						<input type=radio class="categoryRadioBox" id="allCategoryRadioBox">&nbsp;
						<label for="allCategoryRadioBox">진행중만</label>
                    </div>
                    <br>
                    
                    <div id="allCategoryContentArea" class="categoryContentArea">
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
                    	<i class="bi bi-search"></i>
						<input type="text" placeholder="키워드와 #태그 모두 검색할 수 있어요." class="searchWord" id="questionSearchWord">
						<i class="bi bi-x-circle-fill"></i>
                    </div>
                    <!-- 라이오 박스 공간 ---------------------------------->
<!--                     <div class="col-12 allCategoryRadioDiv empty"></div> -->
					<br>
                    
                    <!-- 게시글 전체 영역 -->
                    <div id="questionCategoryContentArea" class="categoryContentArea">
                    </div>

            </div>

            <!--도와주세요 탭3----------------------------------------------------------------->      
            <div class="tab-pane fade" id="v-pills-help" role="tabpanel" aria-labelledby="v-pills-help-tab">
                	<!-- 검색 입력창 영역 --------------------------------->
                    <div class="col-12 searchArea">
                    	<i class="bi bi-search"></i>
						<input type="text" placeholder="키워드와 #태그 모두 검색할 수 있어요." class="searchWord" id="helpSearchWord">
						<i class="bi bi-x-circle-fill"></i>
                    </div>
                    
                    <!-- 라이오 박스 영역 ---------------------------------->
                    <div class="col-12 allCategoryRadioDiv">
						<input type=radio class="categoryRadioBox" id="helpCategoryRadioBox">&nbsp;
						<label for="helpCategoryRadioBox">진행중만</label>
                    </div>
                    <br>
                    
                    <!-- 게시글 전체 영역 -->
                    <div id="helpCategoryContentArea" class="categoryContentArea">
                    </div>

            </div>

            <!--도와드려요 탭4----------------------------------------------------------------->
            <div class="tab-pane fade" id="v-pills-support" role="tabpanel" aria-labelledby="v-pills-support-tab">
                
                	<!-- 검색 입력창 영역 --------------------------------->
                    <div class="col-12 searchArea">
                    	<i class="bi bi-search"></i>
						<input type="text" placeholder="키워드와 #태그 모두 검색할 수 있어요." class="searchWord" id="supportSearchWord">
						<i class="bi bi-x-circle-fill"></i>
                    </div>
                    <!-- 라이오 박스 공간 ---------------------------------->
<!--                     <div class="col-12 allCategoryRadioDiv"></div> -->
                    <br>
                    <!-- 게시글 전체 영역 -->
					<div id="supportCategoryContentArea" class="categoryContentArea">
					</div>
            </div>

            <!--일상 탭5----------------------------------------------------------------->
            <div class="tab-pane fade" id="v-pills-daily" role="tabpanel" aria-labelledby="v-pills-daily-tab">

                	<!-- 검색 입력창 영역 --------------------------------->
                    <div class="col-12 searchArea">
                    	<i class="bi bi-search"></i>
						<input type="text" placeholder="키워드와 #태그 모두 검색할 수 있어요." class="searchWord" id="dailySearchWord">
						<i class="bi bi-x-circle-fill"></i>
                    </div>
                    <!-- 라이오 박스 공간 ---------------------------------->
<!--                     <div class="col-12 allCategoryRadioDiv"></div> -->
                    <br>
                    
					<!-- 게시글 전체 영역 -->
                    <div id="dailyCategoryContentArea" class="categoryContentArea">
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
	//뒤로가기로 재진입 시
// 	$(window).bind("pageshow", function (event) {
// 		if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
// 			// Back Forward Cache로 브라우저가 로딩될 경우 혹은 브라우저 뒤로가기 했을 경우
// 			location.reload();
// 		}
// 	});

	






	let hash_tag = '${hash_tag}';//$(function{}) 에서 사용하기 위한 전역변수 - detailView에서 넘어온 해시태그 존재 여부

	
// 	$(window).bind("pageshow", function (event) {
// 		if (event.originalEvent.persisted) {
// 			console.log('BFCahe로부터 복원됨');
// 		}
// 		else {
// 			console.log('새로 열린 페이지');
// 		}
// 	});
	
	

	//글쓰기 버튼 클릭 시 
  	$("#toWriteBtn").on("click",function(){
		if('${loginID}'==''){		
			Swal.fire({
	            icon: 'warning',
	            title: '로그인 후 이용 가능합니다.'
	        })
	        return false;
    	}  		
  		

  		let category ;
        let siteUrl = window.location.href.split("#").pop(); //주소창
		if(siteUrl.split("-").length<2){ 
		  siteUrl="all-tab" // 첫번째 탭을 id에 넣어줌
		}
		if(siteUrl=='all-tab'){
			category= '';
		}else if(siteUrl=='question-tab'){
			category= 'q';
		}else if(siteUrl=='help-tab'){
			category= 'h';
		}else if(siteUrl=='support-tab'){
			category= 's';
		}else if(siteUrl=='daily-tab'){
			category= 'd';
		}	

  		location.href = "/community/boardWrite?category="+category;
// 		alert("진행중 체크여부 : "+$(".categoryRadioBox").is(':checked'));
  	})
  
  	
  	
  	//마감 여부에 따른 게시글 가져오기//////////////////////////
  	//전체 카테고리 라디오 박스 체크박스처럼 작동하게. 선택,해제 가능하게
  	let a11_checked = false;
	$("#allCategoryRadioBox").on("click", function(){
		if(a11_checked){//체크가 되어 있을 때 해제 하는,
			$(this).prop('checked', false);
			a11_checked = false;
			$(".endExsist").css("display","block");
			$(".endLine").css("display","block");
		}else{//체크가 안 되어 있을 때 선택하는.
			$(this).prop('checked', true);
			a11_checked = true;
			$(".endExsist").css("display","none");
			$(".endLine").css("display","none");
		}
	})
  	//도와주세요 카테고리 라디오 박스 체크박스처럼 작동하게. 선택,해제 가능하게
  	let help_checked = false;
	$("#helpCategoryRadioBox").on("click", function(){
		
		if(help_checked){//체크가 되어 있을 때 해제 하는,
			$(this).prop('checked', false);
			help_checked = false;
			$(".endExsist").css("display","block");
			$(".endLine").css("display","block");

		}else{//체크가 안 되어 있을 때 선택하는.
			$(this).prop('checked', true);
			help_checked = true;
			$(".endExsist").css("display","none");
			$(".endLine").css("display","none");

		}
		
	})
	/////////////////////////마감 여부에 따른 게시글 가져오기///
	
	
	//검색 창에 입력 감지하는 이벤트 (지우기 아이콘 display 설정)
	$(".searchWord").on("input",function(){
		if($(this).val() != ''){
			$(".bi-x-circle-fill").css("display","block");
		}else{
			$(".bi-x-circle-fill").css("display","none");
		}
	})
	//검색어 지우기 아이콘 클릭 시
	$(".bi-x-circle-fill").on("click",function(){
		$(this).siblings(".searchWord").val("");
		$(this).siblings(".searchWord").focus();
	})
	
	
	
	
	//UTF-8 인코딩 방식 바이트 길이 구하기 함수
	const getByteLengthOfString = function(s,b,i,c){
	    for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
	    return b;
	};
	
	//검색 기능///////////////////////////////////////////////////////////////
	$(".searchWord").on("keydown", function(e){

        if(e.which  == 13){ //엔터
            if($(this).val() == ""){
    			Swal.fire({
    	            icon: 'warning',
    	            title: '검색어를 입력해주세요.'
    	        })
    	        return false;
            }
        
            //최대글자 수
            //UTF-8 인코딩 방식 바이트 길이 구하기
            let titleLength = $(this).val();
            if(getByteLengthOfString(titleLength)>60){//한글 최대 20글자
    			Swal.fire({
    	            icon: 'warning',
    	            text: '검색어는 20자 이내로 작성해주세요'
    	        })
    	        return false;
            	return false;
            }
            
//             history.pushState(null, null, "/community/search");//주소 바꾸기
//             window.onpopstate = function (event) {
//                 window.history.go(-1);
//              };   

            $(".notice").css("display","none");//공지글 숨기기
			$(this).parent().siblings(".categoryContentArea").children().remove(); //게시글 모두 지우기
            let serachContents = ($(this).val()).trim();//검색 문자열 앞 뒤 공백 제거
            
            let siteUrl = window.location.href.split("#").pop(); //활성화할 문자
			if(siteUrl.split("-").length<2){   // 사이트에 최초 접속시 #탭id 가 없음, 활성화할 탭 id 넣어주기
			  siteUrl="all-tab" // 첫번째 탭을 id에 넣어줌
			}
			
//             console.log(serachContents)
			if(siteUrl=='all-tab'){
				window.scrollTo({top:0, left:0, behavior:'auto'});
				$("#allCategoryRadioBox").prop('checked', false);//라디오박스 체크 해제
				a11_checked = false;
				//전체보기 탭 내용 구성 함수 호출.
				allTab('',serachContents);
			}else if(siteUrl=='question-tab'){
				window.scrollTo({top:0, left:0, behavior:'auto'});
				//궁금해요 탭 내용 구성 함수 호출.
				questionTab('q',serachContents);
			}else if(siteUrl=='help-tab'){
				window.scrollTo({top:0, left:0, behavior:'auto'});
				$("#helpCategoryRadioBox").prop('checked', false);//라디오박스 체크 해제
				help_checked = false;
				//도와주세요 탭 내용 구성 함수 호출.
				helpTab('h',serachContents);
			}else if(siteUrl=='support-tab'){
				window.scrollTo({top:0, left:0, behavior:'auto'});
				//도와드려요 탭 내용 구성 함수 호출.
				supportTab('s',serachContents);
			}else if(siteUrl=='daily-tab'){
				window.scrollTo({top:0, left:0, behavior:'auto'});
				//일상 탭 내용 구성 함수 호출.
				dailyTab('d',serachContents);
			}	
            
			setCookie('hash', '2', 30);//detailView에서 hashtag 검색한 거라는 의미 없애고 / 검색 했다는 의미 삽입.
			setCookie('serachContents', serachContents , 30);
            
             
        }else if(e.which  == 9){//탭
        	return false;
        }

        //입력 받은 데이터가 한글, 영어, 숫자가 아니면 입력 못하게.
        let str = e.key;
        let regex = /[(ㄱ-힣a-zA-Z\d\#\s)]/;
        let result = regex.test(str);
        if(result==false){
            return false;
        }	
			
	})
	




	//탭 별 content 구성 함수///////////////////////////////////////////////////////////////////////////////////////////////////
	//전체보기 탭 내용 구성 함수
	function allTab(category, searchContent){
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
	    			       
	      let isSearchNone1 = true; 
	      function getList(pape){

	           $.ajax({
	                url:'/community/list',
	                type:'POST',
	               data : {cpage : page, category : category, searchContent : searchContent},
	               dataType : 'json',
	               async: false
	             }).done(function(resp){
					let list = JSON.parse(resp[0]) // 
	            	let totalPage = resp[1]
	            	console.log("전체보기 토탈 페이지 : "+totalPage);
	            	console.log("전체보기 현재 페이지 : "+page);
					
	            	if(list.length == 0 && isSearchNone1){
	            		if(getCookie('hash') == '2'){
	            			$("#allCategoryContentArea").append('<p class="searchNone"><br><br>검색 결과가 없습니다.</p>');
	            		}else{
	           				$("#allCategoryContentArea").append('<p class="searchNone"><br><br>마지막 게시글입니다.<br><br><br><br></p>');
	            		}

           				isSearchNone1 = false;
	            			
	            	}else{
	            		
	            		
						if(totalPage<pape){
//	 						alert("마지막 페이지 입니다.");
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
				        		if(list[i].progress == 'N'){
				        			titleArea.append("<span class = 'progress'>마감</span>");//제목 옆 마감 표시
				        		}
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
//	 					               dataType : 'json',
						               async: false
						             }).done(function(resp){
//	 					            	 console.log(resp);
						            	 if(resp != ''){//대표 이미지가 있으면,
							        		let profile = $('<div class="profile">');//대표 이미지 영역
							        		profile.append('<img class = "imgs" src="'+resp+'">');
							        		boardCenter_rightArea.append(profile); 
							        		
							        		boardCenterArea.append(boardCenter_leftArea);//제목,본문,해시태그,프로필 전체 영역에---왼쪽 제목,본문,해시태그 영역 삽입
							        		boardCenterArea.append(boardCenter_rightArea);//제목,본문,해시태그,프로필 전체 영역에---오른쪽 대표 이미지 영역 삽입
						            	 }else{
						            		 boardCenter_leftArea.css("width","100%");//왼쪽 영역밖에 없으니까.
						            		 boardCenterArea.append(boardCenter_leftArea);//제목,본문,해시태그,프로필 전체 영역에---왼쪽 제목,본문,해시태그 영역 삽입
						            	 }
						             })

				        		
				        		//////좋아요 댓글 수, 등록시간////// 
				        		let boardFooterArea = $("<div class='boardFooterArea'>");//좋아요 댓글 수, 등록시간 전체 영역
				        		boardFooterArea.append('<span class = "goodCountSpan"><i class="bi bi-hand-thumbs-up-fill"> '+list[i].like_count+'</span>');//좋아요 수
					  	           $.ajax({//댓글 수 가져오기
						                url:'/community/reCount',
						                type:'POST',
						               data : {parent_seq : list[i].board_seq},
//						               dataType : 'json',
						               async: false
						             }).done(function(resp){
						            	 boardFooterArea.append('<span class = "replyCountSpan"><i class="bi bi-chat-dots-fill"></i> '+resp+'</span>');//댓글 수
						             })
				        		
				        		
				        		let time = elapsedTime(list[i].write_date);
				        		boardFooterArea.append("<span class = 'regDate'>"+time+"</span>");//시간

				        		//진행여부가 '마감'이라면, 게시글div에 endExsist 클래스 부여
				        		if(list[i].progress == 'N'){
				        			boardArea.addClass("endExsist");
				        		}
				        		
				        		////////////게시글 박스 영역에, 각 영역 삽입////////////////
				        		boardArea.append(category);
				        		boardArea.append(boardCenterArea);
				        		boardArea.append(boardFooterArea);
				        		boardArea.append('<input type=hidden class="board_seq" value="'+list[i].board_seq+'">');//게시글 seq 숨겨두기

				        		$("#allCategoryContentArea").append(boardArea);//게시글 박스 영역을, 전체 Content영역에 append
				        		//진행여부가 '마감'이라면, endLine 경계선에 클래스 부여
				        		if(list[i].progress == 'N'){ 
				        			$("#allCategoryContentArea").append("<div class='col-12 boardBoundaryLine endLine'><hr></div>");//게시글 바운더리 영역 삽입
				        		}else{
				        			$("#allCategoryContentArea").append("<div class='col-12 boardBoundaryLine'><hr></div>");//게시글 바운더리 영역 삽입
				        		}
				        		
				            	 
				             }
							
						}

	            		
	            		
	            	}
	            	
	            	
	            	

	               
	               
	             })
	    	   
	       }
		
	}
	//궁금해요 탭 내용 구성 함수
	function questionTab(category, searchContent){
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
	    			       
	       let isSearchNone2 = true; 
	      function getList(pape){

	           $.ajax({
	                url:'/community/list',
	                type:'POST',
	               data : {cpage : page, category : category , searchContent : searchContent},
	               dataType : 'json',
	               async: false
	             }).done(function(resp){
					let list = JSON.parse(resp[0]) // 
	            	let totalPage = resp[1]
	            	console.log("궁금해요 토탈 페이지 : "+totalPage);
	            	console.log("궁금해요 현재 페이지 : "+page);
					
	            	
	            	if(list.length == 0 && isSearchNone2){
	            		if(getCookie('hash') == '2'){
	            			$("#questionCategoryContentArea").append('<p class="searchNone"><br><br>검색 결과가 없습니다.</p>');
	            		}else{
	           				$("#questionCategoryContentArea").append('<p class="searchNone"><br><br>마지막 게시글입니다.<br><br><br><br></p>');
	            		}
           				isSearchNone2 = false;
	            	}else{
						if(totalPage<pape){
//	 						alert("마지막 페이지 입니다.");
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
//						               dataType : 'json',
						               async: false
						             }).done(function(resp){
//						            	 console.log(resp);
						            	 if(resp != ''){//대표 이미지가 있으면,
							        		let profile = $('<div class="profile">');//대표 이미지 영역
							        		profile.append('<img class = "imgs" src="'+resp+'">');
							        		boardCenter_rightArea.append(profile); 
							        		
							        		boardCenterArea.append(boardCenter_leftArea);//제목,본문,해시태그,프로필 전체 영역에---왼쪽 제목,본문,해시태그 영역 삽입
							        		boardCenterArea.append(boardCenter_rightArea);//제목,본문,해시태그,프로필 전체 영역에---오른쪽 대표 이미지 영역 삽입
						            	 }else{
						            		 boardCenter_leftArea.css("width","100%");//왼쪽 영역밖에 없으니까.
						            		 boardCenterArea.append(boardCenter_leftArea);//제목,본문,해시태그,프로필 전체 영역에---왼쪽 제목,본문,해시태그 영역 삽입
						            	 }
						             })
				        		

				        		
				        		//////좋아요 댓글 수, 등록시간////// 
				        		let boardFooterArea = $("<div class='boardFooterArea'>");//좋아요 댓글 수, 등록시간 전체 영역
				        		boardFooterArea.append('<span class = "goodCountSpan"><i class="bi bi-hand-thumbs-up-fill"> '+list[i].like_count+'</span>');//좋아요 수
					  	           $.ajax({//댓글 수 가져오기
						                url:'/community/reCount',
						                type:'POST',
						               data : {parent_seq : list[i].board_seq},
//						               dataType : 'json',
						               async: false
						             }).done(function(resp){
						            	 boardFooterArea.append('<span class = "replyCountSpan"><i class="bi bi-chat-dots-fill"></i> '+resp+'</span>');//댓글 수
						             })
				        		
				        		let time = elapsedTime(list[i].write_date);
				        		boardFooterArea.append("<span class = 'regDate'>"+time+"</span>");//시간

				        		
				        		////////////게시글 박스 영역에, 각 영역 삽입////////////////
				        		boardArea.append(category);
				        		boardArea.append(boardCenterArea);
				        		boardArea.append(boardFooterArea);
				        		boardArea.append('<input type=hidden class="board_seq" value="'+list[i].board_seq+'">');//게시글 seq 숨겨두기
				        		

				        		$("#questionCategoryContentArea").append(boardArea);//게시글 박스 영역을, 전체 Content영역에 append
				        		$("#questionCategoryContentArea").append("<div class='col-12 boardBoundaryLine'><hr></div>");//게시글 바운더리 영역 삽입
				            	 
				             }
							
						}
	            	}
	            	
	            	
	            	
	            	


	               
	               
	             })
	    	   
	       }
	}
	//도와주세요 탭 내용 구성 함수
	function helpTab(category , searchContent){
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
	    			       
	       let isSearchNone3 = true;
	      function getList(pape){

	           $.ajax({
	                url:'/community/list',
	                type:'POST',
	               data : {cpage : page, category : category , searchContent : searchContent},
	               dataType : 'json',
	               async: false
	             }).done(function(resp){
					let list = JSON.parse(resp[0]) // 
	            	let totalPage = resp[1]
	            	console.log("도와주세요 토탈 페이지 : "+totalPage);
	            	console.log("도와주세요 현재 페이지 : "+page);
					
	            	if(list.length == 0 && isSearchNone3){
	            		if(getCookie('hash') == '2'){
	            			$("#helpCategoryContentArea").append('<p class="searchNone"><br><br>검색 결과가 없습니다.</p>');
	            		}else{
	           				$("#helpCategoryContentArea").append('<p class="searchNone"><br><br>마지막 게시글입니다.<br><br><br><br></p>');
	            		}
           				isSearchNone3 = false;
	            		
	            	}else{
						if(totalPage<pape){
//							alert("마지막 페이지 입니다.");
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
				        		if(list[i].progress == 'N'){
				        			titleArea.append("<span class = 'progress'>마감</span>");//제목 옆 마감 표시
				        		}
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
//						               dataType : 'json',
						               async: false
						             }).done(function(resp){
//						            	 console.log(resp);
						            	 if(resp != ''){//대표 이미지가 있으면,
							        		let profile = $('<div class="profile">');//대표 이미지 영역
							        		profile.append('<img class = "imgs" src="'+resp+'">');
							        		boardCenter_rightArea.append(profile); 
							        		
							        		boardCenterArea.append(boardCenter_leftArea);//제목,본문,해시태그,프로필 전체 영역에---왼쪽 제목,본문,해시태그 영역 삽입
							        		boardCenterArea.append(boardCenter_rightArea);//제목,본문,해시태그,프로필 전체 영역에---오른쪽 대표 이미지 영역 삽입
						            	 }else{
						            		 boardCenter_leftArea.css("width","100%");//왼쪽 영역밖에 없으니까.
						            		 boardCenterArea.append(boardCenter_leftArea);//제목,본문,해시태그,프로필 전체 영역에---왼쪽 제목,본문,해시태그 영역 삽입
						            	 }
						             })
				        		

				        		
				        		//////좋아요 댓글 수, 등록시간////// 
				        		let boardFooterArea = $("<div class='boardFooterArea'>");//좋아요 댓글 수, 등록시간 전체 영역
				        		boardFooterArea.append('<span class = "goodCountSpan"><i class="bi bi-hand-thumbs-up-fill"> '+list[i].like_count+'</span>');//좋아요 수
					  	           $.ajax({//댓글 수 가져오기
						                url:'/community/reCount',
						                type:'POST',
						               data : {parent_seq : list[i].board_seq},
//						               dataType : 'json',
						               async: false
						             }).done(function(resp){
						            	 boardFooterArea.append('<span class = "replyCountSpan"><i class="bi bi-chat-dots-fill"></i> '+resp+'</span>');//댓글 수
						             })
				        		
				        		let time = elapsedTime(list[i].write_date);
				        		boardFooterArea.append("<span class = 'regDate'>"+time+"</span>");//시간

				        		//진행여부가 '마감'이라면, 게시글 div에 endExsist 클래스 부여
				        		if(list[i].progress == 'N'){
				        			boardArea.addClass("endExsist");
				        		}
				        		////////////게시글 박스 영역에, 각 영역 삽입////////////////
				        		boardArea.append(category);
				        		boardArea.append(boardCenterArea);
				        		boardArea.append(boardFooterArea);
				        		boardArea.append('<input type=hidden class="board_seq" value="'+list[i].board_seq+'">');//게시글 seq 숨겨두기

				        		$("#helpCategoryContentArea").append(boardArea);//게시글 박스 영역을, 전체 Content영역에 append
				        		//진행여부가 '마감'이라면, endLine 경계선에 클래스 부여
				        		if(list[i].progress == 'N'){ 
				        			$("#helpCategoryContentArea").append("<div class='col-12 boardBoundaryLine endLine'><hr></div>");//게시글 바운더리 영역 삽입
				        		}else{
				        			$("#helpCategoryContentArea").append("<div class='col-12 boardBoundaryLine'><hr></div>");//게시글 바운더리 영역 삽입
				        		}
				             }
							
						}
	            	}
	            	

	               
	             })
	    	   
	       }
	}
	//도와드려요 탭 내용 구성 함수
	function supportTab(category , searchContent){
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
	    			       
	       let isSearchNone4 = true;
	      function getList(pape){

	           $.ajax({
	                url:'/community/list',
	                type:'POST',
	               data : {cpage : page, category : category , searchContent:searchContent},
	               dataType : 'json',
	               async: false
	             }).done(function(resp){
					let list = JSON.parse(resp[0]) // 
	            	let totalPage = resp[1]
	            	console.log("궁금해요 토탈 페이지 : "+totalPage);
	            	console.log("궁금해요 현재 페이지 : "+page);
					
	            	if(list.length == 0 && isSearchNone4){
	            		if(getCookie('hash') == '2'){
	            			$("#supportCategoryContentArea").append('<p class="searchNone"><br><br>검색 결과가 없습니다.</p>');
	            		}else{
	           				$("#supportCategoryContentArea").append('<p class="searchNone"><br><br>마지막 게시글입니다.<br><br><br><br></p>');
	            		}
           				isSearchNone4 = false;
	            	}else{
						if(totalPage<pape){
//							alert("마지막 페이지 입니다.");
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
//						               dataType : 'json',
						               async: false
						             }).done(function(resp){
//						            	 console.log(resp);
						            	 if(resp != ''){//대표 이미지가 있으면,
							        		let profile = $('<div class="profile">');//대표 이미지 영역
							        		profile.append('<img class = "imgs" src="'+resp+'">');
							        		boardCenter_rightArea.append(profile); 
							        		
							        		boardCenterArea.append(boardCenter_leftArea);//제목,본문,해시태그,프로필 전체 영역에---왼쪽 제목,본문,해시태그 영역 삽입
							        		boardCenterArea.append(boardCenter_rightArea);//제목,본문,해시태그,프로필 전체 영역에---오른쪽 대표 이미지 영역 삽입
						            	 }else{
						            		 boardCenter_leftArea.css("width","100%");//왼쪽 영역밖에 없으니까.
						            		 boardCenterArea.append(boardCenter_leftArea);//제목,본문,해시태그,프로필 전체 영역에---왼쪽 제목,본문,해시태그 영역 삽입
						            	 }
						             })
				        		

				        		
				        		//////좋아요 댓글 수, 등록시간////// 
				        		let boardFooterArea = $("<div class='boardFooterArea'>");//좋아요 댓글 수, 등록시간 전체 영역
				        		boardFooterArea.append('<span class = "goodCountSpan"><i class="bi bi-hand-thumbs-up-fill"> '+list[i].like_count+'</span>');//좋아요 수
					  	           $.ajax({//댓글 수 가져오기
						                url:'/community/reCount',
						                type:'POST',
						               data : {parent_seq : list[i].board_seq},
//						               dataType : 'json',
						               async: false
						             }).done(function(resp){
						            	 boardFooterArea.append('<span class = "replyCountSpan"><i class="bi bi-chat-dots-fill"></i> '+resp+'</span>');//댓글 수
						             })
				        		
				        		let time = elapsedTime(list[i].write_date);
				        		boardFooterArea.append("<span class = 'regDate'>"+time+"</span>");//시간

				        		
				        		////////////게시글 박스 영역에, 각 영역 삽입////////////////
				        		boardArea.append(category);
				        		boardArea.append(boardCenterArea);
				        		boardArea.append(boardFooterArea);
				        		boardArea.append('<input type=hidden class="board_seq" value="'+list[i].board_seq+'">');//게시글 seq 숨겨두기

				        		$("#supportCategoryContentArea").append(boardArea);//게시글 박스 영역을, 전체 Content영역에 append
				        		$("#supportCategoryContentArea").append("<div class='col-12 boardBoundaryLine'><hr></div>");//게시글 바운더리 영역 삽입
				            	 
				             }
							
						}
	            	}
	            	
	            	
	            	
	            	


	               
	               
	             })
	    	   
	       }
	}
	//일상 탭 내용 구성 함수
	function dailyTab(category , searchContent){
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
	    			       
	       let isSearchNone5 = true;
	      function getList(pape){

	           $.ajax({
	                url:'/community/list',
	                type:'POST',
	               data : {cpage : page, category : category , searchContent : searchContent},
	               dataType : 'json',
	               async: false
	             }).done(function(resp){
					let list = JSON.parse(resp[0]) // 
	            	let totalPage = resp[1]
	            	console.log("일상 토탈 페이지 : "+totalPage);
	            	console.log("일상 현재 페이지 : "+page);
					
	            	if(list.length == 0 && isSearchNone5){
	            		if(getCookie('hash') == '2'){
	            			$("#dailyCategoryContentArea").append('<p class="searchNone"><br><br>검색 결과가 없습니다.</p>');
	            		}else{
	           				$("#dailyCategoryContentArea").append('<p class="searchNone"><br><br>마지막 게시글입니다.<br><br><br><br></p>');
	            		}
           				isSearchNone5 = false;
	            	}else{
						if(totalPage<pape){
//							alert("마지막 페이지 입니다.");
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
//						               dataType : 'json',
						               async: false
						             }).done(function(resp){
//						            	 console.log(resp);
						            	 if(resp != ''){//대표 이미지가 있으면,
							        		let profile = $('<div class="profile">');//대표 이미지 영역
							        		profile.append('<img class = "imgs" src="'+resp+'">');
							        		boardCenter_rightArea.append(profile); 
							        		
							        		boardCenterArea.append(boardCenter_leftArea);//제목,본문,해시태그,프로필 전체 영역에---왼쪽 제목,본문,해시태그 영역 삽입
							        		boardCenterArea.append(boardCenter_rightArea);//제목,본문,해시태그,프로필 전체 영역에---오른쪽 대표 이미지 영역 삽입
						            	 }else{
						            		 boardCenter_leftArea.css("width","100%");//왼쪽 영역밖에 없으니까.
						            		 boardCenterArea.append(boardCenter_leftArea);//제목,본문,해시태그,프로필 전체 영역에---왼쪽 제목,본문,해시태그 영역 삽입
						            	 }
						             })
				        		

				        		
				        		//////좋아요 댓글 수, 등록시간////// 
				        		let boardFooterArea = $("<div class='boardFooterArea'>");//좋아요 댓글 수, 등록시간 전체 영역
				        		boardFooterArea.append('<span class = "goodCountSpan"><i class="bi bi-hand-thumbs-up-fill"> '+list[i].like_count+'</span>');//좋아요 수
					  	           $.ajax({//댓글 수 가져오기
						                url:'/community/reCount',
						                type:'POST',
						               data : {parent_seq : list[i].board_seq},
//						               dataType : 'json',
						               async: false
						             }).done(function(resp){
						            	 boardFooterArea.append('<span class = "replyCountSpan"><i class="bi bi-chat-dots-fill"></i> '+resp+'</span>');//댓글 수
						             })
				        		
				        		let time = elapsedTime(list[i].write_date);
				        		boardFooterArea.append("<span class = 'regDate'>"+time+"</span>");//시간

				        		
				        		////////////게시글 박스 영역에, 각 영역 삽입////////////////
				        		boardArea.append(category);
				        		boardArea.append(boardCenterArea);
				        		boardArea.append(boardFooterArea);
				        		boardArea.append('<input type=hidden class="board_seq" value="'+list[i].board_seq+'">');//게시글 seq 숨겨두기

				        		$("#dailyCategoryContentArea").append(boardArea);//게시글 박스 영역을, 전체 Content영역에 append
				        		$("#dailyCategoryContentArea").append("<div class='col-12 boardBoundaryLine'><hr></div>");//게시글 바운더리 영역 삽입
				            	 
				             }
							
						}
	            	}
	            	
	
	             })
	    	   
	       }
	}
	//////////////////////////////////////////////////////////////////////////////////////////////////////탭 별 content 구성 함수////
	

	
	
	
	
	
	
	
	
	
	//시간 차 구하기 함수/////////////////////////////////////////////////////////////////////
	
	// 본문
// 	<input type=hidden class="date" value="${i.reg_date}"> //→ DB에서 가져온 timestamp값 넣어주기
// 	<div class="diff"></div>// → 현재 시간과의 계산 결과 출력할 곳
	
	// 시간 계산하는 스크립트
// 	let arr = $(".date");
// 	let arr2 = $(".diff");
	
// 	for(let i = 0; i < arr.length; i++) {
// 	arr2[i].innerHTML = elapsedTime(i);
// 	}
	
	function elapsedTime(i) {

		let timeValue = new Date(i);//등록 시간
		let reg_year = timeValue.getFullYear();//등록 년
		let reg_month = timeValue.getMonth()+1;//등록 월
		let reg_day = timeValue.getDate();//등록 일
		let reg_date = reg_year+"-"+reg_month+"-"+reg_day;//등록일 ex) 2022-07-10		
		

        let today = new Date();//현재시간
        let betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);//분(현재시간 등록시간 차)
        let betweenTimeHour = Math.floor(betweenTime / 60);//시(현재시간 등록시간 차)
//         const betweenTimeDay = Math.floor(betweenTime / 60 / 24);//일(현재시간, 등록시간 차)


		var d = new Date();//현재 날짜
		var now_year = d.getFullYear(); //현재 년, 2015
		var now_month = (d.getMonth() + 1); //현재 월, 11[1을 더해야함. 유일하게 조심해야할 부분. 1월은 0이다.]
		var now_day = d.getDate(); //현재 일
		var yesterday = now_day-1; //어제
		


		if(now_year == reg_year && now_month == reg_month && yesterday == reg_day ){//등록시간이랑 어제랑 날짜가 같으면,
			return '어제';
		}else{
			
			if(betweenTimeHour > 24){
				return reg_date;
			}else if(betweenTime >= 60 && betweenTimeHour <= 24){
	        	return betweenTimeHour + '시간 전';
	        }else if(betweenTime < 60 && betweenTime > 1){
	        	return betweenTime + '분 전';
	        }else if(betweenTime <= 1){
	        	return '방금 전';
	        }
			
		}

	}
	
	
	
	
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
	
	
	
</script>


</body>

</html>