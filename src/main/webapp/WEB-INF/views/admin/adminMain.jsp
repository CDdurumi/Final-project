<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!--  부트스트랩-->
<!-- css -->
<link rel="stylesheet" href="/css/admin/adminMain_AdminList.css">
<link rel="stylesheet" href="/css/admin/adminMain_ReportList.css">
<link rel="stylesheet" href="/css/admin/adminCommon.css">
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/pNav.jsp" />


	<div class="container mainContent">
		<div id="adminHeader">관리자 페이지</div>
		<hr id="boundaryLine">
<!-- 가로 탭 -->		
			<ul class="nav nav-pills nav-justified d-flex d-md-none" id="v-pills-tab2">
				<li class="nav-item"><a href="#adminMember-tab"><button class="nav-link tabs2" id="v-pills-adminMember-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-adminMember" type="button" role="tab" aria-controls="v-pills-adminMember" aria-selected="true">회원정보</button></a></li>
				<li id="cate1" class="nav-item"><details id="hDetail">
						<summary style="padding: 0px; font-size: 14px; margin-bottom: 20px;">신고관리</summary>
						<ul  class="subMenu">
							<li><a href="#report1-tab"><button class="nav-link tabs2 sub" id="v-pills-report1-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-report1" type="button" role="tab" aria-controls="v-pills-report1" aria-selected="true" style="color: #666666;">신고목록</button></a></li>
							<li><a href="#report2-tab"><button class="nav-link tabs2 sub" id="v-pills-report2-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-report2" type="button" role="tab" aria-controls="v-pills-report2" aria-selected="true" style="color: #666666;">블랙리스트</button></a></li>
						</ul>
					</details></li>
				<li class="nav-item"><a href="#dashBoard-tab"><button class="nav-link tabs2" id="v-pills-dashBoard-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-dashBoard" type="button" role="tab" aria-controls="v-pills-adminMember" aria-selected="true">대시보드</button></a></li>
			</ul>
		<div class="d-flex align-items-start">
<!-- 세로 탭-->
			<div class="nav flex-column nav-pills d-none d-md-flex" id="v-pills-tab" role="tablist" aria-orientation="vertical">
<!--첫번째 탭 : 회원정보 -->
				<a href="#adminMember-tab" class="firstDepthTab">
					<button class="nav-link tapUrl" id="v-pills-adminMember-tab" data-bs-toggle="pill" data-bs-target="#v-pills-adminMember" type="button" role="tab" aria-controls="v-pills-adminMember" aria-selected="true">회원정보관리</button>
				</a>
<!--두번째 탭 : 신고관리 -->
				<details id="vDetail">
					<summary class="navi-link firstDepthTab">신고관리</summary>
					<ul>
						<li class="reLi">
						<a href="#report1-tab">
								<button class="nav-link sub tapUrl" id="v-pills-report1-tab" data-bs-toggle="pill" data-bs-target="#v-pills-report1" type="button" role="tab" aria-controls="v-pills-report1" aria-selected="false">
									<div>신고목록</div>
								</button>
						</a></li>
						<li class="reLi">
						<a href="#report2-tab" >
								<button class="nav-link sub tapUrl" id="v-pills-report2-tab" data-bs-toggle="pill" data-bs-target="#v-pills-report2" type="button" role="tab" aria-controls="v-pills-report2" aria-selected="false">
									<div>블랙리스트</div>
								</button>
						</a></li>
					</ul>
				</details>
<!--세번째 탭 : 대시보드 -->
				<a href="#dashBoard-tab" class="firstDepthTab">
					<button class="nav-link tapUrl " id="v-pills-dashBoard-tab" data-bs-toggle="pill" data-bs-target="#v-pills-dashBoard" type="button" role="tab" aria-controls="v-pills-dashBoard" aria-selected="false">대시보드</button>
				</a>
			</div>
<!-- 탭 페이지 -->
			<div class="tab-content" id="v-pills-tabContents">
<!-- 첫번째 페이지 : 회원정보 -->
				<div class="tab-pane fade show active " id="v-pills-adminMember"
					role="tabpanel" aria-labelledby="v-pills-adminMember-tab">
					<div id="adminMemberContainer" class="row pc-ver-list">
						<div id="adminMemberTitle" class='col-12'>회원 정보 관리</div>
