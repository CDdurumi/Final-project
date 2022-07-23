<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="32x32" href="/img/favicon/favicon-32x32.png">
<title>[DOWA] 고객센터</title>
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


<script>
 $(document).ready(function(){
			function formatDate(date) {
		    
		    	var d = new Date(date),
		    
		    	month = '' + (d.getMonth() + 1) , 
		    	day = '' + d.getDate(), 
		    	year = d.getFullYear();
		    
			    if (month.length < 2) month = '0' + month; 
			    if (day.length < 2) day = '0' + day; 
		    
			    return [year, month, day].join('-');
		    }

	 
		////////////////////////////////////////////////////////////////////// 공지사항 페이지네이션 설정/////////////
		$(".container").on("click",".page-notice", function(){ 
			
			let cpage = $(this).text();
			console.log(cpage)
			$(".page-notice").detach();
			$(".notice-list").detach();
			
			// let test;
			// 해당 데이터 값 받아오기
			$.ajax({
				url:"/center/getNoticeList",
				data:{cpage:cpage},
				type:"get",
				dataType:"json"
			}).done(function(resp){
				console.log(resp);
				
				for(let i=0; i<resp.list.length; i++){
					
					let li = $("<li class='notice-list'>");
					let a = $("<a href='/center/noticeDetail?seq="+resp.list[i].notice_seq+"'>");
					let strong = $("<strong class='title'>");
					let span = $("<span class='date'>");
					
					let date = formatDate(resp.list[i].write_date)
					
					strong.text(resp.list[i].title);
					span.text(date); // 날짜만 고정해주면 됨.
					
					a.append(strong);
					a.append(span);
					
					li.append(a);
					
					$("#notice").append(li);
				
				}

				$("#noticePage").append(resp.page);
				$("html").scrollTop(0);
				
			}); // ajax 행
		});
		
		
		/////////// 공지사항 페이지 네이션 초기화
		$(".notice-list-reset").on("click",function(){
			
			let cpage = 1;

			$(".page-notice").detach(); // 페이지네이션 초기화
			$(".notice-list").detach(); // 리스트 초기화
			
			// let test;
			// 해당 데이터 값 받아오기
			$.ajax({
				url:"/center/getNoticeList",
				data:{cpage:cpage},
				type:"get",
				dataType:"json"
			}).done(function(resp){
				console.log(resp);
				
				for(let i=0; i<resp.list.length; i++){
					
					let li = $("<li class='notice-list'>");
					let a = $("<a href='/center/noticeDetail?seq="+resp.list[i].notice_seq+"'>");
					let strong = $("<strong class='title'>");
					let span = $("<span class='date'>");
					
					let date = formatDate(resp.list[i].write_date)
					
					strong.text(resp.list[i].title);
					span.text(date);
					
					a.append(strong);
					a.append(span);
					
					li.append(a);
					
					$("#notice").append(li);
				
				}

				$("#noticePage").append(resp.page);
				$("html").scrollTop(0);
				
			}); // ajax
		}); 
		
		
		////1대1문의 페이지 네이션 초기화  .inquiry-list-reset///
		$(".inquiry-list-reset").on("click",function(){
			
			let cpage = 1;

			$(".page-inquiry").detach(); // 페이지네이션 초기화
			$(".inquiry-list").detach(); // 리스트 초기화
			
			// 해당 데이터 값 받아오기
			$.ajax({
				url:"/center/getInquiryList",
				data:{cpage:cpage},
				type:"get",
				dataType:"json"
			}).done(function(resp){
				console.log(resp);
				
				for(let i=0; i<resp.list.length; i++){
					
					let li = $("<li class='inquiry-list'>");
					let a = $("<a href='/center/inquiryDetail?seq="+resp.list[i].inquiry_seq+"'>");
					let strong = $("<strong class='title'>");
					let span1 = $("<span class='date'>");
					let span2 = $("<span class='result'>");
					
					let result_txt;
					
					if(resp.list[i].sts == '0'){
						result_txt = "답변 대기"
					} else {
						result_txt = "답변 완료"
					}
					
					let date = formatDate(resp.list[i].write_date)
					
					strong.text(resp.list[i].title);
					span1.text(date);
					span2.text(result_txt);
					if(result_txt=='답변 대기'){
						span2.css({"color":"#ffb200","font-weight":"600"});
					}else{
						span2.css({"color":"#9381ff","font-weight":"600"});
					}
					
					
					a.append(strong);
					a.append(span1);
					a.append(span2);
					
					li.append(a);
					
					$("#inquiry").append(li);
				
				}

				$("#inquiryPage").append(resp.page);
				$("html").scrollTop(0);
				
			}); // ajax
		}); 		
		
		////1대1문의 페이지 네이션 설정  .page-inquiry///
		$(".container").on("click",".page-inquiry", function(){ 
			
			let cpage = $(this).text();
			console.log(cpage)
			$(".page-inquiry").detach(); 
			$(".inquiry-list").detach(); 
			
			// 해당 데이터 값 받아오기
			$.ajax({
				url:"/center/getInquiryList",
				data:{cpage:cpage},
				type:"get",
				dataType:"json"
			}).done(function(resp){
				console.log(resp);
				
				for(let i=0; i<resp.list.length; i++){
					
					let li = $("<li class='inquiry-list'>");
					let a = $("<a href='/center/inquiryDetail?seq="+resp.list[i].inquiry_seq+"'>");
					let strong = $("<strong class='title'>");
					let span1 = $("<span class='date'>");
					let span2 = $("<span class='result'>");
					
					let result_txt;
					
					if(resp.list[i].sts == '0'){
						result_txt = "답변 대기"
					} else {
						result_txt = "답변 완료"
					}
					
					let date = formatDate(resp.list[i].write_date)
					
					strong.text(resp.list[i].title);
					span1.text(date);
					span2.text(result_txt);
					if(result_txt=='답변 대기'){
						span2.css({"color":"#ffb200","font-weight":"600"});
					}else{
						span2.css({"color":"#9381ff","font-weight":"600"});
					}
					
					a.append(strong);
					a.append(span1);
					a.append(span2);
					
					li.append(a);
					
					$("#inquiry").append(li);
				
				}

				$("#inquiryPage").append(resp.page);
				$("html").scrollTop(0);
				
			}); // ajax
		});		
 });
