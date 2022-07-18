<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>[DOWA] 재능마켓 - 환불 신청</title>
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
    <!-- 카카오 페이 결제 테스트모드 관련 -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <!-- input.css  -->
    <link rel="stylesheet" href="/css/sideTab.css">
	<link rel="stylesheet" href="/css/class/classReg.css">
   
</head>
<body data-bs-spy="scroll" data-bs-target="#classHeader" data-bs-offset="230" tabindex="0">	
	<div class="container mainContent" style="padding-bottom:5%;">  
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		
        <div id="pageHeader"><a href="/class/main">재능마켓</a><br><hr></div>
        
        <div class="row">
            <div class="col-12"><h5>환불 신청</h5></div>
        </div>
        <div class="row box boxRefund">
            <div class="col-12 boxHeader">주문 정보</div>
            <hr>            
            <div class="col-12 classTitle" style="padding:20px;">
                <span class=category>[${cdto.category1 }<c:if test="${cdto.category2!=null }"><i class="bi bi-dot"></i>세부카테고리</c:if>]</span>
                ${cdto.title }
                <div class="imgBox"><img src="/upload/${idto.sys_name }"></div>                                            
            </div>
            <hr style="margin-bottom:2px;background-color:#c2c2c2;">
            <div class="col-5">주문 번호</div>
            <div class="col-7 ">${rsdto.regstds_seq }</div>  
            <div class="col-5">클래스 일자</div>
            <div class="col-7 classDate">${cdto.class_date }</div>          
            <div class="col-5">주문 일자</div>
            <div class="col-7 regDate">${rsdto.reg_date }</div>            
            <div class="col-5">주문자</div>
            <div class="col-7">${name }</div>
            <div class="col-5">주문서 입금 현황</div>
            <div class="col-7"><span id="currRegCheck">결제 완료</span></div>
        </div>
        
        <div class="row box boxRefund" style="margin-bottom:10px;">
            <div class="col-12 boxHeader">
                결제 정보
            </div>
            <hr>
            <div class="col-5">결제일시</div>
            <div class="col-7 regDate">${rsdto.reg_date }</div>
            <div class="col-5">결제 수단</div>
            <div class="col-7 regType"></div>
            <div class="col-5">상품 금액</div>
            <div class="col-7 price"></div>
            <div class="col-5">상품 할인 금액</div>
            <div class="col-7">0원</div>
            <div class="col-5">실결제 금액</div>
            <div class="col-7 price"></div>
            <hr style="margin-bottom:0px;background-color:#c2c2c2;">
            <div class="col-5">환불 예정 금액<br>(결제액의 <span id="refundRatio"></span>)</div>
            <div class="col-7 totalPrice"></div>
            <div class="col-12" style="text-align:right;padding-bottom:0;"><input type="button" id="checkRefundPolicy" value="환불 정책 조회"></div>
        	<div class="col-12 refundPolicy" style="display:none">
        		환불 정책에 따라 클래스 일정 하루 전날까지 환불 요청이 가능합니다.<br>
                 - 클래스 일정 <span class="refundDay">7일 전</span>까지 취소 시 : <b>전액</b> 환불<br>
				 - 클래스 일정 <span class="refundDay">3일 전</span>까지 취소 시 : 결제 요금의 <b>50%</b> 환불<br>
				 - 클래스 일정 <span class="refundDay">전날</span>까지 취소 시 : 결제 요금의 <b>30%</b> 환불<br>
				 - 클래스 일정 <span class="refundDay">당일 이후</span> : 취소/환불 <b>불가</b><br>
        	</div>
        </div>
        <div class="row boxRefund">
            <div class="col-12 p-0" style="text-align: center;">
                <input type="button" value="구매 취소" id="next">                
            </div>
        </div>
	</div>
    <script>
    
	 // 환불 비율 표시
		let today=new Date();
		let class_date = new Date("${cdto.class_date}");
		
		let year = class_date.getFullYear();
		let month = class_date.getMonth();
		let day = class_date.getDate();		
		
		let refundAll = new Date(year,month,day-6);
		let refund50 = new Date(year,month,day-2);
		
		if(today<refundAll){
			$("#refundRatio").text("100%");
		}else if(today<refund50){
			$("#refundRatio").text("50%");
		}else{
			$("#refundRatio").text("30%");
		}
    
		
    
	 // 클래스 가격 천단위마다 쉼표 처리		
		let price = ${cdto.price};
		price = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		$(".price").text(price+"원");
		
		// 환불 금액 계산 후 천단위마다 쉼표 처리
		let refund=0;
		if($("#refundRatio").text()=='100%'){
			refund = Number(${cdto.price});
			
		}else if($("#refundRatio").text()=='50%'){
			refund = Number(${cdto.price}*0.5);
			
		}else{
			refund = Number(${cdto.price}*0.3);
		}
		refund= Math.round(refund/10)*10;
		let leftPrice = ${cdto.price}-refund; // 환불금액 제외한 사용자의 실 결제금액 계산
		refund = refund.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');		
		$(".totalPrice").text(refund+"원");
		
		
    
	// 결제 수단 표시
		if(${rsdto.type=='K'}){
			$(".regType").text("카카오페이");
		}else{
			$(".regType").text("네이버페이");
		}
    
	
	
	// 결제 일자 수정
		let date = $(".regDate").text();
		$($(".regDate")[0]).text(date.substring(0,10));
		$($(".regDate")[1]).text(date.substring(0,19));  			
	
		
		
	// 환불 정책 조회 클릭 시 보여주기
	    $("#checkRefundPolicy").on("click",function(){
	    	
	    	if($(".refundPolicy").css("display")=="none"){
	    		$(".refundPolicy").css("display","block");
	    	}else{
	    		$(".refundPolicy").css("display","none");
	    	}
	    	
// 	        window.open("/class/detail?class_seq=${cdto.class_seq}#refund");
	    })   
	    
	   
	    
	//  구매 취소 클릭 시  
		$("#next").on("click",function(){
			Swal.fire({
		        title: '정말 취소하시겠습니까?',
		        showCancelButton: true,
		        confirmButtonColor: '#9381FF',
		        cancelButtonColor: '#D9D9D9',
		        confirmButtonText: '네',
		        cancelButtonText: '아니요',
	        }).then((result) => {
	        	if (result.isConfirmed) {    	        		
	        		
	        		let regStds_seq = '${rsdto.regstds_seq}';
	        		
	    			$.ajax({
	    				url:"/class/refund",
	    				data:{"regStds_seq":regStds_seq,
	    					"price":leftPrice}
	    			}).done(function(resp){
	    				if(resp){
	    					Swal.fire({
	    			            icon: 'success',
	    			            title: '구매가 취소되었습니다',
	    			            showConfirmButton: false,
	    			            timer: 1200,
	    			            allowOutsideClick:false,
	    			            allowEscapeKey:false,
	    			            allowEnterKey:false
	    		            }).then((result2) => {						
	    						if (result2.dismiss === Swal.DismissReason.timer) {
	    							location.replace("/class/refundFin");
	    	                    }
	    					})
	    				} 				
	    			})
				}
			})
		})
	</script>
	<jsp:include page="/WEB-INF/views/common/pNav.jsp"/>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<jsp:include page="/WEB-INF/views/common/loginModal.jsp" />
</body>
</html>