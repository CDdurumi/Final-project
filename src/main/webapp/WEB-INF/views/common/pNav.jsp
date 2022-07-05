<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="/css/input.css">
<link rel="stylesheet" href="/css/pNav.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(function() {
		//let ws = new WebSocket("ws://124.50.95.45/chat");
		let ws = new WebSocket("ws://localhost/chat");
		ws.onmessage = function(e) {
			let result = JSON.parse(e.data);
			console.log(result);
			if(result[0].room_code !== location.href.split("#")[1]){return false;}
			$("#conp").text("두루미 톡방이름 : " )
			for(let i =0; i<result.length; i++){
				if('${MemberDTO.nickname}'==result[i].nickname){
					let line = $("<div class='d-flex flex-row justify-content-end'>");
					let div = $("<div>");
					let p1 =$("<p class='small me-3 mb-3 rounded-3 text-muted d-flex justify-content-end'>");
					let p2 =$("<p class='small p-2 me-3 mb-1 text-white rounded-3 bg-primary' style='max-width:250px'>");
					let p3 =$("<p class='small me-3 mb-3 rounded-3 text-muted d-flex justify-content-end'>");
					
					p1.append(result[i].nickname);
					p2.append(result[i].message);
					p3.append(result[i].date);
					div.append(p1);
					div.append(p2);
					div.append(p3);
					line.append(div);
					$(".card-body").append(line);
					}else{
						let line = $("<div class='d-flex flex-row justify-content-start'>");
						let div = $("<div>");
						let p1 =$("<p class='small me-3 mb-3 rounded-3 text-muted d-flex justify-content-start'>");
						let p2 =$("<p class='small p-2 me-3 mb-1 text-white rounded-3 bg-primary' style='max-width:250px'>");
						let p3 =$("<p class='small me-3 mb-3 rounded-3 text-muted d-flex justify-content-start'>");
						
						p1.append(result[i].nickname);
						p2.append(result[i].message);
						p3.append(result[i].date);
						div.append(p1);
						div.append(p2);
						div.append(p3);
						line.append(div);
						$(".card-body").append(line);
					}
					updateScroll();
			}
			
			
		}

		$("#chat_area").on("keydown", function(e) {
			let text = $('#chat_area');
				if (e.keyCode == 13 && text.val() !=='') {					
					let line = $("<div>");
					line.append(text.val());
					
					var obj ={}
					obj.room_code = location.href.split("#")[1]	;
					obj.message = text.val();	
					
					
					
					ws.send(JSON.stringify(obj));
					text.val("");
					return false;
				}
		})
	
	})
	
	
	         function updateScroll() {
            var element = document.getElementById("chat_contents");
            $(element).scrollTop(element.scrollHeight);
        }
</script>
<style>
	#outline_box{
		min-height:600px;
		min-width:400px;
		position: fixed;
		right: 20px;
		bottom: 5px;
		z-index : 2;
		background-color : #f8f7ff;
 		border-radius: 40px 40px 10px 40px;
 		box-shadow: 0px 0px 15px 15px #9381ff;
 		text-aligin:center;	
 		display:none;	
	}
	.chat_head{
		max-height:590px;
		max-width:97%;
		background-color : #f8f7ff;
		padding:10px;
		border-radius: 40px 40px 10px 40px;
		margin:auto;
		margin-top:5px;
		
		text-align :center;
		
	}
	
	
	#chat_container{
		height:450px;
		background-color:gray;
	}
	.chat_room{
		display:none;
	}
	
	.card{
		border-radius: 0px 0px 10px 40px;
	}
	<!--채팅-->	
	.text_test{
		height:300px;
		max-width:250px;
	}
	.card-body{
		overflow-y:auto;
		-ms-overflow-style: none;
		scrollbar-width: none;
		 
	}
	.card-body::-webkit-scrollbar {
	    display: none; /* Chrome, Safari, Opera*/
	}
	
