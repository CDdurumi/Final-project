<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="icon" type="image/png" sizes="32x32" href="/img/favicon/favicon-32x32.png">
	<title>[DOWA] 재능마켓 - 결제 진행</title>
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
            <div class="col-12"><h5>결제하기</h5></div>
        </div>
        <div class="row box">
            <div class="col-10 boxHeader">주문정보</div>
            <div class="col-2" style="text-align: right"><i class="bi bi-pencil-fill" title="주문서 수정하기"></i></div>
            <hr>
            <div class="col-12 classTitle">
                <span class=category>[${cdto.category1 }<c:if test="${cdto.category2!=null }"><i class="bi bi-dot"></i>세부카테고리</c:if>]</span>
                ${cdto.title }
                <div class="imgBox"><img src="/upload/${idto.sys_name }"></div>                                            
            </div>
        </div>
        <div class="row box">
            <div class="col-12 boxHeader">
                결제 금액
            </div>
            <hr>
            <div class="col-8">총 상품 금액</div>
            <div class="col-4 price"></div>
            <div class="col-8">상품 할인 금액</div>
            <div class="col-4">0원</div>
            <hr>
            <div class="col-8">최종가격</div>
            <div class="col-4 totalPrice"></div>
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
    
	 // 클래스 가격 천단위마다 쉼표 처리		
		let price = ${cdto.price};
		price = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		$(".price").text(price+"원");
		$(".totalPrice").text(price+"원");
		
    	
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
	    
	    
	    
	 // 구매하기 클릭 시
	    $("#next").on("click",function(){
	        
	    	// 결제정보 선택x 시 return
	        let types = $(".payType").children();
	        if($(types[0]).attr("class")==null&&$(types[1]).attr("class")==null){
	            alert("결제 방식을 선택해주세요.")
	            return false;
	        }
	        
	        let class_seq = '${cdto.class_seq}';
	        let regStds_seq = ${regStds_seq};
	        let price = ${cdto.price};
	        
	        var IMP = window.IMP; 
			IMP.init("imp36339298");
	        let type="";
	        
			// 카카오 페이 선택 시
	        if($($(".payType").children()[0]).attr("class")=="checked"){	
	        	
				type="K";
				
				IMP.request_pay({
			          pg: "kakaopay.TC0ONETIME",
			          pay_method: "card",
			          merchant_uid: ${regStds_seq},
			          name: "[DOWA] ${cdto.title }",
			          amount: ${cdto.price},
			          buyer_email: "${loginID}",
			          buyer_name: "${name}",
			          buyer_tel: "${phone}"
			      }, function (rsp) { // callback
			    	  
			    	  // 결제 성공 시 로직
			          if (rsp.success) {
			     	        $.ajax({
			     	        	url:"/class/reg",
			     	        	data:{"regStds_seq":regStds_seq,
			     	        		"parent_seq":class_seq,
			     	        		"type":type,
			     	        		"price":price}	    	        			
			     	        }).done(function(resp){
			     	        	// 성공 시 주문 완료 창
			     	        	if(resp){
			     	        		Swal.fire({
			     	    	            icon: 'success',
			     	    	            title: '주문이 완료되었습니다.',
			     	    	            showConfirmButton: false,
			     	    	            timer: 1500,
			     	    	            allowOutsideClick:false,
			     			            allowEscapeKey:false,
			     			            allowEnterKey:false
		     	    	            }).then((result) => {
		     	    	                if (result.dismiss === Swal.DismissReason.timer) {
		     	    	                    location.replace("/class/regFin?class_seq="+class_seq);
		    	                        }
		    	                    })
		     	        		}
		     	        	})
		     	       // 결제 실패 시
			          } else {
			        	  Swal.fire({
		  	    	            icon: 'warning',
		  	    	            title: '결제에 실패하였습니다.',
		  	    	            text:'클래스 화면으로 이동합니다.',
		  	    	            showConfirmButton: false,
		  	    	            timer: 1500,
		  	    	          	allowOutsideClick:false,
		  		            	allowEscapeKey:false,
		  		            	allowEnterKey:false
		    	            }).then((result) => {
		    	                if (result.dismiss === Swal.DismissReason.timer) {
		    	                    location.replace("/class/detail?class_seq="+class_seq);
		                        }
		                   })
			          }
			      })
	        // 네이버 페이
	        }else{
	        	type="N";
		    	  
		    	  // 결제 성공 시 로직
		     	        $.ajax({
		     	        	url:"/class/reg",
		     	        	data:{"regStds_seq":regStds_seq,
		     	        		"parent_seq":class_seq,
		     	        		"type":type,
		     	        		"price":price}	    	        			
		     	        }).done(function(resp){
		     	        	// 성공 시 주문 완료 창
		     	        	if(resp){
		     	        		Swal.fire({
		     	    	            icon: 'success',
		     	    	            title: '주문이 완료되었습니다.',
		     	    	            showConfirmButton: false,
		     	    	            timer: 1500,
		     	    	            allowOutsideClick:false,
		     			            allowEscapeKey:false,
		     			            allowEnterKey:false
	     	    	            }).then((result) => {
	     	    	                if (result.dismiss === Swal.DismissReason.timer) {
	     	    	                    location.replace("/class/regFin?class_seq="+class_seq);
	    	                        }
	    	                    })
	     	        		}
	     	        	})	     	        	
	        		}	
		     })
   	        
   		        	    		
// 	    	// IMP.request_pay(param, callback) 결제창 호출
// 		      IMP.request_pay({
// 		          pg: "tosspay.tosstest",
// 		          pay_method: "card",
// 		          merchant_uid: ${regStds_seq},
// 		          name: "[DOWA] ${cdto.title }",
// 		          amount: ${cdto.price},
// 		          buyer_email: "${loginID}",
// 		          buyer_name: "${name}",
// 		          buyer_tel: "${phone}",
// 		          m_redirect_url : "http://localhost/class/tossReg"		       
// 		         '/class/tossReg?regStds_seq=${regStds_seq}&parent_seq='+class_seq  		        	  
// 		      }, function (rsp) { // callback        
   	        
   	        
   	        
   	        
	    
    </script>
	<jsp:include page="/WEB-INF/views/common/pNav.jsp"/>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<jsp:include page="/WEB-INF/views/common/loginModal.jsp" />
</body>
</html>