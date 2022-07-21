
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!--  부트스트랩-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<!-- 스위트 얼럿 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- css -->
<link rel="stylesheet" href="/css/admin/adminCommon.css">
<link rel="stylesheet" href="/css/admin/adminMember.css">
</head>

<body>

	<div class="container mainContent">

		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<jsp:include page="/WEB-INF/views/common/pNav.jsp" />

		<div id="adminHeader">관리자 페이지</div>
		<hr id="boundaryLine">
				<!-- 가로 탭 -->		
			<ul class="nav nav-pills nav-justified d-flex d-md-none" id="v-pills-tab2">
				<li class="nav-item"><a href="/admin/adminMain/#adminMember-tab"><button class="nav-link tabs2  active" id="v-pills-adminMember-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-adminMember" type="button" role="tab" aria-controls="v-pills-adminMember" aria-selected="true" style="color: #666666;border-bottom:4px solid #9381ff">회원정보</button></a></li>
				<li id="cate1" class="nav-item"><details id="hDetail">
						<summary style="padding: 0px; font-size: 14px; margin-bottom: 20px;">신고관리</summary>
						<ul  class="subMenu">
							<li><a href="/admin/adminMain/#report1-tab"><button class="nav-link tabs2" id="v-pills-report1-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-report1" type="button" role="tab" aria-controls="v-pills-report1" aria-selected="true" style="color: #666666;">신고목록</button></a></li>
							<li><a href="/admin/adminMain/#report2-tab"><button class="nav-link tabs2" id="v-pills-report2-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-report2" type="button" role="tab" aria-controls="v-pills-report2" aria-selected="true" >블랙리스트</button></a></li>
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
					<button class="nav-link active" id="v-pills-adminMember-tab"
						data-bs-toggle="pill" data-bs-target="#v-pills-adminMember"
						type="button" role="tab" aria-controls="v-pills-adminMember"
						aria-selected="true">회원정보관리</button>
				</a>
				<!--두번째 탭 : 신고관리 -->
				<details id="vDetail">
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
								<button class="nav-link sub" id="v-pills-report2-tab"
									data-bs-toggle="pill" data-bs-target="#v-pills-report2"
									type="button" role="tab" aria-controls="v-pills-report2"
									aria-selected="false">
									<div>블랙리스트</div>
								</button>
						</a></li>
					</ul>
				</details>
				<!--세번째 탭 : 대시보드 -->
				<a href="/admin/adminMain/#dashBoard" >
					<button class="nav-link" id="v-pills-dashBoard-tab"
						data-bs-toggle="pill" data-bs-target="#v-pills-dashBoard"
						type="button" role="tab" aria-controls="v-pills-dashBoard"
						aria-selected="false">대시보드</button>
				</a>
			</div>
<!--가로 탭 : (depth2)클래스 관련 탭 -->
			<div class="tab-contents" id="v-pills-tabContents">

				<div id="classBtns" class="row">
					<div class="classBtnWrapper col-6 col-lg-4 col-xl-3">
						<a class="nav-link" href="#section1-tab"><button
								class="classBtn communityBtn active" id="section1-tab-btn">${mdto.name }님이 쓴 글</button></a>
					</div>
					<div class="classBtnWrapper col-5 col-lg-4 col-xl-3">
						<a class="nav-link" href="#section2-tab"><button
								class="classBtn communityBtn" id="section2-tab-btn">${mdto.name }님이 쓴 댓글</button></a>
					</div>
				</div>
				<div class="tab-content">
<!-- 1페이지 : 내가 쓴 글 -->
					<div class="tab-pane fade show active" id="section1-tab">
						<div class="category">${mdto.name }님이 쓴 글</div>
						<div id="totalpost" align=right></div>
						<div id="boardContainer"></div>
						<div class="pageWrapper">
							<div class="page info" id="boardPage"></div>
						</div>
					</div>
<!-- 두번째 페이지 : 내가 쓴 댓글 -->
					<div class="tab-pane fade" id="section2-tab">
					<div class="category">${mdto.name }님이 쓴 댓글</div>
						<div id="totalpost2" align=right> </div>
						<div id="replyContainer">
