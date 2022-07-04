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
    <!-- input.css  -->
    <link rel="stylesheet" href="/css/sideTab.css">
	<link rel="stylesheet" href="/css/class/classReg.css">
   
</head>
<body data-bs-spy="scroll" data-bs-target="#classHeader" data-bs-offset="230" tabindex="0">	
	<div class="container mainContent" style="padding-bottom:5%;">  
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		
        <div id="pageHeader"><a href="/class/list">재능마켓</a><br><hr></div>
        
        <div class="row">
            <div class="col-12"><h5>결제하기</h5></div>
        </div>
        <div class="row box">
            <div class="col-10 boxHeader">주문정보</div>
            <div class="col-2" style="text-align: right"><i class="bi bi-pencil-fill"></i></div>
            <hr>
            <div class="col-12 classTitle">
                <span class=category>[카테고리<i class="bi bi-dot"></i>세부카테고리]</span> 클래스 제목
                <div class="imgBox"><img src="/img/class/addImg.png"></div>                                            
            </div>
        </div>
        <div class="row box">
            <div class="col-12 boxHeader">
                결제 금액
            </div>
            <hr>
            <div class="col-8">총 상품 금액</div>
            <div class="col-4">309,000원</div>
            <div class="col-8">상품 할인 금액</div>
            <div class="col-4">-79,500원</div>
            <hr>
            <div class="col-8 totalPrice">최종가격</div>
            <div class="col-4 totalPrice">229,500원</div>
        </div>
        <div class="row box ">
            <div class="col-12 boxHeader">결제 방식</div>
            <hr>
            <div class="col-6 payType"><img src="/img/class/kpay.png"></div>
            <div class="col-6 payType"><img src="/img/class/npay.png"></div>
            <div class="col-12" style="text-align: center;">
                <input type="button" value="구매하기" id="next">
            </div>
        </div>
	</div>
    <script>	  
    	
    // 주문 정보 수정 - 이전으로
	    $(".bi-pencil-fill").on("click",function(){
	        history.back();
	    })
	    
	    
	// 결제 방식 선택 시 checked class 추가
	    $(".payType").on("click",function(){
	        let K = $(this).parent().children()[2];
	        let N = $(this).parent().children()[3];
	        let cK = $(K).children();
	        let cN = $(N).children();
	
	        if($(this)[0]==K){ // 카카오페이 클릭시
	            if(cK.attr("class")==null&&cN.attr("class")==null){
	                cK.attr("class","checked");
	                $(K).css("border","5px solid #FF781E70");
	            }else if(cK.attr("class")==null&&cN.attr("class")=="checked"){
	                cK.attr("class","checked");
	                cN.removeAttr("class");
	                $(K).css("border","5px solid #FF781E70");
	                $(N).css("border","5px solid #ececec");
	            }else{
	                cK.removeAttr("class");
	                $(K).css("border","5px solid #ececec");
	            }
	        }else{ //네이버페이 클릭시
	            if(cK.attr("class")==null&&cN.attr("class")==null){
	                cN.attr("class","checked");
	                $(N).css("border","5px solid #FF781E70");
	            }else if(cK.attr("class")=="checked"&&cN.attr("class")==null){
	                cK.removeAttr("class");
	                cN.attr("class","checked");
	                $(K).css("border","5px solid #ececec");
	                $(N).css("border","5px solid #FF781E70");
	            }else{
	                cN.removeAttr("class");
	                $(N).css("border","5px solid #ececec");
	            }
	        }
	    })
	
	    
	 // 구매하기 클릭시 ( 결제정보 선택x 시 return )
	    $("#next").on("click",function(){
	        
	        let types = $(".payType").children();
	        if($(types[0]).attr("class")==null&&$(types[1]).attr("class")==null){
	            alert("결제 방식을 선택해주세요.")
	            return false;
	        }
	        Swal.fire({
	            title: '주문 처리중입니다.',
	            text:'잠시만 기다려주세요.',
	            showConfirmButton: false,
	            timer:1200,
	            didOpen: () => {
	                Swal.showLoading()
	            }
	        }).then((result) => {
	            Swal.fire({
	            icon: 'success',
	            title: '주문이 완료되었습니다.',
	            showConfirmButton: false,
	            timer: 1200
	            }).then((result) => {
	                if (result.dismiss === Swal.DismissReason.timer) {
	                    	location.href="/class/regFin";
                    }
                })
            })
        })
	    
    </script>
	<jsp:include page="/WEB-INF/views/common/pNav.jsp"/>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<jsp:include page="/WEB-INF/views/common/loginModal.jsp" />
</body>
</html>