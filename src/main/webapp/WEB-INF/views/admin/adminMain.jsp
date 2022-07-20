<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="icon" type="image/png" sizes="32x32" href="/img/favicon/favicon-32x32.png">
<title>[DOWA] 관리자 페이지</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, width=device-width, target-densityDpi=medium-dpi">

 
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- chart.js -->
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/Chart.js/0.2.0/Chart.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<!-- <script src="//code.jquery.com/jquery-1.11.1.min.js"></script> -->
<!-- <script src="//cdnjs.cloudflare.com/ajax/libs/Chart.js/0.2.0/Chart.min.js"></script> -->
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
				<li class="nav-item adminTabBtn"><a href="#adminMember-tab"><button class="nav-link tabs2" id="v-pills-adminMember-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-adminMember" type="button" role="tab" aria-controls="v-pills-adminMember" aria-selected="true">회원정보</button></a></li>
				<li id="cate1" class="nav-item"><details id="hDetail">
						<summary style="padding: 0px; font-size: 14px; margin-bottom: 20px;">신고관리</summary>
						<ul  class="subMenu">
							<li><a href="#report1-tab" class="reportListTabBtn"><button class="nav-link tabs2 sub" id="v-pills-report1-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-report1" type="button" role="tab" aria-controls="v-pills-report1" aria-selected="true" style="color: #666666;">신고목록</button></a></li>
							<li><a href="#report2-tab"><button class="nav-link tabs2 sub" id="v-pills-report2-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-report2" type="button" role="tab" aria-controls="v-pills-report2" aria-selected="true" style="color: #666666;">블랙리스트</button></a></li>
						</ul>
					</details></li>
				<li class="nav-item"><a href="#dashBoard-tab"><button class="nav-link tabs2" id="v-pills-dashBoard-tab2" data-bs-toggle="pill" data-bs-target="#v-pills-dashBoard" type="button" role="tab" aria-controls="v-pills-adminMember" aria-selected="true">대시보드</button></a></li>
			</ul>
		<div class="d-flex align-items-start">
<!-- 세로 탭-->
			<div class="nav flex-column nav-pills d-none d-md-flex" id="v-pills-tab" role="tablist" aria-orientation="vertical">
<!--첫번째 탭 : 회원정보 -->
				<a href="#adminMember-tab" class="firstDepthTab adminTabBtn">
					<button class="nav-link tapUrl" id="v-pills-adminMember-tab" data-bs-toggle="pill" data-bs-target="#v-pills-adminMember" type="button" role="tab" aria-controls="v-pills-adminMember" aria-selected="true">회원정보관리</button>
				</a>
<!--두번째 탭 : 신고관리 -->
				<details id="vDetail">
					<summary class="navi-link firstDepthTab">신고관리</summary>
					<ul>
						<li class="reLi">
						<a href="#report1-tab" class="reportListTabBtn">
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
			
						<div id="MemberSearchBox" class="row">						
						<div class="memberSearchCount col-12 d-lg-none" id="mCount"></div>
						<div class="memberSearchCount d-none d-lg-block" id="PCount"></div>
						<div class="selectWrapper">
							<select id="memberSearchFilter" name="memberSearchFilter" class="selectA">
								<option value="all" class="optionA">전체</option>
								<option value="email" class="optionA">이메일</option>
								<option value="name" class="optionA">성명</option>
								<option value="nickname" class="optionA">닉네임</option>
							</select>
							<input type="text" id="adminMemberSearch" placeholder="회원 검색">
							<input type="button" value="검색" id="memberSearchBtn">
							</div> 
						</div>
						<div id="adminMemberList">
							<div class="row" id="memberListHeaderContainer">
								<div class="col-1 d-none d-lg-block  memberListHeader" id="member_seq">번호</div>
								<div class="col-4 col-lg-3 memberListHeader">이메일</div>
								<div class="col-2 col-lg-2 memberListHeader">성명</div>
								<div class="col-3 col-lg-2 memberListHeader">닉네임</div>
								<div class="col-3  col-lg-2  memberListHeader">등급</div>
								<div class="d-none d-lg-block col-lg-1  memberListHeader">신고수</div>
								<div class="d-none d-lg-block col-lg-1  memberListHeader">강의수</div>
							</div>
						</div>
						<div id="adminMemberListWrapper">
<!-- 						회원정보 리스트 -->
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
							<div class="reportFilterBox col-12 col-lg-5">
								<select id="reportFilter1" class="reportFilter" onchange="chageLangSelect()">
									<option value="게시글">게시글</option>
									<option value="댓글">댓글</option>
									<option value="리뷰">리뷰</option>
								</select> 
								<select id="reportFilter2" class="reportFilter" onchange="chageLangSelect2()">
									<option value="재능마켓">재능마켓</option>
									<option value="커뮤니티">커뮤니티</option>
								</select>
								<label for="notResol" style="cursor:pointer" id="notResolve"><input type="checkbox" id="notResol" onchange="notResol()" />미처리건만</label>
							</div>
							<div class="reportSearchBox col-12 col-lg-7">
								<select id="reportFilter3" class="reportFilter">
									<option value="제목" id="filter1">제목</option>
									<option value="작성자">작성자</option>
									<option value="신고자">신고자</option>
								</select> 
								<input type="text" id="report1_Search"> 
								<input type="button" value="검색" class="reportSearchBtn" onclick="saerchReport()">
							</div>
						</div>
						<div class="reportList">
							<div class="row reportListHeaderContainer">
								<div class="reportListHeader reportListHeaderLeft">
									<input type="checkBox" id="reportList1AllCheck" value="selectAll" name="reportListCheck" onclick="selectAll(this)">
								</div>
								<div class="reportListHeader" id="report1Headerseq">번호</div>
								<div class="reportListHeaderRight">
									<div class="col-6 reportListHeader" id="reportListTitle">제목</div>
									<div class="col-3 reportListHeader">작성자</div>
									<div class="col-3 reportListHeader">신고자</div>
