<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<!--  부트스트랩-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.1.1/css/fontawesome.min.css" integrity="sha384-zIaWifL2YFF1qaDiAo0JFgsmasocJ/rqu7LKYH8CoBEXqGbb9eO+Xi3s6fQhgFWM" crossorigin="anonymous">    <!--  부트스트랩-->
    <!-- input.css  -->
	<link rel="stylesheet" href="/css/index.css">
    
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="common/header.jsp" />
	<article style="min-height:100vh;">
	<h2>input--nao</h2>
	<span class="input input--nao">
    <input class="input__field input__field--nao" type="text" id="input-3" />
    <label class="input__label input__label--nao" for="input-3">
      <span class="input__label-content input__label-content--nao">Invitation Code</span>
    </label>
    <svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
      <path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
    </svg>
  </span>
  
  <h2>Minoru</h2>
  <span class="input input--minoru">
    <input class="input__field input__field--minoru" type="text" id="input-13" />
    <label class="input__label input__label--minoru" for="input-13">
      <span class="input__label-content input__label-content--minoru">First Name</span>
    </label>
  </span>
  </article>
  
  <jsp:include page="common/pNav.jsp" />
  
  <jsp:include page="common/footer.jsp" />
</body>
</html>