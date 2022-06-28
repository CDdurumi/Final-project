<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<!--  부트스트랩-->
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>
    <!-- input.css  -->
	<link rel="stylesheet" href="/css/index.css">
    
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div class="container">

	<jsp:include page="common/header.jsp" />
	
	
	<div style="min-height:100vh; margin-top:200px;" class="contents">
	<h2>input--nao</h2>
	<span class="input input--nao">
    <input class="input__field input__field--nao" type="text" id="input-3" />
    <label class="input__label input__label--nao" for="input-3">
      <span class="input__label-content input__label-content--nao">Invitation Code</span>
    </label>

  </span>
  
  <h2>Minoru</h2>
  <span class="input input--minoru">
    <input class="input__field input__field--minoru" type="text" id="input-13" />
    <label class="input__label input__label--minoru" for="input-13">
      <span class="input__label-content input__label-content--minoru">First Name</span>
    </label>
  </span>
  </div>
  
  <jsp:include page="common/pNav.jsp" />
  
  <jsp:include page="common/footer.jsp" />
  </div>
</body>
</html>