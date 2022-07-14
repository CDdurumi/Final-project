<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>[DOWA] 재능마켓 - ${cdtoNN.TITLE }</title>
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
		
        <div id="pageHeader"><a href="/class/main">재능마켓</a><br><hr></div>
        
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
                                        <span class="info_category">${cdtoNN.CATEGORY1 } <c:if test="${cdtoNN.CATEGORY2!=null}"><i class="bi bi-dot"></i> ${cdtoNN.CATEGORY2 }</c:if></span><br>
                                        <span class="info_title">${cdtoNN.TITLE }</span>
                                    </div>
                                    <div class="col-4 infoleft">크리에이터</div>
                                    <div class="col-8 inforight">
                                        <span> 
                                            <div class="info_pImgBox">
                                            	<c:choose>
                                            		<c:when test="${cdtoNN.PROFILE_IMG!=null }">
                                            			<img src="/upload/${cdtoNN.PROFILE_IMG}">
                                            		</c:when>
                                            		<c:otherwise>
                                            			<img src="/img/class/default.png">
                                            		</c:otherwise>
                                            	</c:choose>                                                
                                            </div> ${cdtoNN.NICKNAME}
                                        </span>
                                    </div>
                                    <div class="col-4 infoleft">클래스 일정</div>
                                    <div class="col-8 inforight date">${cdtoNN.CLASS_DATE }</div>
                                    <div class="col-12 infoleft"><i class="bi bi-bookmark"></i> ${stdsNum }명의 회원이 수강했어요!<br><br><hr></div>
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
                                            	
                                            	<input type="text" value="${likeNum}" readonly>
                                            
                                            </span>
                                            <span id="shareB" data-bs-toggle="modal" data-bs-target="#shareModal"><i class="bi bi-share share"></i></span>
                                            <input type="button" class="regBtn" value="클래스 신청하기">
                                            <div class="regChecked"  style="display:none">구매 완료 <i class="bi bi-check-lg"></i></div>
                                        </div>
                                    </nav>
                                </div>
                            </div>
                            
                            <!-- '클래스 정보' 스크롤 포인트 -->
							<div id="classInfo"></div><br> 
							
							<!-- 클래스 정보 영역 -->
                            <p class="d-none d-lg-block">안녕하세요!<br>
                                <span id="classTitle">${cdtoNN.TITLE }</span> 클래스 입니다.</p><br>
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
                                            <p>크리에이터 ${cdtoNN.NICKNAME}입니다.</p>
                                        </div>
                                        <div class="col-2" style="text-align:right;">
                                            <div class="pImgBox">
                                                <c:choose>
                                            		<c:when test="${cdtoNN.PROFILE_IMG!=null }">
                                            			<img src="/upload/${cdtoNN.PROFILE_IMG}">
                                            		</c:when>
                                            		<c:otherwise>
                                            			<img src="/img/class/default.png">
                                            		</c:otherwise>
                                            	</c:choose>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <br>
                                            <p id="createrInfo">${cdtoNN.CREATER_INFO }</p>
                                            <br>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="divLine"></div>
							<div class="row">
								<div class="col-12" style="text-align:right">									
									<c:choose>
										<c:when test="${cdtoNN.CREATER_ID==loginID||type=='A' }">
											<span class="classDelete">삭제하기</span>
										</c:when>
										<c:otherwise>
											<input type=hidden class="rSeq" value="${cdtoNN.CLASS_SEQ }">
											<input type=hidden class="reported" value='${cdtoNN.CREATER_ID }'>
											<input type=hidden class="rpContents" value="${cdtoNN.TITLE }">
											<input type=hidden class="rState" value="${cdtoNN.STATE }">
											<span class="report">신고하기</span>
										</c:otherwise>									
									</c:choose>
								</div>
							</div>
							<!-- 수강 후기 스크롤 포인트 -->
                            <div id="classReview"></div><br>
                            <!-- 수강 후기 영역 -->
                            <div class="row">
                                <div class="col-8"><h5>실제 수강생 후기</h5></div>
                                <div class="col-4" style="text-align: right;">
                                    <input type=button value="후기 작성하기" id="writeReview">
                                    
                                </div>
                                <div class="col-12">
                                    <div class="row">
                                        <div class="col-12 classStars">
                                            <span id="starCountImg"><input type=hidden value="${cdtoNN.STAR_COUNT }"></span>
                                            <span id="starCount">${cdtoNN.STAR_COUNT }</span>
                                            <span id="countRv"></span>
                                        </div>
                                    </div>
                                </div>
                                <!-- 수강 후기 목록 (스크롤) -->
								<div class="col-12" id="reviewScroll">
									<hr>
									<c:choose>
									
										<c:when test='${rlist.size()==0}'>
											<div style="text-align:center"><br>아직 작성된 리뷰가 없습니다.<br><br></div>
										</c:when>
										
										<c:otherwise>
											<c:forEach var="r" items='${rlist }'>
												<div class="row review" id=${r.REVIEW_SEQ }>
													<c:choose>
														<c:when test='${r.SYS_NAME!=null }'>
															<div class="col-9 col-lg-8">
																<div class="row">
																	<div class="col-3">
																		<div class="rpImgBox">
																			<img src="/upload/${r.PROFILE_IMG}">
																		</div>
																	</div>
																	<div class="col-9">
																		${r.NICKNAME }<br> 
																		<span class="reviewStars">
																		<input type=hidden value=${r.STARS }></span> 
																		<span class="rWriteDate">${r.WRITE_DATE }</span>
																	</div>
																	<div class="col-3"></div>
																	<div class="col-9">
																		<div class="reviewContent">${r.CONTENTS }</div>
																	</div>
																</div>
															</div>
															<div class="col-3 col-lg-4 rImgBoxArea">
																<a data-bs-toggle="modal" data-bs-target="#imgModal"
																	data-bs-imgSrc="/upload/${r.SYS_NAME }">
																	<div class="rImgBox">
																		<img src="/upload/${r.SYS_NAME }">
																	</div>
																</a>
															</div>
														</c:when>
														<c:otherwise>
															<div class="col-12">
																<div class="row">
																	<div class="col-2">
																		<div class="rpImgBox">
																			<c:choose>
							                                            		<c:when test="${r.PROFILE_IMG!=null }">
							                                            			<img src="/upload/${r.PROFILE_IMG}">
							                                            		</c:when>
							                                            		<c:otherwise>
							                                            			<img src="/img/class/default.png">
							                                            		</c:otherwise>
							                                            	</c:choose>
																		</div>
																	</div>
																	<div class="col-10">
																		${r.NICKNAME }<br> 
																		<span class="reviewStars">
																		<input type=hidden value='${r.STARS }'></span> 
																		<span class="rWriteDate">${r.WRITE_DATE }</span>
																	</div>
																	<div class="col-2"></div>
																	<div class="col-10">
																		<div class="reviewContent">${r.CONTENTS }</div>
																	</div>
																</div>
															</div>
														</c:otherwise>
													</c:choose>
													<div class="col-2"></div>
													<div class="col-6 thumbs">
														<c:choose>
															<c:when test='${loginID==null }'>
																<span class="rLike">
																	<i class="bi bi-hand-thumbs-up"></i> 
																	<span class="rLikeCount">
				                                            			${r.LIKE_COUNT }
				                                            		</span>
			                                            		</span>
															</c:when>
		
															<c:otherwise>
																<c:choose>
																	<c:when test='${r.LIKE_SEQ==null }'>
																		<span class="rLike">
																			<i class="bi bi-hand-thumbs-up"></i> 
																			<span class="rLikeCount">
						                                            			${r.LIKE_COUNT }
						                                            		</span>
					                                            		</span>
			                                        				</c:when>
																	<c:otherwise>
																		<span class="rLike">
																			<i class="bi bi-hand-thumbs-up-fill"></i> 
																			<span class="rLikeCount">
						                                            			${r.LIKE_COUNT }
						                                            		</span>
					                                            		</span>
			                                        				</c:otherwise>
																</c:choose>
															</c:otherwise>
														</c:choose>
													</div>
													<div class="col-4 rEtc">
														<c:choose>
															<c:when test="${loginID == r.STD_ID ||type=='A'}">
																<input type=hidden class="rSeq" value="${r.REVIEW_SEQ }">
																<c:if test="${loginID == r.STD_ID}">
																	<span class="modifyRvw"> 수정 </span>
																</c:if>
																<span class="deleteRvw"> 삭제 </span>
															</c:when>
															<c:otherwise>
																<input type=hidden class="rSeq" value="${r.REVIEW_SEQ }">
																<input type=hidden class="reported" value='${r.STD_ID }'>
																<input type=hidden class="rpContents" value="${r.CONTENTS }">
																<input type=hidden class="rState" value="${r.STATE }">
																<span class="report">신고하기</span>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
												<hr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
							</div>
							<br>
							</div>
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
                                <div class="col-8 etcContent date">
                                    <span>${cdtoNN.CLASS_DATE }</span>                                
                                </div>                                
                            </div>
                            <hr>
                            <div class="row etc">
                                <div class="col-4 etcHeader">
                                    <span>클래스 장소</span>
                                </div>
                                <div class="col-8 etcContent">
                                    <span> (${cdtoNN.ZIPCODE }) ${cdtoNN.ADDRESS1 }<c:if test="${cdtoNN.ADDRESS2!=null }">, ${cdtoNN.ADDRESS2 }</c:if></span>
                                </div>
                                <div class="col-4 etcHeader"></div>
                                <div class="col-8 etcContent">
                                    <input type = hidden value="${cdtoNN.ADDRESS1 }" id="addressForMap">
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
                        <span class="info_category">${cdtoNN.CATEGORY1 } <c:if test="${cdtoNN.CATEGORY2!=null}"><i class="bi bi-dot"></i> ${cdtoNN.CATEGORY2 }</c:if></span><br>
                        <span class="info_title">${cdtoNN.TITLE }</span>
                    </div>
                    <div class="col-4 infoleft">크리에이터</div>
                    <div class="col-8 inforight">
                        <span> 
                            <div class="info_pImgBox">
                                <c:choose>
                               		<c:when test="${cdtoNN.PROFILE_IMG!=null }">
                               			<img src="/upload/${cdtoNN.PROFILE_IMG}">
                               		</c:when>
                               		<c:otherwise>
                               			<img src="/img/class/default.png">
                               		</c:otherwise>
                               	</c:choose>
                            </div> ${cdtoNN.NICKNAME}
                        </span>
                    </div>
                    <div class="col-4 infoleft">클래스 일정</div>
                    <div class="col-8 inforight date">${cdtoNN.CLASS_DATE }</div>
                    <div class="col-12 infoleft"><i class="bi bi-bookmark"></i> ${stdsNum }명의 회원이 수강했어요!</div>
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
							<input type="text" value="${likeNum}" class="likeCount" readonly>
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
                        <div class="regChecked" style="display:none">구매 완료 <i class="bi bi-check-lg"></i></div>
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
                                <form method="post" id="rForm">
                                    <div class="mb-3">
                                        <i class="bi bi-star" id="rStar1"></i>
                                        <i class="bi bi-star" id="rStar2"></i>
                                        <i class="bi bi-star" id="rStar3"></i>
                                        <i class="bi bi-star" id="rStar4"></i>
                                        <i class="bi bi-star" id="rStar5"></i>
                                        <p>별표를 클릭하여 평가해주세요.</p>
                                        <input type="hidden" name="review_seq" id="rSeqForModify">
                                        <input type="hidden" name="parent_seq" id="rParentSeq" value="${cdtoNN.CLASS_SEQ }">
                                        <input type=hidden id="rStartCount" name="stars" value="0">
                                    </div>
                                    <div class="mb-3">
                                        <textarea class="form-control" id="rmContent" name="contents" placeholder="솔직한 후기를 남겨주세요."></textarea>
                                    </div>
                                    <div class="mb-3">
                                        <span class="rmImgBox">
                                        	<img src="/img/class/addRImg.png" class="addImg">
                                        	<img src="/" class="preview" style="display:none">
											<i class="bi bi-x-circle-fill" style="display:none"></i>
											<input type=file class=pic style="display:none">		
											<input type=text class="sys_name" name="sys_name" id="re_sys_name" style="display:none">
                                        </span>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                                <button type="button" class="btn btn-primary" id="rFormSubmit">등록</button>
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
             <div class="col-12">
            	<!-- 신고하기 모달 -->
                <div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="rpmodalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content" id="rpmodal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="rpmodalLabel">신고하기</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body" id="rpmodal-body">
                                <form method="post" id="rpForm">
                                    <div class="mb-3 p-2">
                                        신고하는 이유를 선택해주세요.
                                        <input type=hidden name="parent_seq" id="reportPSeq">
                                        <input type=hidden name="writer" id="reported">
                                        <input type=hidden name="contents" id="rpContents">
                                    </div>
                                    <div class="mb-3 p-4">
                                        <input type=radio id="reason1" name="reason" value="광고 및 홍보성 내용" checked>
                                        <label for="reason1">광고 및 홍보성 내용</label><br><br>
                                        <input type=radio id="reason2" name="reason" value="관련없는 이미지, 내용">
                                        <label for="reason2">관련없는 이미지, 내용</label><br><br>
                                        <input type=radio id="reason3" name="reason" value="욕설, 비방, 공격적인 내용">
                                        <label for="reason3">욕설, 비방, 공격적인 내용</label><br><br>
                                        <input type=radio id="reason4" name="reason" value="음란/선정성">
                                        <label for="reason4">음란/선정성</label><br><br>
                                        <input type=radio id="reason5" name="reason" value="저작권 침해">
                                        <label for="reason5">저작권 침해</label><br><br>
                                        <input type=radio id="reason6" name="reason" value="개인정보 노출">
                                        <label for="reason6">개인정보 노출</label><br><br>
                                        <input type=radio id="reason7" name="reason" value="기타">
                                        <label for="reason7">기타</label>                                  
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                            	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                            	<button type="button" class="btn btn-primary" id="rpFormSubmit">신고하기</button>                                                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
    <script>
    
