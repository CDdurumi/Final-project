<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" type="image/png" sizes="32x32" href="/img/favicon/favicon-32x32.png">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <!--Bootstrap Icon-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">    
    <!-- input.css  -->
	<link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="/css/button.css">
<meta charset="UTF-8">
<title>서로 DOWA</title>
</head>
<body>
	
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container-fluid mainContent">
		<div id="carouselExampleControls" class="carousel carousel-dark slide" data-bs-ride="carousel">
  			<div class="carousel-inner h-100">
    			<div class="carousel-item active h-100">
    				<a href="/guide">
      					<img src="/resources/img/index/carousel1.jpg" class="d-block w-100" alt="...">
      				</a>	
    			</div>    			
   				<div class="carousel-item h-100">
   					<a href="/community/main">
      					<img src="/resources/img/index/carousel21.png" class="d-block w-100" alt="...">
    				</a>    			
    			</div>				
    			<div class="carousel-item h-100">
    				<a href="/class/main">
      					<img src="/resources/img/index/carousel31.png" class="d-block w-100" alt="...">
    				</a>
    			</div>	
  				
  			</div>
	  		<button class="carousel-control-prev " type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
	    		<span class="carousel-control-prev-icon cbutton" aria-hidden="true"></span>
	    		<span class="visually-hidden">Previous</span>
	  		</button>
	  		<button class="carousel-control-next " type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
	    		<span class="carousel-control-next-icon cbutton" aria-hidden="true"></span>
	    		<span class="visually-hidden">Next</span>
	  		</button>
		</div>		
	</div>
	
	<div class="container" >
	  	<div class="footer-content">
                		<!-- 카테고리 선택 메뉴 -->
                    	<div class="pt-5 pb-5">
                    		<div class="row">
                    			<div class="col-12 col-lg-6">
	                    			<div class= "row catergory_text">
										<div class="col-3">
											<a href="/class/list?category=요리&page=1">
												<img src="/resources/img/index/요리.png" class="class_type">
                    							<p>요리</p>
											</a>											
										</div>
										<div class="col-3">
											<a href="/class/list?category=음악&page=1">
												<img src="/resources/img/index/음악.png" class="class_type">
                    							<p>음악</p>
											</a>											
										</div>
										<div class="col-3">
											<a href="/class/list?category=공예&page=1">
												<img src="/resources/img/index/공예.png" class="class_type">
                    							<p>공예</p>
											</a>											
										</div>
										<div class="col-3">
											<a href="/class/list?category=사진&page=1">
												<img src="/resources/img/index/사진.png" class="class_type">
                    							<p>사진</p>
											</a>											
										</div>
									</div>	
								</div>
                    			<div class="col-12 col-lg-6">
	                    			<div class= "row catergory_text">
	                    				<div class="col-3">
	                    					<a href="/class/list?category=언어&page=1">
	                    						<img src="/resources/img/index/언어.png" class="class_type">
                    							<p>언어</p>
	                    					</a>											
										</div>
										<div class="col-3" >
											<a href="/class/list?category=운동&page=1">
												<img src="/resources/img/index/운동.png" class="class_type">
                    							<p>운동</p>
											</a>											
										</div>										
										<div class="col-3">
											<a href="/class/list?category=코딩&page=1">
												<img src="/resources/img/index/프로그래밍.png" class="class_type">
                    							<p>코딩</p>
											</a>											
										</div>
										<div class="col-3">
											<a href="/class/list?category=기타&page=1">
												<img src="/resources/img/index/기타.png" class="class_type" id="etc_icon">
                    							<p>기타</p>
											</a>											
										</div>
									</div>	
								</div>
                       		</div>
                    	</div>
                    	<!-- 카테고리 선택 메뉴 -->
      	</div> 
      	<!-- 추천 클래스 -->
      	<div class="container recommend_container">
      		
           	<div class="row">
           		<div class="col-6 recommendTitle">추천 클래스</div>
           		<div class="col-6" style="text-align:right">
           			<a href="/class/main"><button class="button button--telesto"><span><span>전체보기</span></span></button></a>
           		</div>
           		<div class="col-12" style="text-align:center;">
           			<c:forEach var='i' items="${clist }">
                        <div class="row article" style="position: relative;">						
							<div class="col-12">
								<a href="/class/detail?class_seq=${i.CLASS_SEQ }">
									<div class="imgBox">
										<img src="/upload/${i.SYS_NAME}">
									</div>
								</a>
							</div>										
							<div class="col-12 creater" style="text-align:left;">${i.NICKNAME }</div>                                       
                            <div class="col-12 classTitle" style="text-align:left;">
                                <a href="/class/detail?class_seq=${i.CLASS_SEQ }">
                                    <span class=category>
                                    	[${i.CATEGORY1 }
                                    	<c:if test="${i.CATEGORY2!=null }">
                                    		<i class="bi bi-dot"></i>${i.CATEGORY2 }
                                    	</c:if>]
                                    </span> 
                                    ${i.TITLE }
                                </a>                                            
                            </div>
                            <div class="col-12 likeAndStar" style="text-align:left;"><i class="bi bi-heart-fill"></i> <span class=currLike>${i.LIKE_COUNT }</span>   <i class="bi bi-star-fill"></i> <span class=currStar>${i.STAR_COUNT }</span>   <i class="bi bi-calendar3"></i> <span>${i.CLASS_DATE }</span></div>                                    
                            <div class="col-12 price" style="text-align:left;">${i.PRICE }</div>
                        </div>  
                     </c:forEach>
           		</div>
            </div>
            <br>
        	<hr size="10px" style="background-color:#c5c5c5">
        	<br>
      	</div>
      	<!-- 추천 클래스 -->
      	<!-- 최신글  -->
      	<div class="container recommend_container">
      		
           	<div class="row">
           		<div class="col-6 recommendTitle">최신글 보기</div>
           		<div class="col-6" style="text-align:right">
           			<button class="button button--telesto" id="to_community"><span><span>전체보기</span></span></button>
           		</div>
           		
           		
           		<div class="col-12 i_communityEntireArea">
           			<div class= "row i_communityArea">
		           		<c:forEach var="i" items="${coList}">
		           			
		           			<div class="col-12 col-lg-6 i_boardArea">
								<!-- 카테고리 정보 출력하기 -->
								<c:set var="seqString" value="${i.BOARD_SEQ}" /><!-- 게시글 시퀀스 가지고 -->
								<c:set var="category" value="${fn:substring(seqString,0,1)}" /><!-- 앞 한글자 따기 -->
								<c:choose>
									<c:when test="${category eq 'q'}"><div class="i_category"><span class="i_gubun">궁금해요</span></div></c:when>
									<c:when test="${category eq 'h'}"><div class="i_category"><span class="i_gubun">도와주세요</span></div></c:when>
									<c:when test="${category eq 's'}"><div class="i_category"><span class="i_gubun">도와드려요</span></div></c:when>
									<c:when test="${category eq 'd'}"><div class="i_category"><span class="i_gubun">일상</span></div></c:when>		
								</c:choose>


								<div class="i_boardCenterArea">
								
									<c:choose>
										<c:when test="${!empty i.SYS_NAME}"><!-- 대표 이미지가 존재하면, -->
										
											<div class="i_boardCenter_leftArea">
												<div class="i_titleArea">
													${i.TITLE}
									        		<c:if test="${i.PROGRESS == 'N'}">
									        			<span class="i_progress">마감</span>
									        		</c:if>
												</div>
			        		
												<div class="i_contentArea">${i.CONTENTS}</div>
												<!-- 해시태그 영역 -->
												<c:choose>
													<c:when test="${!empty i.HASH_TAG}"><!-- 해시태그가 존재한다면, -->
														<div class="i_hashArea">
															<c:set var="tagString" value="${i.HASH_TAG}" /><!-- 해시태그 나열 가지고 -->
															<c:set var="tags" value="${fn:split(tagString,'#')}" /><!-- 배열로 나누기 -->
															<c:forEach var="tag" items="${tags}" varStatus="status">
																<span class="i_hashSpan">#${tag}</span>
															</c:forEach>
														</div>		
													</c:when>
													
													<c:otherwise>
														<div class="i_hashArea"><span class="i_hashSpan">#</span></div>
													</c:otherwise>
												</c:choose>
												
											</div>
											
											<div class="i_boardCenter_rightArea">
												<div class="i_profile"><img class="i_imgs" src="/community/${i.SYS_NAME}"></div>
											</div>
										
										</c:when>
										
										<c:otherwise>
											
											<div class="i_boardCenter_leftArea" style="width:100%;">
												<div class="i_titleArea">
													${i.TITLE}
									        		<c:if test="${i.PROGRESS == 'N'}">
									        			<span class="i_progress">마감</span>
									        		</c:if>
												</div>
												<div class="i_contentArea">${i.CONTENTS}</div>
												<!-- 해시태그 영역 -->
												<c:choose>
													<c:when test="${!empty i.HASH_TAG}"><!-- 해시태그가 존재한다면, -->
														<div class="i_hashArea">
															<c:set var="tagString" value="${i.HASH_TAG}" /><!-- 해시태그 나열 가지고 -->
															<c:set var="tags" value="${fn:split(tagString,'#')}" /><!-- 배열로 나누기 -->
															<c:forEach var="tag" items="${tags}" varStatus="status">
																<span class="i_hashSpan">#${tag}</span>
															</c:forEach>
														</div>		
													</c:when>
													
													<c:otherwise>
														<div class="i_hashArea"><span class="i_hashSpan">#</span></div>
													</c:otherwise>
												</c:choose>
												
											</div>
										
										</c:otherwise>
									</c:choose>
								
								
								</div>

								<div class="i_boardFooterArea">
									<span class="i_goodCountSpan"><i class="bi bi-hand-thumbs-up-fill goodIcon"> ${i.LIKE_COUNT}</i></span>
									<span class="i_replyCountSpan"><i class="bi bi-chat-dots-fill replyIcon"></i> ${i.RE_COUNT}</span>
									<span class="i_regDate">${i.WRITE_DATE}</span>
								</div>
								
								<input type="hidden" class="board_seq" value="${i.BOARD_SEQ}">
								
								<div class='col-12 boardBoundaryLine'><hr></div>
		           			</div>
		
		           		</c:forEach>
           			</div>
           		</div>

           		
           		
           	</div>                    	
      	</div>
 	 </div>
  <script>
