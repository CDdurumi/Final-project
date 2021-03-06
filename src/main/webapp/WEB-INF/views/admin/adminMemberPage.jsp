
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="32x32" href="/img/favicon/favicon-32x32.png">
<title>[DOWA] 관리자 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!--  부트스트랩-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<!-- sweetalert  -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<!-- 스위트 얼럿 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- 아이콘 CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<!--  부트스트랩-->

<!-- css -->
<link rel="stylesheet" href="/css/admin/adminCommon.css">
<link rel="stylesheet" href="/css/admin/adminMember.css">
<link rel="stylesheet" href="/css/member/memberOut.css?after">
</head>
<body>




	<div class="container mainContent">
	
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/common/pNav.jsp" />
		<div id="adminHeader">관리자 페이지</div>
		<hr id="boundaryLine">
				<!-- 가로 탭 -->		
			<ul class="nav nav-pills nav-justified d-flex d-md-none" id="v-pills-tab2">
				<li class="nav-item"><a href="/admin/adminMain/#adminMember-tab"><button class="nav-link tabs2  active" id="v-pills-adminMember-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-adminMember" type="button" role="tab" aria-controls="v-pills-adminMember" aria-selected="true" style="border-bottom:4px solid #9381ff">회원정보</button></a></li>
				<li id="cate1" class="nav-item"><details id="hDetail">
						<summary style="padding: 0px; font-size: 14px; margin-bottom: 20px;">신고관리</summary>
						<ul  class="subMenu">
							<li><a href="/admin/adminMain/#report1-tab"><button class="nav-link tabs2" id="v-pills-report1-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-report1" type="button" role="tab" aria-controls="v-pills-report1" aria-selected="true" style="color: #666666;">신고목록</button></a></li>
							<li><a href="/admin/adminMain/#report2-tab"><button class="nav-link tabs2" id="v-pills-report2-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-report2" type="button" role="tab" aria-controls="v-pills-report2" aria-selected="true" style="color: #666666;">블랙리스트</button></a></li>
						</ul>
					</details></li>
				<li class="nav-item"><a href="/admin/adminMain/#dashBoard-tab"><button class="nav-link tabs2" id="v-pills-dashBoard-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-dashBoard" type="button" role="tab" aria-controls="v-pills-adminMember" aria-selected="true">대시보드</button></a></li>
			</ul>
		<div class="d-flex align-items-start">
			<!-- 사이드 탭-->
			<div class="nav flex-column nav-pills d-none d-md-flex"  id="v-pills-tab" role="tablist" aria-orientation="vertical">
<!--첫번째 탭 : 회원정보 -->
				<a href="/admin/adminMain/#adminMember-tab" class="tapUrl firstDepthTab">
					<button class="nav-link active" id="v-pills-adminMember-tab" data-bs-toggle="pill" data-bs-target="#v-pills-adminMember" type="button" role="tab" aria-controls="v-pills-adminMember" aria-selected="true">회원정보관리</button>
				</a>
<!--두번째 탭 : 신고관리 -->
				<details id="vDetail">
					<summary class="navi-link firstDepthTab">신고관리</summary>
					<ul>
						<li class="reLi">
						<a href="/admin/adminMain/#report1-tab" class="tapUrl">
								<button class="nav-link sub" id="v-pills-report1-tab" data-bs-toggle="pill" data-bs-target="#v-pills-report1" type="button" role="tab" aria-controls="v-pills-report1" aria-selected="false">
									<div>신고목록</div>
								</button>
						</a></li>
						<li class="reLi">
						<a href="/admin/adminMain/#report2-tab" class="tapUrl">
								<button class="nav-link sub" id="v-pills-report2-tab" data-bs-toggle="pill" data-bs-target="#v-pills-report2" type="button" role="tab" aria-controls="v-pills-report2" aria-selected="false">
									<div>블랙리스트</div>
								</button>
						</a></li>
					</ul>
				</details>
<!--세번째 탭 : 대시보드 -->
				<a href="/admin/adminMain/#dashBoard-tab" >
					<button class="nav-link" id="v-pills-dashBoard-tab" data-bs-toggle="pill" data-bs-target="#v-pills-dashBoard" type="button" role="tab" aria-controls="v-pills-dashBoard" aria-selected="false">대시보드</button>
				</a>
			</div>
<!-- 탭 페이지 -->
			<div class="tab-content" id="v-pills-tabContents">
<!-- 탭 페이지 : 회원정보 상세 -->
					<div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab";">
