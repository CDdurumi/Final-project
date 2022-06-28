<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CommunityMain</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!--부트스트랩-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>

<!-- side_tap common -->
<link rel="stylesheet" href="/css/sideTab.css">

</head>
<body>


<div class="container">  

  <div class="d-flex align-items-start">
    <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
      
      <a href="#home-tab"><button class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">Home</button></a>
      <a href="#profile-tab"><button class="nav-link " id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">Profile</button></a>
      <a href="#contact-tab"><button class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#v-pills-messages" type="button" role="tab" aria-controls="v-pills-messages" aria-selected="false">Messages</button></a>
    </div>
    <div class="tab-content" id="v-pills-tabContent" style="word-break:break-all; ">
      <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
          <div class="row">
              <div class="col-12">
                탭1 테스트
              </div>
          </div>
      </div>
      <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">탭2</div>
      <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">탭3</div>
    </div>
  </div>
</div>



<script>
  // window.location.href;
  // location.href;
  //  document.URL; 사이트 주소불러오는 방법들

  
  
  let siteUrl = window.location.href.split("#"); // #을 기준으로 사이트 주소를 나눠서 siteUrl  배열타입 변수에 저장   siteUrl[1]에 활성화 해야할 문자가 들어있음
  let tab1 = $("#v-pills-home-tab");
  let tab2 = $("#v-pills-profile-tab");
  let tab3 = $("#v-pills-messages-tab");

  let tab1_contents = $("#v-pills-home");
  let tab2_contents = $("#v-pills-profile");
  let tab3_contents = $("#v-pills-messages");

  if (siteUrl[1] == 'home-tab') {
    tab1.addClass('active');
    tab2.removeClass('active');
    tab3.removeClass('active');

    tab1_contents.addClass('show active');
    tab2_contents.removeClass('show active');
    tab3_contents.removeClass('show active');
  }
  else if (siteUrl[1] == 'profile-tab') {
    tab1.removeClass('active');
    tab2.addClass('active');
    tab3.removeClass('active');

    tab1_contents.removeClass('show active');
    tab2_contents.addClass('show active');
    tab3_contents.removeClass('show active');
  }
  else if (siteUrl[1] == 'contact-tab') {
    tab1.removeClass('active');
    tab2.removeClass('active');
    tab3.addClass('active');

    tab1_contents.removeClass('show active');
    tab2_contents.removeClass('show active');
    tab3_contents.addClass('show active');
  }

  // 부트스트랩 탭메뉴 버그 방지  
  tab1.on('click',function(){
    tab2.removeClass('active');
    tab3.removeClass('active');
  })
  tab2.on('click',function(){
    tab1.removeClass('active');
    tab3.removeClass('active');
  })
  tab3.on('click',function(){
    tab1.removeClass('active');
    tab2.removeClass('active');
  })
</script>
</body>

</html>