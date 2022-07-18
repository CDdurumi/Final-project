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
	<div class="modal fade" id="changePw-toggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content memberout-box" align=center>
				<form>
					<div id="modal1">
					<div class="modal-header t-auto" style="border-bottom: none; padding-bottom: 0px;"id="login-header">
						<h2>비밀번호 변경</h2>
					</div>
					<div class="modal-body">
						<div class="user-box" style="margin-top:20px; margin-bottom:20px;">
							<label id="pw">현재 비밀번호</label><input type="password" name="pw" id="currentPw" required>
						</div>
					</div>
					<div class="modal-footer d-flex" style="border-top: none; display: flex; justify-content: center;">
					<button type="button" id="pwChk" class="btns2">다음</button>
					<button	type="button" id="cancel" class="btns2">취소</button>
					</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/member/changePwNext.jsp" />

	<script type="text/javascript">
	$("#pwChk").on('click',function(){
		var password = $("#currentPw").val();
		
		$.ajax({
		     url:'/myPage/currentpwChk',
		     data:{password:password},
		     type:"post"
		  }).done(function(resp) {
			if(resp == 1) {
				$("#changePwNext-toggle").modal('show');
		 		$("#changePw-toggle").modal('hide');
			}else {
				Swal.fire({                    
		             width:500,
		             html: "<span style='font-size:15px'>입력하신 비밀번호와 실제 비밀번호가 일치하지 않습니다.<br>확인하시고 다시 입력하세요.</span>",
		             showConfirmButton: false,
		             timer: 1500,
		             background:'#dbdbdb',
		             backdrop:'transparent'
		         })
		         $("#currentPw").val("");
				 $("#currentPw").focus();
			}
		});
		  
	})
	
	$("#cancel").on('click',function(){
		$("#changePw-toggle").modal('hide');
	})
	
	</script>
</body>
</html>