</script>

</head>


<body>
<!-- Header -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/> 
<%-- <jsp:include page="/WEB-INF/views/common/pNav.jsp"/> --%>


<div class="container mainContent" id="service-center-container" >

	<div id="pageHeader">고객센터<hr></div>
	
	<!-- 가로형 카테고리 영역 -->
	<div id="horizonCategoryArea">
		<a href="#notice-tab" class="horizonCategory notice-list-reset mx-3" id="v-pills-notice-tab2">공지사항</a>
		<a href="#help-tab" class="horizonCategory mx-3" id="v-pills-help-tab2">자주 묻는 질문</a>
		<a href="#question-tab" class="horizonCategory inquiry-list-reset mx-3" id="v-pills-question-tab2">문의하기</a>
	</div>
	
    <!-- 세로 탭 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
    <div class="d-flex align-items-start">
        <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <a href="/center/main?cpage=1#notice-tab"><button class="nav-link notice-list-reset" id="v-pills-notice-tab" data-bs-toggle="pill" data-bs-target="#v-pills-all" type="button" role="tab" aria-controls="v-pills-all" aria-selected="true">공지사항</button></a>
            <a href="#help-tab"><button class="nav-link" id="v-pills-help-tab" data-bs-toggle="pill" data-bs-target="#v-pills-help" type="button" role="tab" aria-controls="v-pills-help" aria-selected="false">자주 묻는 질문</button></a>
            <a href="#question-tab"><button class="nav-link inquiry-list-reset" id="v-pills-question-tab" data-bs-toggle="pill" data-bs-target="#v-pills-question" type="button" role="tab" aria-controls="v-pills-question" aria-selected="false">문의하기</button></a>
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
										<strong class='title'>
											<c:out value="${i.title}"/>
										</strong>
										<span class='date'>											
											<fmt:formatDate value="${i.write_date}" type="both" pattern="yyyy-MM-dd" />
										</span>
									</a>
								</li>
                    		</c:forEach>         	
                    		
                    	</ul>

			   <!-- JSTL로 묶기 -->
			   <c:choose>
				   <c:when test="${type == 'A'}">
				   	   <div style="text-align:right; border:none;">  
					   		<a href="/center/notice-write"><input type="button" id="writeBtn" value="공지사항 작성"></a><br>
				   	   </div>
			   	   </c:when>	
			   </c:choose>
			   	
			  </div>

			   	
			   <div class="pagination p9">
			       <ul id="noticePage">
						${page}
			       </ul>
			    </div>
				
            </div>

            <!--자주묻는 질문 탭----------------------------------------------------------------->      
            <div class="tab-pane fade" id="v-pills-help" role="tabpanel" aria-labelledby="v-pills-help-tab">
	            <div style="visibility: hidden; position: absolute; width: 0px; height: 0px;">
	  		    	<svg xmlns="http://www.w3.org/2000/svg">
	    	    		<symbol viewBox="0 0 24 24" id="expand-more">
	      	    			<path d="M16.59 8.59L12 13.17 7.41 8.59 6 10l6 6 6-6z"/><path d="M0 0h24v24H0z" fill="none"/>
	    	    		</symbol>
	            
			        	<symbol viewBox="0 0 24 24" id="close">
	      	    			<path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"/><path d="M0 0h24v24H0z" fill="none"/>
	    	    		</symbol>
	  		    	</svg>
			    </div>
				<div class="col-12 guide" >
						<a href="/guide"><img src="/img/index/carousel1.jpg"></a>
                </div>
				<details>
	  			  <summary>
	    		     도와는 어떤 곳인가요?
	    			 <svg class="control-icon control-icon-expand" width="24" height="24" role="presentation"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#expand-more" /></svg>
	    			 <svg class="control-icon control-icon-close" width="24" height="24" role="presentation"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#close" /></svg>
	  			  </summary>
	  			  <p>도와는 서로의 재능과 도움을 나눌 수 있는 플랫폼입니다.<br>
	  			  자세한 가이드는 상단의 배너를 클릭해 확인해보세요!
				</details>
				
				<details>
	  			  <summary>
	    		     재능마켓은 무엇인가요?
	    			 <svg class="control-icon control-icon-expand" width="24" height="24" role="presentation"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#expand-more" /></svg>
	    			 <svg class="control-icon control-icon-close" width="24" height="24" role="presentation"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#close" /></svg>
	  			  </summary>
	  			  <p>꼭 대단한 재능이 아니라도 괜찮아요!<br>
	  			  자유롭게 클래스를 개설해 내가 가진 재능을 나누고, 자유롭게 클래스를 구매해 남이 가진 재능을 배울 수 있어요.</p>
				</details>
				
				<details>
	  			  <summary>
	    		     클래스 구매는 어떻게 하나요?
	    			 <svg class="control-icon control-icon-expand" width="24" height="24" role="presentation"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#expand-more" /></svg>
	    			 <svg class="control-icon control-icon-close" width="24" height="24" role="presentation"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#close" /></svg>
	  			  </summary>
	  			  <p>클래스는 각 클래스별 상세 화면에서 '클래스 신청하기' 버튼을 통해 카카오페이, 네이버페이 두 가지 수단으로 구매가 가능해요.</p>
				</details>
	
				<details>
				  <summary>
	    			클래스 일정은 어디서 확인할 수 있나요?
	    			<svg class="control-icon control-icon-expand" width="24" height="24" role="presentation"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#expand-more" /></svg>
	    			<svg class="control-icon control-icon-close" width="24" height="24" role="presentation"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#close" /></svg>
	  			  </summary>
	  			  <p>각 클래스별 상세 화면 혹은 이미 구매한 클래스라면 로그인 후 마이페이지 내 재능마켓 탭에서도 일정 확인이 가능해요.</p>
				</details>
	
				<details>
	  			  <summary>
	    		  	클래스를 구매하고 참석하지 못했어요. 환불 가능한가요? 
	    		  	<svg class="control-icon control-icon-expand" width="24" height="24" role="presentation"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#expand-more" /></svg>
	    		  	<svg class="control-icon control-icon-close" width="24" height="24" role="presentation"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#close" /></svg>
	  			  </summary>
	  			  <p>도와의 환불 정책에 따라 클래스 당일 이후에는 클래스 환불이 불가합니다.<br><br>
	  			  - 클래스 일정 <span class="refundDay">7일 전</span>까지 취소 시 : <b>전액</b> 환불<br>
				  - 클래스 일정 <span class="refundDay">3일 전</span>까지 취소 시 : 결제 요금의 <b>50%</b> 환불<br>
				  - 클래스 일정 <span class="refundDay">전날</span>까지 취소 시 : 결제 요금의 <b>30%</b> 환불<br>
				  - 클래스 일정 <span class="refundDay">당일 이후</span> : 취소/환불 <b>불가</b><br><br>
	  			  클래스 당일 이후라도 클래스에 문제가 생겨 환불이 필요하다면 관리자에게 문의하세요.</p>
				</details>
            
				<details>
	  			  <summary>
	    		  	환불은 언제 되나요?
	    		  	<svg class="control-icon control-icon-expand" width="24" height="24" role="presentation"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#expand-more" /></svg>
	    		  	<svg class="control-icon control-icon-close" width="24" height="24" role="presentation"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#close" /></svg>
	  			  </summary>
	  			  <p>환불 신청일로부터 7일 이내에 환불 처리가 완료됩니다.</p>
				</details>

				<details>
	  			  <summary>
	    		  	커뮤니티는 어떻게 이용하나요?
	    		  	<svg class="control-icon control-icon-expand" width="24" height="24" role="presentation"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#expand-more" /></svg>
	    		  	<svg class="control-icon control-icon-close" width="24" height="24" role="presentation"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#close" /></svg>
	  			  </summary>
	  			  <p>로그인을 하지 않아도 커뮤니티의 게시글을 볼 수는 있지만 작성은 로그인 시에만 가능합니다.<br>
	  			  로그인 후, 커뮤니티의 카테고리에 맞춰 글을 작성하시고 댓글도 달아보세요.</p>
				</details>     
				         
				<details>
	  			  <summary>
	    		  	커뮤니티의 '도와주세요', '도와드려요' 카테고리는 무엇인가요?
	    		  	<svg class="control-icon control-icon-expand" width="24" height="24" role="presentation"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#expand-more" /></svg>
	    		  	<svg class="control-icon control-icon-close" width="24" height="24" role="presentation"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#close" /></svg>
	  			  </summary>
	  			  <p>도와 회원 간의 상부상조를 위한 카테고리입니다.<br>다른 회원들에게 간단한 질문 혹은 도움을 요청하거나 내가 가진 기술 혹은 능력으로 도움을 드릴 수 있습니다.</p>
				</details>  
				
				<details>
	  			  <summary>
	    		  	로그인이 되지 않아요.
	    		  	<svg class="control-icon control-icon-expand" width="24" height="24" role="presentation"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#expand-more" /></svg>
	    		  	<svg class="control-icon control-icon-close" width="24" height="24" role="presentation"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#close" /></svg>
	  			  </summary>
	  			  <p>혹시 비밀번호를 잘못 입력 하지는 않았나요?<br>
	  			  비밀번호 찾기를 통해 새로운 비밀번호를 재설정하시거나 올바른 비밀번호를 입력했는데도 로그인이 되지 않는다면, 도와 정책 상 재능마켓, 커뮤니티 이용 시 신고된 자신의 게시물이 10건 이상일 경우 관리자의 판단 하에 접속이 제한될 수 있습니다.</p>
				</details>                  
            </div>
            
            <!--문의내역 탭----------------------------------------------------------------->
            <div class="tab-pane fade" id="v-pills-question" role="tabpanel" aria-labelledby="v-pills-question-tab">
                    	<ul class="inquiryList" id="inquiry">
               	
                    	</ul>
                    	
			   <!-- JSTL로 묶기 -->
			   <c:choose>
				   <c:when test="${type == 'M'}">
		               <div style="text-align:right;">     	
        		       		<a href="/center/inquiry"><input type="button" id="writeBtn" value="1:1문의"></a>
               		   </div>    	
			   	   </c:when>	
			   </c:choose>      	
              
			   <div class="pagination p9">
			       <ul id="inquiryPage">
			       		<!-- pagination -->
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
<jsp:include page="/WEB-INF/views/common/pNav.jsp" />
<!-- loginModal -->
<jsp:include page="/WEB-INF/views/common/loginModal.jsp" />



