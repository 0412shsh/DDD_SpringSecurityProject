	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>DDD &mdash; Diary :D</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Website Template by freehtml5.co" />
	<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<meta name="author" content="freehtml5.co" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>	




<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"></script>
<script>
$(document).ready(function() {
	$('.noticeTab').find('a[href="' + document.location.pathname + '"]').parents('li').addClass('active');
	});
</script>




	<!-- 
	//////////////////////////////////////////////////////

	FREE HTML5 TEMPLATE 
	DESIGNED & DEVELOPED by FreeHTML5.co
		
	Website: 		http://freehtml5.co/
	Email: 			info@freehtml5.co
	Twitter: 		http://twitter.com/fh5co
	Facebook: 		https://www.facebook.com/fh5co

	//////////////////////////////////////////////////////
	 -->

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Libre+Baskerville:400,400i,700" rel="stylesheet"
	>
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css">

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/magnific-popup.css">

	<!-- Flexslider  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/flexslider.css">

	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.theme.default.min.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">

	<!-- Modernizr JS -->
	<script src="${pageContext.request.contextPath }/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
		
	<div id="page">
		
	<nav class="fh5co-nav" role="navigation">
		<div class="container-wrap">
			<div class="top-menu">
				<div class="row">
					<div class="col-md-12 col-offset-0 text-center">
						<div id="fh5co-logo"><a href="/">Dear.Diary :D</a></div>
					</div>
					<div class="col-md-12 col-md-offset-0 text-center menu-1">
					<div class="noticeTab">
						<ul>
							<li class="home"><a href="/">Home</a></li>
<!-- 							<li class="news"><a href="sermons.html">News</a></li> -->
							<li class="read"><a href="/board/mydiary">Read</a></li>
							<li class="write"><a href="/board/mydiarywrite">Write</a></li>
<!-- 							<li class="community"><a href="/board/community">Community</a></li> -->
							
							<sec:authorize access="isAnonymous()">	
							<li class="login"><a href="/member/login">Login</a></li>
							<li class="login"><a href="/member/register">Join</a></li>
							</sec:authorize>
							
							
						</ul>
						</div>
							<sec:authorize access="isAuthenticated()">	
							
							<form action="/logout" method="post"> 
							<sec:authentication property="principal.username"/>님 환영합니다♡&nbsp;&nbsp;
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
							<button>로그아웃</button>
							</form><br>
							</sec:authorize>
						
						
							
							
					</div>
				</div>
				
			</div>
		</div>
	</nav>

	



