<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="icon" type="image/png" sizes="32x32" href="/img/favicon/favicon-32x32.png">
	<title>[DOWA] 재능마켓 - 결제 완료</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, width=device-width, target-densityDpi=medium-dpi">

 
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
		
        <div id="pageHeader"><a href="/class/main">재능마켓</a><br><hr></div>
        
        <div class="row">
            <div class="col-12"><h5>결제하기</h5></div>
        </div>
        <div class="row box" id="boxF">
            <div class="col-12 boxHeader" style="text-align: center;">결제가 완료되었습니다.</div>        
            <hr>
            <div class="col-12 classTitle">
                <span class=category>[${cdto.category1 }<c:if test="${cdto.category2!=null }"><i class="bi bi-dot"></i>${cdto.category2 }</c:if>]</span>
                ${cdto.title }
                <div class="imgBox"><img src="/upload/${idto.sys_name }"></div>                                            
            </div>
            <hr>
            <div class="col-12" style="text-align: center;">
                <input type="button" value="클래스 화면으로" id="toClass">
                <input type="button" value="목록으로" id="toList">
            </div>
        </div>
	</div>
    <script>	  
    
    	$(function(){
    		// 뒤로가기 방지
        	history.pushState(null, null, location.href);
       	    window.onpopstate = function (event) {
       	    	window.history.go(1);
       	    };
    	})
        
    
    	
   	// 클래스 화면으로
	    $("#toClass").on("click",function(){
	        location.replace("/class/detail?class_seq=${cdto.class_seq}");
	    })
	    
	   
	// 목록으로
	    $("#toList").on("click",function(){
	        location.replace("/class/main");
	    })
	    
    </script>
	<jsp:include page="/WEB-INF/views/common/pNav.jsp"/>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<jsp:include page="/WEB-INF/views/common/loginModal.jsp" />
</body>
</html>