<!-- 회원 정보 -->						
						<div class="category">
							회원 정보
						</div>
						<div>
							<div class="box" style="background: #BDBDBD;">
								<c:choose>
									<c:when test="${mdto.profile_img != null}">
										<img class="profile" src='/upload/${mdto.profile_img}'>
									</c:when>
									<c:otherwise>
										<img class="profile" src="/img/defaultProfile.png">
									</c:otherwise>
								</c:choose>
							</div>
								<div></div>
								<div class="filebox" align=center style="margin-top: 5px;">
								<c:choose>
										<c:when test="${mdto.profile_img != null}">
											<input id="defaultimg" type='button' value='기본 이미지로 변경' />
										</c:when>
									</c:choose>
									<button class="btn toDefault" style="display: none;">변경</button>
									<button type="button" class="upcancel btn" style="display: none; margin-left: 10px;">취소</button>
								</div>
							
							<div class="row1">
								<div class="left">
									<div class="leftc">이름</div>
									<div class="leftc">이메일</div>
									<div class="leftc">휴대전화</div>
									<div class="leftc">닉네임</div>
									<div class="leftc">회원등급</div>
									<div class="leftc">신고수</div>
								</div>
								<div class="right">
									<div class="rightc">
										<input id="modiname" type="text" value="${mdto.name}" size=13 maxlength=13 disabled class="editable" name="name">
										<span class="modify"><i class="bi bi-pencil-fill"></i></span>
										<input type="hidden" value="name">
										<button type="button" class="btn2 modifybtn" style="display: none;">변경</button>
										<button type="button" class="btn2 upcancel" style="display: none; margin-top: 0px;">취소</button>
										<span class="noticebox" style="display: none;"></span>
									</div>
									<div class="rightc" id="memberEmail">${mdto.email}</div>
									<div class="rightc">
										<input id="modiphone" type="text" value="${mdto.phone}" size=13 maxlength=13 disabled class="editable" name="phone">
										<span class="modify"><i class="bi bi-pencil-fill"></i></span>
										<input type="hidden" value="phone">
										<button type="button" class="btn2 modifybtn" style="display: none;">변경</button>
										<button type="button" class="btn2 upcancel" style="display: none; margin-top: 0px;">취소</button>
										<span class="noticebox" style="display: none;"></span>
									</div>
									<div class="rightc">
										<input id="modinickname" type="text" value="${mdto.nickname}" size=13 disabled class="editable" name="nickname">
										<span class="modify"><i class="bi bi-pencil-fill"></i></span>
										<input type="hidden" value="nickname">
										<button type="button" class="btn2 modifybtn" style="display: none;">변경</button>
										<button type="button" class="btn2 upcancel" style="display: none; margin-top: 0px;">취소</button>
										<span class="noticebox" style="display: none;"></span>
									</div>
									<div class="rightc">
										<input id="moditype" type="text" value="${mdto.type }" size=13 disabled class="editable" name="type">
										<select id="modiType2"  class="selectC" style="display:none">
											<option value="M">일반회원</option>
											<option value="B">블랙리스트</option>
											<option value="A">관리자</option>
										</select>
										<span class="modifyType"><i class="bi bi-pencil-fill"></i></span>
										<input type="hidden" value="type">
										<button type="button" class="btn2 modifybtn" style="display: none;">변경</button>
										<button type="button" class="btn2 upcancel" style="display: none; margin-top: 0px;">취소</button>
										<span class="noticebox" style="display: none;"></span>
									</div>
									<div class="rightc">${reportCount }건 									
									<a href="/admin/memberReport?email=${mdto.email}"><span id="reportMore">자세히 > </span></a></div>
								
								<c:if test="${mdto.type!='관리자' }">
									<div id="memberOut">	<a data-bs-toggle="modal" href="#adninMemberOut-toggle" role="button" style="color: #6B54FF;">
								<button id="memberOutBtn">강제탈퇴</button>
								</a></div>						
								</c:if>
								
								</div>
							</div>
						</div>
						
						
						<div style="clear: both;"></div>
						<div class="category">
							재능<img id="totalent" class="btns" src="/img/rightBtn2.png">
						</div>
						<c:choose>
							<c:when test="${empty buycList}">
								<div class="info">
									<p>
										구매한 클래스가 없습니다.
									</p>
								</div>
							</c:when>
							<c:otherwise>
						<div class="classHead">
							${mdto.name } 님이 구매한 클래스
