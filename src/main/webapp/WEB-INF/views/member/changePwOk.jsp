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
	<div class="modal fade" id="changePwOk-toggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content memberout-box" align=center>
				<form>
					<div class="modal-body">
						<div class="user-box">
							<h3>비밀번호 변경이 완료되었습니다.</h3>
							다음 로그인부터 변경된 비밀번호로 로그인해주세요.
						</div>
					</div>
					<div class="modal-footer d-flex" style="border-top: none; display: flex; justify-content: center;">
					<button type="button" id="chngOk" class="btns2">확인</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	$("#chngOk").on('click',function(){
		$("#changePwOk-toggle").modal('hide');
	})
	
	</script>
</body>
</html>