<!-- 				<div class="reply"> -->
<!-- 				<div class="replyrow1">카테고리 · [원문] 본문 제목</div> -->
<!-- 				<div class="replyrow2">댓글 내용</div> -->
<!-- 				<div class="replyrow3"> -->
<!-- 					<span class="like">작성일 · <i class="bi bi-emoji-smile-fill"></i> 좋아요 수 -->
<!-- 					</span> -->
<!-- 				</div> -->
<!-- 			</div>	 -->
						</div>
						<div class="pageWrapper">
							<div class="page info" id="replyPage"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		let siteUrl = window.location.href.split("#").pop();
		let tabs = $(".classBtn"); //세로탭 메뉴들
		let tabs_contents = $(".tab-content").children(); // 컨텐츠틀
		setting(siteUrl); //사이트 접속 초기세팅
		let email = '${mdto.email }';
		
		window.onpopstate = function(event) {
			resetTab();
			siteUrl = window.location.href.split("#").pop();
			setting(siteUrl);
		}

		tabs.on("click", function() { //세로탭 메뉴들 전체에 클릭시 이벤트
			resetTab(); //선택된 탭 초기화
			$(this).addClass("active"); //클릭한 탭만 활성
			setTimeout(function() {
				window.scrollTo(0, 0);
			}, 2);
		})

		function setting(siteUrl) {
			if (siteUrl.split("-").length < 2) {
				siteUrl = "section1-tab";
			}

			$("#" + siteUrl + "-btn").addClass("active"); //url에 맞는 탭 활성화      
			tabs_contents.removeClass("show active"); //부트스트랩 탭 컨텐츠 버그방지용 초기화
			$("#" + siteUrl).addClass("show active"); // url에 맞는 컨텐츠 활성화
			
			if(siteUrl == "section1-tab"){
				writtenBoard('${mdto.email}', 1)
			}else if(siteUrl=="section2-tab"){
				writtenReply('${mdto.email}', 1)
				$("#section1-tab-btn").removeClass("active");
			}
			
		}

		function resetTab() { //선택된 탭 초기화
			tabs.removeClass("active");
			
		}
		
	
		//회원이 쓴 글 탭
		function writtenBoard(email,nowPage){
			let boardContainer = $("#boardContainer");
			boardContainer.text('');
			$("#boardPage").text('');
			
			$.ajax({
				url:"/admin/writtenBoard",
				data:{"email":email,"nowPage":nowPage},
				dataType:'json'
			}).done(function(data){
				console.log(data);
				let boardCount = data[0];
				let page = JSON.parse(data[1]);
				let boardList = JSON.parse(data[2]);
				let mainImgList = JSON.parse(data[3]);
// 				let write_date = JSON.parse(data[4]);
				
				$("#totalpost").text("작성한 글 : " +boardCount+" 건");
				
// 				console.log(write_date);

				
				if(boardList.length==0){

					$("#boardPage").append("<div class='noClass' style='font-size:20px'>작성한 게시글이 없습니다.</div>")
				}
				
				
				for(let i=0;i<boardList.length;i++){
					let location = null;
					if(boardList[i].BOARD_SEQ.startsWith('q')){
						location = '궁금해요';
					}else if(boardList[i].BOARD_SEQ.startsWith('h')){
						location = '도와주세요';
					}else if(boardList[i].BOARD_SEQ.startsWith('s')){
						location = '도와드려요';
					}else{
						location = '일상';
					}
					
    		
					
					let boardLink = $("<a href='/community/detailView?seq="+boardList[i].BOARD_SEQ+"'></a>");
					let post = $("<div class='post'></div>");
					let div = $("<div><span class='comucates'>"+location+"</span></div>");	
					let row2 = $("<div class='row2'></div>");
					let comuup =  $("<div class='comuup'></div>");
					let left5 = $("<div class='left5'></div>");
					let classrow11 = $("<div class='classrow11'>"+boardList[i].TITLE+"</div>");
					let classrow12 = $("<div class='classrow12'>"+boardList[i].CONTENTS+"</div>");
					let right5 = $("<div class='right5'></div>");
					if(mainImgList[i]!="0"){
						comuimg = $("<img class='comuimg' src='/community/"+mainImgList[i]+"'><br>")					
					}else{
						comuimg = $("<img class='comuimg'  src='/img/white.jpg'><br>")	
					}
					let classrow13=null;
					
					let comudown = $("<div class='comudown'></div>")
					if(boardList[i].HASH_TAG!=null){
						classrow13 = $("<div class='classrow13'>"+boardList[i].HASH_TAG+"</div>")
					}else{
						classrow13 = $("<div class='classrow13'>. . . </div>")
					}
					let classrow14 = $("<div class='classrow14'></div>")
					let i1 = $("<i class='bi bi-eye-fill'></i> "+boardList[i].VIEW_COUNT+" · <i class='bi bi-emoji-smile-fill'></i> "+boardList[i].LIKE_COUNT+" · <i class='bi bi-chat-dots-fill'></i> "+boardList[i].NREPLY_COUNT+"<span class='postdate'>"+boardList[i].BOARD_DATE+"</span>")
					

					// 			<a href="#">
// 			<div class="post">
// 				<div>
// 				<span class="comucates">일상</span>
// 				</div>
// 				<div class="row2">
// 					<div class="comuup">
// 						<div class="left5">
// 							<div class="classrow11">치맥 맛있어용</div>
// 							<div class="classrow12">와 진짜 대존맛이에여ㅠㅠㅠㅠㅠㅠㅠ저두 먹고싶어여ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ</div>
// 						</div>
// 						<div class="right5">
// 							<img class="comuimg" src="/img/chimac.jpg"><br>
// 						</div>
// 						<div class="comudown">
// 							<div class="classrow13">#해쉬태그1 #해쉬태그2</div>
// 							<div class="classrow14">
// 								<i class="bi bi-emoji-smile-fill"></i> 좋아요 수 · <i class="bi bi-chat-dots-fill"></i> 댓글 수<span class="postdate">2022.06.30</span>
// 							</div>
// 						</div>
// 					</div>
// 				</div>
// 			</div>
// 		</a>
					
					
					classrow14.append(i1);
					
					comudown.append(classrow13);
					comudown.append(classrow14);
// 					if(mainImgList[i]!="0"){
// 						right5.append(comuimg);	
// 					}					
					right5.append(comuimg);
					left5.append(classrow11);
					left5.append(classrow12);
					
					comuup.append(left5);
					comuup.append(right5);
					comuup.append(comudown);
					
					row2.append(comuup);
					post.append(div);
					post.append(row2);
					boardLink.append(post);
					
					boardContainer.append(boardLink);
					
					
					if(boardList[i].STATE=='2'){
						classrow11.append("<span style='font-size:0.7em;'>   (신고로 인한 삭제처리)</span>")
					}
					
				}
				
				
				
		          
				//페이지 
				
				if(boardList.length!=0){
	    			if(page.startPage!=1){
	    				$("#boardPage").append("<div class='movePage' id='boardPrevBtn'>Prev</div>");
	    			}else{
	    				$("#boardPage").append("<div class='movePage none' style='color:#d3d3d3'>Prev</div>")
	    			}
	    			for(let i=page.startPage;i<=page.endPage;i++){
	    				if(page.nowPage==i){
	    					$("#boardPage").append("<div class='nowPage boardPageBtn'>"+i+"</div>")	
	    				}else{
	    					$("#boardPage").append("<div class='nomalPage boardPageBtn'>"+i+"</div>")
	    				}
	    			}
	    			if(page.endPage<page.lastPage){
	    				$("#boardPage").append("<div class='movePage' id='boardNextBtn'>Next</div>");
	    			}else{
	    				$("#boardPage").append("<div class='movePage none' style='color:#d3d3d3'>Next</div>");
	    			}
	    			
	    			//페이지 이동
	        		$(".boardPageBtn").on("click",function(){
	            		let nowPage= $(this).text();
	            		writtenBoard(email, nowPage)
	            	})
	            	
	            	//이전 페이지
	            	$("#boardPrevBtn").on("click",function(){
	        			let nowPage= page.startPage-1;
	        			writtenBoard(email, nowPage)
	            	})
	 	          	//다음 페이지
	            	$("#boardNextBtn").on("click",function(){
	        			let nowPage= page.endPage+1;
	        			writtenBoard(email, nowPage)
	            	})
				}
	          
				
			})
			

			
		}
		
		function writtenReply(email,nowPage){
			let replyContainer = $("#replyContainer");
			replyContainer.text('');
			$("#replyPage").text('');
			$.ajax({
				url:"/admin/replyByEmail",
				data:{"email":email,"nowPage":nowPage},
				dataType:"json"
			}).done(function(data){
				let replyCount = data[0];
				let page = JSON.parse(data[1]);
				let replyList = JSON.parse(data[2]);
				console.log("댓글 :" +replyList)
				$("#totalpost2").text("작성한 댓글 : " +replyCount+" 건");
				
				
				if(replyList.length==0){

					$("#replyPage").append("<div class='noClass' style='font-size:20px'>작성한 댓글이 없습니다.</div>")
				}
				
				
				for(let i=0;i<replyList.length;i++){
					let location = null;
					if(replyList[i].SEQ.startsWith('q')){
						location = '궁금해요';
					}else if(replyList[i].SEQ.startsWith('h')){
						location = '도와주세요';
					}else if(replyList[i].SEQ.startsWith('s')){
						location = '도와드려요';
					}else{
						location = '일상';
					}
					
					let reportLink = $("<a href='/community/detailView?seq="+replyList[i].SEQ+"'></a>")
					let reply = $("<div class='reply'></div>");
					let replyrow1 = $("<div class='replyrow1'>"+location+" "+replyList[i].TITLE+"</div>")
					let replyrow2 = $("<div class='replyrow2'>"+replyList[i].RCONTENTS+"</div>")
					let replyrow3 = $("<div class='replyrow3'></div>")
					let like = $("<span class='like'>"+replyList[i].RDATE+" · <i class='bi bi-emoji-smile-fill'></i> "+replyList[i].RLIKE+"</span>")
				
				
					replyrow3.append(like);
					reply.append(replyrow1);
					reply.append(replyrow2);
					reply.append(replyrow3);
					reportLink.append(reply)
					replyContainer.append(reportLink)
					
					
					if(replyList[i].RSTATE=='2' && replyList[i].CSTATE=='2'){
						replyrow1.append("<span style='font-size:0.7em;'>(게시글·댓글 신고로 인한 삭제처리)</span>")
						reply.addClass("block")
					}else if(replyList[i].RSTATE=='2'&&replyList[i].CSTATE!='2'){
						replyrow1.append("<span style='font-size:0.7em;'>(댓글 신고로 인한 삭제처리)</span>");
						reply.addClass("block")
					}else if(replyList[i].CSTATE=='2' && replyList[i].RSTATE!='2'){
						replyrow1.append("<span style='font-size:0.7em;'>(게시글 신고로 삭제된 상태_열람은 가능)</span>");
					}
					
				}
				
				$(".block").on("click",function(){
		    		Swal.fire({
	    	            icon: 'warning',
	    	            title: '삭제 처리된 댓글입니다.'
	    	        })
					return false;
				})
				
				//페이지 
				
				if(replyList.length!=0){
	    			if(page.startPage!=1){
	    				$("#replyPage").append("<div class='movePage' id='replyPrevBtn'>Prev</div>");
	    			}else{
	    				$("#replyPage").append("<div class='movePage none' style='color:#d3d3d3'>Prev</div>")
	    			}
	    			for(let i=page.startPage;i<=page.endPage;i++){
	    				if(page.nowPage==i){
	    					$("#replyPage").append("<div class='nowPage replyPageBtn'>"+i+"</div>")	
	    				}else{
	    					$("#replyPage").append("<div class='nomalPage replyPageBtn'>"+i+"</div>")
	    				}
	    			}
	    			if(page.endPage<page.lastPage){
	    				$("#replyPage").append("<div class='movePage' id='replyNextBtn'>Next</div>");
	    			}else{
	    				$("#replyPage").append("<div class='movePage none' style='color:#d3d3d3'>Next</div>");
	    			}
	    			
	    			//페이지 이동
	        		$(".replyPageBtn").on("click",function(){
	            		let nowPage= $(this).text();
	            		writtenReply(email,nowPage)
	            	})
	            	
	            	//이전 페이지
	            	$("#replyPrevBtn").on("click",function(){
	        			let nowPage= page.startPage-1;
	        			writtenReply(email,nowPage)
	            	})
	 	          	//다음 페이지
	            	$("#replyNextBtn").on("click",function(){
	        			let nowPage= page.endPage+1;
	        			writtenReply(email,nowPage)
	            	})
				}
				
				
// 				<div class="reply">
// 				<div class="replyrow1">카테고리 · [원문] 본문 제목</div>
// 				<div class="replyrow2">댓글 내용</div>
// 				<div class="replyrow3">
// 					<span class="like">작성일 · <i class="bi bi-emoji-smile-fill"></i> 좋아요 수
// 					</span>
// 				</div>
// 			</div>	
			})
		}
		
		
		
		
		function getYear(date) {
		    return date.getFullYear();
		}

		function getMonth(date) {
		    return ('0' + (date.getMonth() + 1)).slice(-2);
		}

		function getDate(date) {
		    return ('0' + date.getDate()).slice(-2);
		}

		function getHour(date) {
		    return ('0' + date.getHours()).slice(-2); 
		}

		function getMin(date) {
		    return ('0' + date.getMinutes()).slice(-2);
		}

		function getSec(date) {
		    return ('0' + date.getSeconds()).slice(-2); 
		}

		function getTime(date) {
		    return getYear(date) + "-" +getMonth(date) + "-" + getDate(date);
		}

		function getFullTime(date) {
		    return getYear(date) + "-" +getMonth(date) + "-" + getDate(date) + " " + getHour(date) + ":" + getMin(date) + ":" + getSec(date);
		}
		
		
		
	</script>
<%-- 	<jsp:include page="/WEB-INF/views/common/pNav.jsp" /> --%>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
