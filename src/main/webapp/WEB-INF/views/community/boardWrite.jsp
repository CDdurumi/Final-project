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
			
			<!-- 해시태그 -->
			<div class="col-12 col-sm-9 col-lg-10">
				<div contentEditable=true data-text="해시태그는 최대 5개." id="hashDiv"></div>
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
	
	//해시태그////////////////////////////////////////////////////////////////////////////////////
    //해시태그 전체 div영역 클릭 시
    $("#hashDiv").on("click", function(){
        if($(this).children().length == 0){//해시태그가 0개일 때,
            $(this).removeAttr("contentEditable");

            //해시태그 새로 만들기
            let hashtagArea = $('<span class="hashtagArea">');
            let shapArea = $('<span class="shapArea">#</span>');
            let hashtag = $('<span class="hashtag" contenteditable="true"></span>');
            hashtagArea.append(shapArea);
            hashtagArea.append(hashtag);
            
            $("#hashDiv").append(hashtagArea);

            $(".hashtag").focus();
        }


        if( $($(this).children()[0]).children(".hashtag").attr("contenteditable") == null){//해시태그의 contenteditable 속성이 없을 때(즉, 포커스 아웃 된 후에 다시 클릭 시) 
            $(this).removeAttr("contentEditable");

            if($(this).children().siblings().length <= 4){//해시태그는 최대 5개
                //해시태그 새로 만들기
                let hashtagArea = $('<span class="hashtagArea">');
                let shapArea = $('<span class="shapArea">#</span>');
                let hashtag = $('<span class="hashtag" contenteditable="true"></span>');
                hashtagArea.append(shapArea);
                hashtagArea.append(hashtag);
                
                $("#hashDiv").append(hashtagArea);

                $(".hashtag").focus();
            }else{
                alert("해시태그는 최대 5개만 가능합니다.");
            }

        }

    })

    //해시태그에서 포커스 아웃했을 때,
    $("#hashDiv").on("focusout",".hashtag",function(e){
        if($("#hashDiv").children().length == 1 && $(this).text() != ""){//해시태그가 1개 있는데 내용이 있을 때 포커스 아웃하면,
            
            if($(this).children(".hashDel").length == 0){
                //해시태그 취소 x 넣기
                $(this).append("&nbsp;");
                $(this).append('<a class="hashDel">X</a>');
                $(this).removeAttr("contenteditable");
            }

        }else if($("#hashDiv").children().length == 1 && $(this).text() == ""){//해시태그가 1개 있는데 내용이 없을 때 포커스 아웃하면,
            $(this).parent().remove();
            $("#hashDiv").attr("contentEditable","true");
        
        }else if($("#hashDiv").children().length > 1 && $(this).text() == ""){//해시태그가 1개 이상이고 내용이 없을 때 포커스 아웃하면,
            $(this).parent().remove();
        
        }else if($("#hashDiv").children().length > 1 && $(this).text() != ""){//해시태그가 1개 이상이고 내용이 있을 때 포커스 아웃하면,
            
            if($(this).children(".hashDel").length == 0){
                //해시태그 취소 x 넣기
                $(this).append("&nbsp;");
                $(this).append('<a class="hashDel">X</a>');
                $(this).removeAttr("contenteditable");
            }
        }
            let index = $(this).parent().siblings().length-1;
            let lastHsah = $($(this).parent().siblings()[index]).children(".hashtag");
    })

    //해시 태그 X 클릭 이벤트
    $("#hashDiv").on("click", ".hashDel", function(){ 
        
        let index = $(this).parent().parent().siblings().length-1;
        $($(this).parent().parent().siblings()[index]).children(".hashtag").focus();
        $(this).parent().parent().remove();

    })


    //해시태그 키 입력 이벤트
    $("#hashDiv").on("keydown",".hashtag",function(e){

        if(e.which  === 13 || e.which  == 9 || e.which  == 32){ //엔터, 탭, 스페이스 바
            if($(this).text() == ""){
                return false;
            }


            //해시태그 새로 만들기
            if($(this).parent().siblings().length <= 3){//해시태그는 5개 까지만

                //해시태그 취소 x 넣기
                if($(this).children(".hashDel").length == 0){
                    $(this).append("&nbsp;");
                    $(this).append('<a class="hashDel">X</a>');
                    $(this).removeAttr("contenteditable");
                }


                //해시태그 본문 영역 만들기
                let hashtagArea = $('<span class="hashtagArea">');
                let shapArea = $('<span class="shapArea">#</span>');
                let hashtag = $('<span class="hashtag" contenteditable="true"></span>');

                hashtagArea.append(shapArea);
                hashtagArea.append(hashtag);
                
                $("#hashDiv").append(hashtagArea);

                $(this).parent().siblings().children(".hashtag").focus();//새로 만든 해시태그에 포커스
                
            }else(
                alert("해시태그는 최대 5개만 가능합니다.")
            )

            return false;
        }

        //최대글자 수
        if($(this).text().length > 7){
            alert("해시태그 최대 8글자.");
            return false;
        }
        
        
        //입력 받은 데이터가 한글, 영어, 숫자가 아니면 입력 못하게.
        let str = e.key;
        let regex = /[(ㄱ-힣a-zA-Z\d)]/;
        let result = regex.test(str);
        if(result==false){
            return false;
        }

    })
	/////////////////////////////////////////////////////////////////////해시태그/////////////////
	
	
	
	
	
	</script>
	
</body>

</html>