//==========< 추천 클래스 화면 구성 관련 (별, 금액 표시) >================================    
	
  $(function(){
		setPrice();
		setStars();
	})
	
	
//가격 천원단위 , 표시
	function setPrice(){

		let priceArr = $(".price");
		for(let i=0;i<priceArr.length;i++){
			let price = $(priceArr[i]).text();
			if(price.slice(-1)=='원'){
				continue;
			}
			price = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			$(priceArr[i]).text(price+"원");
		}  
	}
	
	
// 소수점 첫번째까지 반올림하여 별점 숫자 표시
	function setStars(){
		
		let currStarArr = $(".currStar");
		for(let i=0;i<currStarArr.length;i++){
			let newStar = Math.round($(currStarArr[i]).text() * 10) / 10;
			$(currStarArr[i]).text(newStar);
		}
	}
  
  
  
  
	//게시글 클릭 시 디테일 페이지로 가기 위한 이벤트//////////////////////////////////////////////////////
	$(".i_boardArea").on("click" ,function(){
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
  
	
  	//커뮤니티 전체보기 버튼
	$("#to_community").on("click",function(){
		//커뮤니티 메인 페이지 이동
		location.href = "/community/main";
	})	
	
	

  </script>	 
  
  
  
  
  <jsp:include page="/WEB-INF/views/common/footer.jsp" />
  <jsp:include page="/WEB-INF/views/common/pNav.jsp" />
  <!-- loginModal -->
  <jsp:include page="/WEB-INF/views/common/loginModal.jsp" />
  
  
  
</body>
</html>