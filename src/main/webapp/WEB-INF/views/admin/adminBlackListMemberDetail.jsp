
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<!-- 스위트 얼럿 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- css -->
<link rel="stylesheet" href="/css/admin/adminCommon.css">
<link rel="stylesheet" href="/css/admin/adminBlackListMember.css">

<!-- 메인의 신고리스트를 가져왔으므로 해당 css 파일도 공유 -->
<link rel="stylesheet" href="/css/admin/adminMain_ReportList.css">
</head>
<body>
	<div class="container mainContent">

		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<jsp:include page="/WEB-INF/views/common/pNav.jsp" />
		<div id="adminHeader">관리자 페이지</div>
		<hr id="boundaryLine">
		<!-- 가로 탭 -->		
			<ul class="nav nav-pills nav-justified d-flex d-md-none" id="v-pills-tab2">
				<li class="nav-item"><a href="/admin/adminMain/#adminMember-tab"><button class="nav-link tabs2" id="v-pills-adminMember-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-adminMember" type="button" role="tab" aria-controls="v-pills-adminMember" aria-selected="true">회원정보</button></a></li>
				<li id="cate1" class="nav-item"><details id="hDetail">
						<summary style="padding: 0px; font-size: 14px; margin-bottom: 20px;">신고관리</summary>
						<ul  class="subMenu">
							<li><a href="/admin/adminMain/#report1-tab"><button class="nav-link tabs2 " id="v-pills-report1-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-report1" type="button" role="tab" aria-controls="v-pills-report1" aria-selected="true" style="color: #666666;">신고목록</button></a></li>
							<li><a href="/admin/adminMain/#report2-tab"><button class="nav-link tabs2 active" id="v-pills-report2-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-report2" type="button" role="tab" aria-controls="v-pills-report2" aria-selected="true" style="color: #666666;">블랙리스트</button></a></li>
						</ul>
					</details></li>
				<li class="nav-item"><a href="/admin/adminMain/#dashBoard"><button class="nav-link tabs2" id="v-pills-dashBoard-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-dashBoard" type="button" role="tab" aria-controls="v-pills-adminMember" aria-selected="true">대시보드</button></a></li>
			</ul>
		<div class="d-flex align-items-start">
			<!-- 사이드 탭-->
			<div class="nav flex-column nav-pills d-none d-md-flex" id="v-pills-tab"
				role="tablist" aria-orientation="vertical">
				<!--첫번째 탭 : 회원정보 -->
				<a href="/admin/adminMain/#adminMember-tab"
					class="tapUrl firstDepthTab">
					<button class="nav-link" id="v-pills-adminMember-tab"
						data-bs-toggle="pill" data-bs-target="#v-pills-adminMember"
						type="button" role="tab" aria-controls="v-pills-adminMember"
						aria-selected="true">회원정보관리</button>
				</a>
				<!--두번째 탭 : 신고관리 -->
				<details id="vDetail" open>
					<summary class="navi-link firstDepthTab">신고관리</summary>
					<ul>
						<li class="reLi"><a href="/admin/adminMain/#report1-tab"
							class="tapUrl">
								<button class="nav-link sub" id="v-pills-report1-tab"
									data-bs-toggle="pill" data-bs-target="#v-pills-report1"
									type="button" role="tab" aria-controls="v-pills-report1"
									aria-selected="false">
									<div>신고목록</div>
								</button>
						</a></li>
						<li class="reLi"><a href="/admin/adminMain/#report2-tab"
							class="tapUrl">
								<button class="nav-link sub active" id="v-pills-report2-tab"
									data-bs-toggle="pill" data-bs-target="#v-pills-report2"
									type="button" role="tab" aria-controls="v-pills-report2"
									aria-selected="false">
									<div>블랙리스트</div>
								</button>
						</a></li>
					</ul>
				</details>
				<!--세번째 탭 : 대시보드 -->
				<a href="/class/write"tapUrlfirstDepthTab">
					<button class="nav-link" id="v-pills-dashBoard-tab"
						data-bs-toggle="pill" data-bs-target="#v-pills-dashBoard"
						type="button" role="tab" aria-controls="v-pills-dashBoard"
						aria-selected="false">대시보드</button>
				</a>
			</div>
			<!-- 탭 페이지 -->
			<div class="tab-content" id="v-pills-tabContents">
				<!-- 탭 페이지 : 회원정보 상세 -->
				<div class="tab-pane fade show active" id="reportListWrapper"
					role="tabpanel">
					<div class="reportTitle col-12" id="reportTitle">${blackMember.EMAIL }님의 신고 현황</div>
					<div id="reportDetail">총 ${blackMember.REPORT } 건의 신고 기록이 있습니다.
					<a href="/admin/memberPage?email=${blackMember.EMAIL}"><span id="toInfo">회원정보가기 ></span></a>
					</div>
					<!-- 신고관리 카테고리 분류 -->
					<div id="memberReportSum">
						<div class="row reportListsumHead" id="sumHead">
							<div class="col-3">합계</div>
							<div class="col-3">게시글</div>
							<div class="col-3">댓글</div>
							<div class="col-3">리뷰</div>
						</div>
						<div class="row reportListsumHead" id="sumMain">
							<div class="col-3">${blackMember.REPORT }건</div>
							<div class="col-3">${reportCount.board}건</div>
							<div class="col-3">${reportCount.reply}건</div>
							<div class="col-3">${reportCount.review}건</div>
							<span style="text-align:right"> 반려된 건 : ${blackMember.REJECT } 건</span>
							
						</div>
						
						<div id="reportContainer" class="row pc-ver-list detail">
							<div class="reportList memberReportList" id=reportMemberList">
								<div class="row reportListHeaderContainer detail">
									<div class="reportListHeader reportListHeaderLeft head_check">
										<input type="checkBox" id="reportList1AllCheck" name="blackListCheck" value="selectAll" onclick="selectAll(this)">
									</div>
									<div class="reportListHeader detail head_seq">번호</div>
									<div class="row reportListHeaderRight rightHeaderList">
										<div class="col-6 reportListHeader detail">제목</div>
										<div class="col-3 reportListHeader detail">신고자</div>
										<div class="col-3 reportListHeader detail">비고</div>
										<!-- 									<div class="col-2 reportListHeader">신고일자</div> -->
									</div>
								</div>
								<c:forEach var="i" items="${rList}" varStatus="status">
									<div class="reportListContainer toBoards">
										<div class="reportListName report2_seq reportListLeft detail center">
											<input type="checkBox" class="listCheck" name="blackListCheck" value="${i.report_seq}">
											<input type="hidden" value="${i.state} " class="state">
										</div>
										<div class="reportListName  detail report2_seq center"> ${(page.nowPage-1)*page.cntPerPage+status.index+1}</div>
										<div class="reportListRight row">
											<input type="hidden" value="${i.state} " class="state">
											<input type="hidden" value="${i.parent_seq} " class="parent_seq">
											<input type="hidden" value="${boardNclass_seq[status.index]} " class="board_seq">
											<div class="col-6 reportListName title  detail" style="padding-left:30px">${i.contents }</div>
											<div class="col-3 reportListName  detail">${writerNreporter[status.index].reporter}</div>
											<div class="col-3 reportListName  center detail">${locations[status.index]}</div>
											<div class="col-5 reportListName  detail center" id="reportReason">${i.reason }</div>
											<div class="col-4 reportListName detail">신고일 :
												<fmt:formatDate value="${i.report_date}" type="both" pattern="yy/MM/dd" />
											</div>
											<div class="col-3 reportListName detail" style="text-align:center">
												<c:choose>
													<c:when test="${i.state==2 }">
														삭제
													</c:when>
													<c:when test="${i.state==1 }">
														미처리
													</c:when>
													<c:otherwise>
														반려
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</div>						
								</c:forEach>
							</div>
							<div class="selectBtnsBottom col-12">
								<!-- adminMain-Repor.css -->
								<button class="selectBtn" id="selectBtn1"  onclick="reportReject()">신고반려</button>
								<button class="selectBtn" id="selectBtn2" onclick="selectDelete()">선택삭제</button>
								<button class="selectBtn" id="selectBtn2" onclick="deleteAllReport()">모두삭제</button>
							</div>
							<!-- 페이지네이션 -->
							<div class="pageWrapper">
								<div class="page" id="blackLIstPage">
								
								<c:choose>
									<c:when test="${page.startPage!=1 }">
										<div class='movePage' id='blackListPrevBtn'>Prev</div>
									</c:when>
									<c:otherwise>
										<div class='movePage none' style='color:#d3d3d3'>Prev</div>
									</c:otherwise>
								</c:choose>
								<c:forEach  begin="${page.startPage}" end="${page.endPage}" var="i">
								<c:choose>
									<c:when test="${page.nowPage==i}">
										<div class='nowPage blackListPageBtn'>${i}</div>
									</c:when>
									<c:otherwise>
										<div class='nomalPage blackListPageBtn'>${i}</div>
									</c:otherwise>
								</c:choose>
								</c:forEach>
								<c:choose>
									<c:when test="${page.endPage<page.lastPage }">
										<div class='movePage' id='blackListNextBtn'>Next</div>
									</c:when>
									<c:otherwise>
										<div class='movePage none' style='color:#d3d3d3'>Next</div>
									</c:otherwise>
								</c:choose>
						
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/pNav.jsp" />
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
			
			//페이지 이동
    		$(".blackListPageBtn").on("click",function(){
        		let nowPage= $(this).text();
        		location.href = "/admin/memberReportList?email=${blackMember.EMAIL}&nowPage="+nowPage;
        	})
        	
        	//이전 페이지
        	$("#blackListPrevBtn").on("click",function(){
    			let nowPage= ${page.startPage-1};
    			location.href = "/admin/memberReportList?email=${blackMember.EMAIL}&nowPage="+nowPage;
        	})
        	//다음 페이지
        	$("#blackListNextBtn").on("click",function(){
    			let nowPage= ${page.endPage+1};
    			location.href = "/admin/memberReportList?email=${blackMember.EMAIL}&nowPage="+nowPage;
        	})
        	
        	
        	
       $(".reportListRight").on("click",function(){

			if($(this).children(".parent_seq").val().startsWith('c')){//parent_seq가 c로 시작하는 경우
				if($(this).children(".parent_seq").val().startsWith('cr')){//재능마켓-리뷰로 이동						
					if($(this).children(".state").val()==2){//리뷰-삭제처리된 경우
    		    		Swal.fire({
    	    	            icon: 'warning',
    	    	            title: '삭제 처리된 리뷰입니다.'
    	    	        })
						return false;
					}else{//리뷰- 삭제 안된경우
						location.href= '/class/detail?class_seq='+$(this).children('.board_seq').val();		
					
					}
				}else{//재능마켓인 경우
					location.href= '/class/detail?class_seq='+$(this).children(".parent_seq").val();	
				}
			}else if($(this).children(".parent_seq").val().startsWith('r')){//커뮤니티 댓글인 경우
				if($(this).children(".state").val()=='2'){//리뷰-삭제처리된 경우
		    		Swal.fire({
	    	            icon: 'warning',
	    	            title: '삭제 처리된 댓글입니다.'
	    	        })
					return false;
				}else{//리뷰- 삭제 안된경우
					location.href= '/community/detailView?seq='+$(this).children('.board_seq').val();		
				
				}
			}else{//커뮤니티 글인 경우
				location.href= '/community/detailView?seq='+$(this).children(".parent_seq").val();
			}
		})
		
		//신고리스트 전체 선택 시
		    	//신고 리스트 전체 선택 시 
		function selectAll(selectAll)  {
		  let checkboxes 
		       = document.getElementsByName('blackListCheck');
		  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked;
		  })
		}
			
		//선택 반려
    	function reportReject(){
    		let rejectTarget = [];// 반려 대상 넣을 배열
    		let rejectCount = 0; // 총 반려건수
    		let rejeced = 0 ; //현재 반려되어 있는 건수
    		let state = null;
    		 $("input:checkbox[name='blackListCheck']:checked").each(function(){			
    			 state = $(this).next().val();
    			 if(state==0){
    				 rejeced++;
    			 } 			 
    			 rejectTarget.push($(this).val());// 체크된 것만 값을 뽑아서 배열에 push
       			 console.log(rejeced);	
       			console.log(rejectTarget);
    		        })
    		        if($("#reportList1AllCheck").is(':checked')){//전부 선택 박스는 선택 대상에서 제외
    		        	rejectCount =  rejectTarget.length-1-rejeced;
    		        }else{
    		        	rejectCount =  rejectTarget.length-rejeced;
    		        }			
    		 		if(rejectCount>0){
      		            Swal.fire({
      	  			        title: "총 " + rejectCount + "건을 반려하시겠습니까?",
      	  			        showCancelButton: true,
      	  			        confirmButtonColor: '#9381FF',
      	  			        cancelButtonColor: '#D9D9D9',
      	  			        confirmButtonText: '확인',
      	  			        cancelButtonText: '취소',
      	    				 }).then((result) =>{
      	    					 if (result.isConfirmed){
      	    						 $.ajax({
      	    							traditional: true,
      	    						 	url:"/admin/reportReject",
      	    						 	data:{"rejectTarget" :rejectTarget}
      	    						 }).done(function(){
       	    				    		Swal.fire({
       	    				    			icon  : "success",
      	    			    	            title: '반려가 완료되었습니다.',
      	    			    	          closeOnClickOutside : false
      	    			    	        }).then(function(){
      	    			    	        	location.reload();
      	    			    	      })
       	    				    			
      	    							
      	    						 })
      	    					 }
      	    				 })
    		 		}else{
    		    		Swal.fire({
    	    	            icon: 'warning',
    	    	            title: '대상이 없습니다.'
    	    	        })
    	    	        return false;
    		 		}
   		 }
		
		//선택 삭제 
		    function selectDelete(){
    		let rejectTarget = [];// 삭제 대상 넣을 배열
    		let rejectCount = 0; // 총 삭제건수
    		let rejeced = 0 ; //현재 삭제되어 있는 건수
    		let state = null;
    		
    		 $("input:checkbox[name='blackListCheck']:checked").each(function(){
    			 state = $(this).next().val();
    			 if(state==2){
    				 rejeced++;
    			 } 		
    			 rejectTarget.push($(this).val());// 체크된 것만 값을 뽑아서 배열에 push
    		        })
    		        if($("#reportList1AllCheck").is(':checked')){//전부 선택 박스는 선택 대상에서 제외
    		        	rejectCount =  rejectTarget.length-1-rejeced;
    		        }else{
    		        	rejectCount =  rejectTarget.length-rejeced;
    		        }			
    		 		if(rejectCount>0){
      		            Swal.fire({
      	  			        title: "총 " + rejectCount + "건을 삭제하시겠습니까?",
      	  			        showCancelButton: true,
      	  			        confirmButtonColor: '#9381FF',
      	  			        cancelButtonColor: '#D9D9D9',
      	  			        confirmButtonText: '확인',
      	  			        cancelButtonText: '취소',
      	    				 }).then((result) =>{
      	    					 if (result.isConfirmed){
      	    						 $.ajax({
      	    							traditional: true,
      	    						 	url:"/admin/reportSelectDelete",
      	    						 	data:{"rejectTarget" :rejectTarget}
      	    						 }).done(function(){
        	    				    		Swal.fire({
           	    				    			icon  : "success",
          	    			    	            title: '삭제가 완료되었습니다.',
          	    			    	          closeOnClickOutside : false
          	    			    	        }).then(function(){
          	    			    	        	location.reload();
          	    			    	      })
           	    				    			
      	    						 })
      	    					 }
      	    				 })
    		 		}else{
    		    		Swal.fire({
    	    	            icon: 'warning',
    	    	            title: '대상이 없습니다.'
    	    	        })
    	    	        return false;
    		 		}    		
    	}
   
        	//전체 삭제
       function deleteAllReport(){
			let email = '${blackMember.EMAIL}'
        		
    		Swal.fire({
 			        title: "해당 회원의 모든 신고건을 삭제하시겠습니까?",
 			        showCancelButton: true,
 			        confirmButtonColor: '#9381FF',
 			        cancelButtonColor: '#D9D9D9',
 			        confirmButtonText: '확인',
 			        cancelButtonText: '취소',
   				 }).then((result) =>{
   					 if (result.isConfirmed){
   						 $.ajax({
   							type:'post',
   						 	url:"/admin/deleteAllbyEmail",
   						 	data:{"email":email}
   						 }).done(function(){
 				    		Swal.fire({
   				    			icon  : "success",
  			    	            title: '삭제가 완료되었습니다.',
  			    	          closeOnClickOutside : false
  			    	        }).then(function(){
  			    	        	location.reload();
  			    	      })
   						 })
   					 }
   				 })
    		
    	}
        	
	</script>
</body>
</html>