<!-- 								<div class="col-2 reportListHeader">신고일자</div> -->
								</div>
							</div>
							<div class="reportListBigContainer">
							</div>
						</div>
						<div class="selectBtnsBottom col-12">
							<span id ='ListSearchCount'></span>
							<!-- adminMain-Repor.css -->
							<button class="selectBtn" id="selectBtn1" onclick="reportReject()">신고반려</button>
							<button class="selectBtn" id="selectBtn2" onclick="selectDelete()">선택삭제</button>
							<button class="selectBtn" id="selectBtn3">모두삭제</button>
						</div>
						<div class="pageWrapper">
							<div class="page" id="reportListPage">

							</div>
						</div>
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
							<span id="blackListDetail">블랙리스트 또는 신고수가 10건 이상인 회원</span>
								<select id="reportFilter4" class="reportFilter">
									<option value="이메일">이메일</option>
									<option value="성명">성명</option>
									<option value="닉네임">닉네임</option>
								</select> 
								<input type="text" id="report2_Search"> 
								<input type="button" value="검색" class="reportSearchBtn" onclick = "blackListSearch()">
							</div>
						</div>
						<div class="reportList">
							<div class="row reportListHeaderContainer">
								<div class="col-1 reportListHeader">
									<input type="checkBox" id="reportList2AllCheck" name="blackListCheck" onclick="blackListSelectAll(this)" value="selectAll">
								</div>
								<div class="col-1 reportListHeader">번호</div>
								<div class="col-3 reportListHeader">이메일</div>
								<div class="col-2 reportListHeader">성명</div>
								<div class="col-2 reportListHeader">닉네임</div>
								<div class="col-2 reportListHeader blackMemberType">회원등급</div>
								<div class="col-1 reportListHeader ">신고수</div>
							</div>
							<div id = "blackListBigContainer">

							</div>
						</div>
					</div>
					<div class="selectBtnsBottom col-12">
						<span id="blackListCount"></span>
						<!-- adminMain-Repor.css -->
						<button id="blackListRegBtn" class="blackListBtn" onclick="blackListReg()">블랙리스트 등록</button>
						<button id="blackListCancelBtn" class="blackListBtn" onclick="blackListCancel()">블랙리스트 해제</button>
					</div>
				<div class="pageWrapper">
							<div class="page" id="blackListPage">

							</div>
						</div>
				</div>
				<div class="tab-pane fade" id="v-pills-dashBoard" role="tabpanel"
					aria-labelledby="v-pills-dashBoard-tab">
					<div>
						<div style="width:95% ; margin:auto; margin-top:10px; border:1px solid black" >
<!--방문자 현황-->	
						<canvas id="myChart"></canvas>
				    
				    	</div>
				   		
				   		<div style=" width:95%; height: 300px; border:1px solid black; margin:auto; margin-top:10px;" > 
<!--요약-->

				    	</div>
				    	<div class="row" style=" width:95%; height: 300px; border:1px solid black; margin:auto; margin-top:10px;" > 
<!--재능마켓-->			<div style="position: relative; width:50%; height:100%">
							<canvas id="myChart2"></canvas>
						</div>	
						<div style="position: relative; width:50%; height:100%">
							<canvas id="myChart3"></canvas>
						</div>				
				    	</div>
				   		<div class="row" style=" width:95%; height: 300px; border:1px solid black; margin:auto; margin-top:10px;" > 
<!--클래스-->				<div style="position: relative; width:50%; height:100%">
							<canvas id="myChart4"></canvas>
						</div>	
						<div style="position: relative; width:50%; height:100%">
							<canvas id="myChart5"></canvas>
						</div>		
				    	</div>
				    </div>
					</div>
			</div>
		</div>
	</div>
<%-- 	<jsp:include page="/WEB-INF/views/common/pNav.jsp" /> --%>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
	
	
	<script>
		

		
 //초기세팅
 //탭 세팅 변수들
    		let siteUrl = window.location.href.split("#").pop();
        	let tabs = $(".tapUrl"); //세로탭 메뉴들
        	let tabs2 = $(".tabs2"); //가로탭 메뉴들
        	let tabs_contents = $("#v-pills-tabContents").children(); // 컨텐츠틀   		
 //2번째 페이지 - 신고목록 변수들       	
        	let reportFilter1 = $("#reportFilter1").val();
        	let reportFilter2 = $("#reportFilter2").val();
        	let reportFilter3 = $("#reportFilter3").val();
        	let report1_Search = null;//검색어
        	let reportResolCheck = '전체'; //전체, 미처리 건으로 보기 설정 위한 변수
			let reportListCount = null; //신고 출력 건수
        	let notDeletedReport = 0;//삭제 안된 신고 건수
        	
      		$("#reportFilter1").val('게시글');
    		$("#reportFilter2").val('재능마켓');
 
        	setting(siteUrl); //사이트 접속 초기세팅
        	
        	window.onpopstate = function(event){
  		      resetTab();
  		      siteUrl = window.location.href.split("#").pop();
      		$("#reportFilter1").val('게시글');
    		$("#reportFilter2").val('재능마켓');
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
    	    
    	    if(siteUrl=="adminMember-tab"){
    	    	adminMemberTab('','','1');
    	    }else if(siteUrl=="report1-tab"){
    	    	reportListTab('게시글','재능마켓','제목','',1,'전체');
        		$("#reportFilter1").val('게시글');
        		$("#reportFilter2").val('재능마켓');
        		$("#reportFilter2").removeAttr('disabled');
        		$("#report1_Search").val('');
    	    }else if(siteUrl=="report2-tab"){
    	    	blackListTab('','',1);
    	    	$("#report2_Search").val('');
    	    }
    	}
        	
        	function resetTab(){ //선택된 탭 초기화	
        		tabs.removeClass("active");
//        	     tabs2.removeClass("active");
        	    tabs2.css("border-bottom","none"); 
        	}

        
