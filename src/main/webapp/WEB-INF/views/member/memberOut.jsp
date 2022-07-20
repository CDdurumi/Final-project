<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/member/memberOut.css?after">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="modal fade" id="memberOut-toggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content memberout-box" align=center>
				<form>
					<div id="modal1">
					<div class="modal-header t-auto" style="border-bottom: none; padding-bottom: 0px;"id="login-header">
						<h2>정말 탈퇴하시겠어요?</h2>
					</div>
					<div class="modal-body">
						<div class="user-box">
							회원 탈퇴 시 회원 정보 및 결제 내역, 작성 게시글 및 댓글은 모두 삭제됩니다.
						</div>
					</div>
					<div class="modal-footer d-flex" style="border-top: none; display: flex; justify-content: center;">
					<button type="button" id="realOut" class="btns2" style="background-color:#A8C9E6;">탈퇴하기</button>
					<button	type="button" id="outCancel" class="btns2">취소</button>
					</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/member/memberOutOk.jsp" />

	<script type="text/javascript">
	$("#realOut").on('click',function(){
		$.ajax({
		     url:'/myPage/memberOut'
		  })
		  
		$("#memberOutOk-toggle").modal('show');
		$("#memberOut-toggle").modal('hide');
	})
	
	$("#outCancel").on('click',function(){
		$("#memberOut-toggle").modal('hide');
	})

	</script>
</body>
</html>