<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<style>

/* 업로드 개별 목록 영역 */
#preview > p{
	display: inline-block;
	margin-right: 20px;
	position: relative;
}
/* 업로드 이미지 삭제 버튼 */
.file-remove{
	margin-left: 10px;
	position: absolute;
	right: 0px;
}
</style>
</head>
<body>

	
	<form action="/community/writePro" method="post" enctype="multipart/form-data">
<!-- 		<button>등록</button> -->
		
		<input type="file" id="file-input" name="file" accept="image/*" multiple style="display:none;"/>
		<label for="file-input"><img src="/img/community/imgUpload.png" style="width: 50px; height: 40px;"></label> <!-- 파일 업로드 커스텀 하기 -->
		
		<h3>업로드된 파일</h3>
		<div id="preview"></div>
	</form>
	
	
	
	
	<script>
		let count = 0;
		let fileCount = 0; //파일 개수 카운트
		var fileInput = document.getElementById('file-input');
		var preview = document.getElementById('preview');
		var dataTranster_ori = new DataTransfer();
		
		fileInput.addEventListener('change', (event) => {
// 			console.log("//////////////////////추가//////////////////")
// 			console.dir(fileInput) 
			var fileList = event.target.files;
			
			for(var i = 0; i < fileList.length; i++){
				if(fileCount < 4){
	// 				console.log(fileInput.files);
					if(fileList[i].type.includes('image/')){//이미지 확장자만 업로드 가능하게.
						if(fileList[i].name.length>100){//파일 이름 길이 제한(100자), 
							alert("파일명이 100자 이상인 파일은 제외되었습니다.")
						}else if(fileList[i].size > (10*1024*1024)){//최대 파일 용량 10MB
							alert("최대 파일 용량인 10MB를 초과한 파일은 제외되었습니다.")
						}else if (fileList[i].name.lastIndexOf('.') == -1) {//확장자 없는 파일 제외
					        alert("확장자가 없는 파일은 제외되었습니다.");
					    
						
						}else{//정상 업로드 로직
							count++;
							dataTranster_ori.items.add(fileList[i]);
							preview.innerHTML += 
								"<p id='"+fileList[i].lastModified+"'>"
								+"<img id='img"+count+"' style='width:100px; height:100px;'><button data-index='"
								+fileList[i].lastModified+"' onClick='fncRemove(this)' class='file-remove'>X</button></p></img>";
							//console.log(fileList[i].lastModified);
							
							readImage(event.target, i ,'img'+count);
							
							fileCount++; //파일 개수 카운트
							console.log(fileCount);
						}
					}else{
						alert("이미지 파일만 선택 가능합니다.")
					}
				
				}else{
					alert("파일은 최대 4개까지만 가능합니다.");
					break;
				}
				
			}
// 			console.log(dataTranster_ori);
			fileInput.files = dataTranster_ori.files;
		
		});
		
		
		function fncRemove(obj){ //x버튼 클릭 했을 시
// 			console.log("//////////////////////삭제//////////////////")
// 			console.dir(fileInput) 
			var removeTargetId = obj.dataset.index;
			var dataTranster = new DataTransfer();
			var fileList = fileInput.files;
// 			console.log(fileInput.files);
// 			console.log(dataTranster);
			for(var i = 0; i < fileList.length; i++){
				if(removeTargetId != fileList[i].lastModified){
// 					console.log(fileList[i])//남아 있는 거
					dataTranster.items.add(fileList[i]);
				}
			}
// 			console.dir(fileInput) 
			
			fileInput.files = dataTranster.files;
// 			console.log(dataTranster);
			$("#"+removeTargetId).remove();
// 			console.log(removeTargetId);
// 			console.log(fileInput.files);
// 			console.dir(fileInput) 
			
			dataTranster_ori=dataTranster;
			fileCount -= 1 ;//파일 개수 카운트
			console.log(fileCount);
		}

		
		//이미지 가져오기
		function readImage(input, index, id) {
		    if (input.files && input.files[index]) {
		        const reader = new FileReader();
		        
		        reader.onload = (e) => {
		            const previewImage = document.getElementById(id);
		            previewImage.src = e.target.result;
		        }
		        reader.readAsDataURL(input.files[index]);
		    }
		}
    </script>
</body>
</html>