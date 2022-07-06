<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<!--  부트스트랩-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.1.1/css/fontawesome.min.css" integrity="sha384-zIaWifL2YFF1qaDiAo0JFgsmasocJ/rqu7LKYH8CoBEXqGbb9eO+Xi3s6fQhgFWM" crossorigin="anonymous">    <!--  부트스트랩-->
	<!--알람 팝업-->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!--Bootstrap Icon-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <!--다음맵 API 키-->
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1cda901cc32993198836861cdc427005&libraries=services"></script>
    <!-- input.css  -->
    <link rel="stylesheet" href="/css/sideTab.css">
	<link rel="stylesheet" href="/css/class/classDetail.css">
   
</head>
<body data-bs-spy="scroll" data-bs-target="#classHeader" data-bs-offset="230" tabindex="0">	
	<div class="container mainContent" style="padding-bottom:5%;">  
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		
        <div id="pageHeader"><a href="/class/list">재능마켓</a><br><hr></div>
        
        <!-- 상단 클래스 메인 이미지 / 클릭 시 모달로 크게 보기-->
        <div class="row classImgs">
            <div class="col-12 h-100">            
            	<div class="myGallery">
            		<a data-bs-toggle="modal" data-bs-target="#imgModal" style="display:none">
	                    <img id="ma1_view">
	                </a>
            		<a class="ma_etc" data-bs-toggle="modal" data-bs-target="#imgModal" style="display:none">
                     	<img id="ma2_view">
                    </a>
                    <a class="ma_etc" data-bs-toggle="modal" data-bs-target="#imgModal" style="display:none">
                        <img id="ma3_view">
                    </a>
                    <a class="ma_etc" data-bs-toggle="modal" data-bs-target="#imgModal" style="display:none">
                        <img id="ma4_view">
                    </a>                        
            	</div>                
            </div>
        </div> 
		
		 <!-- 클래스 본문 영역 -->
        <div class="row">
            <div class="col-12 col-lg-8">
                <div class="row">
                    <div class="col-12">
                    <!--  본문 헤더  -->
                        <nav id="classHeader" class="navbar navbar-light bg-light px-3">
                            <ul class="nav nav-pills w-100">
                              <li class="nav-item w-25 p-0">
                                <a class="nav-link active" href="#classInfo">클래스 소개</a>
                              </li>
                              <li class="nav-item w-25 p-0">
                                <a class="nav-link" href="#classReview">수강 후기</a>
                              </li>
                              <li class="nav-item w-25 p-0">
                                <a class="nav-link" href="#classEtc">클래스 정보</a>
                              </li>
                              <li class="nav-item w-25 p-0">
                                <a class="nav-link" href="#refund">환불 정책</a>
                              </li>
                            </ul>
                        </nav>
                        
                        <div id="classContents">
                        	
                        	<!-- 클래스 소개+구매 (반응형-lg이하) -->  
                            <div class="d-block d-lg-none">
                                <div class="row">
                                    <div class="col-12">
                                        <span class="info_category">${cdto.category1 } <c:if test="${cdto.category2!=null}"><i class="bi bi-dot"></i> ${cdto.category2 }</c:if></span><br>
                                        <span class="info_title">${cdto.category1 }</span>
                                    </div>
                                    <div class="col-4 infoleft">크리에이터</div>
                                    <div class="col-8 inforight">
                                        <span> 
                                            <div class="info_pImgBox">
                                                <img src="/img/class/addImg.png">
                                            </div> ${cdto.creater_id }
                                        </span>
                                    </div>
                                    <div class="col-4 infoleft">클래스 일정</div>
                                    <div class="col-8 inforight">${cdto.class_date }</div>
                                    <div class="col-12 infoleft"><i class="bi bi-bookmark"></i> 20명의 회원이 수강했어요!<br><br><hr></div>
									<div class="col-4 infoleft infoleft_price">수강권</div>
                                    <div class="col-8 info_price"></div><hr>									
									
                                    <nav class="navbar fixed-bottom navbar-light bg-light">
                                        <div class="container-fluid">
                                            <span id="likeB" class="like">
                                            	<c:choose>
                                            		<c:when test="${likeOrNot=='true' }">
	                                            		<i class="bi bi-heart-fill" style="color:#FF781E"></i>
	                                            	</c:when>
	                                            	<c:otherwise>
	                                            		<i class="bi bi-heart"></i>
	                                            	</c:otherwise>	
                                            	</c:choose>
                                            	
                                            	
                                            	
                                            	<input type="text" value="22" readonly>
                                            
                                            </span>
                                            <span id="shareB" data-bs-toggle="modal" data-bs-target="#shareModal"><i class="bi bi-share share"></i></span>
                                            <input type="button" class="regBtn" value="클래스 신청하기">
                                        </div>
                                    </nav>
                                </div>
                            </div>
                            
                            <!-- '클래스 정보' 스크롤 포인트 -->
							<div id="classInfo"></div><br> 
							
							<!-- 클래스 정보 영역 -->
                            <p class="d-none d-lg-block">안녕하세요!<br>
                                <span id="classTitle">${cdto.title }</span> 클래스 입니다.</p><br>
                            <div class="row">
                                <div class="col-12" style="display:none">
                                    <div class="imgBox"><img id="ex1_view"></div>
                                    <div class="imgInfo"></div>
                                    <br>
                                </div>    
                                <div class="col-12" style="display:none">
                                    <div class="imgBox"><img id="ex2_view"></div>
                                    <div class="imgInfo"></div>
                                    <br>
                                </div>    
                                <div class="col-12" style="display:none">
                                    <div class="imgBox"><img id="ex3_view"></div>
                                    <div class="imgInfo"></div>
                                    <br>
                                </div>
                                <div class="col-12" style="display:none">
                                    <div class="imgBox"><img id="ex4_view"></div>
                                    <div class="imgInfo"></div>
                                    <br>
                                </div>
                                <hr>
                                <!-- 클래스 정보 - 크리에이터 소개 영역 -->
                                <div class="col-12">
                                    <div class="row">
                                        <div class="col-10">
                                            <h5>크리에이터</h5>
                                            <p>크리에이터 ${cdto.creater_id }입니다.</p>
                                        </div>
                                        <div class="col-2" style="text-align:right;">
                                            <div class="pImgBox">
                                                <img src="/img/class/addImgLong3.png">
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <br>
                                            <p id="createrInfo">${cdto.creater_info }</p>
                                            <br>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="divLine"></div>
							
							<!-- 수강 후기 스크롤 포인트 -->
                            <div id="classReview"></div><br>
                            <!-- 수강 후기 영역 -->
                            <div class="row">
                                <div class="col-8"><h5>실제 수강생 후기</h5></div>
                                <div class="col-4" style="text-align: right;">
                                    <input type=button value="후기 작성하기" id="writeReview" data-bs-toggle="modal" data-bs-target="#writeReviewModal">
                                    
                                </div>
                                <div class="col-12">
                                    <div class="row">
                                        <div class="col-12 classStars">
                                            <span id="starCountImg"><input type=hidden value="4.8"></span>
                                            <span id="starCount">4.8</span>
                                            <span id="countRv">총 30개</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- 수강 후기 목록 (스크롤) -->
                                <div class="col-12" id="reviewScroll">
                                    <hr>
                                    <div class="row review">
                                        <div class="col-9 col-lg-8">
                                            <div class="row">
                                                <div class="col-3">
                                                    <div class="rpImgBox">
                                                        <img src="/img/class/addRImg.png">
                                                    </div>
                                                </div>
                                                <div class="col-9">
                                                    수강생 이름<br>
                                                    <span class="reviewStars"><input type=hidden value=4.5></span>
                                                    <span class="rWriteDate">2022-06-30</span>
                                                </div>
                                                <div class="col-3"></div>
                                                <div class="col-9">
                                                    <textarea class="reviewContent" readonly>진짜 재밌었어요!</textarea> 
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-3 col-lg-4 rImgBoxArea">
                                            <a data-bs-toggle="modal" data-bs-target="#imgModal" data-bs-imgSrc="/img/class/addRImg.png">
                                                <div class="rImgBox">
                                                    <img src="/img/class/addRImg.png">
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-2"></div>
                                        <div class="col-6 thumbs">
                                            <span><i class="bi bi-hand-thumbs-up-fill"></i> 명에게 도움됨</span>
                                        </div>
                                        <div class="col-4 report">
                                            <span>신고하기</span>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row review">
                                        <div class="col-12">
                                            <div class="row">
                                                <div class="col-2">
                                                    <div class="rpImgBox">
                                                        <img src="/img/class/addRImg.png">
                                                    </div>
                                                </div>
                                                <div class="col-10">
                                                    수강생 이름<br>
                                                    <span class="reviewStars"><input type=hidden value=1.5></span>
                                                    <span class="rWriteDate">2022-06-30</span>
                                                </div>
                                                <div class="col-2"></div>
                                                <div class="col-10">
                                                    <textarea class="reviewContent" readonly>그림이 없는 리뷰~</textarea> 
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-2"></div>
                                        <div class="col-6 thumbs">
                                            <span><i class="bi bi-hand-thumbs-up-fill"></i> 명에게 도움됨</span>
                                        </div>
                                        <div class="col-4 report">
                                            <span>신고하기</span>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row review">
                                        <div class="col-9 col-lg-8">
                                            <div class="row">
                                                <div class="col-3">
                                                    <div class="rpImgBox">
                                                        <img src="/img/class/addRImg.png">
                                                    </div>
                                                </div>
                                                <div class="col-9">
                                                    수강생 이름<br>
                                                    <span class="reviewStars"><input type=hidden value=3.5></span>
                                                    <span class="rWriteDate">2022-06-30</span>
                                                </div>
                                                <div class="col-3"></div>
                                                <div class="col-9">
                                                    <textarea class="reviewContent" readonly>진짜 재밌었어요!</textarea> 
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-3 col-lg-4 rImgBoxArea">
                                            <a data-bs-toggle="modal" data-bs-target="#imgModal" data-bs-imgSrc="/img/class/addRImg.png">
                                                <div class="rImgBox">
                                                    <img src="/img/class/addRImg.png">
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-2"></div>
                                        <div class="col-6 thumbs">
                                            <span><i class="bi bi-hand-thumbs-up-fill"></i> 명에게 도움됨</span>
                                        </div>
                                        <div class="col-4 report">
                                            <span>신고하기</span>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row review">
                                        <div class="col-12">
                                            <div class="row">
                                                <div class="col-2">
                                                    <div class="rpImgBox">
                                                        <img src="/img/class/addRImg.png">
                                                    </div>
                                                </div>
                                                <div class="col-10">
                                                    수강생 이름<br>
                                                    <span class="reviewStars"><input type=hidden value=5></span>
                                                    <span class="rWriteDate">2022-06-30</span>
                                                </div>
                                                <div class="col-2"></div>
                                                <div class="col-10">
                                                    <textarea class="reviewContent" readonly>그림이 없는 리뷰~</textarea> 
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-2"></div>
                                        <div class="col-6 thumbs">
                                            <span><i class="bi bi-hand-thumbs-up-fill"></i> 명에게 도움됨</span>
                                        </div>
                                        <div class="col-4 report">
                                            <span>신고하기</span>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row review">
                                        <div class="col-9 col-lg-8">
                                            <div class="row">
                                                <div class="col-3">
                                                    <div class="rpImgBox">
                                                        <img src="/img/class/addRImg.png">
                                                    </div>
                                                </div>
                                                <div class="col-9">
                                                    수강생 이름<br>
                                                    <span class="reviewStars"><input type=hidden value=4></span>
                                                    <span class="rWriteDate">2022-06-30</span>
                                                </div>
                                                <div class="col-3"></div>
                                                <div class="col-9">
                                                    <textarea class="reviewContent" readonly>진짜 재밌었어요!</textarea> 
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-3 col-lg-4 rImgBoxArea">
                                            <a data-bs-toggle="modal" data-bs-target="#imgModal" data-bs-imgSrc="/img/class/addRImg.png">
                                                <div class="rImgBox">
                                                    <img src="/img/class/addRImg.png">
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-2"></div>
                                        <div class="col-6 thumbs">
                                            <span><i class="bi bi-hand-thumbs-up-fill"></i> 명에게 도움됨</span>
                                        </div>
                                        <div class="col-4 report">
                                            <span>신고하기</span>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row review">
                                        <div class="col-12">
                                            <div class="row">
                                                <div class="col-2">
                                                    <div class="rpImgBox">
                                                        <img src="/img/class/addRImg.png">
                                                    </div>
                                                </div>
                                                <div class="col-10">
                                                    수강생 이름<br>
                                                    <span class="reviewStars"><input type=hidden value=2></span>
                                                    <span class="rWriteDate">2022-06-30</span>
                                                </div>
                                                <div class="col-2"></div>
                                                <div class="col-10">
                                                    <textarea class="reviewContent" readonly>그림이 없는 리뷰~</textarea> 
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-2"></div>
                                        <div class="col-6 thumbs">
                                            <span><i class="bi bi-hand-thumbs-up-fill"></i> 명에게 도움됨</span>
                                        </div>
                                        <div class="col-4 report">
                                            <span>신고하기</span>
                                        </div>
                                    </div>
                                    <br>
                                </div>
                            </div>
                            <br>
                            <div class="divLine"></div>
							
							<!-- 클래스 정보 스크롤 포인트 -->
                            <div id="classEtc"></div><br>
                            <!-- 클래스 정보 영역 -->
                            <h5>클래스 정보</h5>
                            <hr>
                            <div class="row etc">
                                <div class="col-4 etcHeader">
                                    <span>클래스 일정</span>
                                </div>
                                <div class="col-8 etcContent">
                                    <span>${cdto.class_date }</span>                                
                                </div>                                
                            </div>
                            <hr>
                            <div class="row etc">
                                <div class="col-4 etcHeader">
                                    <span>클래스 장소</span>
                                </div>
                                <div class="col-8 etcContent">
                                    <span> (${cdto.zipcode }) ${cdto.address1 }<c:if test="${cdto.address2!=null }">, ${cdto.address2 }</c:if></span>
                                </div>
                                <div class="col-4 etcHeader"></div>
                                <div class="col-8 etcContent">
                                    <input type = hidden value="${cdto.address1 }" id="addressForMap">
                                    <div id="map"></div>
                                </div>
                            </div>                                
                            <br><br>
                            <div class="divLine"></div>
							<!-- 환불 정책 스크롤 포인트 -->
                            <div id="refund"></div><br>
                            <!-- 환불 정책 영역 -->
                            <h5>환불 정책</h5>
                            <div class="row">
                                <div class="col-12" id="refundPolicy">
                                    환불 정책에 따라 구매일로부터 90일까지 환불 요청이 가능하며, <span id="refundDay">7일 전</span>까지 전액 환불이 가능합니다.
                                </div>
                            </div>         
                        </div>
                    </div>
                </div>                
            </div>
            <!-- 클래스 소개+구매 (반응형-lg이상) -->  
            <div class="col-4 d-none d-lg-block">
                <div class="row infoArea">
                    <div class="col-12">
                        <span class="info_category">${cdto.category1 } <c:if test="${cdto.category2!=null}"><i class="bi bi-dot"></i> ${cdto.category2 }</c:if></span><br>
                        <span class="info_title">${cdto.title }</span>
                    </div>
                    <div class="col-4 infoleft">크리에이터</div>
                    <div class="col-8 inforight">
                        <span> 
                            <div class="info_pImgBox">
                                <img src="/img/class/addImg.png">
                            </div> ${cdto.creater_id }
                        </span>
                    </div>
                    <div class="col-4 infoleft">클래스 일정</div>
                    <div class="col-8 inforight">${cdto.class_date }</div>
                    <div class="col-12 infoleft"><i class="bi bi-bookmark"></i> 20명의 회원이 수강했어요!</div>
                    <div class="col-12" style="text-align: center">
                        <br>
                        <button type="button" class="info_like like">
                        	<c:choose>
                           		<c:when test="${likeOrNot=='true' }">
                            		<i class="bi bi-heart-fill" style="color:#FF781E"></i>
                            	</c:when>
                            	<c:otherwise>
                            		<i class="bi bi-heart"></i>
                            	</c:otherwise>	
                           	</c:choose>
							<input type="text" value="22" class="likeCount" readonly>
						</button>
                        <button type="button" class="info_share share" data-bs-toggle="modal" data-bs-target="#shareModal"><i class="bi bi-share"></i> 공유하기</button>
                        <hr>                       
                    </div>
                    <div class="col-4 infoleft infoleft_price">
                        수강권
                    </div>
                    <div class="col-8 info_price"></div>

                    <div class="col-12" style="text-align: center;">
                        <input type="button" class="regBtn" value="클래스 신청하기">
                    </div>
                </div>
            </div>
        </div>
		
		<!-- 모달 모음 -->
        <div class="row">
            <div class="col-12">
            	<!-- 이미지 보기 모달 -->                
                <div class="modal" tabindex="-1" id="imgModal">
                    <div class="modal-dialog modal-dialog-centered modal-lg">
                        <div class="modal-content i_modal-content">
                            <div class="modal-header" style="border: 0;">
                                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                                  aria-label="Close"></button>
                            </div>
                            <div class="modal-body i_modal-body p-0">
                                <p class="p-2"><img src="/"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12">
            	<!-- 리뷰 작성 모달 -->
                <div class="modal fade" id="writeReviewModal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content" id="rmodal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="modalLabel">후기 작성하기</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body" id="rmodal-body">
                                <form>
                                    <div class="mb-3">
                                        <i class="bi bi-star" id="rStar1"></i>
                                        <i class="bi bi-star" id="rStar2"></i>
                                        <i class="bi bi-star" id="rStar3"></i>
                                        <i class="bi bi-star" id="rStar4"></i>
                                        <i class="bi bi-star" id="rStar5"></i>
                                        <p>별표를 클릭하여 평가해주세요.</p>
                                    </div>
                                    <div class="mb-3">
                                        <textarea class="form-control" id="rmContent" placeholder="솔직한 후기를 남겨주세요."></textarea>
                                    </div>
                                    <div class="mb-3">
                                        <span class="rmImgBox"><img src="/img/class/addRImg.png"></span>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                                <button type="button" class="btn btn-primary">등록</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12">
            	<!-- 링크 공유 모달 -->
                <div class="modal fade" id="shareModal" tabindex="-1" aria-labelledby="smodalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content" id="smodal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="smodalLabel">링크 공유하기</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body" id="smodal-body">
                                <input type="text" id="shareLink" readonly>
                                <button type="button" id="shareLinkBtn"><i class="bi bi-link-45deg"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
    <script>	
    
    	// 반복문안에서 각 ImgDTO 에 해당하는 src 넣어주기
	    let arr = JSON.parse('${arrImg}');
		for(let i=0;i<arr.length;i++){
			let type=arr[i].img_seq.substring(0,2);
			let target = arr[i].img_seq.substring(0,3);
			let sys_name = arr[i].sys_name;
			//이미지 src 설정
			$("#"+target+"_view").attr("src","/upload/"+sys_name);
			
			//메인 이미지라면
			if(type=="ma"){				
				//모달용 data-bs-imgSrc 설정
				$("#"+target+"_view").parent().attr("data-bs-imgSrc","/upload/"+sys_name);
				//사진이 존재한다면 사진 및 모달 활성화
				$("#"+target+"_view").parent().css("display","inline-block")	
			//설명 이미지라면
			}else{
				//사진 설명 넣어주기
				$("#"+target+"_view").parent().siblings(".imgInfo").text(arr[i].img_desc)
				//사진이 존재한다면 사진 및 설명 활성화
				$("#"+target+"_view").parent().parent().css("display","inline-block")
			}
		}    	
		
		
		// 클래스 가격 천단위마다 쉼표 처리		
		let price = ${cdto.price};
		price = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		$(".info_price").text(price+"원");
		
		
	    $(function(){
	    	
	    	// 클래스 평점에 따른 별 이미지 출력
	        let star = "<i class='bi bi-star'></i>";
	        let half = "<i class='bi bi-star-half'></i>";
	        let fill = "<i class='bi bi-star-fill'></i>";
	
	        let classTotalStar = $("#starCountImg").children("input").val();
	        let stars="";
	        
	        if(classTotalStar<0.5){
	            stars=star+star+star+star+star;
	        }else if(classTotalStar<1){
	            stars=half+star+star+star+star;
	        }else if(classTotalStar<1.5){
	            stars=fill+star+star+star+star;
	        }else if(classTotalStar<2){
	            stars=fill+half+star+star+star;
	        }else if(classTotalStar<2.5){
	            stars=fill+fill+star+star+star;
	        }else if(classTotalStar<3){
	            stars=fill+fill+half+star+star;
	        }else if(classTotalStar<3.5){
	            stars=fill+fill+fill+star+star;
	        }else if(classTotalStar<4){
	            stars=fill+fill+fill+half+star;
	        }else if(classTotalStar<4.5){            
	            stars=fill+fill+fill+fill+star;
	        }else if(classTotalStar<5){
	            stars=fill+fill+fill+fill+half;                
	        }else if(classTotalStar==5){
	            stars=fill+fill+fill+fill+fill;     
	        }
	        $("#starCountImg").prepend(stars);
	
	        
	    	//  수강생 리뷰 평점에 따른 별 이미지 출력
	        let reviewStars = $(".reviewStars").children("input");
	        let rStars="";
	        for(let i=0;i<reviewStars.length;i++){
	            if($(reviewStars[i]).val()<0.5){
	                rStars=star+star+star+star+star;
	            }else if($(reviewStars[i]).val()<1){
	                rStars=half+star+star+star+star;
	            }else if($(reviewStars[i]).val()<1.5){
	                rStars=fill+star+star+star+star;
	            }else if($(reviewStars[i]).val()<2){
	                rStars=fill+half+star+star+star;
	            }else if($(reviewStars[i]).val()<2.5){
	                rStars=fill+fill+star+star+star;
	            }else if($(reviewStars[i]).val()<3){
	                rStars=fill+fill+half+star+star;
	            }else if($(reviewStars[i]).val()<3.5){
	                rStars=fill+fill+fill+star+star;
	            }else if($(reviewStars[i]).val()<4){
	                rStars=fill+fill+fill+half+star;
	            }else if($(reviewStars[i]).val()<4.5){            
	                rStars=fill+fill+fill+fill+star;
	            }else if($(reviewStars[i]).val()<5){
	                rStars=fill+fill+fill+fill+half;                
	            }else if($(reviewStars[i]).val()==5){
	                rStars=fill+fill+fill+fill+fill;     
	            }
	            $(reviewStars[i]).parent().append(rStars);
	        }
	        
	        
        	// 링크 공유하기 모달에서 사용할 링크 넣어두기
	        let url = window.document.location.href;
	        $("#shareLink").val(url);
	    })
	
	    
	    //다음맵API - 클래스 위치 출력
	    var mapContainer = document.getElementById('map'),
	        mapOption = {
	            center: new kakao.maps.LatLng(33.450701, 126.570667), 
	            level: 3 
	        };   
	    var map = new kakao.maps.Map(mapContainer, mapOption); 
	    var geocoder = new kakao.maps.services.Geocoder();
	    geocoder.addressSearch($("#addressForMap").val(), function(result, status) {
	
	        if (status === kakao.maps.services.Status.OK) {	
	            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	            var marker = new kakao.maps.Marker({
	                map: map,
	                position: coords
	            });
	            map.setCenter(coords);
	        } 
	    });    
	
	    
		// 찜하기 버튼 클릭시 이벤트
	    $(".like").on("click",function(){
	    	
	    	// target0 : 작은창 하단바 찜하기 / target1 : 큰창 우측 찜하기
	    	// 두 버튼 중 하나반 클릭해도 나머지 버튼에도 효과 적용
	    	let target0=$($(".like")[0]).children("i");
	        let target1=$($(".like")[1]).children("i");
	        let count = Number($(this).children("input").val());
	        let parent_seq = '${cdto.class_seq}';
	        
	        // 찜을 기존에 하지 않았다면
	        if(target0.attr("class")=="bi bi-heart"){ 
	        	
	        	//db에 저장
	        	$.ajax({
	        		url:"/class/like",
	        		data:{"parent_seq" : parent_seq}
	        	})
	        	
	        	target0.css("color","#FF781E");
	        	target1.css("color","#FF781E");
	            target0.attr("class","bi bi-heart-fill");
	            target1.attr("class","bi bi-heart-fill");
	            count += 1;
	            $($(".like")[0]).children("input").val(count);
	            $($(".like")[1]).children("input").val(count);
	
	            Swal.fire({                    
	                width:250,
	                html: "<span style='font-size:15px'><i class='bi bi-heart-fill' style='color:#FF781E'></i> 찜하기 완료!</span>",
	                showConfirmButton: false,
	                timer: 1000,
	                background:'#dbdbdb50',
	                backdrop:'transparent'
	            })
	            
	        // 이미 찜 처리가 되어있었다면
	        }else{
	        	
	        	//db에서 삭제
	        	$.ajax({
	        		url:"/class/likeCancel",
	        		data:{"parent_seq" : parent_seq}
	        	})
	        	
	        	target0.css("color","#595959");
	        	target1.css("color","#595959");
	            target0.attr("class","bi bi-heart");
	            target1.attr("class","bi bi-heart");
	            count -= 1;
	            $($(".like")[0]).children("input").val(count);
	            $($(".like")[1]).children("input").val(count);
	        }
	    })
	    
    // 이미지 클릭시 모달에 이미지 소스 설정 
	    var imgModal = document.getElementById('imgModal')
	    imgModal.addEventListener('show.bs.modal', function (event) {
	        var button = event.relatedTarget
	        var recipient = button.getAttribute('data-bs-imgSrc')
	        var modalBodyImg = imgModal.querySelector('.modal-body img')
	        $(modalBodyImg).attr("src",recipient);
	    })
	
	
	// 리뷰 작성 시 클릭에 따른 별점 처리
	    $("#rStar1").on("click",function(e){
	        let target = $(this).offset().left+20;
	        if(e.clientX<=target){
	            $(this).attr("class","bi bi-star-half");
	            $("#rStar2").attr("class","bi bi-star");
	            $("#rStar3").attr("class","bi bi-star");
	            $("#rStar4").attr("class","bi bi-star");
	            $("#rStar5").attr("class","bi bi-star");
	        }else{
	            $(this).attr("class","bi bi-star-fill");
	            $("#rStar2").attr("class","bi bi-star");
	            $("#rStar3").attr("class","bi bi-star");
	            $("#rStar4").attr("class","bi bi-star");
	            $("#rStar5").attr("class","bi bi-star");
	        }
	    })
	    
	    $("#rStar2").on("click",function(e){
	        let target = $(this).offset().left+20;
	        if(e.clientX<=target){
	            $("#rStar1").attr("class","bi bi-star-fill");
	            $(this).attr("class","bi bi-star-half");
	            $("#rStar3").attr("class","bi bi-star");
	            $("#rStar4").attr("class","bi bi-star");
	            $("#rStar5").attr("class","bi bi-star");
	        }else{
	            $("#rStar1").attr("class","bi bi-star-fill");
	            $(this).attr("class","bi bi-star-fill");
	            $("#rStar3").attr("class","bi bi-star");
	            $("#rStar4").attr("class","bi bi-star");
	            $("#rStar5").attr("class","bi bi-star");
	        }
	    })
	
	    $("#rStar3").on("click",function(e){
	        let target = $(this).offset().left+20;
	        if(e.clientX<=target){
	            $("#rStar1").attr("class","bi bi-star-fill");
	            $("#rStar2").attr("class","bi bi-star-fill");
	            $(this).attr("class","bi bi-star-half");
	            $("#rStar4").attr("class","bi bi-star");
	            $("#rStar5").attr("class","bi bi-star");
	        }else{
	            $("#rStar1").attr("class","bi bi-star-fill");
	            $("#rStar2").attr("class","bi bi-star-fill");
	            $(this).attr("class","bi bi-star-fill");
	            $("#rStar4").attr("class","bi bi-star");
	            $("#rStar5").attr("class","bi bi-star");
	        }
	    })
	
	    $("#rStar4").on("click",function(e){
	        let target = $(this).offset().left+20;
	        if(e.clientX<=target){
	            $("#rStar1").attr("class","bi bi-star-fill");
	            $("#rStar2").attr("class","bi bi-star-fill");
	            $("#rStar3").attr("class","bi bi-star-fill");
	            $(this).attr("class","bi bi-star-half");
	            $("#rStar5").attr("class","bi bi-star");
	        }else{
	            $("#rStar1").attr("class","bi bi-star-fill");
	            $("#rStar2").attr("class","bi bi-star-fill");
	            $("#rStar3").attr("class","bi bi-star-fill");
	            $(this).attr("class","bi bi-star-fill");
	            $("#rStar5").attr("class","bi bi-star");
	        }
	    })
	
	    $("#rStar5").on("click",function(e){
	        let target = $(this).offset().left+20;
	        if(e.clientX<=target){
	            $("#rStar1").attr("class","bi bi-star-fill");
	            $("#rStar2").attr("class","bi bi-star-fill");
	            $("#rStar3").attr("class","bi bi-star-fill");
	            $("#rStar4").attr("class","bi bi-star-fill");
	            $(this).attr("class","bi bi-star-half");
	        }else{
	            $("#rStar1").attr("class","bi bi-star-fill");
	            $("#rStar2").attr("class","bi bi-star-fill");
	            $("#rStar3").attr("class","bi bi-star-fill");
	            $("#rStar4").attr("class","bi bi-star-fill");
	            $(this).attr("class","bi bi-star-fill");
	        }
	    })
	    
    // 링크 공유하기 이벤트
	    $("#shareLinkBtn").on("click",function(){
	        $("#shareLink").select();
	        document.execCommand("copy");  
	
	        Swal.fire({
	            icon: 'success',
	            text: '링크가 복사되었습니다.',
	            showConfirmButton: false,
	            timer: 1000
	        })
	    })
	    
	    
	// 클래스 등록하기 클릭 시 
	    $(".regBtn").on("click",function(){
	    	
	    	let class_seq = '${cdto.class_seq}';
	    	
	    	// 등록되어 있는지 여부를 체크
	    	$.ajax({
	    		url:"/class/regOrNot",
	    		data:{"parent_seq":class_seq}	    	
			}).done(function(resp){
	    		if(resp){ // 등록되어 있다면
	    			Swal.fire({
	    	            icon: 'warning',
	    	            title: '이미 등록하신 클래스입니다'
	    	        })
	    	        return false;
	    		}else{ // 등록되어 있지 않다면 구매 페이지로 이동
	    			location.href="/class/toReg?class_seq="+class_seq;
	    		}
	    		
	    	})
	    	
	    	
        })
        
    </script>
	<jsp:include page="/WEB-INF/views/common/pNav.jsp"/>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<jsp:include page="/WEB-INF/views/common/loginModal.jsp" />
</body>
</html>