<script>

	//////////////////////////////////////////////////////////////////////탭 설정/////////////
	// window.location.href;
	// location.href;
	//  document.URL; 사이트 주소불러오는 방법들
	
	let siteUrl = window.location.href.split("#").pop(); //활성화할 문자
	let tabs = $("#v-pills-tab").children(); //세로탭 메뉴들
	let tabs2= $("#horizonCategoryArea").children();// 가로탭 메뉴들
	let tabs_contents = $("#v-pills-tabContent").children(); // 컨텐츠틀
	
// 	console.log(siteUrl);
	setting(siteUrl);
	
	window.onpopstate = function(event) {   //주소변경감지 이벤트
	  resetTab();
	  siteUrl = window.location.href.split("#").pop(); // 이걸 바꿔주면 되지 않나.
	  console.log(siteUrl);
	  setting(siteUrl);
	  
// 	  console.log("현재 페이지 : " +  siteUrl)
	  
	}

	
	tabs.on("click",function(){   //세로탭 메뉴들 전체에 클릭시 이벤트
	  resetTab(); //선택된 탭 초기화
	  $(this).children().addClass("active"); //클릭한 탭만 활성
	})
	
	tabs2.on("click",function(){   //가로탭 메뉴들 전체에 클릭시 이벤트
	  resetTab(); //선택된 탭 초기화
	  $(this).addClass("active"); //클릭한 탭만 활성
	})
	
	//탭 세팅
	function setting(siteUrl){
	  if(siteUrl.split("-").length<2){   // 사이트에 최초 접속시 #탭id 가 없음, 활성화할 탭 id 넣어주기
	    siteUrl="notice-tab" // 첫번째 탭을 id에 넣어줌 -> 이게 문제 새로고침하면 무조건 notice-tab으로 옴
	  }
	  
	  $("#v-pills-"+siteUrl+"").addClass("active"); //url에 맞는 세로탭 활성화    
	  $("#v-pills-"+siteUrl+"2").addClass("active"); //url에 맞는 가로탭 활성화      
	  tabs_contents.removeClass("active"); //부트스트랩 탭 컨텐츠 버그방지용 초기화
	  $("#v-pills-"+siteUrl.split("-").shift()+"").addClass("show active"); // url에 맞는 컨텐츠 활성화
	  //
	  
	}
	
	function resetTab(){ //선택된 탭 초기화
	  tabs.children().removeClass("active");
	  tabs2.removeClass("active");
	}
 
	
  	
</script>


</body>

</html>