<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
<link rel="stylesheet" href="/css/header.css">

  <title>header</title>
</head>

<body>
  <nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
    <div class="container">

      <div id="header_logo"><a class="navbar-brand" href="/"><img src="/img/logo.png" style="width:auto; height:40px;"></a></div>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
        aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
        <ul class="navbar-nav">
          <li class="nav-item">
            <div class="pulse"><span data-tooltip="한번 배워볼까요?"><a class="nav-link" aria-current="page" href="/class/list">재능마켓</a></span></div>
          </li>
          <li class="nav-item">
            <div class="pulse"><span data-tooltip="도움이 필요하다면?"><a class="nav-link" href="/community/main">커뮤니티</a></span></div>
          </li>
          <li class="nav-item">
                 <div class="pulse">  
  					<a class="nav-link" href="#">고객센터</a>
				 </div>
          </li>          
          <c:choose>
          
		  	<c:when test="${loginID != null}">
				<li class="nav-item dropdown">

  		          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
        		      data-bs-toggle="dropdown" aria-expanded="false">
              			내 정보
            	  </a>
            
            	  <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
              		<div class="shake"><li><a class="dropdown-item" href="/login/logout">로그아웃</a></li></div>
              		<li><a class="dropdown-item" href="/myPage/main">마이페이지</a></li>
          		  </ul>
            
          		</li>
			</c:when>
	
			<c:otherwise>
			  <li class="nav-item">
            	<a class="nav-link" data-bs-toggle="modal" href="#login-toggle" role="button">로그인</a>
          	  </li>
			</c:otherwise>

	      </c:choose> 
           
        </ul>
      </div>
    </div>
  </nav>
 
    
</body>

</html>