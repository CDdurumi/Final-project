<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>[DOWA] 재능마켓 - 클래스 오픈하기</title>
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
	<!--Bootstrap Icon-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
	<!-- input.css  -->
	<link rel="stylesheet" href="/css/sideTab.css">
	<link rel="stylesheet" href="/css/class/classWrite.css">
   
</head>
<body>	
	<div class="container mainContent">  
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
        <div id="pageHeader"><a href="/class/main">재능마켓</a><hr></div>
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
			<form action="/class/upload" method="post" enctype="multipart/form-data" id=form>
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
								<p class="inputTitle">카테고리<span id="requiredStar">*</span></p>
								<p class="inputSubTitle">1차 카테고리를 선택해주세요.</p>
								<select name="category1" id="category1">
									<option value="" selected disabled>카테고리</option>
									<option value="요리">요리</option>
									<option value="음악">음악</option>
									<option value="공예">공예</option>
									<option value="사진">사진</option>
									<option value="언어">언어</option>
									<option value="운동">운동</option>
									<option value="코딩">코딩</option>
									<option value="기타">기타</option>
								</select> <br>
								<br>
							</div>
							<div class="col-12">
								<p class="inputTitle">세부 카테고리</p>
								<p class="inputSubTitle">구체적인 카테고리를 적어주세요.</p>
								<input type="text" name="category2" id="category2" maxlength="30" 
									placeholder="ex) 케이크 만들기, 우쿨렐레 강습, 가죽 공예 등"> <br>
								<br>
							</div>
							<div class="col-12">
								<p class="inputTitle">클래스 제목<span id="requiredStar">*</span></p>
								<p class="inputSubTitle">컨셉이 잘 드러나는 클래스의 제목을 적어주세요.</p>
								<input type="text" name="title" id="title" maxlength="60"> <br>
								<br>
							</div>
							<div class="col-12">
								<p class="inputTitle">가격<span id="requiredStar">*</span></p>
								<p class="inputSubTitle">클래스의 금액을 적어주세요.</p>
								<input type='text'
									oninput="this.value = this.value.replace(/[^0-9{1,8}]/g, '').replace(/(\..*)\./g, '$1');"
									name="price" id="price" maxlength="8"> 원 <br>
								<br>
							</div>
							<div class="col-12">
								<p class="inputTitle">클래스 메인 이미지<span id="requiredStar">*</span></p>
								<p class="inputSubTitle">클래스 메인 이미지는 상세 페이지 상단에 보여지는 이미지에요.
									(최소 1장 ~ 최대 4장 설정 가능)<br>첫 이미지는 클래스 메인 이미지로 사용됩니다.</p>
								<div class="row">
									<div class="col-12">
										<!--  이미지 정보를 담을 배열 -->
										<input type=text id=arrImg name=arrImg style="display:none">
										<!-- 메인 이미지1 -->
										<span class="imgBox imgbox">
											<img src="/img/class/addMainImg.png" class="addImg">
											<img src="/" class="preview" style="display:none">
											<i class="bi bi-x-circle-fill" style="display:none"></i>
											<input type=file class=pic style="display:none">		
											<input type=text class="ori_name" id="ma1_ori_name" style="display:none">
											<input type=text class="sys_name" id="ma1_sys_name" style="display:none">
										</span>
										<!-- 메인 이미지2 -->
										<span class="imgBox imgbox">
											<img src="/img/class/addImg.png" class="addImg">
											<img src="/" class="preview" style="display:none">
											<i class="bi bi-x-circle-fill" style="display:none"></i>
											<input type=file class=pic style="display:none">		
											<input type=text class="ori_name" id="ma2_ori_name" style="display:none">
											<input type=text class="sys_name" id="ma2_sys_name" style="display:none">
										</span>
									</div>
									<div class="col-12">
										<!-- 메인 이미지3 -->
										<span class="imgBox imgbox">
											<img src="/img/class/addImg.png" class="addImg">
											<img src="/" class="preview" style="display:none">
											<i class="bi bi-x-circle-fill" style="display:none"></i>
											<input type=file class=pic style="display:none">		
											<input type=text class="ori_name" id="ma3_ori_name" style="display:none">
											<input type=text class="sys_name" id="ma3_sys_name" style="display:none">
										</span>
										<!-- 메인 이미지4 -->
										<span class="imgBox imgbox">
											<img src="/img/class/addImg.png" class="addImg">
											<img src="/" class="preview" style="display:none">
											<i class="bi bi-x-circle-fill" style="display:none"></i>
											<input type=file class=pic style="display:none">		
											<input type=text class="ori_name" id="ma4_ori_name" style="display:none">
											<input type=text class="sys_name" id="ma4_sys_name" style="display:none">
										</span>
									</div>
								</div>
								<br>
							</div>
							<div class="col-12">
								<p class="inputTitle">크리에이터 한 줄 소개<span id="requiredStar">*</span></p>
								<p class="inputSubTitle">크리에이터님이 어떤 분인지 짧게 소개해주세요.</p>
								<input type="text" name="creater_info" id="creater_info" maxlength="600"> <br>
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
								<p class="inputTitle">클래스 소개<span id="requiredStar">*</span></p>
								<p class="inputSubTitle">클래스 주제에 대한 이미지와 설명을 적어주세요.(최소 1개 ~ 최대 4개 설정 가능)</p>
																
								<div class="row">
									<div class="col-12 col-xl-6">
										<span class="imgBox2 imgbox">											
											<img src="/img/class/addImgLong1.png" class="addImg">
											<img src="/" class="preview" style="display:none">
											<i class="bi bi-x-circle-fill" style="display:none"></i>
											<input type=file class=pic style="display:none">		
											<input type=text class="ori_name" id="ex1_ori_name" style="display:none">
											<input type=text class="sys_name" id="ex1_sys_name" style="display:none">
										</span><br>
										<textarea placeholder="사진에 대한 설명을 적어주세요." class="ima_desc" id="ex1_ima_desc"></textarea>
										<br>
										<br>
									</div>
	
									<div class="col-12 col-xl-6">
										<span class="imgBox2 imgbox">
											<img src="/img/class/addImgLong2.png" class="addImg">
											<img src="/" class="preview" style="display:none">
											<i class="bi bi-x-circle-fill" style="display:none"></i>
											<input type=file class=pic style="display:none">		
											<input type=text class="ori_name" id="ex2_ori_name" style="display:none">
											<input type=text class="sys_name" id="ex2_sys_name" style="display:none">
										</span><br>
										<textarea placeholder="사진에 대한 설명을 적어주세요." class="ima_desc" id="ex2_ima_desc"></textarea>
										<br>
										<br> <input type="button" value="추가하기" id="infoReveal1">
									</div>
	
									<div class="col-12 col-xl-6"  id="cInfoHidden1" style="display: none">
										<span class="imgBox2 imgbox">
											<img src="/img/class/addImgLong3.png" class="addImg">
											<img src="/" class="preview" style="display:none">
											<i class="bi bi-x-circle-fill" style="display:none"></i>
											<input type=file class=pic style="display:none">		
											<input type=text class="ori_name" id="ex3_ori_name" style="display:none">
											<input type=text class="sys_name" id="ex3_sys_name" style="display:none">										
										</span><br>
										<textarea placeholder="사진에 대한 설명을 적어주세요." class="ima_desc" id="ex3_ima_desc"></textarea>
										<br>
										<br> <input type="button" value="추가하기" id="infoReveal2">
									</div>
									<div class="col-12 col-xl-6" id="cInfoHidden2" style="display: none">
										<span class="imgBox2 imgbox">
											<img src="/img/class/addImgLong4.png" class="addImg">
											<img src="/" class="preview" style="display:none">
											<i class="bi bi-x-circle-fill" style="display:none"></i>
											<input type=file class=pic style="display:none">		
											<input type=text class="ori_name" id="ex4_ori_name" style="display:none">
											<input type=text class="sys_name" id="ex4_sys_name" style="display:none">
										</span><br>
										<textarea placeholder="사진에 대한 설명을 적어주세요." class="ima_desc" id="ex4_ima_desc"></textarea>
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
								<p class="inputTitle">클래스 일정<span id="requiredStar">*</span></p>
								<p class="inputSubTitle">클래스를 진행할 날짜를 선택해주세요.</p>
								<input type="text" name="class_date" id="datePicker" placeholder="클릭하여 날짜 선택">