//==========< 화면 구성 관련 (별, 금액 표시 등) >================================   
	
	// 클래스 이미지들 관련 src 등 설정
	    let arr = JSON.parse('${arrImg}');
	    let maCount = 0;
	    
	    for(let i=0;i<arr.length;i++){
			let type=arr[i].img_seq.substring(0,2);
			if(type=="ma"){	
				
				//이미지 grid class 설정용 
				maCount+=1;		
			}
		}    
	    
		for(let i=0;i<arr.length;i++){
			let type=arr[i].img_seq.substring(0,2);
			let target = arr[i].img_seq.substring(0,3);
			let sys_name = arr[i].sys_name;
			//이미지 src 설정
			$("#"+target+"_view").attr("src","/upload/"+sys_name);
			
			//메인 이미지라면
			if(type=="ma"){	
				
				//모달용 data-bs-imgSrc & grid class 설정
				$("#"+target+"_view").parent().attr({"data-bs-imgSrc":"/upload/"+sys_name,
													"class":"item"+maCount});
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
		let price = ${cdtoNN.PRICE};
		price = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		$(".info_price").text(price+"원");
		
		
		
	// 리뷰 좋아요 수 표시 수정 (0.0 -> 0)
		let rLikeArr = $(".rLikeCount");
		for(let i=0;i<rLikeArr.length;i++){
			let num = Number($(rLikeArr[i]).text());
			$(rLikeArr[i]).text(num+" 명에게 도움됨");
		}
	
		
		
	// 기구매자에게는 구매 완료 표시
		if(${loginID!=null}){
			
			let class_seq = '${cdtoNN.CLASS_SEQ}';
			
			$.ajax({
	    		url:"/class/regOrNot",
	    		data:{"parent_seq":class_seq}	    	
			}).done(function(resp){
	    		if(resp){ // 등록되어 있다면
	    			$($(".regChecked")[0]).css("display","inline-block");
	    			$($(".regChecked")[1]).css("display","inline-block");
	    			$($(".regBtn")[0]).css("display","none");
	    			$($(".regBtn")[1]).css("display","none");
	    		}
	    	})
		}
	
	
		
	// 클래스 평점에 따른 별 이미지 출력
        let star = "<i class='bi bi-star'></i>";
        let half = "<i class='bi bi-star-half'></i>";
        let fill = "<i class='bi bi-star-fill'></i>";

        let classTotalStar = $("#starCountImg").children("input").val();
        // 소수점 첫번째까지 반올림하여 별점 숫자 표시
        let newClassStar = Math.round(classTotalStar * 10) / 10;
        $("#starCount").text(newClassStar);
        // 별점 그림은 0.5단위로 반올림하여 표시
        classTotalStar=Math.ceil(classTotalStar*2) / 2;
        
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
		
    	
        
    //다음맵API - 클래스 위치 출력
	    var mapContainer = document.getElementById('map'),
	        mapOption = {
	            center: new kakao.maps.LatLng(33.450701, 126.570667), 
	            level: 3 
	        };   
	    var map = new kakao.maps.Map(mapContainer, mapOption); 
	    var geocoder = new kakao.maps.services.Geocoder();
	    // 클래스 주소 위치로 지도 좌표 이동
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
	    
	    
	    
//==========< 화면 로딩 이후 설정 >================================	   				
	
	    $(function(){
	        
       	// 링크 공유하기 모달에서 사용할 링크 넣어두기
	        let url = window.document.location.href;
	        $("#shareLink").val(url);
	        
	        
	        
     	// 리뷰 작성 모달 닫힐 경우 리셋
			$('#writeReviewModal').on('hide.bs.modal', function(e) {
				
				//사진 및 미리보기 삭제
				if($(".rmImgBox").children(".sys_name").val()!=null){
					$(".rmImgBox").children("i").click();   
				}
				
				//$("#rForm")[0].reset(); // form 리셋
				$("#rStar1").attr("class","bi bi-star");
				$("#rStar2").attr("class","bi bi-star");
	            $("#rStar3").attr("class","bi bi-star");
	            $("#rStar4").attr("class","bi bi-star");
	            $("#rStar5").attr("class","bi bi-star"); // 별 리셋
			})		
			
			
			
		// 입력 검증
			
			// 특수문자 정규식 변수(공백 미포함)
	   	    let replaceChar = /[@\#$%^&*\()\-=+_\'\;<>\/\`:\"\\[\]|{}]/gi;
	   	 
	   	    // 완성형 아닌 한글 정규식
	   	    let replaceNotFullKorean = /[ㄱ-ㅎㅏ-ㅣ]/gi;
	   	    
			$("#rmContent").on("focusout", function() {
	            let target = $(this).val();
	            if (target.length > 0) {
	                if (target.match(replaceChar) || target.match(replaceNotFullKorean)) {
	                	target = target.replace(replaceChar, "").replace(replaceNotFullKorean, "");
	                }
	                $(this).val(target);
	            }
            }).on("keyup", function() {
                $(this).val($(this).val().replace(replaceChar, ""));
                
                if ($(this).val().length > 1500){
                    alert("최대 500자까지 입력 가능합니다.");
                    $(this).val($(this).val().substring(0, 1500));
                }
      		});
	    })
	    

	    
//==========< 클래스 찜하기, 리뷰 좋아요 관련 이벤트 >================================	    
	    
	// 클래스 찜하기 버튼 클릭시 이벤트
	    $(".like").on("click",function(){	    	
	    	
	    	//로그인되어 있지 않다면 리턴
	    	if('${loginID}'==''){
	    		Swal.fire({
    	            icon: 'warning',
    	            title: '로그인 후 이용 가능합니다.'
    	        })
    	        return false;
	    	}
	    	
	    	// target0 : 작은창 하단바 찜하기 / target1 : 큰창 우측 찜하기
	    	// 두 버튼 중 하나반 클릭해도 나머지 버튼에도 효과 적용
	    	let target0=$($(".like")[0]).children("i");
	        let target1=$($(".like")[1]).children("i");
	        let count = Number($(this).children("input").val());
	        let parent_seq = '${cdtoNN.CLASS_SEQ}';
	        
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
	                allowOutsideClick:false,
		            allowEscapeKey:false,
		            allowEnterKey:false,
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
	    
	    
	    
	// 리뷰 좋아요 클릭 시 이벤트	
		$(".rLike").on("click",function(){
			
			//로그인되어 있지 않다면 리턴
	    	if('${loginID}'==''){
	    		Swal.fire({
    	            icon: 'warning',
    	            title: '로그인 후 이용 가능합니다.'
    	        })
    	        return false;
	    	}
			
			let review_seq = $(this).parent().siblings(".rEtc").children(".rSeq").val();
			let past = Number($(this).children(".rLikeCount").text().split("명")[0].trim());
			
			// 좋아요가 되어있지 않았다면
			if($(this).children("i").attr("class")=="bi bi-hand-thumbs-up"){
				
				$.ajax({
					url:"/review/like",
					data:{parent_seq:review_seq}
				})
				
				
				$(this).children("i").attr("class","bi bi-hand-thumbs-up-fill");
				$(this).children(".rLikeCount").text(Number(past+1) + " 명에게 도움됨")
			
			// 좋아요가 되어있었다면
			}else{
				
				$.ajax({
					url:"/review/likeCancel",
					data:{parent_seq:review_seq}
				})
				
				$(this).children("i").attr("class","bi bi-hand-thumbs-up");
				$(this).children(".rLikeCount").text(Number(past-1) + " 명에게 도움됨")
			}
		})
		
		
		
//==========< 클래스 등록하기 클릭 시 이벤트 >=================================			
		    
	// 클래스 등록하기 클릭 시 
	    $(".regBtn").on("click",function(){
	    	
	    	if(${loginID==null}){
	    		Swal.fire({
    	            icon: 'warning',
    	            title: '로그인 후 구매 가능합니다.'
    	        })    	        
    	        return false;
	    	}
	    	
	    	let class_seq = '${cdtoNN.CLASS_SEQ}';
	    	
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

        
        
//==========< 클래스 삭제하기 클릭 시 이벤트 >=================================  
	
	
	$(".classDelete").on("click",function(){		
		
		// 클래스 작성자 본인이고, 구매자가 존재한다면
		if(${type!='A'&&stdsNum!=0}){
			
			Swal.fire({
	            icon: 'warning',
	            title: '구매자가 존재하는 클래스입니다.',
	            text: '해당 클래스를 삭제하시려면 관리자에게 문의해주시기 바랍니다.'
	        })
	        return false;
		}
		
		Swal.fire({
	        title: '정말 삭제하시겠습니까?',
	        showCancelButton: true,
	        confirmButtonColor: '#9381FF',
	        cancelButtonColor: '#D9D9D9',
	        confirmButtonText: '확인',
	        cancelButtonText: '취소',
        }).then((result) => {
        	if (result.isConfirmed) {    
        		
        		let class_seq = '${cdtoNN.CLASS_SEQ}';
    			
    			$.ajax({
    				url:"/class/delete",
    				data:{class_seq:class_seq}
    			}).done(function(resp){
    				if(resp){
    					Swal.fire({
    			            icon: 'success',
    			            title: '클래스가 삭제되었습니다',
    			            showConfirmButton: false,
    			            timer: 1200,
    			            allowOutsideClick:false,
    			            allowEscapeKey:false,
    			            allowEnterKey:false
    		            }).then((result2) => {						
    						if (result2.dismiss === Swal.DismissReason.timer) {
    							location.replace("/class/main");
    	                    }
    					})
    				} 				
    			})
			}
		})
	})
		
		
//==========< 모달 1 - 이미지 보기 모달 >================================			
	    
    // 이미지 클릭시 모달에 이미지 소스 설정 
	    var imgModal = document.getElementById('imgModal')
	    imgModal.addEventListener('show.bs.modal', function (event) {
	        var button = event.relatedTarget
	        var recipient = button.getAttribute('data-bs-imgSrc')
	        var modalBodyImg = imgModal.querySelector('.modal-body img')
	        $(modalBodyImg).attr("src",recipient);
	    })
	    
	    
	    
//==========< 모달 2 - 리뷰 작성 모달 >================================	  
	
	// 리뷰 작성하기 클릭 시 (모달 열리기 전) 
		$("#writeReview").on("click",function(e){
			
			// 로그인 되어있지 않다면 리턴
			if('${loginID}'==''){				
	    		Swal.fire({
    	            icon: 'warning',
    	            title: '로그인 후 이용 가능합니다.'
    	        })
    	        return false;
	    	}
			
			// 구매 여부를 체크		
			let class_seq = '${cdtoNN.CLASS_SEQ}';	  
	    	
	    	$.ajax({
	    		url:"/class/regOrNot",
	    		data:{"parent_seq":class_seq}	    	
			}).done(function(resp){
	    		if(resp){ // 등록되어 있다면
	    			
	    			// 후기 작성 여부 확인
	    			$.ajax({
	    	    		url:"/review/writeOrNot",
	    	    		data:{"parent_seq":class_seq}	    	
	    			}).done(function(resp){
	    				if(!resp){
	    					$('#writeReviewModal').modal('show');
	    				}else{
	    					Swal.fire({
	    	    	            icon: 'warning',
	    	    	            text: '후기는 한 번만 작성 가능합니다'
	    	    	        })
	    				}
	    			})
	    		
	    		}else{ // 등록되어 있지 않다면
	    			
	    			Swal.fire({
	    	            icon: 'warning',
	    	            title: '구매 후 작성 가능합니다.'
	    	        })
	    		}
	    	})
		})
		
		
		
	// 리뷰 수정 클릭 시
		$(".modifyRvw").on("click",function(e){
			
			// reviewSeq 및 내용을 리뷰 모달로 옮기고 모달창 오픈
			let rSeq = $(this).siblings(".rSeq").val();
			$("#rSeqForModify").val(rSeq);
			
			let rParentSeq ="${cdtoNN.CLASS_SEQ }"; 
			$("#rParentSeq").val(rParentSeq);
			
			let rContent = $(this).parent().parent().find(".reviewContent").text();
			$("#rmContent").val(rContent);
			
			if($(this).parent().parent().find(".rImgBox").length){
				let sys_name = $(this).parent().parent().find(".rImgBox").children().attr("src").substr(8);
				$(".rmImgBox").children(".sys_name").val(sys_name);
				$(".rmImgBox").children(".addImg").css("display","none");
				$(".rmImgBox").children(".preview").attr("src","/upload/"+sys_name);
				$(".rmImgBox").children(".preview").css("display","inline-block");				
				$(".rmImgBox").children("i").css("display","inline-block");	
			}
			
			$('#writeReviewModal').modal('show');
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
	            $("#rStartCount").val(0.5);
	        }else{
	            $(this).attr("class","bi bi-star-fill");
	            $("#rStar2").attr("class","bi bi-star");
	            $("#rStar3").attr("class","bi bi-star");
	            $("#rStar4").attr("class","bi bi-star");
	            $("#rStar5").attr("class","bi bi-star");
	            $("#rStartCount").val(1);
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
	            $("#rStartCount").val(1.5);
	        }else{
	            $("#rStar1").attr("class","bi bi-star-fill");
	            $(this).attr("class","bi bi-star-fill");
	            $("#rStar3").attr("class","bi bi-star");
	            $("#rStar4").attr("class","bi bi-star");
	            $("#rStar5").attr("class","bi bi-star");
	            $("#rStartCount").val(2);
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
	            $("#rStartCount").val(2.5);
	        }else{
	            $("#rStar1").attr("class","bi bi-star-fill");
	            $("#rStar2").attr("class","bi bi-star-fill");
	            $(this).attr("class","bi bi-star-fill");
	            $("#rStar4").attr("class","bi bi-star");
	            $("#rStar5").attr("class","bi bi-star");
	            $("#rStartCount").val(3);
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
	            $("#rStartCount").val(3.5);
	        }else{
	            $("#rStar1").attr("class","bi bi-star-fill");
	            $("#rStar2").attr("class","bi bi-star-fill");
	            $("#rStar3").attr("class","bi bi-star-fill");
	            $(this).attr("class","bi bi-star-fill");
	            $("#rStar5").attr("class","bi bi-star");
	            $("#rStartCount").val(4);
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
	            $("#rStartCount").val(4.5);
	        }else{
	            $("#rStar1").attr("class","bi bi-star-fill");
	            $("#rStar2").attr("class","bi bi-star-fill");
	            $("#rStar3").attr("class","bi bi-star-fill");
	            $("#rStar4").attr("class","bi bi-star-fill");
	            $(this).attr("class","bi bi-star-fill");
	            $("#rStartCount").val(5);
	        }
	    })
	    
	    
	    
	//-------------리뷰 이미지 첨부 관련--------------------
		
		// 파일명 저장할 전역변수
		let sys_name = "";
		
		//클릭으로 첨부 - 이미지 클릭시 파일 선택창 열림		
		$(".addImg").on("click",function(){
			
			// 기존에 파일이 있었다면 삭제
			if($(this).siblings(".sys_name").val()!=""){
				$(this).siblings("i").click();
			}	
			$(this).siblings(".pic").click();
		})		
		
		
		// input type=file 변화 감지 이벤트
		$(".pic").on("change",function(){
			
			//파일 형식 확인
			let type = $(this).val().split('.').pop().toLowerCase();
			if($.inArray(type,['gif','png','jpg','jpeg'])== -1){
				alert("이미지 형식의 파일이 아닙니다.");
				$(this).siblings(".addImg").css("display","inline-block");
				$(this).siblings(".preview").css("display","none");
				$(this).val("");
				$(this).siblings(".sys_name").val("");
				$(this).siblings("i").css("display","none");
				
			// 파일 용량 초과시	
			}else if($(this).prop("files")[0].size> (10*1024*1024)){
				alert('10MB 이하 파일만 등록할 수 있습니다.\n\n' + '현재파일 용량 : ' + (Math.round($(this).prop("files")[0].size / 1024 / 1024 * 100) / 100) + 'MB');
				$(this).siblings(".addImg").css("display","inline-block");
				$(this).siblings(".preview").css("display","none");
				$(this).siblings(".sys_name").val("");
				$(this).siblings("i").css("display","none");
				
			//이미지 파일이 맞으면 URL API를 통해 미리보기 생성
			}else{
				
				file = $(this).prop("files")[0];
				let imgSrc = window.URL.createObjectURL(file);
				
				$(this).siblings(".addImg").css("display","none");
				$(this).siblings(".preview").attr("src",imgSrc);
				$(this).siblings(".preview").css("display","inline-block");				
				$(this).siblings("i").css("display","inline-block");				
				
				// 서버로 파일 전송
				let formData = new FormData();
				formData.append("file",file);
				uploadFile(formData);
				
				// 저장된 파일명을 input에 입력
				$(this).siblings(".sys_name").val(sys_name);
			}
		})
		
		
		
		// 드래그로 첨부
		
		// drag default 효과 방지
		$("body").on("dragenter dragover drop",function(){
			event.preventDefault();
		})
		
		$(".rmImgBox").on("dragenter dragover",function(){
			event.preventDefault();
		})
		
		
		
		// imgBox 영역에 드래그 시
		$(".rmImgBox").on("drop",function(e){
			
			// 기존에 파일이 있었다면 삭제
			if($(this).children(".sys_name").val()!=""){
				$(this).children("i").click();
			}
			
			let file = e.originalEvent.dataTransfer.files[0];
			
			//파일 형식 확인
			let type = file.name.split('.').pop().toLowerCase();
			if($.inArray(type,['gif','png','jpg','jpeg'])== -1){
				alert("이미지 형식의 파일이 아닙니다.");
				$(this).children(".addImg").css("display","inline-block");
				$(this).children(".preview").css("display","none");
				$(this).children(".sys_name").val("");
				$(this).children("i").css("display","none");
			
			// 파일 용량 초과시	
			}else if(file.size> (10*1024*1024)){
				alert('10MB 이하 파일만 등록할 수 있습니다.\n\n' + '현재파일 용량 : ' + (Math.round(file.size / 1024 / 1024 * 100) / 100) + 'MB');
				$(this).children(".addImg").css("display","inline-block");
				$(this).children(".preview").css("display","none");
				$(this).children(".sys_name").val("");
				$(this).children("i").css("display","none");
			
			}else{ // 이미지 파일이 맞으면 미리보기 이미지 생성
				let imgSrc = window.URL.createObjectURL(file);
				$(this).children(".addImg").css("display","none");
				$(this).children(".preview").attr("src",imgSrc);
				$(this).children(".preview").css("display","inline-block");
				$(this).children("i").css("display","inline-block");
				
				//서버로 파일 전송
				let formData = new FormData();
				formData.append("file",file);
				uploadFile(formData);
				
				// 저장된 파일명을 input에 입력
				$(this).children(".sys_name").val(sys_name);
			}
		})		
		
		
		// 파일 첨부 시 서버에 저장		
		function uploadFile(formData){
			$.ajax({
				url:"/class/addFile",
				data:formData,
				async:false,
				processData:false,
				contentType:false,
				type:"POST"
			}).done(function(resp){
				let result = JSON.parse(resp);
				sys_name = result.sys_name;
			})
		}
	
		
		// 'x'클릭 시 서버에서 파일 삭제		
		$(".bi-x-circle-fill").on("click",function(){
			let sys_name = $(this).siblings(".sys_name").val();
			$.ajax({
				url:"/class/deleteFile",
				async:false,
				data:{sys_name:sys_name},
				type:"POST"
			})
			
			window.URL.revokeObjectURL($(this).siblings(".preview").attr("src"));
			$(this).siblings(".addImg").css("display","inline-block");
			$(this).siblings(".preview").attr("src","/");
			$(this).siblings(".preview").css("display","none");
			$(this).siblings(".pic").val("");
			$(this).css("display","none");	
			$(this).siblings(".sys_name").val("");
		})
		
	//-------------리뷰 이미지 첨부 끝--------------------
	    
		
	// 리뷰 모달 submit 이벤트
		$("#rFormSubmit").on("click",function(){
			
			// 필수 입력 확인 (별점, 내용)
			if($("#rStartCount").val()=='0'){
				Swal.fire({
    	            icon: 'warning',
    	            title: '별점을 선택해 주세요',
    	            text: '최소 별점은 0.5점입니다'
    	        })
    	        return false;
			}
			
			if($("#rmContent").val().trim()==null||$("#rmContent").val().trim()==''){
				Swal.fire({
    	            icon: 'warning',
    	            title: '내용을 입력해 주세요'
    	        })
    	        return false;
			}
			
			
			// 수정이 아닌 첫 작성이라면
			if($("#rSeqForModify").val()==''){
				
				let form = $("#rForm");
			    let actionUrl = "/review/write";
				
				$.ajax({
			        type: "POST",
			        url: actionUrl,
			        data: form.serialize()
			        
			    }).done(function(resp){ 
			    	
			    	 Swal.fire({
			            icon: 'success',
			            title: '등록이 완료되었습니다.',
			            showConfirmButton: false,
			            timer: 1500,
			            allowOutsideClick:false,
			            allowEscapeKey:false,
			            allowEnterKey:false
		            }).then((result2) => {	
		            	if (result2.dismiss === Swal.DismissReason.timer) {
		            		location.reload();
		    	         }
		            })
			    })
			    
			}else{
				
				// 수정이라면
				let form = $("#rForm");
			    let actionUrl = "/review/modify";
			    
			    $.ajax({
			        type: "POST",
			        url: actionUrl,
			        data: form.serialize()
			        
			    }).done(function(resp){ 
			    	
			    	 Swal.fire({
			            icon: 'success',
			            title: '등록이 완료되었습니다.',
			            showConfirmButton: false,
			            timer: 1500,
			            allowOutsideClick:false,
			            allowEscapeKey:false,
			            allowEnterKey:false
		            }).then((result2) => {	
		            	if (result2.dismiss === Swal.DismissReason.timer) {
		            		location.reload();
		    	         }
		            })
			    })
			}
		})
		
		

	// 리뷰 삭제 클릭 시
		$(".deleteRvw").on("click",function(){
			
			Swal.fire({
		        title: '정말 삭제하시겠습니까?',
		        showCancelButton: true,
		        confirmButtonColor: '#9381FF',
		        cancelButtonColor: '#D9D9D9',
		        confirmButtonText: '확인',
		        cancelButtonText: '취소',
	        }).then((result) => {
	        	if (result.isConfirmed) {    
	        		
	    			let review_seq = $(this).siblings(".rSeq").val();		    			
	    			let parent_seq ="${cdtoNN.CLASS_SEQ }"; 
	    			
	    			$.ajax({
	    				url:"/review/delete",
	    				data:{review_seq:review_seq,
	    					parent_seq:parent_seq}
	    			}).done(function(){
	    				Swal.fire({
				            icon: 'success',
				            title: '리뷰가 삭제되었습니다',
				            showConfirmButton: false,
				            timer: 1200,
				            allowOutsideClick:false,
				            allowEscapeKey:false,
				            allowEnterKey:false
			            }).then((result2) => {						
							if (result2.dismiss === Swal.DismissReason.timer) {
								location.reload();
		                    }
						})
	    			})
				}
			})
		})
		
		
		
//==========< 모달 3 - 링크 공유 모달 >================================
	
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
	
	
//==========< 모달 4 - 신고하기 모달 >=================================	    
	    
	// 신고하기 클릭 시 (모달 열리기 전)
		$(".report").on("click",function(){
			
			// 로그인 되어있지 않다면 리턴
			if('${loginID}'==''){		
				Swal.fire({
    	            icon: 'warning',
    	            title: '로그인 후 이용 가능합니다.'
    	        })
    	        return false;
	    	}
			
			let parent_seq = $(this).siblings('.rSeq').val();
			let reported = $(this).siblings(".reported").val();
			let rpContents = $(this).siblings(".rpContents").val();
			let rState = $(this).siblings(".rState").val();
			
			// 신고 여부 확인
			if(rState==1){
				Swal.fire({
    	            icon: 'warning',
    	            text: '이미 다른 사용자로부터 신고가 접수된 게시물입니다.'
    	        })
    	        return false;
			}else{
				$("#reported").val(reported);
				$("#rpContents").val(rpContents);
				$("#reportPSeq").val(parent_seq);
				
				$('#reportModal').modal('show');
			}
		})
	
		
		
	// 신고하기 폼 submit 시
		$("#rpFormSubmit").on("click",function(){
			
			let form = $("#rpForm");
		    let actionUrl = "/class/report";
			
			$.ajax({
		        url: actionUrl,
		        data: form.serialize()
		        
		    }).done(function(resp){ 
		    	
		    	 Swal.fire({
		            icon: 'success',
		            title: '신고가 접수되었습니다.',
		            showConfirmButton: false,
		            timer: 1500,
		            allowOutsideClick:false,
		            allowEscapeKey:false,
		            allowEnterKey:false
	            }).then((result2) => {						
					if (result2.dismiss === Swal.DismissReason.timer) {
						location.reload();
                    }
				})
		    })
// 		    $('#rpForm')[0].reset();
// 			$('#reportModal').modal('hide');
		})
	    
        
    </script>
	<jsp:include page="/WEB-INF/views/common/pNav.jsp"/>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<jsp:include page="/WEB-INF/views/common/loginModal.jsp" />
</body>
</html>