<!-- 						멤버 검색 -->
						<div id="MemberSearchBox" class="col-12">
						<div id="memberSearchCount"></div>
							<select id="memberSearchFilter" name="memberSearchFilter">
								<option value="all">전체</option>
								<option value="email">이메일</option>
								<option value="name">성명</option>
								<option value="nickname">닉네임</option>
							</select> 
							<input type="text" id="adminMemberSearch" placeholder="원하는 회원 검색">
							<input type="button" value="검색" id="memberSearchBtn">
						</div>
						<div id="adminMemberList">
							<div class="row" id="memberListHeaderContainer">
								<div class="col-1 memberListHeader" id="member_seq">번호</div>
								<div class="col-4 col-lg-3 memberListHeader">이메일</div>
								<div class="col-3 col-lg-1 memberListHeader">성명</div>
								<div class="col-2 col-lg-2 memberListHeader">닉네임</div>
								<div class="col-2 memberListHeader">회원등급</div>
								<div class="d-none d-lg-block col-lg-1  memberListHeader">신고수</div>
								<div class="d-none d-lg-block col-lg-2  memberListHeader">개설강의수</div>
							</div>
						</div>
						<div id="adminMemberListWrapper">
						
						</div>
						<div class="pageWrapper">
							<div class="page" id="memberPage">

							</div>
						</div>
					</div>				
				</div>
<!-- 두번째 페이지 : 신고관리 -->
				<div class="tab-pane fade" id="v-pills-report1" role="tabpanel" aria-labelledby="v-pills-report1-tab">
					<div id="reportContainer" class="row pc-ver-list">
						<div class="reportTitle" class='col-12'>신고목록</div>
<!-- 신고관리 카테고리 분류 -->
						<div class="reportHeaderBox" class="row">
							<div class="reportFilterBox col-5">
								<select id="reportFilter1" class="reportFilter">
									<option value="게시글">게시글</option>
									<option value="댓글">댓글</option>
									<option value="리뷰">리뷰</option>
								</select> <select id="reportFilter2" class="reportFilter">
									<option>클래스</option>
									<option>커뮤니티</option>
								</select>
							</div>
							<div class="reportSearchBox col-7">
								<select id="reportFilter3" class="reportFilter">
									<option value="작성자">작성자</option>
									<option value="제목">제목</option>
									<option value="내용">내용</option>
								</select> 
								<input type="text" id="report1_Search"> 
								<input type="button" value="검색" class="reportSearchBtn">
							</div>
						</div>
						<div class="reportList">
							<div class="row reportListHeaderContainer">
								<div class="reportListHeader reportListHeaderLeft">
									<input type="checkBox" id="reportList1AllCheck">
								</div>
								<div class="reportListHeaderRight">
									<div class="col-1 reportListHeader">번호</div>
									<div class="col-5 reportListHeader">제목</div>
									<div class="col-3 reportListHeader">작성자</div>
									<div class="col-3 reportListHeader">신고자</div>
<!-- 									<div class="col-2 reportListHeader">신고일자</div> -->
								</div>
							</div>
							<div class="reportListContainer">
								<div class="reportListName reportListLeft center">
									<input type="checkBox" class="listCheck">
								</div>
								<div class="reportListRight" class="row">
									<div class="col-1 reportListName center">1</div>
									<div class="col-5 reportListName">신고신고신ㅅ</div>
									<div class="col-3 reportListName">nay199@naver.com</div>
									<div class="col-3 reportListName">nay199@naver.com</div>
									<hr>
									<div class="col-7 reportListName center" id="reportReason">부적절한 홍보게시판</div>
									<div class="col-5 reportListName">신고일 : 22/06/22</div>
								</div>
							</div>
						</div>
						<div class="selectBtnsBottom col-12">
							<!-- adminMain-Repor.css -->
							<button class="selectBtn" id="selectBtn1">신고반려</button>
							<button class="selectBtn" id="selectBtn2">선택삭제</button>
							<button class="selectBtn" id="selectBtn2">모두삭제</button>
						</div>
						<div class="page">1 2 3 4 5 6 7 8 9 10 Next ></div>
					</div>
				</div>
