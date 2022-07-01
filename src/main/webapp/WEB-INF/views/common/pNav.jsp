<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">


<link rel="stylesheet" href="/css/pNav.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#outline_box{
		min-height:600px;
		min-width:400px;
		position: fixed;
		right: 40px;
		bottom: 155px;
		z-index : 2;
		background-color : #f8f7ff;
 		border-radius: 40px 40px 10px 40px;
 		box-shadow: 0px 0px 15px 15px #9381ff;
 		text-aligin:center;	
 		display:none;	
	}
	#chat_head{
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
</style>
</head>
<body>
	<div id="outline_box">
		<div class="row" id="chat_head">
			<div class="col-6 " style="text-align:left;">드롭다운 메뉴</div>
			<div class="col-6 " style="text-align:right;">채팅방 검색 , 닉네임 검색 </div>
		</div>
		<div class="container" id="chat_container">
			<div class="row chat_room">
				<div class="col-3">	
					프로필사진
				</div>
				
				<div class="col-6">
					<div class="row">
						<div class="col-12">채팅방이름+아이콘</div>
					</div>
					<div class="row">
						<div class="col-12">마지막 채팅 내용</div>
					</div>
				</div>
				<div class="col-3">
					시간
				</div>
			</div>
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
let i = 0;
$("#chat_icon").on("click",function(){
	if(i==0){
		$("#outline_box").css("display","inline");
		i+=1;
	}else{
		$("#outline_box").css("display","none");
		i-=1;
	}
})


</script>

</body>

</html>