<!-- 							<span id="tomorepost" class="more">더보기 ></span> -->
						</div>
								<c:forEach var="i" items="${buycList }" begin="0" end="2" varStatus="status">
									<a href="/class/detail?class_seq=${i.CLASS_SEQ }">
									<div class="class">
										<div class="classdate">
										구매일 : 
											${i.BUY_DATE}
										/ 수업시작일 :	
											<fmt:formatDate value="${i.CLASS_DATE}" type="both" pattern="yyyy-MM-dd" />
											<c:if test="${i.STATE==2}">
												<span style="font-size:0.7em;">(신고로 인한 삭제처리)</span>
											</c:if>
										</div>
										<div class="row2">
											<div class="left2">
												<img class="classimg" src="/upload/${mainImgList[status.index].sys_name }">
											</div>
											<div class="right2">
												<div class="classrow1">${i.CATEGORY1} · ${i.CATEGORY2}
													<c:if test="${i.RSTATE=='환불'}">
														<span style="font-size:0.8em;color:red;">(환불)</span>
													</c:if>
												</div>
												<div class="classrow2">
													${i.TITLE } · <span class="creator">${i.CREATER_INFO }</span>
												</div>
											</div>
										</div>
									</div>
									</a>
								</c:forEach>
							</c:otherwise>
						</c:choose>

						<div style="clear: both;"></div>
<!-- 커뮤니티 -->
						<div class="category">
							커뮤니티
						<a href="/admin/memberCommunity?email=${mdto.email}">
						<img id="tocommunity" class="btns" src="/img/rightBtn2.png"></a>
						</div>
						<div class="comucate">
							${mdto.name } 님이 쓴 글
							<a href="/admin/memberCommunity?email=${mdto.email}"><span id="tomorepost" class="more">더보기 ></span></a>
								</div>
						<c:choose>
							<c:when test="${empty boardList}">
								<div class="info">
									<p>
										등록한 글이 없습니다.
									</p>
								</div>
							</c:when>
							<c:otherwise>
				
								<c:forEach var="p" items="${ boardList }">
								<a href='/community/detailView?seq=${p.BOARD_SEQ }'>
								<div class="mypost">
									<div class="postitle">${p.TITLE }

									</div>
									<div class="postdetail">
										<c:choose>
											<c:when test="${p.BOARD_SEQ.startsWith('q')}">
												궁금해요
											</c:when>
											<c:when test="${p.BOARD_SEQ.startsWith('h')}">
												도와주세요
											</c:when>
											<c:when test="${p.BOARD_SEQ.startsWith('s')}">
												도와드려요
											</c:when>
											<c:when test="${p.BOARD_SEQ.startsWith('d')}">
												일상
											</c:when>																		
										</c:choose>${p.BOARD_DATE} · <i class='bi bi-eye-fill'></i> ${p.VIEW_COUNT}  · <i class="bi bi-emoji-smile-fill"></i> ${p.LIKE_COUNT } · <i class="bi bi-chat-dots-fill"></i> ${p.NREPLY_COUNT }
											<c:if test="${p.STATE==2}">
												<span style="font-size:0.7em;">(신고로 인한 삭제처리)</span>
											</c:if>
									</div>
								</div>
								</a>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<div class="comucate">
							${mdto.name } 님이 쓴 댓글
							<a href="/admin/memberCommunity?email=${mdto.email}#section2-tab"><span id="tomorereply" class="more">더보기 ></span></a>
						</div>
						<c:choose>
							<c:when test="${empty replyList}">
								<div class="info">
									<p>
										등록한 댓글이 없습니다.
									</p>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach var="r" items="${replyList}">
<%-- 								<a href='/community/detailView?seq=${r.SEQ }'> --%>
									<div class="myreply myreply1" >
										<input type="hidden" class="rstate" value="${r.RSTATE }">
										<input type="hidden" class="cstate" value="${r.CSTATE }">
										<input type="hidden" class="seq" value="${r.SEQ }">
										<div class="replytitle">[원문]
											<c:choose>
											<c:when test="${r.SEQ.startsWith('q')}">
												궁금해요
											</c:when>
											<c:when test="${r.SEQ.startsWith('h')}">
												도와주세요
											</c:when>
											<c:when test="${r.SEQ.startsWith('s')}">
												도와드려요
											</c:when>
											<c:when test="${r.SEQ.startsWith('d')}">
												일상
											</c:when>															
										</c:choose> · ${r.TITLE }</div>		
										<div class="replydetail">
											${r.RCONTENTS } <br>
											<span class="like">${r.RDATE } · <i class="bi bi-emoji-smile-fill"></i> ${r.RLIKE }
											</span>
											<c:choose>
												<c:when test="${r.RSTATE==2 && r.CSTATE==2 }">
													<span style="font-size:0.7em;">(댓글·게시물 신고로 인한 삭제처리)</span>
												</c:when>
												<c:when test="${r.RSTATE==2 && r.CSTATE!=2 }">
													<span style="font-size:0.7em;">(댓글 신고로 인한 삭제처리)</span>
												</c:when>
												<c:when test="${r.RSTATE!=2 && r.CSTATE==2 }">
													<span style="font-size:0.7em;">(게시글 신고로 삭제된 상태_열람은 가능)</span>
												</c:when>
											</c:choose>
											
										</div>
									</div>
