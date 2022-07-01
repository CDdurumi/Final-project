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
	<!--다음맵 API 키-->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1cda901cc32993198836861cdc427005&libraries=services"></script>
	<!--Datepicker - bootstrap-->    
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">
	<!-- input.css  -->
	<link rel="stylesheet" href="/css/sideTab.css">
	<link rel="stylesheet" href="/css/class/classWrite.css">
   
</head>
<body>	
	<div class="container mainContent">  
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
        <div id="pageHeader">클래스<hr></div>
        <ul class="nav nav-pills nav-justified d-flex d-md-none" id="v-pills-tab2">
            <li class="nav-item">
                <a href="#info-tab"><button class="nav-link" id="v-pills-info-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-info" type="button" role="tab" aria-controls="v-pills-info" aria-selected="true">기본 정보</button></a>
            </li>
            <li class="nav-item">
                <a href="#classInfo-tab"><button class="nav-link" id="v-pills-classInfo-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-classInfo" type="button" role="tab" aria-controls="v-pills-classInfo" aria-selected="false">클래스 소개</button></a>
            </li>
            <li class="nav-item">
                <a href="#classEtc-tab"><button class="nav-link" id="v-pills-classEtc-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-classEtc" type="button" role="tab" aria-controls="v-pills-classEtc" aria-selected="false">클래스 일정</button></a>
            </li>
            <li class="nav-item">
                <a href="#check-tab"><button class="nav-link" id="v-pills-check-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-check" type="button" role="tab" aria-controls="v-pills-check" aria-selected="false">오픈 전 확인</button></a>
            </li>
        </ul>
        <div class="d-flex align-items-start">
			<div class="nav flex-column nav-pills me-3 d-none d-md-flex" id="v-pills-tab" role="tablist" aria-orientation="vertical">                  
				<a href="#info-tab"><button class="nav-link" id="v-pills-info-tab" data-bs-toggle="pill" data-bs-target="#v-pills-info" type="button" role="tab" aria-controls="v-pills-info" aria-selected="true">기본 정보</button></a>
				<a href="#classInfo-tab"><button class="nav-link " id="v-pills-classInfo-tab" data-bs-toggle="pill" data-bs-target="#v-pills-classInfo" type="button" role="tab" aria-controls="v-pills-classInfo" aria-selected="false">클래스 소개</button></a>
				<a href="#classEtc-tab"><button class="nav-link" id="v-pills-classEtc-tab" data-bs-toggle="pill" data-bs-target="#v-pills-classEtc" type="button" role="tab" aria-controls="v-pills-classEtc" aria-selected="false">클래스 일정</button></a>
				<a href="#check-tab"><button class="nav-link" id="v-pills-check-tab" data-bs-toggle="pill" data-bs-target="#v-pills-check" type="button" role="tab" aria-controls="v-pills-check" aria-selected="false">오픈 전 확인사항</button></a>
			</div>
			<div class="tab-content" id="v-pills-tabContent">
				<div class="tab-pane fade show active" id="v-pills-info" role="tabpanel" aria-labelledby="v-pills-info-tab">
					<div class="row">
						<div class="col-8">
							<p class="formTitle">클래스 등록하기</p>
						</div>
						<div class="col-4 cancel">
							<input type=button class=cancelBtn value="나가기">
						</div>
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
							</select> <br>
							<br>
						</div>
						<div class="col-12">
							<p class="inputTitle">세부 카테고리</p>
							<p class="inputSubTitle">구체적인 카테고리를 적어주세요.</p>
							<input type="text" name="category2"
								placeholder="ex) 케이크 만들기, 우쿨렐레 강습, 가죽 공예 등"> <br>
							<br>
						</div>
						<div class="col-12">
							<p class="inputTitle">클래스 제목</p>
							<p class="inputSubTitle">컨셉이 잘 드러나는 클래스의 제목을 적어주세요.</p>
							<input type="text" name="title"> <br>
							<br>
						</div>
						<div class="col-12">
							<p class="inputTitle">가격</p>
							<p class="inputSubTitle">클래스의 금액을 적어주세요.</p>
							<input type='text'
								oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
								name="price" id="price"> 원 <br>
							<br>
						</div>
						<div class="col-12">
							<p class="inputTitle">클래스 메인 이미지</p>
							<p class="inputSubTitle">클래스 메인 이미지는 상세 페이지 상단에 보여지는 이미지에요.
								(최대 4장 설정 가능)<br>첫 이미지는 클래스 메인 이미지로 사용됩니다.</p>
							<div class="row">
								<div class="col-12">
									<span class="imgBox"><img src="/img/class/addMainImg.png"></span> <span
										class="imgBox"><img src="/img/class/addImg.png"></span>
								</div>
								<div class="col-12">
									<span class="imgBox"><img src="/img/class/addImg.png"></span> <span
										class="imgBox"><img src="/img/class/addImg.png"></span>
								</div>
							</div>
							<br>
						</div>
						<div class="col-12">
							<p class="inputTitle">크리에이터 한 줄 소개</p>
							<p class="inputSubTitle">크리에이터님이 어떤 분인지 짧게 소개해주세요.</p>
							<input type="text" name="title"> <br>
							<br>
							<br>
						</div>
						<div class="col-6"></div>
						<div class="col-6" style="text-align: right;">
							<input type="button" value="다음" class="next" id="next1">
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="v-pills-classInfo" role="tabpanel"
					aria-labelledby="v-pills-classInfo-tab">
					<div class="row">
						<div class="col-8">
							<p class="formTitle">클래스 등록하기</p>
						</div>
						<div class="col-4 cancel">
							<input type=button class=cancelBtn value="나가기">
						</div>
						<div class="col-12">
							<p class="inputTitle">클래스 소개</p>
							<p class="inputSubTitle">클래스 주제에 대한 이미지와 설명을 적어주세요.(2~4개 설정 가능)</p>
							<div class="row">
								<div class="col-12">
									<span class="imgBox2"><img src="/img/class/addImgLong1.png"></span><br>
									<textarea placeholder="사진에 대한 설명을 적어주세요." class="ima_desc"></textarea>
									<br>
									<br>
								</div>

								<div class="col-12">
									<span class="imgBox2"><img src="/img/class/addImgLong2.png"></span><br>
									<textarea placeholder="사진에 대한 설명을 적어주세요." class="ima_desc"></textarea>
									<br>
									<br> <input type="button" value="추가하기" id="infoReveal1">
								</div>

								<div class="col-12" id="cInfoHidden1" style="display: none">
									<span class="imgBox2"><img src="/img/class/addImgLong3.png"></span><br>
									<textarea placeholder="사진에 대한 설명을 적어주세요." class="ima_desc"></textarea>
									<br>
									<br> <input type="button" value="추가하기" id="infoReveal2">
								</div>
								<div class="col-12" id="cInfoHidden2" style="display: none">
									<span class="imgBox2"><img src="/img/class/addImgLong4.png"></span><br>
									<textarea placeholder="사진에 대한 설명을 적어주세요." class="ima_desc"></textarea>
								</div>
							</div>
							<br>
							<br>
						</div>
						<div class="col-6">
							<input type="button" value="이전" class="before" id="before2">

						</div>
						<div class="col-6" style="text-align: right;">
							<input type="button" value="다음" class="next" id="next2">
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="v-pills-classEtc" role="tabpanel"
					aria-labelledby="v-pills-classEtc-tab">
					<div class="row">
						<div class="col-8">
							<p class="formTitle">클래스 등록하기</p>
						</div>
						<div class="col-4 cancel">
							<input type=button class=cancelBtn value="나가기">
						</div>
						<div class="col-12">
							<p class="inputTitle">클래스 일정</p>
							<p class="inputSubTitle">클래스를 진행할 날짜를 선택해주세요.</p>
							<input type="text" id="datePicker" placeholder="클릭하여 날짜 선택">
							<br>
							<br>
						</div>
						<div class="col-12" id="classLoc">
							<p class="inputTitle">클래스 장소</p>
							<p class="inputSubTitle">클래스를 진행할 주소를 입력해주세요.</p>
							<input type="text" id="zipcode" readonly> <input
								type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
							<input type="text" id="address1" placeholder="주소" readonly><br>
							<input type="text" id="address2" placeholder="상세주소를 입력해주세요">
							<div id="map"
								style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>
							<br><br><br><br>
						</div>
						<div class="col-6">
							<input type="button" value="이전" class="before" id="before3">
						</div>
						<div class="col-6" style="text-align: right;">
							<input type="button" value="다음" class="next" id="next3">
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="v-pills-check" role="tabpanel"
					aria-labelledby="v-pills-check-tab">
					<div class="row">
						<div class="col-8">
							<p class="formTitle">클래스 등록하기</p>
						</div>
						<div class="col-4 cancel">
							<input type=button class=cancelBtn value="나가기">
						</div>
						<div class="col-12">
							<p class="inputTitle">오픈 전 확인사항</p>
							<p class="inputSubTitle">완벽한 페이지를 위해 오픈 전 마지막으로 점검을 해보아요!</p>
							<div class="checkList">
								<p class="checkTitle">구체적으로 어떤 걸 배울 수 있는지 알려주셨나요?</p>
								<p class="inputSubTitle">내 클래스를 통해 배우게 될 나만의 기법, 노하우, 스킬을 소개해주세요.</p>
								<input type="checkbox"> <span class=checkAnswer>
									네, 확인했어요.</span>
							</div>
							<div class="checkList">
								<p class="checkTitle">클래스를 통해 어떤 결과를 얻을 수 있는지 알려주셨나요?</p>
								<p class="inputSubTitle">내 클래스를 듣고 클래스메이트님들이 얻을 수 있는 결과를 알려주세요.</p>
								<input type="checkbox"> <span class=checkAnswer>
									네, 확인했어요.</span>
							</div>
							<div class="checkList">
								<p class="checkTitle">맞춤법이 틀린 부분은 없었나요?</p>
								<p class="inputSubTitle">오로지 텍스트와 이미지로 나의 클래스를 보여주는 곳이기 때문에
									맞춤법은 나의 인상을 결정짓는 중요한 부분입니다. 맞춤법 검사를 필수적으로 진행해주세요.</p>
								<span id="toSpeller">맞춤법 검사기로 확인해보기</span><br>
								<input type="checkbox"> <span class=checkAnswer>
									네, 확인했어요.</span>
							</div>
							<div class="checkList">
								<p class="checkTitle">부적절한 콘텐츠는 검토 후 유보될 수 있습니다.</p>
								<p class="inputSubTitle">광고성 및 불법(저작권 침해 등), 유해 콘텐츠가 포함되거나
									도와 정책에 맞지 않는 클래스인 경우 즉시 유보처리가 됨을 안내드립니다. 오픈 전 이 내용을 꼭 확인하고
									인지하셨다면 체크 박스를 눌러주세요.</p>
								<input type="checkbox"> <span class=checkAnswer>
									네, 확인했어요.</span>
							</div>
							<br>
							<br>
						</div>
						<div class="col-6">
							<input type="button" value="이전" class="before" id="before4">
						</div>
						<div class="col-6" style="text-align: right;">
							<input type="button" value="오픈하기" class="next" id="open">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    <script>
	 // window.location.href;
	    // location.href;
	    //  document.URL; 사이트 주소불러오는 방법들
	    
	
	// '이전','다음'클릭 시 처리
	    $("#next1").on("click",function(){
	        $("#v-pills-classInfo-tab").click();
	    })
	    $("#before2").on("click",function(){
	        $("#v-pills-info-tab").click();
	    })
	    $("#next2").on("click",function(){
	        $("#v-pills-classEtc-tab").click();
	    })
	    $("#before3").on("click",function(){
	        $("#v-pills-classInfo-tab").click();
	    })
	    $("#next3").on("click",function(){
	        $("#v-pills-check-tab").click();
	    })
	    $("#before4").on("click",function(){
	        $("#v-pills-classEtc-tab").click();
	    })
	
	
	//'나가기' 클릭 시 팝업
	    $(".cancelBtn").on("click",function(){
	        Swal.fire({
	        title: '정말 나가실거에요?',
	        text: "오늘, 마음먹은 김에 바로 페이지 작성을 완료하고 크리에이터님을 기다리고 있는 수강생들을 만나세요! 조금만 더 힘내봐요 우리!",
	        showCancelButton: true,
	        confirmButtonColor: '#9381FF',
	        cancelButtonColor: '#D9D9D9',
	        confirmButtonText: '계속 작성할래요',
	        cancelButtonText: '나갈래요',
	        }).then((result) => {
	        
	        })
	    })
	
	
	// 클래스 소개 - 이미지 추가
	    $("#infoReveal1").on("click",function(){
	        $("#cInfoHidden1").css("display","block");
	        $(this).css("display","none");
	    })
	
	    $("#infoReveal2").on("click",function(){
	        $("#cInfoHidden2").css("display","block");
	        $(this).css("display","none");
	    })
	
	    
	// 클래스 장소 - 다음맵 API script
	    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	    mapOption = {
	        center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
	        level: 4 // 지도의 확대 레벨
	    };
	
	    //지도를 미리 생성
	    var map = new daum.maps.Map(mapContainer, mapOption);
	    //주소-좌표 변환 객체를 생성
	    var geocoder = new daum.maps.services.Geocoder();
	    //마커를 미리 생성
	    var marker = new daum.maps.Marker({
	        position: new daum.maps.LatLng(37.537187, 127.005476),
	        map: map
	    });
	
	    function sample5_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                let zipcode = data.zonecode; //우편번호
	                var addr = data.address; // 최종 주소 변수
	                
	                // 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("zipcode").value = zipcode;
	                document.getElementById("address1").value = addr;
	                // 주소로 상세 정보를 검색
	                geocoder.addressSearch(data.address, function(results, status) {
	                    // 정상적으로 검색이 완료됐으면
	                    if (status === daum.maps.services.Status.OK) {
	
	                        var result = results[0]; //첫번째 결과의 값을 활용
	
	                        // 해당 주소에 대한 좌표를 받아서
	                        var coords = new daum.maps.LatLng(result.y, result.x);
	                        // 지도를 보여준다.
	                        mapContainer.style.display = "block";
	                        map.relayout();
	                        // 지도 중심을 변경한다.
	                        map.setCenter(coords);
	                        // 마커를 결과값으로 받은 위치로 옮긴다.
	                        marker.setPosition(coords)
	                    }
	                });
	            }
	        }).open();
	    }
	
	
	// Datepicker
	    $("#datePicker").datepicker({
	    	format : "yyyy-mm-dd",
	        language : "ko",
	        todayHighlight : true,
	        startDate : '+1d'
	    })
	    
	    
	
	// 맞춤법 검사기로 이동
	
	    $("#toSpeller").on("click",function(){
	        window.open("http://speller.cs.pusan.ac.kr/");
	    })
	
	    
	// 체크박스 옆의 글 클릭 시 체크 처리
	    $(".checkAnswer").on("click",function(){
	        if($(this).prev().prop("checked")){
	            $(this).prev().prop("checked", false);    
	        }else{
	            $(this).prev().prop("checked", true);
	        }            
	    })
	
	    
	// '오픈하기' 클릭 시
	    $("#open").on("click",function(){
	        Swal.fire({
	        title: '클래스를 오픈하시겠어요?',
	        showCancelButton: true,
	        confirmButtonColor: '#9381FF',
	        cancelButtonColor: '#D9D9D9',
	        confirmButtonText: '네!',
	        cancelButtonText: '조금 더 검토할래요',
	        }).then((result) => {
	        	if (result.isConfirmed) {
		            //여기서 ajax로 폼 전송하고 업로드
		            Swal.fire({
		            icon: 'success',
		            title: '등록이 완료되었습니다.',
		            showConfirmButton: false,
		            timer: 1500
		            }).then((result) => {
		            	location.href="/class/detail";
		            })
	        	}
	        })
	    })
	
	
	    
	// 새로고침 시 현재탭 유지	
		
	    let siteUrl = window.location.href.split("#").pop(); //활성화할 문자
	    let tabs = $("#v-pills-tab").children(); //세로탭 메뉴들
	    let tabs2 = $("#v-pills-tab2").children(); //가로탭 메뉴들
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
	      window.scrollTo({top:0, left:0, behavior:'auto'});
	    })
	    
	    tabs2.on("click",function(){   //가로탭 메뉴들 전체에 클릭시 이벤트
	      resetTab(); //선택된 탭 초기화
	      $(this).children().addClass("active"); //클릭한 탭만 활성
	      window.scrollTo({top:0, left:0, behavior:'auto'});
	    })
	
	    //탭 세팅
	    function setting(siteUrl){
	      if(siteUrl.split("-").length<2){   // 사이트에 최초 접속시 #탭id 가 없음, 활성화할 탭 id 넣어주기
	    	  siteUrl="info-tab" // 첫번째 탭을 id에 넣어줌
	      }
	      $("#v-pills-"+siteUrl+"").addClass("active"); //url에 맞는 세로탭 활성화
	      $("#v-pills-"+siteUrl+"2").addClass("active"); //url에 맞는 가로탭 활성화
	      tabs_contents.removeClass("active"); //부트스트랩 탭 컨텐츠 버그방지용 초기화
	      $("#v-pills-"+siteUrl.split("-").shift()+"").addClass("show active"); // url에 맞는 컨텐츠 활성화
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