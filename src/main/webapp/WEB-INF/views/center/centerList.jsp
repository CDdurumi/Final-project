<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DOWA 고객센터</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!--부트스트랩-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>

<!-- side_tap common -->
<link rel="stylesheet" href="/css/sideTab.css">

<!-- communityMain 전용 스타일 -->
<link rel="stylesheet" href="/css/center/centerList.css">

<!-- input style -->
<link rel="stylesheet" href="/css/index.css">

</head>


<body>
<!-- Header -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/> 
<%-- <jsp:include page="/WEB-INF/views/common/pNav.jsp"/> --%>


<div class="container mainContent" id="service-center-container" >

	<div id="pageHeader">고객센터<hr></div>
	
	<!-- 가로형 카테고리 영역 -->
	<div id="horizonCategoryArea">
		<a href="#notice-tab" class="horizonCategory">공지사항</a>
		<a href="#help-tab" class="horizonCategory">자주묻는 질문</a>
		<a href="#question-tab" class="horizonCategory">문의내역</a>
	</div>
	
    <!-- 세로 탭 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
    <div class="d-flex align-items-start">
        <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <a href="#notice-tab"><button class="nav-link active" id="v-pills-notice-tab" data-bs-toggle="pill" data-bs-target="#v-pills-all" type="button" role="tab" aria-controls="v-pills-all" aria-selected="true">공지사항</button></a>
            <a href="#help-tab"><button class="nav-link" id="v-pills-help-tab" data-bs-toggle="pill" data-bs-target="#v-pills-help" type="button" role="tab" aria-controls="v-pills-help" aria-selected="false">자주묻는 질문</button></a>
            <a href="#question-tab"><button class="nav-link " id="v-pills-question-tab" data-bs-toggle="pill" data-bs-target="#v-pills-question" type="button" role="tab" aria-controls="v-pills-question" aria-selected="false">문의내역</button></a>
        </div>

        <!-- 탭 contents --------------------------------------------------------------------------------------------->
        <div class="tab-content" id="v-pills-tabContent" style="word-break:break-all; ">
            <!--공지사항 탭----------------------------------------------------------------->
            <div class="tab-pane fade show active" id="v-pills-notice" role="tabpanel" aria-labelledby="v-pills-notice-tab">
                <div class="" id="allCategoryContentArea">
                    	<ul class="boardList" id="notice">

							<li>
								<a href="/center/noticeDetail">
									<strong class='title'>1. 무슨무슨 업데이트</strong>
									<span class='date'>2022.7.6</span>
								</a>
							</li>
							
							
							<li>
								<a href="">
									<strong class='title'>2. 무슨무슨 업데이트</strong>
									<span class='date'>2022.7.6</span>
								</a>
							</li>
							
							
							<li>
								<a href="">
									<strong class='title'>3. 무슨무슨 업데이트</strong>
									<span class='date'>2022.7.6</span>
								</a>
							</li>
							
							
							<li>
								<a href="">
									<strong class='title'>4. 무슨무슨 업데이트</strong>
									<span class='date'>2022.7.6</span>
								</a>
							</li>
                    	
							<li>
								<a href="">
									<strong class='title'>5. 무슨무슨 업데이트</strong>
									<span class='date'>2022.7.6</span>
								</a>
							</li>                    	
                    	</ul>

			   <!-- JSTL로 묶기 -->
			   <div style="text-align:right; border:none;">  
				   <a href="/center/notice-write"><input type="button" id="writeBtn" value="공지사항 작성"></a><br>
			   </div>		
				</div>

			   	
			   <div class="pagination p9">
			       <ul>
			         <a href="#"><li>1</li></a>
			         <a href="#"><li>2</li></a>
			         <a href="#"><li>3</li></a>
			         <a class="is-active" href="#"><li>4</li></a>
			         <a href="#"><li>5</li></a>
			         <a href="#"><li>6</li></a>
			       </ul>
			    </div>
				
            </div>

            <!--자주묻는 질문 탭----------------------------------------------------------------->      
            <div class="tab-pane fade" id="v-pills-help" role="tabpanel" aria-labelledby="v-pills-help-tab">
            	자주 묻는 질문이올시다.
            </div>
            
            <!--문의내역 탭----------------------------------------------------------------->
            <div class="tab-pane fade" id="v-pills-question" role="tabpanel" aria-labelledby="v-pills-question-tab">
                    	<ul class="inquiryList" id="inquiry">

							<li>
								<a href="/center/inquiryDetail">
									<strong class='title'>환불은 언제 가능한가요?</strong>
									<span class='date'>2022.7.6</span>
									<span class='result'>답변 완료</span>
								</a>
							</li>
							
							
							<li>
								<a href="">
									<strong class='title'>2. 무슨무슨 업데이트</strong>
									
									<span class='date'>2022.7.6</span>
								</a>
							</li>
							
							
							<li>
								<a href="">
									<strong class='title'>3. 무슨무슨 업데이트</strong>
									<span class='date'>2022.7.6</span>
								</a>
							</li>
							
							
							<li>
								<a href="">
									<strong class='title'>4. 무슨무슨 업데이트</strong>
									<span class='date'>2022.7.6</span>
								</a>
							</li>
                    	
							<li>
								<a href="">
									<strong class='title'>5. 무슨무슨 업데이트</strong>
									<span class='date'>2022.7.6</span>
								</a>
							</li>                    	
                    	</ul>
               <div style="text-align:right;">     	
               		<a href="/center/inquiry"><input type="button" id="writeBtn" value="1:1문의"></a>
               </div>    	
			   <div class="pagination p9">
			       <ul>
			         <a href="#"><li>1</li></a>
			         <a href="#"><li>2</li></a>
			         <a class="is-active" href="#"><li>3</li></a>
			         <a href="#"><li>4</li></a>
			         <a href="#"><li>5</li></a>
			         <a href="#"><li>6</li></a>
			       </ul>
			    </div>                    	
                    	
                    	
                    	
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
	    siteUrl="notice-tab" // 첫번째 탭을 id에 넣어줌
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
	//  alert("진행중 체크여부 : "+$("#allCategoryRadioBox").is(':checked'));
  	});
  
  	
</script>


</body>

</html>