<!-- 세번째 페이지 : 블랙리스트 -->
				<div class="tab-pane fade" id="v-pills-report2" role="tabpanel" aria-labelledby="v-pills-report2-tab">
					<div id="reportContainer" class="row pc-ver-list">
						<div class="reportTitle" class='col-12'>블랙리스트</div>
						<!-- 신고관리 카테고리 분류 -->
						<!-- 헤더는 신고목록 쪽과 비슷하게 가기 때문에 신고목록과 클래스 같이 씀 -->
						<div class="report2HeaderBox" class="row">
							<div class="reportSearchBox">
								<select id="reportFilter3" class="reportFilter">
									<option value="번호">번호</option>
									<option value="이메일">이메일</option>
									<option value="성명">성명</option>
									<option value="닉네임">닉네임</option>
								</select> 
								<input type="text" id="report2_Search"> 
								<input type="button" value="검색" class="reportSearchBtn">
							</div>
						</div>
						<div class="reportList">
							<div class="row reportListHeaderContainer">
								<div class="col-1 reportListHeader">
									<input type="checkBox" id="reportList2AllCheck">
								</div>
								<div class="col-1 reportListHeader">번호</div>
								<div class="col-4 reportListHeader">이메일</div>
								<div class="col-2 reportListHeader">성명</div>
								<div class="col-2 reportListHeader">닉네임</div>
								<div class="col-2 reportListHeader">신고횟수</div>
							</div>
							<div class="row reportListContainer report2ListContainer">
								<a href="/admin/memberReport">
									<div class="col-1 reportListName center">
									<input type="checkBox" id="listCheck">	
									</div>
									<div class="col-1 reportListName center">1</div>
									<div class="col-4 reportListName">nay199@naver.com</div>
									<div class="col-2 reportListName center">제리제리</div>
									<div class="col-2 reportListName center">모야야</div>
									<div class="col-2 reportListName center">2</div>
								</a>
							</div>
						</div>
					</div>
					<div class="selectBtnsBottom col-12">
						<!-- adminMain-Repor.css -->
						<button id="blackListCancelBtn">블랙리스트 해제</button>
					</div>
					<div class="page">1 2 3 4 5 6 7 8 9 10 Next ></div>
				</div>
				<div class="tab-pane fade" id="v-pills-dashBoard" role="tabpanel"
					aria-labelledby="v-pills-dashBoard-tab">대시보드</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/pNav.jsp" />
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
		

		
 //초기세팅  
    		let siteUrl = window.location.href.split("#").pop();
        	let tabs = $(".tapUrl"); //세로탭 메뉴들
        	let tabs2 = $(".tabs2"); //가로탭 메뉴들
        	let tabs_contents = $("#v-pills-tabContents").children(); // 컨텐츠틀   		
    		
        	setting(siteUrl); //사이트 접속 초기세팅
        	adminMemberTab('','','1')
        	window.onpopstate = function(event){
  		      resetTab();
  		      siteUrl = window.location.href.split("#").pop();
  		      setting(siteUrl);}
    	
    	
        	tabs.on("click",function(){   //세로탭 메뉴들 전체에 클릭시 이벤트
        		resetTab(); //선택된 탭 초기화
        	    $(this).addClass("active"); //클릭한 탭만 활성
        	    $("#cate1").css("margin-bottom","0px");
        	})
    		
    			
    	 tabs2.on("click",function(){   //가로탭 메뉴들 전체에 클릭시 이벤트
    		resetTab(); //선택된 탭 초기화
//    	 	$(this).children().addClass("active"); //클릭한 탭만 활성
    		tabs2.css("border-bottom","none"); 
    		$(this).css("border-bottom","4px solid #9381ff"); 
    		$("#cate1").css("margin-bottom","0px");

    	})
  			
    	
    	function setting(siteUrl){
    		if(siteUrl.split("-").length<2){
    			siteUrl= "adminMember-tab";
    		}
    	    $("#v-pills-"+siteUrl+"").addClass("active"); //url에 맞는 탭 활성화     
    	    
    	    if(siteUrl)
    	    $("#v-pills-"+siteUrl+"2").css("border-bottom","4px solid #9381ff");
    	    tabs_contents.removeClass("show active"); //부트스트랩 탭 컨텐츠 버그방지용 초기화
    	    $("#v-pills-"+siteUrl.split("-").shift()+"").addClass("show active"); // url에 맞는 컨텐츠 활성화
    	    window.scrollTo({top:0, left:0, behavior:'auto'}) 
    	
		      if(siteUrl.includes('report')){
		    	  document.getElementById("vDetail").open = true;
		    	  document.getElementById("hDetail").open = true;
		      }else{
		    	  document.getElementById("vDetail").open = false;
		    	  document.getElementById("hDetail").open = false;
		      }
    	}
        	
        	function resetTab(){ //선택된 탭 초기화	
        		tabs.removeClass("active");
//        	     tabs2.removeClass("active");
        	    tabs2.css("border-bottom","none"); 
        	}

        
    	//첫번째 페이지 : 회원정보 불러오기
    	function adminMemberTab(targetType,target,nowPage){
    		
			$("#adminMemberListWrapper").text('');
			$("#memberPage").text('');
			$("#memberSearchCount").text('');
    		if(nowPage==''){
        		nowPage=1;
    		}

    		$.ajax({
    			url:"/admin/memberList",
	    		data:{'nowPage':nowPage,'targetType':targetType,'target':target},
	    		dataType:'json'
    		}).done(function(data){
    			let mList = JSON.parse(data[0]); //회원 리스트
    			console.log(mList)
    			let rNcCountList = JSON.parse(data[1]); //회원 신고수, 강의개설수
    			let page = JSON.parse(data[2]); // 페이지
				let total = data[3];
    			
    			//총 검색 수 불러오기
    			$("#memberSearchCount").append("총 "+total+"개의 글")
    			//회원 리스트 불러오기
    			for(let i=0;i<mList.length;i++){
    				let memberLink = $("<a href='/admin/memberPage?email="+mList[i].email+ "'class='memberLink'>")
    				let listContainer = $("<div class='row' id='memberListContainer'>");
    				listContainer.append("<div class='col-1 memberListName center' id='member_seq'>"+((page.nowPage-1)*page.cntPerPage+i+1)+"</div>");
    				listContainer.append("<div class='col-4 col-lg-3 memberListName center' id='email'>"+mList[i].email+"</div>");
    				listContainer.append("<div class='col-3 col-lg-1 memberListName center'>"+mList[i].name+"</div>");
    				listContainer.append("<div class='col-2 col-lg-2 memberListName'>"+mList[i].nickname+"</div>");
    				listContainer.append("<div class='col-2 memberListName'>"+mList[i].type+"</div>");
    				listContainer.append("<div class='d-none d-lg-block col-lg-1  memberListName center'>"+rNcCountList[i].reportCount+"</div>");
    				listContainer.append("<div class='d-none d-lg-block col-lg-2 memberListName center'>"+rNcCountList[i].openClassCount+"</div>");		
    				memberLink.append(listContainer);
    				$("#adminMemberListWrapper").append(memberLink)
    			}
    			//페이지
    			if(page.startPage!=1){
    				$("#memberPage").append("<div class='movePage' id='memberPrevBtn'>Prev</div>");
    			}else{
    				$("#memberPage").append("<div class='movePage none' style='color:#d3d3d3'>Prev</div>")
    			}
    			for(let i=page.startPage;i<=page.endPage;i++){
    				if(page.nowPage==i){
    					$("#memberPage").append("<div class='nowPage memberPageBtn'>"+i+"</div>")	
    				}else{
    					$("#memberPage").append("<div class='nomalPage memberPageBtn'>"+i+"</div>")
    				}
    			}
    			if(page.endPage<page.lastPage){
    				$("#memberPage").append("<div class='movePage' id='memberNextBtn'>Next</div>");
    			}else{
    				$("#memberPage").append("<div class='movePage none' style='color:#d3d3d3'>Next</div>");
    			}
				
    			//페이지 이동
        		$(".memberPageBtn").on("click",function(){
            		let nowPage= $(this).text();
            		adminMemberTab(targetType,target,nowPage)
            	})
            	
            	//이전 페이지
            	$("#memberPrevBtn").on("click",function(){
        			let nowPage= page.startPage-1;
            		adminMemberTab(targetType,target,nowPage)
            	})
 	          	//다음 페이지
            	$("#memberNextBtn").on("click",function(){
        			console.log(page.endPage)
        			let nowPage= page.endPage+1;
            		adminMemberTab(targetType,target,nowPage)
            	})
    		})
    		

    	}
    	
    	
		
//     	//회원정보 검색
    	$("#memberSearchBtn").on("click",function(){
    		
    		let targetType = $(this).prev().prev().val();//검색 카테고리
    		let target = $(this).prev().val()//검색어
    		$(this).prev().val('')
			adminMemberTab(targetType,target,'');
    	})
    	
    	
    </script>
</body>
</html>    	