//첫번째 페이지 : 회원정보 불러오기 ------------------------------------------------------------------------
    	
    	function adminMemberTab(targetType,target,nowPage){
    		
			$("#adminMemberListWrapper").text('');
			$("#memberPage").text('');
			$(".memberSearchCount").text('');
    		if(nowPage==''){
        		nowPage=1;
    		}

    		$.ajax({
    			url:"/admin/memberList",
	    		data:{'nowPage':nowPage,'targetType':targetType,'target':target},
	    		dataType:'json'
    		}).done(function(data){
    			let mList = JSON.parse(data[0]); //회원 리스트
    			let rNcCountList = JSON.parse(data[1]); //회원 신고수, 강의개설수
    			let page = JSON.parse(data[2]); // 페이지
				let total = data[3];
    			
    			//총 검색 수 불러오기
    			$(".memberSearchCount").text("총 "+total+" 명의 회원이 있습니다.")
    			//회원 리스트 불러오기
    			for(let i=0;i<mList.length;i++){
    				let memberLink = $("<a href='/admin/memberPage?email="+mList[i].email+ "'class='memberLink'>")
    				let listContainer = $("<div class='row' id='memberListContainer'>");
    				listContainer.append("<div class='col-1 d-none d-lg-block memberListName center' id='member_seq'>"+((page.nowPage-1)*page.cntPerPage+i+1)+"</div>");
    				listContainer.append("<div class='col-4 col-lg-3 memberListName' id='email'>"+mList[i].email+"</div>");
    				listContainer.append("<div class='col-2 col-lg-2 memberListName center'>"+mList[i].name+"</div>");
    				listContainer.append("<div class='col-3 col-lg-2 memberListName'>"+mList[i].nickname+"</div>");
    				listContainer.append("<div class='col-3 col-lg-2 memberListName'>"+mList[i].type+"</div>");
    				listContainer.append("<div class='d-none d-lg-block col-lg-1  memberListName center'>"+rNcCountList[i].reportCount+"</div>");
    				listContainer.append("<div class='d-none d-lg-block col-lg-1 memberListName center'>"+rNcCountList[i].openClassCount+"</div>");		
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
        			let nowPage= page.endPage+1;
            		adminMemberTab(targetType,target,nowPage,reportResolCheck)
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
    	
    	
//두번째 페이지 : 신고 목록-------------------------------------------------------------------
		
    	//신고 리스트 출력
    	function reportListTab(reportFilter1,reportFilter2,reportFilter3,report1_Search,nowPage,reportResolCheck){
    		
    		$(".reportListBigContainer").text('')
    		$("#reportListPage").text('');
			$("#reportListCount").text('');
			$("#ListSearchCount").text('');
			$("input[name=reportListCheck]").prop("checked", false);
			
    		//페이지 정보가 없는 경우 1페이지로 하기
    		if(nowPage==''){
    			nowPage=1;
    		}		
    		//각 필터, 검색 카테고리, 검색어, 현재페이지 담기
//     		let param = {"reportFilter1":reportFilter1,"reportFilter2":reportFilter2,"reportFilter3":reportFilter3,"report1_Search":report1_Search,"nowPage":nowPage,"reportResolCheck":reportResolCheck};
    		
    		$.ajax({
    			type : "post",
    			url:"/admin/reportList",
    			data:{"reportFilter1":reportFilter1,"reportFilter2":reportFilter2,"reportFilter3":reportFilter3,"report1_Search":report1_Search,"nowPage":nowPage,"reportResolCheck":reportResolCheck},
    			dataType:'json' 		
    		}).done(function(data){
    			let page = JSON.parse(data[0]);
    			let reportList = JSON.parse(data[1]);
    			reportListCount = data[2];
//     			let writerNreporter =JSON.parse(data[3]);
    			notDeletedReport = data[3]
    			let boardNclass_seq = JSON.parse(data[4])
    			let toHref = null;//글 성격에 따른 경로 담기
    			
    			
    			console.log("보드 : " + boardNclass_seq)
    			
    			for(let i=0;i<reportList.length;i++){
    				//신고일 형식 변환
    				let date = new Date(reportList[i].REPORT_DATE);
					let report_date = getTime(date);
					let parent_seq = reportList[i].PARENT_SEQ;
					let board_seq = boardNclass_seq[i];
					let isblock = 'nonblock';
					
					//parent_seq에 따라 href 바꾸기
					if(parent_seq.startsWith('c') & !parent_seq.startsWith('cr') ){
						toHref = '/class/detail?class_seq='+parent_seq;
						
					}else if(parent_seq.startsWith('cr')){
						if(reportList[i].state=='삭제'){
							toHref="#report1-tab";
							isblock = 'block';
						}else{
							toHref = '/class/detail?class_seq='+board_seq+"#createrInfo";
						}
					}else if(parent_seq.startsWith('r')){
						if(reportList[i].state=='삭제'){
							toHref="#report1-tab";
							isblock = 'block';
						}else{
							toHref = '/community/detailView?seq='+board_seq+"#replyInputArea";							
						}
					}else{
						toHref = '/community/detailView?seq='+parent_seq;
					}
					console.log(toHref);
    				//리스트 뽑기
    				
    				let reportListContainer = $("<div class='reportListContainer'>")
    				let reportListLeft1 = $("<div class='reportListName reportListLeft center' id='reportListLeft1'>");
    				let reportListLeft2 = $("<div reportListName center' id='report1seq'>"+((page.nowPage-1)*page.cntPerPage+i+1)+"</div>");
    				let Report1Check = $("<input type='checkBox' class='listCheck' id='Report1Check' name='reportListCheck' value="+reportList[i].report_seq+" ><input type='hidden' value='"+reportList[i].state+"'>");
    				let reportToLink = $("<a href='"+toHref+"' class='toBoard "+isblock+"'>")
    				let reportListRight = $("<div class='reportListRight' id='reportListRight1'>");
    				reportListRight.append("<div class='col-6 reportListName' id='reportContents' style='padding-left :30px'>"+reportList[i].CONTENTS+"</div>");
    				reportListRight.append("<div class='col-3 reportListName center'>"+reportList[i].WRNICK+"</div>");
    				reportListRight.append("<div class='col-3 reportListName center'>"+reportList[i].RENICK+"</div>");
    				reportListRight.append("<div class='col-5 reportListName center' id='reportReason'>"+reportList[i].REASON+"</div>");
    				reportListRight.append("<div class='col-4 reportListName'>신고일 : "+reportList[i].RDATE+"</div>");
    				reportListRight.append("<div class='col-3 reportListName reportState'> 상태 : "+reportList[i].STATE+"</div>");
    				
					
    				
    				
    				//리스트 붙이기
    				reportListLeft1.append(Report1Check);
    				reportListContainer.append(reportListLeft1);
    				reportListContainer.append(reportListLeft2);
    				reportToLink.append(reportListRight); 				
    				reportListContainer.append(reportToLink);
    				$(".reportListBigContainer").append(reportListContainer);
    				
    			}
    					
// 				<div class="reportListContainer">
// 				<div class="reportListName reportListLeft center" id="reportListLeft1">
// 					<input type="checkBox" class="listCheck" id="Report1Check">
// 				</div>
// 				<div class="reportListRight" class="row">
//				<a>
// 					<div class="col-1 reportListName center">1</div>
// 					<div class="col-5 reportListName">신고신고신ㅅ</div>
// 					<div class="col-3 reportListName">nay199@naver.com</div>
// 					<div class="col-3 reportListName">nay199@naver.com</div>
// 					<hr>
// 					<div class="col-7 reportListName center" id="reportReason">부적절한 홍보게시판</div>
// 					<div class="col-5 reportListName">신고일 : 22/06/22</div>
// 				</a>		
//			</div>
// 			</div>
    				
    			//삭제된 리뷰나 댓글 클릭 시	 block처리
				$(".block").on("click",function(){
		    		Swal.fire({
	    	            icon: 'warning',
	    	            title: '삭제 처리된 댓글 또는 리뷰입니다.'
	    	        })
					return false;
				})
    			
    			//신고건 붙이기
    			$("#ListSearchCount").append("총 " + reportListCount +"건이 있습니다.");
    			//페이지
    			if(page.startPage!=1){
    				$("#reportListPage").append("<div class='movePage' id='reportListPrevBtn'>Prev</div>");
    			}else{
    				$("#reportListPage").append("<div class='movePage none' style='color:#d3d3d3'>Prev</div>")
    			}
    			for(let i=page.startPage;i<=page.endPage;i++){
    				if(page.nowPage==i){
    					$("#reportListPage").append("<div class='nowPage reportListPageBtn'>"+i+"</div>")	
    				}else{
    					$("#reportListPage").append("<div class='nomalPage reportListPageBtn'>"+i+"</div>")
    				}
    			}
    			if(page.endPage<page.lastPage){
    				$("#reportListPage").append("<div class='movePage' id='reportListNextBtn'>Next</div>");
    			}else{
    				$("#reportListPage").append("<div class='movePage none' style='color:#d3d3d3'>Next</div>");
    			}
				
    			//페이지 이동
        		$(".reportListPageBtn").on("click",function(){
            		let nowPage= $(this).text();
            		reportListTab(reportFilter1,reportFilter2,reportFilter3,report1_Search,nowPage,reportResolCheck)
            	})
            	
            	//이전 페이지
            	$("#reportListPrevBtn").on("click",function(){
        			let nowPage= page.startPage-1;
        			reportListTab(reportFilter1,reportFilter2,reportFilter3,report1_Search,nowPage,reportResolCheck)
            	})
 	          	//다음 페이지
            	$("#reportListNextBtn").on("click",function(){
        			let nowPage= page.endPage+1;
        			reportListTab(reportFilter1,reportFilter2,reportFilter3,report1_Search,nowPage,reportResolCheck)
            	})  			
    		})
    	}
    	
    	//신고리스트 첫번째 필터 변경 시 이벤트
    	function chageLangSelect(){
    		
    		report1_Search = '';
    		$("#report1_Search").val('');
    		reportFilter1=$("#reportFilter1").val();
    		if(reportFilter1=='댓글'){			
    			$("#reportFilter2").val('커뮤니티');
    			$("#reportFilter2").attr('disabled','true');
    			$("#filter1").html('내용');
    			$("#reportListTitle").text('내용');
    			reportFilter2 = '커뮤니티';
	}
    		else if(reportFilter1=='게시글'){    			
    			$("#reportFilter2").val('재능마켓');
    			$("#reportFilter2").removeAttr('disabled');
    			$("#filter1").html('제목');
    			$("#reportListTitle").text('제목');
    			reportFilter2 = '재능마켓';
    		}else if(reportFilter1=='리뷰'){
    			$("#reportFilter2").val('재능마켓');
    			$("#reportFilter2").attr('disabled','true');
    			$("#filter1").html('내용');
    			$("#reportListTitle").text('내용');
    			reportFilter2 = '재능마켓';
    		}
    		
			reportListTab(reportFilter1,reportFilter2,reportFilter3,report1_Search,1,reportResolCheck)	
	    	
    	}
    	
    	
    	//신고리스트 두번째 필터 변경 시 이벤트
    	function chageLangSelect2(){
    		//검색어 초기화
    		report1_Search = '';
    		$("#report1_Search").val('');
    		//두번째 필터 값 넣기
    		reportFilter2=$("#reportFilter2").val();
			reportListTab(reportFilter1,reportFilter2,reportFilter3,report1_Search,1,reportResolCheck)	

    	}
    	
    	//신고리스트 검색 버튼 클릭 시 이벤트
    	function saerchReport(){
          	reportFilter3 = $("#reportFilter3").val();		
        	report1_Search = $("#report1_Search").val();
        	$("#report1_Search").val('');
        	reportListTab(reportFilter1,reportFilter2,reportFilter3,report1_Search,1,reportResolCheck)	
    	}
    	
    	//신고 리스트 전체 선택 시 
		function selectAll(selectAll)  {
		  let checkboxes 
		       = document.getElementsByName('reportListCheck');
		  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked;
		  })
		}
    	
    	// 미처리건만 선택 시
		function notResol(){
			var checked = $('#notResol').is(':checked');
			
			if(checked){
				reportResolCheck = '미처리';
				reportListTab(reportFilter1,reportFilter2,reportFilter3,report1_Search,1,reportResolCheck)	
			}else{
				reportResolCheck = '전체';
				reportListTab(reportFilter1,reportFilter2,reportFilter3,report1_Search,1,reportResolCheck)	
			}
    		
    	}    	
    	
    	//선택 반려
    	function reportReject(){
    		let rejectTarget = [];// 반려 대상 넣을 배열
    		let rejectCount = 0; // 총 반려건수
    		let rejeced = 0 ; //현재 반려되어 있는 건수
    		let state = null;
    		 $("input:checkbox[name='reportListCheck']:checked").each(function(){			
    			 state = $(this).next().val();
    			 if(state=='반려'){
    				 rejeced++;
    			 } 			 
    			 rejectTarget.push($(this).val());// 체크된 것만 값을 뽑아서 배열에 push
       			 console.log(rejeced);	
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
      	    							reportListTab(reportFilter1,reportFilter2,reportFilter3,report1_Search,1,reportResolCheck);	
      	    				    		Swal.fire({
      	    			    	            title: '반려가 완료되었습니다.'
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
    	
    	//선택 대상 삭제
    	function selectDelete(){
    		let rejectTarget = [];// 삭제 대상 넣을 배열
    		let rejectCount = 0; // 총 삭제건수
    		let rejeced = 0 ; //현재 삭제되어 있는 건수
    		let state = null;
    		
    		 $("input:checkbox[name='reportListCheck']:checked").each(function(){
    			 state = $(this).next().val();
    			 if(state=='삭제'){
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
      	    							reportListTab(reportFilter1,reportFilter2,reportFilter3,report1_Search,1,reportResolCheck);	
      	    				    		Swal.fire({
      	    			    	            title: '삭제가 완료되었습니다.'
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
    	
    	function deleteAllReport(reportFilter1,reportFilter2,reportFilter3,report1_Search,nowPage,reportResolCheck){

    		Swal.fire({
 			        title: "총 " + notDeletedReport + "건을 삭제하시겠습니까?",
 			        showCancelButton: true,
 			        confirmButtonColor: '#9381FF',
 			        cancelButtonColor: '#D9D9D9',
 			        confirmButtonText: '확인',
 			        cancelButtonText: '취소',
   				 }).then((result) =>{
   					 if (result.isConfirmed){
   						 $.ajax({
   							type:'post',
   						 	url:"/admin/deleteAllReport",
   						 	data:{"reportFilter1":reportFilter1,"reportFilter2":reportFilter2,"reportFilter3":reportFilter3,"report1_Search":report1_Search,"nowPage":nowPage,"reportResolCheck":reportResolCheck}
   						 }).done(function(){
   							reportListTab(reportFilter1,reportFilter2,reportFilter3,report1_Search,1,reportResolCheck);	
  				    		Swal.fire({
  			    	            title: '삭제가 완료되었습니다.'
  			    	        })
   						 })
   					 }
   				 })
    		
    	}
    	
    	//전체 삭제 이벤트
    	$("#selectBtn3").on("click",function(){
    		deleteAllReport(reportFilter1,reportFilter2,reportFilter3,report1_Search,1,reportResolCheck);		  
    		  	})
//세번째 페이지 : 블랙리스트------------------------------------------------------
		function blackListTab(targetType,target,nowPage){
			$("#blackListBigContainer").text('');
			$("#blackListPage").text('');
			$("input[name=blackListCheck]").prop("checked", false);
			$.ajax({
				type:"post",
				url:"/admin/blackList",
				data:{"targetType":targetType,"target":target,"nowPage":nowPage},
				dataType:"json"
			}).done(function(data){
				let page = JSON.parse(data[0]);
				let blackListMember = JSON.parse(data[1]);
				let totalBlackList = data[2];
				let toBlackLink = null
				
				for(let i=0;i<blackListMember.length;i++){
					
					toBlackLink = '/admin/memberReport?email='+blackListMember[i].EMAIL
					
					let report2ListContainer = $("<div class='row reportListContainer report2ListContainer'>");
					let blackListToLink = $("<a href='"+toBlackLink+"'>");
					let checkBox = $("<div class='col-1 reportListName center'><input type='checkBox' value='"+blackListMember[i].EMAIL+"' name='blackListCheck'><div>")
					let number = $("<div class='col-1 reportListName center'>"+((page.nowPage-1)*page.cntPerPage+i+1)+"</div>")
					let email = $("<div class='col-3 reportListName'>"+blackListMember[i].EMAIL+"</div>")
					let name = $("<div class='col-2 reportListName center'>"+blackListMember[i].NAME+"</div>")
					let nickname = $("<div class='col-2 reportListName center'>"+blackListMember[i].NICKNAME+"</div>")
					let type = $("<div class='col-2 reportListName center blackMemberType'>"+blackListMember[i].TYPE+"</div>")
					let count = $("<div class='col-1 reportListName center'>"+blackListMember[i].REPORT_COUNT+"</div>")
					
					blackListToLink.append(checkBox);
					blackListToLink.append(number);
					blackListToLink.append(email);
					blackListToLink.append(name);
					blackListToLink.append(nickname);
					blackListToLink.append(type);
					blackListToLink.append(count);
					report2ListContainer.append(blackListToLink)
					
					$("#blackListBigContainer").append(report2ListContainer);
					}
				
// 				<div class="row reportListContainer report2ListContainer">
// 				<a href="/admin/memberReport">
// 					<div class="col-1 reportListName center">
// 					<input type="checkBox" id="listCheck">	
// 					</div>
// 					<div class="col-1 reportListName center">1</div>
// 					<div class="col-4 reportListName">nay199@naver.com</div>
// 					<div class="col-2 reportListName center">제리제리</div>
// 					<div class="col-2 reportListName center">모야야</div>
// 					<div class="col-2 reportListName center">2</div>
// 				</a>
// 			</div>
				//검색 수
				
				$("#blackListCount").text("총 " + totalBlackList + "건이 있습니다.")
				
    			//페이지
    			if(page.startPage!=1){
    				$("#blackListPage").append("<div class='movePage' id='blackListPrevBtn'>Prev</div>");
    			}else{
    				$("#blackListPage").append("<div class='movePage none' style='color:#d3d3d3'>Prev</div>")
    			}
    			for(let i=page.startPage;i<=page.endPage;i++){
    				if(page.nowPage==i){
    					$("#blackListPage").append("<div class='nowPage blackListPageBtn'>"+i+"</div>")	
    				}else{
    					$("#blackListPage").append("<div class='nomalPage blackListPageBtn'>"+i+"</div>")
    				}
    			}
    			if(page.endPage<page.lastPage){
    				$("#blackListPage").append("<div class='movePage' id='blackListNextBtn'>Next</div>");
    			}else{
    				$("#blackListPage").append("<div class='movePage none' style='color:#d3d3d3'>Next</div>");
    			}
				
    			//페이지 이동
        		$(".blackListPageBtn").on("click",function(){
            		let nowPage= $(this).text();
            		 blackListTab(targetType,target,nowPage)
            	})
            	
            	//이전 페이지
            	$("#blackListPrevBtn").on("click",function(){
        			let nowPage= page.startPage-1;
        			 blackListTab(targetType,target,nowPage)
            	})
 	          	//다음 페이지
            	$("#blackListNextBtn").on("click",function(){
        			let nowPage= page.endPage+1;
        			 blackListTab(targetType,target,nowPage)
            	})  		
				
			})
			}
    		  	
 			//블랙리스트 검색하기
 			function blackListSearch(){
 				targetType= $("#reportFilter4").val();
 				target = $("#report2_Search").val();
 				blackListTab(targetType,target,1);
 			}
 			
 			//블랙 리스트 전체 선택 시
 		function blackListSelectAll(blackListCheckAll)  {
		  let checkboxes 
		       = document.getElementsByName('blackListCheck');
		  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = blackListCheckAll.checked;
		  })
		}
    	

 			//블랙리스트 해제하기
 			function blackListCancel(){
 	    		let cancelTarget = [];// 해제 대상 넣을 배열
 	    		let targetCount = 0; // 총 해제 대상
 	    		let notBlack = 0 ; //블랙리스트 아닌 경우(해제 대상 아님)
 	    		let type = null;
 	    		
 	    		 $("input:checkbox[name='blackListCheck']:checked").each(function(){
 	    			 type = $(this).parent().siblings('.blackMemberType').text();
 	    			 if(type=='블랙리스트'){
 	    				cancelTarget.push($(this).val()); //체크된 것만 배열에 넣기
 	    			 }
 	 			})	        
 	 			targetCount = cancelTarget.length;//블랙리스트 해제 대상 인원	 
 	    		 if(targetCount>0){
  		            Swal.fire({
  	  			        title: "총 " + targetCount + "건을 해제하시겠습니까?",
  	  			        showCancelButton: true,
  	  			        confirmButtonColor: '#9381FF',
  	  			        cancelButtonColor: '#D9D9D9',
  	  			        confirmButtonText: '확인',
  	  			        cancelButtonText: '취소',
  	    				 }).then((result) =>{
  	    					 if (result.isConfirmed){
									$.ajax({
										url:"/admin/cancelBlackList",
										traditional:true,
										data:{"cancelTarget":cancelTarget}
									}).done(function(){
							    		Swal.fire({
						    	            title: '해제가 완료되었습니다.'
						    	        })
						    	        blackListTab('','',1);
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
 			
 			//블랙리스트 등록하기
 			function blackListReg(){
 	    		let regTarget = [];// 등록 대상 넣을 배열
 	    		let targetCount = 0; // 총 등록 대상
 	    		let blackList = 0 ; //블랙리스트인 경우(등록 대상 아님)
 	    		let type = null;			
 	    		
	    		 $("input:checkbox[name='blackListCheck']:checked").each(function(){
	    			 type = $(this).parent().siblings('.blackMemberType').text();
	    			 if(type=='일반회원'||type=='관리자'){
	    				 regTarget.push($(this).val()); //체크된 것만 배열에 넣기
	    			 }
	 			})
	 			targetCount = regTarget.length;
	    		
	    		 if(targetCount>0){
	  		            Swal.fire({
	  	  			        title: "총 " + targetCount + "건을 등록하시겠습니까?",
	  	  			        showCancelButton: true,
	  	  			        confirmButtonColor: '#9381FF',
	  	  			        cancelButtonColor: '#D9D9D9',
	  	  			        confirmButtonText: '확인',
	  	  			        cancelButtonText: '취소',
	  	    				 }).then((result) =>{
	  	    					 if (result.isConfirmed){
										$.ajax({
											url:"/admin/regBlackList",
											traditional:true,
											data:{"regTarget":regTarget}
										}).done(function(){
								    		Swal.fire({
							    	            title: '등록이 완료되었습니다.'
							    	        })
							    	        blackListTab('','',1);
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
//네번째 페이지 : 대시보드---------------------------------------------------------
    	
    	

    	 var context = document
                .getElementById('myChart')
                .getContext('2d');
            var myChart = new Chart(context, {
                type: 'line', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: [
                        //x 축
                        '1','2','3','4','5','6','7'
                    ],
                    datasets: [
                        { //데이터
                            label: '방문자 현황', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: [
                                11,0,25,20,23,26,25 //x축 label에 대응되는 데이터 값
                            ],
                            backgroundColor: [
                                //색상
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                //경계선 색상
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1 //경계선 굵기
                        }/* ,
                        {
                            label: 'test2',
                            fill: false,
                            data: [
                                8, 34, 12, 24
                            ],
                            backgroundColor: 'rgb(157, 109, 12)',
                            borderColor: 'rgb(157, 109, 12)'
                        } */
                    ]
                },
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            });
	
            

       	 var context2 = document
                   .getElementById('myChart2')
                   .getContext('2d');
               var myChart = new Chart(context2, {
                   type: 'bar', // 차트의 형태
                   data: { // 차트에 들어갈 데이터
                       labels: [
                           //x 축
                           '1','2','3','4','5','6','7'
                       ],
                       datasets: [
                           { //데이터
                               label: '방문자 현황', //차트 제목
                               fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                               data: [
                                   11,0,25,20,23,26,25 //x축 label에 대응되는 데이터 값
                               ],
                               backgroundColor: [
                                   //색상
                                   'rgba(255, 99, 132, 0.2)',
                                   'rgba(54, 162, 235, 0.2)',
                                   'rgba(255, 206, 86, 0.2)',
                                   'rgba(75, 192, 192, 0.2)',
                                   'rgba(153, 102, 255, 0.2)',
                                   'rgba(255, 159, 64, 0.2)'
                               ],
                               borderColor: [
                                   //경계선 색상
                                   'rgba(255, 99, 132, 1)',
                                   'rgba(54, 162, 235, 1)',
                                   'rgba(255, 206, 86, 1)',
                                   'rgba(75, 192, 192, 1)',
                                   'rgba(153, 102, 255, 1)',
                                   'rgba(255, 159, 64, 1)'
                               ],
                               borderWidth: 1 //경계선 굵기
                           }/* ,
                           {
                               label: 'test2',
                               fill: false,
                               data: [
                                   8, 34, 12, 24
                               ],
                               backgroundColor: 'rgb(157, 109, 12)',
                               borderColor: 'rgb(157, 109, 12)'
                           } */
                       ]
                   },
                   options: {
                       scales: {
                           yAxes: [
                               {
                                   ticks: {
                                       beginAtZero: true
                                   }
                               }
                           ]
                       }
                   }
               });

         
             	 var context3 = document
                 .getElementById('myChart3')
                 .getContext('2d');
             var myChart = new Chart(context3, {
                 type: 'pie', // 차트의 형태
                 data: { // 차트에 들어갈 데이터
                     labels: [
                         //x 축
                         '1','2','3','4','5','6','7'
                     ],
                     datasets: [
                         { //데이터
                             label: '방문자 현황', //차트 제목
                             data: [
                                 11,0,25,20,23,26,25 //x축 label에 대응되는 데이터 값
                             ],
                             backgroundColor: [
                                 //색상
                                 'rgba(255, 99, 132, 0.2)',
                                 'rgba(54, 162, 235, 0.2)',
                                 'rgba(255, 206, 86, 0.2)',
                                 'rgba(75, 192, 192, 0.2)',
                                 'rgba(153, 102, 255, 0.2)',
                                 'rgba(255, 159, 64, 0.2)'
                             ],
                             borderColor: [
                                 //경계선 색상
                                 'rgba(255, 99, 132, 1)',
                                 'rgba(54, 162, 235, 1)',
                                 'rgba(255, 206, 86, 1)',
                                 'rgba(75, 192, 192, 1)',
                                 'rgba(153, 102, 255, 1)',
                                 'rgba(255, 159, 64, 1)'
                             ],
                             borderWidth: 1 //경계선 굵기
                         }/* ,
                         {
                             label: 'test2',
                             fill: false,
                             data: [
                                 8, 34, 12, 24
                             ],
                             backgroundColor: 'rgb(157, 109, 12)',
                             borderColor: 'rgb(157, 109, 12)'
                         } */
                     ]
                 },
                 options: {
                     scales: {
                         yAxes: [
                             {
                                 ticks: {
                                     beginAtZero: true
                                 }
                             }
                         ]
                     }
                 }
             });           

             

           	 var context4 = document
                       .getElementById('myChart4')
                       .getContext('2d');
                   var myChart = new Chart(context4, {
                       type: 'bar', // 차트의 형태
                       data: { // 차트에 들어갈 데이터
                           labels: [
                               //x 축
                               '1','2','3','4','5','6','7'
                           ],
                           datasets: [
                               { //데이터
                                   label: '방문자 현황', //차트 제목
                                   fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                                   data: [
                                       11,0,25,20,23,26,25 //x축 label에 대응되는 데이터 값
                                   ],
                                   backgroundColor: [
                                       //색상
                                       'rgba(255, 99, 132, 0.2)',
                                       'rgba(54, 162, 235, 0.2)',
                                       'rgba(255, 206, 86, 0.2)',
                                       'rgba(75, 192, 192, 0.2)',
                                       'rgba(153, 102, 255, 0.2)',
                                       'rgba(255, 159, 64, 0.2)'
                                   ],
                                   borderColor: [
                                       //경계선 색상
                                       'rgba(255, 99, 132, 1)',
                                       'rgba(54, 162, 235, 1)',
                                       'rgba(255, 206, 86, 1)',
                                       'rgba(75, 192, 192, 1)',
                                       'rgba(153, 102, 255, 1)',
                                       'rgba(255, 159, 64, 1)'
                                   ],
                                   borderWidth: 1 //경계선 굵기
                               }/* ,
                               {
                                   label: 'test2',
                                   fill: false,
                                   data: [
                                       8, 34, 12, 24
                                   ],
                                   backgroundColor: 'rgb(157, 109, 12)',
                                   borderColor: 'rgb(157, 109, 12)'
                               } */
                           ]
                       },
                       options: {
                           scales: {
                               yAxes: [
                                   {
                                       ticks: {
                                           beginAtZero: true
                                       }
                                   }
                               ]
                           }
                       }
                   });

             
                 	 var context5 = document
                     .getElementById('myChart5')
                     .getContext('2d');
                 var myChart = new Chart(context5, {
                     type: 'pie', // 차트의 형태
                     data: { // 차트에 들어갈 데이터
                         labels: [
                             //x 축
                             '1','2','3','4','5','6','7'
                         ],
                         datasets: [
                             { //데이터
                                 label: '방문자 현황', //차트 제목
                                 data: [
                                     11,0,25,20,23,26,25 //x축 label에 대응되는 데이터 값
                                 ],
                                 backgroundColor: [
                                     //색상
                                     'rgba(255, 99, 132, 0.2)',
                                     'rgba(54, 162, 235, 0.2)',
                                     'rgba(255, 206, 86, 0.2)',
                                     'rgba(75, 192, 192, 0.2)',
                                     'rgba(153, 102, 255, 0.2)',
                                     'rgba(255, 159, 64, 0.2)'
                                 ],
                                 borderColor: [
                                     //경계선 색상
                                     'rgba(255, 99, 132, 1)',
                                     'rgba(54, 162, 235, 1)',
                                     'rgba(255, 206, 86, 1)',
                                     'rgba(75, 192, 192, 1)',
                                     'rgba(153, 102, 255, 1)',
                                     'rgba(255, 159, 64, 1)'
                                 ],
                                 borderWidth: 1 //경계선 굵기
                             }/* ,
                             {
                                 label: 'test2',
                                 fill: false,
                                 data: [
                                     8, 34, 12, 24
                                 ],
                                 backgroundColor: 'rgb(157, 109, 12)',
                                 borderColor: 'rgb(157, 109, 12)'
                             } */
                         ]
                     },
                     options: {
                         scales: {
                             yAxes: [
                                 {
                                     ticks: {
                                         beginAtZero: true
                                     }
                                 }
                             ]
                         }
                     }
                 });           

            
            		
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
</body>
</html>    	