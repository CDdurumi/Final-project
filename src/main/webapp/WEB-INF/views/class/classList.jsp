<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<!--  부트스트랩-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.1.1/css/fontawesome.min.css" integrity="sha384-zIaWifL2YFF1qaDiAo0JFgsmasocJ/rqu7LKYH8CoBEXqGbb9eO+Xi3s6fQhgFWM" crossorigin="anonymous">    <!--  부트스트랩-->
	<!--알람 팝업-->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!--Bootstrap Icon-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <!--Infinite Scroll API-->
    <script src="https://unpkg.com/infinite-scroll@4/dist/infinite-scroll.pkgd.min.js"></script>
    <script src="/path/to/infinite-scroll.pkgd.min.js"></script>
    
    <!-- input.css  -->
    <link rel="stylesheet" href="/css/sideTab.css">
	<link rel="stylesheet" href="/css/class/classList.css">
   
</head>
<body>	
	<div class="container mainContent" style="padding-bottom:5%;">  
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		
        <div id="pageHeader">재능마켓<span id=toWrite><a href="/class/write"><input type=button id=toWriteBtn value="클래스 등록하기"></a></span><br><hr></div>
        <!-- 가로탭 - 반응형 -->
        <ul class="nav nav-pills nav-justified d-flex d-md-none" id="v-pills-tab2">
            <li class="nav-item">
                <a href="/class/list?category=전체&page=1"><button class="nav-link" id="v-pills-전체-tab2" data-bs-toggle="pill" data-bs-target="#v-pills" type="button" role="tab" aria-controls="v-pills" aria-selected="true"><img src="/img/class/전체.png"><br>전체</button></a>
            </li>
            <li class="nav-item">
                <a href="/class/list?category=요리&page=1"><button class="nav-link" id="v-pills-요리-tab2" data-bs-toggle="pill" data-bs-target="#v-pills" type="button" role="tab" aria-controls="v-pills" aria-selected="false"><img src="/img/index/요리.png"><br>요리</button></a>
            </li>
            <li class="nav-item">
                <a href="/class/list?category=음악&page=1"><button class="nav-link" id="v-pills-음악-tab2" data-bs-toggle="pill" data-bs-target="#v-pills" type="button" role="tab" aria-controls="v-pills" aria-selected="false"><img src="/img/index/음악.png"><br>음악</button></a>
            </li>
            <li class="nav-item">
                <a href="/class/list?category=공예&page=1"><button class="nav-link" id="v-pills-공예-tab2" data-bs-toggle="pill" data-bs-target="#v-pills" type="button" role="tab" aria-controls="v-pills" aria-selected="false"><img src="/img/index/공예.png"><br>공예</button></a>
            </li>
            <li class="nav-item">
                <a href="/class/list?category=사진&page=1"><button class="nav-link" id="v-pills-사진-tab2" data-bs-toggle="pill" data-bs-target="#v-pills" type="button" role="tab" aria-controls="v-pills" aria-selected="false"><img src="/img/index/사진.png"><br>사진</button></a>
            </li>
            <li class="nav-item">
                <a href="/class/list?category=언어&page=1"><button class="nav-link" id="v-pills-언어-tab2" data-bs-toggle="pill" data-bs-target="#v-pills" type="button" role="tab" aria-controls="v-pills" aria-selected="false"><img src="/img/index/언어.png"><br>언어</button></a>
            </li>
            <li class="nav-item">
                <a href="/class/list?category=운동&page=1"><button class="nav-link" id="v-pills-운동-tab2" data-bs-toggle="pill" data-bs-target="#v-pills" type="button" role="tab" aria-controls="v-pills" aria-selected="false"><img src="/img/index/운동.png"><br>운동</button></a>
            </li>
            <li class="nav-item">
                <a href="/class/list?category=코딩&page=1"><button class="nav-link" id="v-pills-코딩-tab2" data-bs-toggle="pill" data-bs-target="#v-pills" type="button" role="tab" aria-controls="v-pills" aria-selected="false"><img src="/img/index/프로그래밍.png"><br>코딩</button></a>
            </li>
            <li class="nav-item">
                <a href="/class/list?category=기타&page=1"><button class="nav-link" id="v-pills-기타-tab2" data-bs-toggle="pill" data-bs-target="#v-pills" type="button" role="tab" aria-controls="v-pills" aria-selected="false"><img src="/img/index/기타.png"><br>기타</button></a>
            </li>
        </ul>
        <div class="d-flex align-items-start">
        	<!-- 세로탭 - 반응형 -->
          <div class="nav flex-column nav-pills me-3 d-none d-md-flex" id="v-pills-tab" role="tablist" aria-orientation="vertical">      
            <a href="/class/list?category=전체&page=1"><button class="nav-link" id="v-pills-전체-tab" data-bs-toggle="pill" data-bs-target="#v-pills" type="button" role="tab" aria-controls="v-pills" aria-selected="true"><img src="/img/class/전체.png"> 전체</button></a>
            <a href="/class/list?category=요리&page=1"><button class="nav-link " id="v-pills-요리-tab" data-bs-toggle="pill" data-bs-target="#v-pills" type="button" role="tab" aria-controls="v-pills" aria-selected="false"><img src="/img/index/요리.png"> 요리</button></a>
            <a href="/class/list?category=음악&page=1"><button class="nav-link" id="v-pills-음악-tab" data-bs-toggle="pill" data-bs-target="#v-pills" type="button" role="tab" aria-controls="v-pills" aria-selected="false"><img src="/img/index/음악.png"> 음악</button></a>
            <a href="/class/list?category=공예&page=1"><button class="nav-link" id="v-pills-공예-tab" data-bs-toggle="pill" data-bs-target="#v-pills" type="button" role="tab" aria-controls="v-pills" aria-selected="false"><img src="/img/index/공예.png"> 공예</button></a>
            <a href="/class/list?category=사진&page=1"><button class="nav-link" id="v-pills-사진-tab" data-bs-toggle="pill" data-bs-target="#v-pills" type="button" role="tab" aria-controls="v-pills" aria-selected="true"><img src="/img/index/사진.png"> 사진</button></a>
            <a href="/class/list?category=언어&page=1"><button class="nav-link " id="v-pills-언어-tab" data-bs-toggle="pill" data-bs-target="#v-pills" type="button" role="tab" aria-controls="v-pills" aria-selected="false"><img src="/img/index/언어.png"> 언어</button></a>
            <a href="/class/list?category=운동&page=1"><button class="nav-link" id="v-pills-운동-tab" data-bs-toggle="pill" data-bs-target="#v-pills" type="button" role="tab" aria-controls="v-pills" aria-selected="false"><img src="/img/index/운동.png"> 운동</button></a>
            <a href="/class/list?category=코딩&page=1"><button class="nav-link" id="v-pills-코딩-tab" data-bs-toggle="pill" data-bs-target="#v-pills" type="button" role="tab" aria-controls="v-pills" aria-selected="false"><img src="/img/index/프로그래밍.png"> 코딩</button></a>
            <a href="/class/list?category=기타&page=1"><button class="nav-link" id="v-pills-기타-tab" data-bs-toggle="pill" data-bs-target="#v-pills" type="button" role="tab" aria-controls="v-pills" aria-selected="false"><img src="/img/index/기타.png"> 기타</button></a>
          </div>
          
          <!-- 탭 내용 -->
          <div class="tab-content" id="v-pills-tabContent">
            <div class="tab-pane fade show active" id="v-pills" role="tabpanel">
                <div class="row searchBar">
                    <div class="col-12" style="text-align : center;">
                        <i class="bi bi-search"></i>
                         <input type="text" placeholder="검색어를 입력해주세요" id="search">
                    </div>
                </div>
                <!-- infinite scroll 영역 -->
                <div class="article-feed">
                    <div class="row">
                    	<c:forEach var='i' items="${list }">
	                        <div class="col-12 col-lg-6 col-xl-4">                            
	                            <article class="article">
	                                <div class="row" style="position: relative;">						
										<div class="col-12">
											<a href="/class/detail?class_seq=${i.CLASS_SEQ }">
												<div class="imgBox">
													<c:forEach var="j" items="${mImgList}">
														<c:if test="${j.parent_seq==i.CLASS_SEQ }">
															<img src="/upload/${j.sys_name }">
														</c:if>
													</c:forEach>
												</div>
											</a>
										</div>										
										<div class="col-12 creater">${i.NICKNAME }</div>                                       
	                                    <div class="col-12 classTitle">
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
	                                    <div class="col-12 likeAndStar"><i class="bi bi-heart-fill"></i> <span class=currLike>${i.LIKE_COUNT }</span>   <i class="bi bi-star-fill"></i> <span class=currStar>${i.STAR_COUNT }</span></div>
	                                    <div class="col-8 price">${i.PRICE }</div>
	                                    <div class="col-4"><span class=like><i class="bi bi-heart"></i><input type=hidden value="${i.CLASS_SEQ }"></span></div>
	                                </div>    
	                            </article>                                                        
	                        </div>
                        </c:forEach>
					</div>
				</div>
                  
                  <!-- infinite scroll 로딩 및 메세지 -->
                  <div class="scroller-status">
                    <div class="infinite-scroll-request loader-ellips"></div>
                    <p class="infinite-scroll-last"></p>
                    <p class="infinite-scroll-error"></p>
                  </div>
                  
                  <!-- infinite scroll 다음 페이지 pagination - 숨김처리 -->
                  <p class="pagination">
                    <a class="pagination__next" href="/"></a>
                  </p>
            </div>            
        </div>
        </div>
	</div>
    <script>	  
    	
    	$(function(){
    		//가격 표시
        	let priceArr = $(".price");
        	for(let i=0;i<priceArr.length;i++){
        		let price = $(priceArr[i]).text();
        		price = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
        		$(priceArr[i]).text(price+"원");
        	}
        	
        	// 로그인 시 찜한 클래스 표시
        	if(${loginID!=null}){
        		let myLikeList=${myLikeList};
        		let arrLike=$(".like");
        		
        		for(let i=0;i<arrLike.length;i++){
        			for(let j=0;j<myLikeList.length;j++){        				
        				if(myLikeList[j]==$(arrLike[i]).children("input").val()){
        					$(arrLike[i]).children("i").css("color","#FF781E");
        					$(arrLike[i]).children("i").attr("class","bi bi-heart-fill");
        				}	
        			}        			
        		}
        	}
    	})
    	
    	
    	// pagination 주소 연결
    	let pageUrl = window.location.href.split("?").pop(); // ?이후 주소 추출
    	let pageCategory = decodeURI(pageUrl).substring(9,11); // 16진수로 변환된 주소를 디코딩
    	
    	if(${currPage<lastPage}){
    		let nextPage = Number(${currPage});
    		nextPage+=1;
        	$(".pagination__next").attr("href","/class/list?category="+category+"&page="+nextPage);
    	}else{
    		$(".pagination__next").attr("href","/");
    	}
    	
    	
    	// infinite scroll 설정
	    $('.article-feed').infiniteScroll({
	        path: '.pagination__next',
	        append: '.article',
	        status: '.scroller-status',
	        hideNav: '.pagination',
	    });
	
	
    	//찜하기 버튼 클릭 이벤트
	    $(".like").on("click",function(){
	    	
	    	//로그인되어 있지 않다면 리턴
	    	if('${loginID}'==''){
	    		Swal.fire({
    	            icon: 'warning',
    	            title: '로그인 후 이용 가능합니다.'
    	        })
    	        return false;
	    	}
	    	
	        let target=$(this).children("i").attr("class");
	        let parent_seq=$(this).children("input").val();
	
	        if(target=="bi bi-heart"){
	        	
	        	//db에 저장
	        	$.ajax({
	        		url:"/class/like",
	        		data:{"parent_seq" : parent_seq}
	        	})
	        	
	            $(this).children("i").css("color","#FF781E");
	            $(this).children("i").attr("class","bi bi-heart-fill");
	            let currLike = $(this).parent().siblings(".likeAndStar").children(".currLike").text();
	            currLike=Number(${currLike});
	            console.log(currLike);
	            $(this).parent().siblings(".likeAndStar").children(".currLike").text(currLike+1);
	
	            Swal.fire({                    
	                width:250,
	                html: "<span style='font-size:15px'><i class='bi bi-heart-fill' style='color:#FF781E'></i> 찜하기 완료!</span>",
	                showConfirmButton: false,
	                timer: 1000,
	                background:'#dbdbdb80',
	                backdrop:'transparent'
	            })
	            
	        // 이미 찜 처리가 되어있었다면    
	        }else{
	        	
	        	//db에서 삭제
	        	$.ajax({
	        		url:"/class/likeCancel",
	        		data:{"parent_seq" : parent_seq}
	        	})
	        	
	            $(this).children("i").css("color","#959595");
	            $(this).children("i").attr("class","bi bi-heart");
	            let currLike = $(this).parent().siblings(".likeAndStar").children(".currLike").text();
	            currLike=Number(currLike);
	            $(this).parent().siblings(".likeAndStar").children(".currLike").text(currLike-1);
	        }
	    })	
	
	
	    // 새로고침 시 현재탭 유지	
		
	    let target = window.location.href.split("?").pop(); // ?이후 주소 추출
	    let siteUrl = decodeURI(target).substring(9,11); // 16진수로 변환된 주소를 디코딩
	    
	    let tabs = $("#v-pills-tab").children(); //세로탭 메뉴들
	    let tabs2 = $("#v-pills-tab2").children(); //가로탭 메뉴들
	    // let tabs_contents = $("#v-pills-tabContent").children(); // 컨텐츠틀
	    
	    setting(siteUrl); //사이트 접속 초기세팅
	    
	    window.onpopstate = function(event) {   //주소변경감지 이벤트
	      resetTab();
	      target = window.location.href.split("?").pop()
	      siteUrl = decodeURI(target).substring(9,11);
	      setting(siteUrl);
	      
	   	// pagination 주소 연결
	    	pageUrl = window.location.href.split("?").pop(); // ?이후 주소 추출
	    	pageCategory = decodeURI(pageUrl).substring(9,11); // 16진수로 변환된 주소를 디코딩
	    	
	    	if(${currPage<lastPage}){
	    		let nextPage = ${currPage} + 1;
	        	$(".pagination__next").attr("href","/class/list?category="+category+"&page="+nextPage);
	    	}else{
	    		$(".pagination__next").attr("href","/");
	    	}
	    }
	    
	    tabs.on("click",function(){   //세로탭 메뉴들 전체에 클릭시 이벤트
	      resetTab(); //선택된 탭 초기화
	      $(this).children().addClass("active"); //클릭한 탭만 활성
	      window.scrollTo({top:0, left:0, behavior:'auto'});
	    })
	    
	    tabs2.on("click",function(){   //가로탭 메뉴들 전체에 클릭시 이벤트
	      resetTab(); //선택된 탭 초기화
	      $(this).children().addClass("active"); //클릭한 탭만 활성
	      window.scrollTo({top:0, left:0, behavior:'auto'});
	    })
	
	    //탭 세팅
	    function setting(siteUrl){
	      
	      $("#v-pills-"+siteUrl+"-tab").addClass("active"); //url에 맞는 세로탭 활성화
	      $("#v-pills-"+siteUrl+"-tab2").addClass("active"); //url에 맞는 가로탭 활성화
	      //tabs_contents.removeClass("active"); //부트스트랩 탭 컨텐츠 버그방지용 초기화
	      //$("#v-pills").addClass("show active"); // url에 맞는 컨텐츠 활성화
	    }
	   
	    function resetTab(){ //선택된 탭 초기화
	      tabs.children().removeClass("active");
	      tabs2.children().children().removeClass("active");
	    }
	    
	    
    </script>
	<jsp:include page="/WEB-INF/views/common/pNav.jsp"/>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<jsp:include page="/WEB-INF/views/common/loginModal.jsp" />
</body>
</html>