</style>
</head>
<body>
	<div id="outline_box">	
		<div class="chat_main">
			<div class="row chat_head">
				<div class="col-6 " style="text-align:left;">드롭다운 메뉴</div>
				<div class="col-4 " style="text-align:right;">검색</div>
				<div class="col-2 " style="text-align:right;"><img src="/resources/img/chat/Reply.png" id="close_chat_img"> </div>
			</div>
			<div class="container" id="chat_container">
				<div class="row chat_room_list">
					<div class="col-3">	
						프로필사진
					</div>
					
					<div class="col-6">
						<div class="row">
							<div class="col-12"><a href="#test1" class="open_room">채팅방이름</a></div>
						</div>
						<div class="row">
							<div class="col-12">마지막 채팅 내용</div>
						</div>
					</div>
					<div class="col-3">
						시간+아이콘
					</div>
				</div>
				
				<div class="row chat_room_list">
					<div class="col-3">	
						프로필사진
					</div>
					
					<div class="col-6">
						<div class="row">
							<div class="col-12"><a href="#test2" class="open_room">채팅방이름</a></div>
						</div>
						<div class="row">
							<div class="col-12">마지막 채팅 내용</div>
						</div>
					</div>
					<div class="col-3">
						시간+아이콘
					</div>
				</div>
				
				<div class="row chat_room_list">
					<div class="col-3">	
						프로필사진
					</div>
					
					<div class="col-6">
						<div class="row">
							<div class="col-12"><a href="#test3" class="open_room">채팅방이름</a></div>
						</div>
						<div class="row">
							<div class="col-12">마지막 채팅 내용</div>
						</div>
					</div>
					<div class="col-3">
						시간+아이콘
					</div>
				</div>
			</div>
		</div>
		
		<div class="chat_room">
			<div class="row chat_head">
				<div class="col-6 " style="text-align:left;">채팅방입니다</div>
				<div class="col-6 " style="text-align:right;"><button id="back">뒤로가기이이</button> </div>
			</div>
			<section >
  <div class="container">

    <div class="row d-flex justify-content-center">
      <div class="col-12">

        <div class="card" id="chat2">
          <div class="card-header d-flex justify-content-between align-items-center ">
            <h5 class="mb-0" id = "conp">두루미톡</h5>

            
          </div>
          <div class="card-body"  style=" position: relative; height: 400px" id="chat_contents">
			
<!-- 			<div class="d-flex flex-row justify-content-start"> -->
<!--               <div> -->
<!--               	<p class="small me-3 mb-3 rounded-3 text-muted d-flex justify-content-start">닉네임</p>              	 -->
<!--                 <p class="small p-2 me-3 mb-1 text-white rounded-3 bg-primary">상대가 쓴 글 </p>                 -->
<!--                 <p class="small me-3 mb-3 rounded-3 text-muted d-flex justify-content-start">00:15</p> -->
<!--               </div> -->
<!--             </div> -->
            
<!--             <div class="d-flex flex-row justify-content-end"> -->
<!--               <div>              	 -->
<!--               	<p class="small me-3 mb-3 rounded-3 text-muted d-flex justify-content-end">닉네임</p> -->
<!--                 <p class="small p-2 me-3 mb-1 text-white rounded-3 bg-primary">내가 쓴 글</p>                 -->
<!--                 <p class="small me-3 mb-3 rounded-3 text-muted d-flex justify-content-end">00:15</p> -->
<!--               </div> -->
<!--             </div> -->

          </div>
          <div class="card-footer text-muted d-flex justify-content-start align-items-center">         
            <span class="input input--minoru">
           			
					<input class="input__field input__field--minoru" type="text" id="chat_area" />		
					 <label class="input__label input__label--minoru" for="input-13">
						<span class="input__label-content input__label-content--minoru">채팅을 입력해보세요</span>
					</label>			
			</span>
          </div>
        </div>

      </div>
    </div>

  </div>
</section>
				
				
			
			
		</div>
			
	</div>
	
    <div class="pNav row">
    	
        <div class="mb-2 zoom" >
            <img src="/img/chatBtn.png" class="pNav_icon" id="chat_icon" style="cursor:pointer; width:50px;height:50px;" >
        </div>
        
        <div class="mb-1 zoom">
            <img src="/img/upBtn.png" class="pNav_icon" style="cursor:pointer; width:50px; height:50px;" onclick="window.scrollTo(0,0);">    
        </div>        
    </div>

<script>

//채팅모달 열기
let i = 0;
$("#chat_icon").on("click",function(){
	if(i==0){
		$("#outline_box").css("display","inline");
		$(".pNav").css("display","none");
		i+=1;
	}else{
		$("#outline_box").css("display","none");
		i-=1;
	}
})
//채팅모달 열기


window.onpopstate = function(event) {   //주소변경감지 이벤트
		console.log(location.href);	
		//history.replaceState({}, null, location.pathname);
}

$("#close_chat_img").on("click",function(){
	$("#outline_box").css("display","none");
	$(".pNav").css("display","inline");
	i-=1;
})

$(".open_room").on("click",function(){	
	$(".chat_main").css("display","none");
	$(".chat_room").css("display","inline");
	
	//이전 채팅 내역 삭제
	let chat_log = $(".card-body").children();
	chat_log.remove();
	//db에서 채팅내역 불러와서 방번호에 맞게 띄워줘야 함.
	let room_code = $(this).attr("href").split("#")[1]; //방번호
})


$("#back").on("click",function(){
	$(".chat_main").css("display","inline");
	$(".chat_room").css("display","none");
})


</script>

</body>

</html>