<!-- 								<input type="hidden" id="dateToTsp" name="class_date"> -->
								<br>
								<br>
							</div>
							<div class="col-12" id="classLoc">
								<p class="inputTitle">클래스 장소<span id="requiredStar">*</span></p>
								<p class="inputSubTitle">클래스를 진행할 주소를 검색하여 입력해주세요.</p>
								<input type="text" id="zipcode" name="zipcode" readonly required> <input
									type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
								<input type="text" id="address1" name="address1" placeholder="주소" readonly><br>
								<input type="text" id="address2" name="address2" placeholder="상세주소를 입력해주세요" maxlength="255">
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
					<div class="tab-pane fade" id="v-pills-check" role="tabpanel" aria-labelledby="v-pills-check-tab">
						<div class="row">
							<div class="col-8">
								<p class="formTitle">클래스 등록하기</p>
							</div>
							<div class="col-4 cancel">
								<input type=button class=cancelBtn value="나가기">
							</div>
							<div class="col-12">
								<p class="inputTitle">오픈 전 확인사항<span id="requiredStar">*</span></p>
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
			</form>
		</div>
	</div>
    <script>
    
    
    // 입력 제한
    
   		// 특수문자 정규식 변수(공백 미포함)
   	    let replaceChar = /[@\#$%^&*\()\-=+_\'\;<>\/\`:\"\\[\]|{}]/gi;
   	 
   	    // 완성형 아닌 한글 정규식
   	    let replaceNotFullKorean = /[ㄱ-ㅎㅏ-ㅣ]/gi;	    	
    		
	    $(function(){
	    	
	    	$("#category2").on("focusout", function() {
	            let target = $(this).val();
	            if (target.length > 0) {
	                if (target.match(replaceChar) || target.match(replaceNotFullKorean)) {
	                	target = target.replace(replaceChar, "").replace(replaceNotFullKorean, "");
	                }
	                $(this).val(target);
	            }
            }).on("keyup", function() {
                $(this).val($(this).val().replace(replaceChar, ""));
      		});
	    	
	    	
	    	$("#title").on("focusout", function() {
	            let target = $(this).val();
	            if (target.length > 0) {
	                if (target.match(replaceChar) || target.match(replaceNotFullKorean)) {
	                	target = target.replace(replaceChar, "").replace(replaceNotFullKorean, "");
	                }
	                $(this).val(target);
	            }
            }).on("keyup", function() {
                $(this).val($(this).val().replace(replaceChar, ""));
      		});
	    	
	    	
	    	$("#creater_info").on("focusout", function() {
	            let target = $(this).val();
	            if (target.length > 0) {
	                if (target.match(replaceChar) || target.match(replaceNotFullKorean)) {
	                	target = target.replace(replaceChar, "").replace(replaceNotFullKorean, "");
	                }
	                $(this).val(target);
	            }
            }).on("keyup", function() {
                $(this).val($(this).val().replace(replaceChar, ""));
      		});
	    	
	        
	        $(".ima_desc").on("focusout", function() {
	            let target = $(this).val();
	            if (target.length > 0) {
	                if (target.match(replaceChar) || target.match(replaceNotFullKorean)) {
	                	target = target.replace(replaceChar, "").replace(replaceNotFullKorean, "");
	                }
	                $(this).val(target);
	            }
            }).on("keyup", function() {
                $(this).val($(this).val().replace(replaceChar, ""));
                
                if ($(this).val().length > 1500){
                    alert("최대 500자까지 입력 가능합니다.");
                    $(this).val($(this).val().substring(0, 1500));
                }
      		});
	        
	        
	        $("#address2").on("focusout", function() {
	            let target = $(this).val();
	            if (target.length > 0) {
	                if (target.match(replaceChar) || target.match(replaceNotFullKorean)) {
	                	target = target.replace(replaceChar, "").replace(replaceNotFullKorean, "");
	                }
	                $(this).val(target);
	            }
            }).on("keyup", function() {
                $(this).val($(this).val().replace(replaceChar, ""));
      		});
	    }) 
	    
	
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
	        	if(!result.isConfirmed){
	        		$("#form")[0].reset(); // form 리셋
			    	$(window).off('beforeunload'); // 새로고침 이벤트 막기
			    	history.pushState(null, null, "/class/write");
		        	location.href="/class/main";	
	        	}
	        })
	    })
	
	// 이미지 첨부 관련-----------------------------------------
		
		// 파일명 저장할 전역변수
		let ori_name = "";
		let sys_name = "";
		
		//클릭으로 첨부 - 이미지 클릭시 파일 선택창 열림		
		$(".addImg").on("click",function(){
			
			// 기존에 파일이 있었다면 삭제
			if($(this).siblings(".ori_name").val()!=""){
				$(this).siblings("i").click();
			}	
			$(this).siblings(".pic").click();
		})
		
		$(".pic").on("change",function(){
			
			//파일 형식 확인
			let type = $(this).val().split('.').pop().toLowerCase();
			if($.inArray(type,['gif','png','jpg','jpeg'])== -1){
				alert("이미지 형식의 파일이 아닙니다.");
				$(this).siblings(".addImg").css("display","inline-block");
				$(this).siblings(".preview").css("display","none");
				$(this).val("");
				$(this).siblings(".ori_name").val("");
				$(this).siblings(".sys_name").val("");
				$(this).siblings("i").css("display","none");
				
			// 파일 용량 초과시	
			}else if($(this).prop("files")[0].size> (10*1024*1024)){
				alert('10MB 이하 파일만 등록할 수 있습니다.\n\n' + '현재파일 용량 : ' + (Math.round($(this).prop("files")[0].size / 1024 / 1024 * 100) / 100) + 'MB');
				$(this).siblings(".addImg").css("display","inline-block");
				$(this).siblings(".preview").css("display","none");
				$(this).siblings(".ori_name").val("");
				$(this).siblings(".sys_name").val("");
				$(this).siblings("i").css("display","none");
				
			//이미지 파일이 맞으면 URL API를 통해 미리보기 생성
			}else{
				
				file = $(this).prop("files")[0];
				let imgSrc = window.URL.createObjectURL(file);
				
				$(this).siblings(".addImg").css("display","none");
				$(this).siblings(".preview").attr("src",imgSrc);
				$(this).siblings(".preview").css("display","inline-block");				
				$(this).siblings("i").css("display","inline-block");		
				
				// 서버로 파일 전송
				let formData = new FormData();
				formData.append("file",file);
				uploadFile(formData);
				
				// 저장된 파일명을 input에 입력
				$(this).siblings(".ori_name").val(ori_name);
				$(this).siblings(".sys_name").val(sys_name);
			}
		})
		
		// 드래그으로 첨부
		
		// drag default 효과 방지
		$("body").on("dragenter dragover drop",function(){
			event.preventDefault();
		})
		
		$(".imgbox").on("dragenter dragover",function(){
			event.preventDefault();
		})
		
		// imgBox 영역에 드래그 시
		$(".imgbox").on("drop",function(e){
			
			// 기존에 파일이 있었다면 삭제
			if($(this).children(".ori_name").val()!=""){
				$(this).children("i").click();
			}
			
			let file = e.originalEvent.dataTransfer.files[0];
			
			//파일 형식 확인
			let type = file.name.split('.').pop().toLowerCase();
			if($.inArray(type,['gif','png','jpg','jpeg'])== -1){
				alert("이미지 형식의 파일이 아닙니다.");
				$(this).children(".addImg").css("display","inline-block");
				$(this).children(".preview").css("display","none");
				$(this).children(".ori_name").val("");
				$(this).children(".sys_name").val("");
				$(this).children("i").css("display","none");
			
			// 파일 용량 초과시	
			}else if(file.size> (10*1024*1024)){
				alert('10MB 이하 파일만 등록할 수 있습니다.\n\n' + '현재파일 용량 : ' + (Math.round(file.size / 1024 / 1024 * 100) / 100) + 'MB');
				$(this).children(".addImg").css("display","inline-block");
				$(this).children(".preview").css("display","none");
				$(this).children(".ori_name").val("");
				$(this).children(".sys_name").val("");
				$(this).children("i").css("display","none");
			
			}else{ // 이미지 파일이 맞으면 미리보기 이미지 생성
				let imgSrc = window.URL.createObjectURL(file);
				$(this).children(".addImg").css("display","none");
				$(this).children(".preview").attr("src",imgSrc);
				$(this).children(".preview").css("display","inline-block");
				$(this).children("i").css("display","inline-block");
				
				//서버로 파일 전송
				let formData = new FormData();
				formData.append("file",file);
				uploadFile(formData);
				
				// 저장된 파일명을 input에 입력
				$(this).children(".ori_name").val(ori_name);
				$(this).children(".sys_name").val(sys_name);
			}
		})
		
		
	// 파일 첨부 시 서버에 저장
		
		function uploadFile(formData){
			$.ajax({
				url:"/class/addFile",
				data:formData,
				async:false,
				processData:false,
				contentType:false,
				type:"POST"
			}).done(function(resp){
				let result = JSON.parse(resp);
				ori_name = result.ori_name;
				sys_name = result.sys_name;
			})
		}
	
	// 'x'클릭 시 서버에서 파일 삭제
		
		$(".bi-x-circle-fill").on("click",function(){
			let sys_name = $(this).siblings(".sys_name").val();
			$.ajax({
				url:"/class/deleteFile",
				async:false,
				data:{sys_name:sys_name},
				type:"POST"
			})
			
			window.URL.revokeObjectURL($(this).siblings(".preview").attr("src"));
			$(this).siblings(".addImg").css("display","inline-block");
			$(this).siblings(".preview").attr("src","/");
			$(this).siblings(".preview").css("display","none");
			$(this).siblings(".pic").val("");
			$(this).css("display","none");	
			$(this).siblings(".ori_name").val("");
			$(this).siblings(".sys_name").val("");
		})
	// 이미지 첨부 관련 script 끝-------------------------------------	
	
		   	
	// 클래스 소개 - 이미지 박스 추가 생성
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
	    	
	    	// 기본 정보 중 누락된 요소가 있다면 리턴
	    	if($("#category1").val()==null){
	    		Swal.fire({
    			  title: '카테고리를 선택해주세요',
    			  icon: 'warning',
    			  showCancelButton: false,
    			  confirmButtonColor: '#9381FF'
    			})
    			$("#v-pills-info-tab").click();
	    		$("#v-pills-info-tab2").click();
    			return false;
	    	}	    	
	    	if($("#title").val().trim()==""||$("#title").val().trim()==null){
	    		Swal.fire({
    			  title: '클래스 제목을 작성해주세요',
    			  icon: 'warning',
    			  showCancelButton: false,
    			  confirmButtonColor: '#9381FF'
    			})
    			$("#v-pills-info-tab").click();
	    		$("#v-pills-info-tab2").click();
    			return false;
	    	}	    	
	    	if($("#price").val()==""||$("#title").val()==null){
	    		Swal.fire({
    			  title: '클래스 가격을 설정해주세요',
    			  icon: 'warning',
    			  showCancelButton: false,
    			  confirmButtonColor: '#9381FF'
    			})
    			$("#v-pills-info-tab").click();
	    		$("#v-pills-info-tab2").click();
    			return false;
	    	}
	    	if(Number($("#price").val())<1000){
	    		Swal.fire({
    			  title: '클래스 가격은 1000원 이상부터 설정 가능합니다',
    			  icon: 'warning',
    			  showCancelButton: false,
    			  confirmButtonColor: '#9381FF'
    			})
    			$("#v-pills-info-tab").click();
	    		$("#v-pills-info-tab2").click();
    			return false;
	    	}
	    	if($("#ma1_ori_name").val()==""||$("#ma1_ori_name").val()==null){
	    		Swal.fire({
    			  text: '클래스 메인 이미지를 설정해주세요',
    			  icon: 'warning',
    			  showCancelButton: false,
    			  confirmButtonColor: '#9381FF'
    			})
    			$("#v-pills-info-tab").click();
	    		$("#v-pills-info-tab2").click();
    			return false;
	    	}	    	
	    	if($("#creater_info").val().trim()==""||$("#creater_info").val().trim()==null){
	    		Swal.fire({
    			  text: '크리에이터님의 한 줄 소개를 작성해주세요',
    			  icon: 'warning',
    			  showCancelButton: false,
    			  confirmButtonColor: '#9381FF'
    			})
    			$("#v-pills-info-tab").click();
	    		$("#v-pills-info-tab2").click();
    			return false;
	    	}	    	
	    	
	    	// 클래스 설명 이미지가 한 장도 첨부되지 않았다면 리턴
	    	if($("#ex1_ori_name").val()==""&&$("#ex1_ori_name").val()==""
	    			&&$("#ex1_ori_name").val()==""&&$("#ex1_ori_name").val()==""){
	    		Swal.fire({
    			  text: '클래스 설명 이미지를 최소 1개 이상 등록해주세요',
    			  icon: 'warning',
    			  showCancelButton: false,
    			  confirmButtonColor: '#9381FF'
    			})
    			$("#v-pills-classInfo-tab").click();
	    		$("#v-pills-classInfo-tab2").click();
    			return false;
	    	}
	    	
	    	// 클래스 일정, 장소가 등록되어있지 않다면 리턴
	    	if($("#datePicker").val()==""||$("#datePicker").val()==null){
	    		Swal.fire({
    			  title: '클래스 일정을 설정해주세요',
    			  icon: 'warning',
    			  showCancelButton: false,
    			  confirmButtonColor: '#9381FF'
    			})
    			$("#v-pills-classEtc-tab").click();
	    		$("#v-pills-classEtc-tab2").click();
    			return false;
	    	}	    	
	    	if($("#address1").val()==""||$("#address1").val()==null){
	    		Swal.fire({
    			  title: '클래스 장소를 설정해주세요',
    			  icon: 'warning',
    			  showCancelButton: false,
    			  confirmButtonColor: '#9381FF'
    			})
    			$("#v-pills-classEtc-tab").click();
	    		$("#v-pills-classEtc-tab2").click();
    			return false;
	    	}
	    	
	    	// 오픈 전 확인사항 체크가 누락되었다면 리턴
	    	if(!$($(".checkList")[0]).children("input").prop('checked')||
	    	    	!$($(".checkList")[1]).children("input").prop('checked')||
	    	    	!$($(".checkList")[2]).children("input").prop('checked')||
	    	    	!$($(".checkList")[3]).children("input").prop('checked')){
	    		Swal.fire({
    			  text: '오픈 전 확인사항에 모두 체크해주세요',
    			  icon: 'warning',
    			  showCancelButton: false,
    			  confirmButtonColor: '#9381FF'
    			})
    			return false;
	    	}
	    	
	    	
	    	// 모든 요소가 입력되었다면	    	
	        Swal.fire({
	        title: '클래스를 오픈하시겠어요?',
	        showCancelButton: true,
	        confirmButtonColor: '#9381FF',
	        cancelButtonColor: '#D9D9D9',
	        confirmButtonText: '네!',
	        cancelButtonText: '조금 더 검토할래요',
	        }).then((result) => {
	        	if (result.isConfirmed) {    
	        		
	        		//URL API에 저장되어있는 url 리셋
	    			window.URL.revokeObjectURL($("#preview1").attr("src"));
		        	
	        		// 배열에 메인이미지와 설명이미지 정보를 담기
	        		let arrImg = new Array();
	        		
					for(let i=1;i<=4;i++){
						if($("#ma"+i+"_ori_name").val()!=""){
							let ma = new Object();
							ma.img_seq="ma"+i;
							ma.ori_name =$("#ma"+i+"_ori_name").val();
							ma.sys_name =$("#ma"+i+"_sys_name").val();
							ma.img_desc="";
							ma.parent_seq="";
							arrImg.push(ma);
						}						 
					}
					
					for(let i=1;i<=4;i++){
						if($("#ex"+i+"_ori_name").val()!=""){
							let ex = new Object();
							ex.img_seq="ex"+i;
							ex.ori_name =$("#ex"+i+"_ori_name").val();
							ex.sys_name =$("#ex"+i+"_sys_name").val();
							ex.img_desc = $("#ex"+i+"_ima_desc").val();
							ex.parent_seq="";
							arrImg.push(ex);
						}						 
					}
					$('#arrImg').val(JSON.stringify(arrImg));
	        		
					let form = $("#form");
				    let actionUrl = form.attr('action');
				    
				    // ajax로 form submit
				    $.ajax({
				        type: "POST",
				        url: actionUrl,
				        data: form.serialize() 
				        
				    }).done(function(resp){ // 업로드된 클래스의 seq를 받아옴
				    	$("#form")[0].reset(); // form 리셋
				    	$(window).off('beforeunload'); // 새로고침 이벤트 막기
				    	history.pushState(null, null, "/class/write");						
				    
						Swal.fire({
				            icon: 'success',
				            title: '등록이 완료되었습니다.',
				            showConfirmButton: false,
				            timer: 1200,
				            allowOutsideClick:false,
				            allowEscapeKey:false,
				            allowEnterKey:false
			            }).then((result2) => {						
							if (result2.dismiss === Swal.DismissReason.timer) {									
								location.href="/class/detail?class_seq="+resp; // 작성한 클래스 detailview로 이동
		                    }
						})
				    })
	        	}
	        })
	    })
	    
	    
	    
	// 새로고침시 컨펌	& form submit 시에는 알람창 띄우지 않기
		
		$(document).ready(function () {
		    // Warning
		    $(window).on('beforeunload', function(e){
		    	e.preventDefault();
		        return "";
		    });
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