<!-- 									</a> -->
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/admin/adminMemberOut.jsp" />
<%-- 	<jsp:include page="/WEB-INF/views/common/pNav.jsp" /> --%>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
	
	// 회원탈퇴모달에서 최종 탈퇴 버튼을 누르면 모달창이 닫히고 회원탈퇴 처리 후 adminMain 페이지로 이동
	$('#admibMemberOutOk-toggle').on('hidden.bs.modal', function () {
		location.href="/admin/memberOut?email=${mdto.email}";	 
 	    location.href="/admin/adminMain";
	})

		//재능 더보기
	    $("#totalent").on('click',function(){
			location.href="/admin/memberClass?email=${mdto.email}"
	      })
	    //커뮤니티 더보기
	    $("#tocommunity").on("click",function(){
	    	location.href="/admin/memberCommunity?email=${mdto.email}"
	    })
	    
	    $(".myreply1").on("click",function(){
			if($(this).children(".rstate").val()==2){
	    		Swal.fire({
		            icon: 'warning',
		            title: '삭제 처리된 댓글입니다.'
		           	
	    		})
	    	 	return false;    	
			}

				
			
			let seq = $(this).children('.seq').val();
			
			location.href ="/community/detailView?seq="+seq;
	    })

		
	    
	    //회원 정보 수정
	    $(".modify").on("click",function(){
	    	$(this).siblings(".editable").removeAttr("disabled");
	    	$(this).siblings(".editable").focus();
	    	$(this).closest(".rightc").siblings().find(".modify").css("display","none");
	    	$(this).closest(".rightc").siblings().find(".modifyType").css("display","none");
	    	$(this).css("display","none");
	    	$(this).siblings(".btn2").css("display","");
	    })
	    
	    //회원 정보 수정(타입)
		    $(".modifyType").on("click",function(){
		    	$(this).siblings(".editable").css("display","none");
		    	$(this).prev().css("display","");
		    	$(this).closest(".rightc").siblings().find(".modify").css("display","none");
		    	$(this).css("display","none");
		    	$(this).siblings(".btn2").css("display","");
		    })
			// 내 정보 변경 최종 취소 시 페이지 새로고침
			$(document).on("click", ".upcancel", function(){ // on 이벤트로 변경
				location.reload();
			});
		    
		 //회원정보 수정 시 유효성 검사
			$(".modifybtn").on('click',function(){
				
				
				let username = $("#modiname").val();
				let unameRegex = /^[가-힣]{2,5}$/;//2~6글자 한글
				let unameResult = unameRegex.test(username);
				let modiType = $(this).prev().val(); //변경할 타입
				let modiContents = $(this).prev().prev().prev().val(); //변경 내용
				console.log(unameResult);

				
				if(modiType=='name'){
					
					if(username.replace(/\s|　/gi, "").length == 0){
						Swal.fire({                    
				             width:400,
				             html: "<span style='font-size:15px'>변경하실 이름을 입력해주세요</span>",
				             showConfirmButton: false,
				             timer: 1000,
				             background:'#dbdbdb90',
				             backdrop:'transparent'
				         })
			            $("#modiname").focus();
						return false;
					} 
					
					
					if(!unameResult){
						Swal.fire({                    
				             width:400,
				             html: "<span style='font-size:15px'>이름을 올바르게 입력해주세요.(한글 2~6글자)</span>",
				             showConfirmButton: false,
				             timer: 1000,
				             background:'#dbdbdb90',
				             backdrop:'transparent'
				         })
			            $("#modiname").focus();
						return false;
			            
					} 
					
				}
					
				
				//닉네임
				let nickname = $("#modinickname").val();
				let nicknameRegex = /^[a-z0-9가-힣]{2,10}$/; //영어 소문자, 숫자 2~10글자
				let nicknameResult = nicknameRegex.test(nickname);

				let email = $("#memberEmail").text();
				

				if(modiType=='nickname'){
	
					if(nickname.replace(/\s|　/gi, "").length == 0){
						Swal.fire({                    
				             width:400,
				             html: "<span style='font-size:15px'>변경하실 닉네임을 입력해주세요.</span>",
				             showConfirmButton: false,
				             timer: 1000,
				             background:'#dbdbdb90',
				             backdrop:'transparent'
				         })
			            $("#modinickname").focus();
			            return false;
					} 	
					
					
					if(!nicknameResult){
						Swal.fire({                    
				             width:400,
				             html: "<span style='font-size:15px'>닉네임을 올바르게 입력해주세요</span>",
				             showConfirmButton: false,
				             timer: 1000,
				             background:'#dbdbdb90',
				             backdrop:'transparent'
				         })
				        $("#modinickname").focus();
				        return false;
					} else {
						$.ajax({
							url:"/signup/nickNameCheck",
							type:"get",
							data:{nickname:nickname}
						}).done(function(resp){
							let result = JSON.parse(resp);
							
							if(result == true){
								Swal.fire({                    
						            width:400,
						            html: "<span style='font-size:15px'>이미 사용중인 닉네임입니다.</span>",
						            showConfirmButton: false,
						            timer: 1500,
						            background:'#dbdbdb',
						            backdrop:'transparent'
						        })
								return false;
							}else{
								$.ajax({
									url:"/admin/memberUpdate",
									data:{"modiType":modiType,"modiContents":modiContents,"email":email}
								}).done(function(data){
									location.reload();
								})	    
							
						 	}
						});	
					}	
						if(nickname.replace(/\s|　/gi, "").length == 0){
				            $(this).siblings('.noticebox').css("display", "");
							$(this).siblings('.noticebox').css("color", "red");
							$(this).siblings('.noticebox').text("변경하실 닉네임을 입력해주세요.(영문,한글,숫자 조합 2~10자)");
				            $("#modinickname").focus();
				            return false;
						} 	
				        
				}
				//휴대전화
		        let phone = $("#modiphone").val();
			    let phoneRegex = /^010[0-9]{8}$/; //핸드폰 11자리
			    let phoneResult = phoneRegex.test(phone);
				if(modiType=='phone'){
			
				    if(phone.replace(/\s|　/gi, "").length == 0){
						 Swal.fire({                    
			             width:400,
			             html: "<span style='font-size:15px'>변경하실 휴대전화번호를 입력해주세요.</span>",
			             showConfirmButton: false,
			             timer: 1000,
			             background:'#dbdbdb90',
			             backdrop:'transparent'
			         })
		            $("#modiphone").focus();
		            return false;
			    } 
			    
				    if(!phoneResult){          
			            Swal.fire({                    
				             width:500,
				             html: "<span style='font-size:15px'>휴대폰 번호는 숫자 11자리로 작성해주세요. ('-' 미포함)</span>",
				             showConfirmButton: false,
				             timer: 1500,
				             background:'#dbdbdb',
				             backdrop:'transparent'
				         })
				        $("#modiphone").focus();
			            return false;
				    }else {
				    	$.ajax({
							url:"/login/phoneCheck",
							type:"get",
							data:{phone:phone}
						}).done(function(resp){
							let result = JSON.parse(resp);
							if(result == true){
								Swal.fire({                    
						             width:500,
						             html: "<span style='font-size:15px'>이미 가입된 연락처입니다.</span>",
						             showConfirmButton: false,
						             timer: 1500,
						             background:'#dbdbdb',
						             backdrop:'transparent'
						         })
						         $("#modiphone").focus();
						         return false;
							}else{
								$.ajax({
									url:"/admin/memberUpdate",
									data:{"modiType":modiType,"modiContents":modiContents,"email":email}
								}).done(function(data){
									location.reload();
								})	    
							
							}
							
							
						});
				    }   
			
				}
				
				if(modiType=='name'||modiType=='type'){
					$.ajax({
						url:"/admin/memberUpdate",
						data:{"modiType":modiType,"modiContents":modiContents,"email":email}
					}).done(function(data){
						location.reload();
					})	    					

				}

			})

		    //기본이미지로 변경
		    // 기본 사진으로 변경 버튼 클릭 시 미리보기 이미지 기본으로 변경
			$("#defaultimg").on('click',function(){
			$(this).css("display","none");
			$(".profile").attr("src", "/img/defaultProfile.png");	
			$(".btn").css("display","");
			})
			
			// 내 정보 및 이미지 변경 최종 취소 시 페이지 새로고침
			$(document).on("click", ".upcancel", function(){ // on 이벤트로 변경
			location.reload();
			});

		 	$(".toDefault").on("click",function(){
		 		let email = '${mdto.email}';
		 		$.ajax({
		 			url:"/admin/imgToDefault",
		 			data:{"email":email}
		 		}).done(function(){
		 			console.log("dpd?");
		 			location.reload();
		 		})
		 	})
		    
		    
			
	</script>
</body>
</html>    	
