<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!--부트스트랩-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>


<!-- boardWrite 전용 스타일 -->
<link rel="stylesheet" href="/css/boardWrite.css">

<!-- input style -->
<link rel="stylesheet" href="/css/index.css">

<style>
	.mainContent div{
 		border: 1px solid black;
	}
	
	.row{ 
/* 		border: 1px solid black; */
	}
	
	[class *=col-]{
/* 		border: 1px solid blue; */
	}	
</style>

<script>
	$(function(){
		
	})	
</script>

</head>
<body>
	<!-- Header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/> 
	<jsp:include page="/WEB-INF/views/common/pNav.jsp"/>

	
	<div class="container mainContent">
		<div id="pageHeader">글 작성<br><hr></div>		
		
		<!-- 카테고리 콤보박스 , 해시태그 영역 -------------------->
		<div class="row category_hasgRow">
			<div class="col-12 col-sm-3 col-lg-2 categoryArea">
				<select name="categoryOption" id="select">
					<option>
					    카테고리
					</option>
					<option value="f">
					    궁금해요
					</option>
					<option value="g">
					    도와주세요
					</option>
					<option value="j">
					    도와드려요
					</option>
					<option value="r">
					    일상
					</option>
				</select>
			</div>
			
			<div class="col-12 col-sm-9 col-lg-10 hashtagArea">
				해시태그
			</div>
		</div>
		
		<!-- 이미지 영역 ---------------------------------->
		<div class="row imgRow">
			<div class="col-12 col-sm-3 col-lg-2 imgUplodArea">
				이미지 선택
			</div>
			
			<div class="col-12 col-sm-9 col-lg-10 imgListgArea">
				이미지 목록
			</div>
		</div>
	
		<!-- 제목, 등록버튼 영역 ---------------------------------->
		<div class="row w-100 titleRow">
			<div class="col-10 col-sm-10 col-md-11 h-100">
				<input type="text" placeholder="제목을 입력하세요" id="titleInput">
			</div>
			
			<div class="col-2 col-sm-2 col-md-1 text-center h-100">
				<input type="button" value="등록" id="submitBtn">
			</div>			
		</div>
	
		<!-- 본문 ---------------------------------->
		<div class="row w-100">
			<div class="col-12 w-100" contenteditable="true" id="contents">
			</div>			
		</div>
	
	
	</div>

	<!-- Footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<!-- loginModal -->
	<jsp:include page="/WEB-INF/views/common/loginModal.jsp" />
	
	
	
	<script>
	
	</script>
	
</body>

</html>