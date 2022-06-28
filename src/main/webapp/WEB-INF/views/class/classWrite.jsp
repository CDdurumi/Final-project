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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.1.1/css/fontawesome.min.css" integrity="sha384-zIaWifL2YFF1qaDiAo0JFgsmasocJ/rqu7LKYH8CoBEXqGbb9eO+Xi3s6fQhgFWM" crossorigin="anonymous">    <!--  부트스트랩-->
    <!-- input.css  -->
   <link rel="stylesheet" href="/css/sideTab.css">
    <link rel="stylesheet" href="/css/class/classWrite.css">
   
</head>
<body>
	
	<div class="container" style="margin-top:200px;">  
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
        <div id="classHeader">클래스<hr></div>
        <div class="d-flex align-items-start">
          <div class="nav flex-column nav-pills me-3 sticky-top" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            
            <a href="#info-tab"><button class="nav-link active" id="v-pills-info-tab" data-bs-toggle="pill" data-bs-target="#v-pills-info" type="button" role="tab" aria-controls="v-pills-info" aria-selected="true">기본 정보</button></a>
            <a href="#classInfo-tab"><button class="nav-link " id="v-pills-classInfo-tab" data-bs-toggle="pill" data-bs-target="#v-pills-classInfo" type="button" role="tab" aria-controls="v-pills-classInfo" aria-selected="false">클래스 소개</button></a>
            <a href="#classEtc-tab"><button class="nav-link" id="v-pills-classEtc-tab" data-bs-toggle="pill" data-bs-target="#v-pills-classEtc" type="button" role="tab" aria-controls="v-pills-classEtc" aria-selected="false">클래스 일정</button></a>
            <a href="#check-tab"><button class="nav-link" id="v-pills-check-tab" data-bs-toggle="pill" data-bs-target="#v-pills-check" type="button" role="tab" aria-controls="v-pills-check" aria-selected="false">오픈 전 확인사항</button></a>
          </div>
          <div class="tab-content" id="v-pills-tabContent">
            <div class="tab-pane fade show active" id="v-pills-info" role="tabpanel" aria-labelledby="v-pills-info-tab">
                <div class="row">
                    <div class="col-12"><p id="formTitle">클래스 등록하기</p></div>
                    <div class="col-12">
                        <p class="inputTitle">카테고리</p>
                        <p class="inputSubTitle">1차 카테고리를 선택해주세요.</p>
                        <select name="category1">
                            <option value="cook">요리</option>
                            <option value="music">음악</option>
                            <option value="art">공예</option>
                            <option value="picture">사진</option>
                            <option value="language">언어</option>
                            <option value="fitness">운동</option>
                            <option value="prigramming">프로그래밍</option>
                            <option value="etc">기타</option>
                        </select>
                        <br><br>
                    </div>
                    <div class="col-12">
                        <p class="inputTitle">세부 카테고리</p>
                        <p class="inputSubTitle">구체적인 카테고리를 적어주세요.</p>
                        <input type="text" name="category2" placeholder="ex) 케이크 만들기, 우쿨렐레 강습, 가죽 공예 등">
                        <br><br>
                    </div>
                    <div class="col-12">
                        <p class="inputTitle">클래스 제목</p>
                        <p class="inputSubTitle">컨셉이 잘 드러나는 클래스의 제목을 적어주세요.</p>
                        <input type="text" name="title">
                        <br><br>
                    </div>
                    <div class="col-12">
                        <p class="inputTitle">가격</p>
                        <p class="inputSubTitle">클래스의 금액을 적어주세요.</p>
                        <input type='number' name="price" min='10' max='10000000'> 원
                        <br><br>
                    </div>
                    <div class="col-12">
                        <p class="inputTitle">클래스 메인 이미지</p>
                        <p class="inputSubTitle">클래스 메인 이미지는 상세 페이지 상단에 보여지는 이미지에요.(최대 4장 설정 가능)</p>
                        <div class="row">
                            <div class="col-12">
                                <span class="imgBox"><img src="addImg1.png"></span>
                                <span class="imgBox"><img src="addImg1.png"></span>
                            </div>
                            <div class="col-12">
                                <span class="imgBox"><img src="addImg1.png"></span>
                                <span class="imgBox"><img src="addImg1.png"></span>
                            </div>
                        </div>
                        <br><br>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="v-pills-classInfo" role="tabpanel" aria-labelledby="v-pills-classInfo-tab">탭2</div>
            <div class="tab-pane fade" id="v-pills-classEtc" role="tabpanel" aria-labelledby="v-pills-classEtc-tab">탭3</div>
            <div class="tab-pane fade" id="v-pills-check" role="tabpanel" aria-labelledby="v-pills-check-tab">탭4</div>
          </div>
        </div>
      </div>
      <jsp:include page="/WEB-INF/views/common/pNav.jsp"/>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"/> 
    	
    
      <script>
        // window.location.href;
        // location.href;
        //  document.URL; 사이트 주소불러오는 방법들
    
        
        
        let siteUrl = window.location.href.split("#"); // #을 기준으로 사이트 주소를 나눠서 siteUrl  배열타입 변수에 저장   siteUrl[1]에 활성화 해야할 문자가 들어있음
        let tab1 = $("#v-pills-info-tab");
        let tab2 = $("#v-pills-classInfo-tab");
        let tab3 = $("#v-pills-classEtc-tab");
        let tab4 = $("#v-pills-check-tab");
    
        let tab1_contents = $("#v-pills-info");
        let tab2_contents = $("#v-pills-classInfo");
        let tab3_contents = $("#v-pills-classEtc");
        let tab4_contents = $("#v-pills-check");
    
        if (siteUrl[1] == 'info-tab') {
          tab1.addClass('active');
          tab2.removeClass('active');
          tab3.removeClass('active');
          tab4.removeClass('active');
    
          tab1_contents.addClass('show active');
          tab2_contents.removeClass('show active');
          tab3_contents.removeClass('show active');
          tab4_contents.removeClass('show active');
        }
        else if (siteUrl[1] == 'classInfo-tab') {
          tab1.removeClass('active');
          tab2.addClass('active');
          tab3.removeClass('active');
          tab4.removeClass('active');
    
          tab1_contents.removeClass('show active');
          tab2_contents.addClass('show active');
          tab3_contents.removeClass('show active');
          tab4_contents.removeClass('show active');
        }
        else if (siteUrl[1] == 'classEtc-tab') {
          tab1.removeClass('active');
          tab2.removeClass('active');
          tab3.addClass('active');
          tab4.removeClass('active');
        
          tab1_contents.removeClass('show active');
          tab2_contents.removeClass('show active');
          tab3_contents.addClass('show active');
          tab4_contents.removeClass('show active');
        }
        else if (siteUrl[1] == 'check-tab') {
          tab1.removeClass('active');
          tab2.removeClass('active');
          tab3.removeClass('active');
          tab4.addClass('active');
        
          tab1_contents.removeClass('show active');
          tab2_contents.removeClass('show active');
          tab3_contents.removeClass('show active');
          tab4_contents.addClass('show active');
        }
    
        // 부트스트랩 탭메뉴 버그 방지  
        tab1.on('click',function(){
          tab2.removeClass('active');
          tab3.removeClass('active');
          tab4.removeClass('active');
        })
        tab2.on('click',function(){
          tab1.removeClass('active');
          tab3.removeClass('active');
          tab4.removeClass('active');
        })
        tab3.on('click',function(){
          tab1.removeClass('active');
          tab2.removeClass('active');
          tab4.removeClass('active');
        })
        tab4.on('click',function(){
          tab1.removeClass('active');
          tab2.removeClass('active');
          tab3.removeClass('active');
        })
    
      </script>
</body>
</html>