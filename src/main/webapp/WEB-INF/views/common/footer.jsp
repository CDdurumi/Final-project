<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
<link rel="stylesheet" href="/css/footer.css">

<title>Insert title here</title>


</head>
<body>
	
<footer class="footer-section ">
        <div class="container">
            <div class="footer-content pt-5 pb-5">
                <div class="row">
                    <div class="col-xl-4 col-lg-4 mb-50">
                        <div class="footer-widget">
                            <div class="footer-logo">
                                <a href="/"><img src="/img/logo.png" class="img-fluid" alt="logo"></a>
                            </div>
                            <div class="footer-text">
                                <p>DOWA는 모든 사람이 상부상조하는 세상을 지향합니다.</p>
                            </div>
                            <div class="footer-social-icon">
                                <span>Follow us</span>
								<a href="#" ><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-facebook" id="facebook" viewBox="0 0 16 16">
  <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z"/>
</svg></a>
                                <a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-twitter" id="twitter" viewBox="0 0 16 16" style="color:#55ACEE;">
  <path d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z"/>
</svg></a>
                                <a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-google" id="google" viewBox="0 0 16 16" style="color:#DD4B39;">
  <path d="M15.545 6.558a9.42 9.42 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885h.002C11.978 15.292 10.158 16 8 16A8 8 0 1 1 8 0a7.689 7.689 0 0 1 5.352 2.082l-2.284 2.284A4.347 4.347 0 0 0 8 3.166c-2.087 0-3.86 1.408-4.492 3.304a4.792 4.792 0 0 0 0 3.063h.003c.635 1.893 2.405 3.301 4.492 3.301 1.078 0 2.004-.276 2.722-.764h-.003a3.702 3.702 0 0 0 1.599-2.431H8v-3.08h7.545z"/>
</svg></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-6 mb-30 footer_divbox" >
                        <div class="footer-widget">
                            <div class="footer-widget-heading">
                                <h3>바로가기</h3>
                            </div>
                            <ul>
                                <li><a href="/">홈</a></li>
                                <li><a href="/center/main">공지사항</a></li>
                                <li><a href="/class/main">재능마켓</a></li>
                                <li><a href="/guide">가이드</a></li>
                                <li><a href="/community/main">커뮤니티</a></li>
                            
                            </ul>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-6 mb-50 footer_divbox">
                        <div class="footer-widget">
                            <div class="footer-widget-heading">
                                <h3>고객센터</h3>
                            </div>
                            <div class="qna-form">
                                <a id="footer-inquiry" href="/center/inquiry">
                                    <button type="button" class="btn">문의하기</button>
                                </a>
                            </div>
                            <div class="footer-text mb-25">
                                <p>오전 10시 ~ 오후 6시 (주말, 공휴일 제외)</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="copyright-area">
            <div class="">
                <div class="row">
                    <div class="col-xl-12 col-lg-12 text-xl-center text-lg-left">
                        <div class="copyright-text">
                            <p>Copyright &copy; 2022, All Right Reserved <a href="/" style="color:#ff781E; text-decoration:none;" >상부상조</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
        
    </footer>
    
    <script>
    
    	$("#footer-inquiry").on("click", function(){
    		
    		if('${loginID}'==''){		
    			Swal.fire({
    	            icon: 'warning',
    	            title: '로그인 후 이용 가능합니다.'
    	        })
    	        return false;
        	}
    		
    	});
    
    
    </script>
</body>
</html>