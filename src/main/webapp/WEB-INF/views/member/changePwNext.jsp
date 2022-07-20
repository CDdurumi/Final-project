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
	<div class="modal fade" id="changePwNext-toggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content memberout-box" align=center>
				<form>
					<div id="modal1">
					<div class="modal-header t-auto" style="border-bottom: none; padding-bottom: 0px;"id="login-header">
						<h2>비밀번호 변경</h2>
					</div>
					<div class="modal-body">
						<div class="user-box" style="margin-top:20px; margin-bottom:30px;">
							안전한 비밀번호로 내 정보를 보호하세요!<br>
							다른 아이디/사이트에서 사용한 적 없는 비밀번호, 이전에 사용한 적 없는 비밀번호가 안전합니다.<br><br>
							영문, 숫자를 각각 하나 이상 포함하여 8~12자 사이로 입력해주세요.
						</div>
						<div class="user-box mt-3">
							<label id="pw">새 비밀번호</label><input type="password" name="pw" id="changePw" required><br><br>
							<label id="pw">새 비밀번호 확인</label><input type="password" name="pw" id="changePwChk" required>
						</div>
					</div>
					<div class="modal-footer d-flex" style="border-top: none; display: flex; justify-content: center;">
					<button type="button" id="pwChng" class="btns2" style="background-color:#A8C9E6;">변경</button>
					<button	type="button" id="chngCancel" class="btns2">취소</button>
					</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/member/changePwOk.jsp" />

	<script type="text/javascript">
	$("#pwChng").on('click',function(){
		var pw = $("#changePw").val();
		var pwchk = $("#changePwChk").val();
		
		let pwRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,12}$/; //영문, 숫자를 하나 이상 포함한 8~12자
		let pwResult = pwRegex.test(pw);
		
		if(pw.replace(/\s|　/gi, "").length == 0){
			Swal.fire({                    
	             width:400,
	             html: "<span style='font-size:15px'>변경하실 비밀번호를 입력해주세요.</span>",
	             showConfirmButton: false,
	             timer: 1000,
	             background:'#dbdbdb',
	             backdrop:'transparent'
	         })
            $("#changePw").focus();
            return false;
		}
		
		if(pwchk.replace(/\s|　/gi, "").length == 0){
			Swal.fire({                    
	             width:400,
	             html: "<span style='font-size:15px'>변경하실 비밀번호를 확인란에 다시 입력해주세요.</span>",
	             showConfirmButton: false,
	             timer: 1000,
	             background:'#dbdbdb',
	             backdrop:'transparent'
	         })
            $("#changePwChk").focus();
            return false;
		}
		
		if(pw !="" && pwchk !=""){
			
			if(!pwResult){
				Swal.fire({                    
		             width:500,
		             html: "<span style='font-size:15px'>영문, 숫자를 각각 하나 이상 포함하여 8~12자 사이로 입력해주세요.</span>",
		             showConfirmButton: false,
		             timer: 1000,
		             background:'#dbdbdb',
		             backdrop:'transparent'
		         })
	           $("#changePw").focus();
	           return false;
			} 

			if(pw == pwchk){
		 		$.ajax({
	 		     url:'/myPage/pwChange',
	 		     data:{password:pw},
	 		     type:"post"
	 		  }).done(function(resp) {
	 			if(resp == 1) {
	 				$("#changePwOk-toggle").modal('show');
	 				$("#changePwNext-toggle").modal('hide');
	 			}else {
	 				Swal.fire({                    
	 		             width:500,
	 		             html: "<span style='font-size:15px'>비밀번호 변경에 실패하였습니다.</span>",
	 		             showConfirmButton: false,
	 		             timer: 1500,
	 		             background:'#dbdbdb',
	 		             backdrop:'transparent'
	 		         })
	 			}
	 		});
			} else {
				Swal.fire({                    
		             width:400,
		             html: "<span style='font-size:15px'>비밀번호가 일치하지 않습니다.</span>",
		             showConfirmButton: false,
		             timer: 1000,
		             background:'#dbdbdb',
		             backdrop:'transparent'
		         })
		         return false;
			}
		}		  
	})
	
	$("#chngCancel").on('click',function(){
		$("#changePwNext-toggle").modal('hide');
	})
	
	</script>
</body>
</html>