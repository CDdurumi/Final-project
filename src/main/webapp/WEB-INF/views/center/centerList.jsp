<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
            <a href="/center/main?cpage=1#notice-tab"><button class="nav-link active pageNav" id="v-pills-notice-tab" data-bs-toggle="pill" data-bs-target="#v-pills-all" type="button" role="tab" aria-controls="v-pills-all" aria-selected="true">공지사항</button></a>
            <a href="#help-tab"><button class="nav-link" id="v-pills-help-tab" data-bs-toggle="pill" data-bs-target="#v-pills-help" type="button" role="tab" aria-controls="v-pills-help" aria-selected="false">자주묻는 질문</button></a>
            <a href="/center/main?cpage=1#question-tab"><button class="nav-link pageNav" id="v-pills-question-tab" data-bs-toggle="pill" data-bs-target="#v-pills-question" type="button" role="tab" aria-controls="v-pills-question" aria-selected="false">문의내역</button></a>
        </div>

        <!-- 탭 contents --------------------------------------------------------------------------------------------->
        <div class="tab-content" id="v-pills-tabContent" style="word-break:break-all; ">
            <!--공지사항 탭----------------------------------------------------------------->
            <div class="tab-pane fade show active" id="v-pills-notice" role="tabpanel" aria-labelledby="v-pills-notice-tab">
                <div class="" id="allCategoryContentArea">
                    	<ul class="boardList" id="notice">
                    	
                    		<c:forEach var="i" items="${list}">
                    			<li class="notice-list">
									<a href="/center/noticeDetail?seq=${i.notice_seq}">
										<strong class='title'>${i.title}</strong>
										<span class='date'>											
											<fmt:formatDate value="${i.write_date}" type="both" pattern="yyyy-MM-dd" />
										</span>
									</a>
								</li>
                    		</c:forEach>         	
                    		
                    	</ul>

			   <!-- JSTL로 묶기 -->
			   <c:choose>
				   <c:when test="${MemberDTO.type == 'A'}">
				   	   <div style="text-align:right; border:none;">  
					   		<a href="/center/notice-write"><input type="button" id="writeBtn" value="공지사항 작성"></a><br>
				   	   </div>
			   	   </c:when>	
			   </c:choose>
			   	
			  </div>

			   	
			   <div class="pagination p9">
			       <ul id="test">
						${page}
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
			         <a href="/center/main?cpage=1#question-tab"><li>1</li></a>
			         <a href="/center/main?cpage=2#question-tab"><li>2</li></a>
			         <a class="is-active" href="/center/main?cpage=3#question-tab"><li>3</li></a>
			         <a href="/center/main?cpage=4#question-tab"><li>4</li></a>
			         <a href="/center/main?cpage=5#question-tab"><li>5</li></a>
			         <a href="/center/main?cpage=6#question-tab"><li>6</li></a>
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

	//////////////////////////////////////////////////////////////////////탭 설정/////////////
	// window.location.href;
	// location.href;
	//  document.URL; 사이트 주소불러오는 방법들
	
	let siteUrl = window.location.href.split("#").pop(); //활성화할 문자
	let tabs = $("#v-pills-tab").children(); //세로탭 메뉴들
	let tabs_contents = $("#v-pills-tabContent").children(); // 컨텐츠틀
	
	console.log(siteUrl);
	
	
	window.onpopstate = function(event) {   //주소변경감지 이벤트
	  resetTab();
	  siteUrl = window.location.href.split("#").pop(); // 이걸 바꿔주면 되지 않나.
	  setting(siteUrl);
	  
	  console.log("현재 페이지 : " +  siteUrl)
	  
	}

	
	tabs.on("click",function(){   //세로탭 메뉴들 전체에 클릭시 이벤트
	  resetTab(); //선택된 탭 초기화
	  $(this).children().addClass("active"); //클릭한 탭만 활성
	})
	
	//탭 세팅
	function setting(siteUrl){
	  if(siteUrl.split("-").length<2){   // 사이트에 최초 접속시 #탭id 가 없음, 활성화할 탭 id 넣어주기
	    siteUrl="notice-tab" // 첫번째 탭을 id에 넣어줌 -> 이게 문제 새로고침하면 무조건 notice-tab으로 옴
	  }
	  
	  $("#v-pills-"+siteUrl+"").addClass("active"); //url에 맞는 탭 활성화      
	  tabs_contents.removeClass("active"); //부트스트랩 탭 컨텐츠 버그방지용 초기화
	  $("#v-pills-"+siteUrl.split("-").shift()+"").addClass("show active"); // url에 맞는 컨텐츠 활성화
	  
	  //
	  
	}
	
	function resetTab(){ //선택된 탭 초기화
	  tabs.children().removeClass("active");
	}
  
	//////////////////////////////////////////////////////////////////////페이지네이션 설정/////////////
	$(".page-notice").on("click", function(){
		
		let cpage = $(this).text();
		console.log(cpage)
		$(".is-active").removeClass("is-active");
		$(this).addClass("is-active");
		$(".notice-list").remove();
		
		// let test;
		// 해당 데이터 값 받아오기
		$.ajax({
			url:"/center/getNoticeList",
			data:{cpage:cpage},
			type:"get",
			dataType:"json"
		}).done(function(resp){
			console.log(resp);
			
			for(let i=0; i<resp.length; i++){
				
				let li = $("<li class='notice-list'>");
				let a = $("<a href='/center/noticeDetail?seq="+resp[i].notice_seq+"'>");
				let strong = $("<strong class='title'>");
				let span = $("<span class='date'>");
				
				strong.text(resp[i].title);
				span.text("2022-07-07"); // 날짜만 고정해주면 됨.
				
				a.append(strong);
				a.append(span);
				
				li.append(a);
				
				$("#notice").append(li);
			
			}

			// test = "<a class='is-active' href='/center/main?cpage=3#question-tab'><li>test</li></a>";
			// $("#test").append(test);
			$("html").scrollTop(0);
			
		}); // ajax 행
	});
	
	
	///////////페이지 네이션 초기화
	$(".pageNav").on("click",function(){
		
		let cpage = 1;
		$(".is-active").removeClass("is-active");
		$(this).addClass("is-active");
		$(".notice-list").remove();
		
	});
	
  	
</script>


</body>

</html>