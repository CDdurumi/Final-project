<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <!-- input.css  -->
	<link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="/css/button.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container-fluid mainContent">
		<div id="carouselExampleControls" class="carousel carousel-dark slide" data-bs-ride="carousel">
  			<div class="carousel-inner">
    			<div class="carousel-item active">
      				<img src="/resources/img/index/carousel1.jpg" class="d-block w-100" alt="...">
    			</div>
    			<div class="carousel-item">
      			<img src="/resources/img/index/carousel2.png" class="d-block w-100" alt="...">
    			</div>
    			<div class="carousel-item">
      			<img src="/resources/img/index/carousel3.png" class="d-block w-100" alt="...">
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
	
	<div class="container mainContent" >
	  	<div class="footer-content">
                		<!-- 카테고리 선택 메뉴 -->
                    	<div class="pt-5 pb-5">
                    		<div class="row">
                    			<div class="col-xl-6 col-lg-6 col-md-12">
	                    			<div class= "row catergory_text">
										<div class="col-3 zoom">
											<img src="/resources/img/index/공예.png" class="class_type">
                    						<p>공예</p>
										</div>
										<div class="col-3 zoom">
											<img src="/resources/img/index/사진.png" class="class_type">
                    						<p>사진</p>
										</div>
										<div class="col-3 zoom">
											<img src="/resources/img/index/언어.png" class="class_type">
                    						<p>언어</p>
										</div>
										<div class="col-3 zoom">
											<img src="/resources/img/index/요리.png" class="class_type">
                    						<p>요리</p>
										</div>
									</div>	
								</div>
                    			<div class="col-xl-6 col-lg-6 col-md-12">
	                    			<div class= "row catergory_text">
										<div class="col-3 zoom" >
											<img src="/resources/img/index/운동.png" class="class_type">
                    						<p>운동</p>
										</div>
										<div class="col-3 zoom">
											<img src="/resources/img/index/음악.png" class="class_type">
                    						<p>음악</p>
										</div>
										<div class="col-3 zoom">
											<img src="/resources/img/index/프로그래밍.png" class="class_type">
                    						<p>프로그래밍</p>
										</div>
										<div class="col-3 zoom">
											<img src="/resources/img/index/기타.png" class="class_type" id="etc_icon">
                    						<p>기타</p>
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
                    		<div class="col-12">
                    			<h2>추천 클래스</h2>
                    		</div>
                    	</div>
                    	<div class="row">
                    		<div class="col-12" style="text-align:right">
                    			<button class="button button--telesto"><span><span>전체보기</span></span></button>
                    		</div>
                    	</div>
        	<hr size="10px" style="background-color:#ffd8be">
      	</div>
      	<!-- 추천 클래스 -->
      	<!-- 최신글  -->
      	<div class="container recommend_container">
      		
                    	<div class="row">
                    		<div class="col-12">
                    			<h2>최신글 보기</h2>
                    		</div>
                    	</div>
                    	<div class="row">
                    		<div class="col-12" style="text-align:right">
                    			<button class="button button--telesto"><span><span>전체보기</span></span></button>
                    		</div>
                    	</div>
      	</div>
  	
  	
 	 </div>
 	 <hr size="5px" style="background-color:#ffd8be">
  	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
  <jsp:include page="/WEB-INF/views/common/pNav.jsp" />
  <!-- loginModal -->
  <jsp:include page="/WEB-INF/views/common/loginModal.jsp" />
</body>
</html>