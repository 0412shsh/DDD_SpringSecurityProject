<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<jsp:include page="./include/header.jsp" />
	<body>
		
	<div class="fh5co-loader"></div>
	
	
	<div class="container-wrap">
		<aside id="fh5co-hero">
			<div class="flexslider">
				<ul class="slides">
			   	<%-- <li style="background-image: url(${pageContext.request.contextPath }/resources/images/img_bg_5.jpg);">
			   		<div class="overlay"></div>
			   		<div class="container-fluid">
			   			<div class="row">
				   			<div class="col-md-6 col-md-offset-3 text-center">
				   				<div class="slider-text">
					   				<div class="slider-text-inner">
					   					<h1>Living &amp; Sharing the Gospel of God</h1>
											<h2>Free html5 templates Made by <a href="http://freehtml5.co/" target="_blank">freehtml5.co</a></h2>
											<p><a class="btn btn-primary btn-demo popup-vimeo" href="https://vimeo.com/channels/staffpicks/93951774"> <i class="icon-play4"></i> Watch Video</a> <a class="btn btn-primary btn-learn">Join us here! <i class="icon-arrow-right3"></i></a></p>
					   				</div>
				   				</div>
				   			</div>
				   		</div>
			   		</div>
			   	</li> --%>
			   	<li><img src=”http://din1410.cdn1.cafe24.com/img_bg_5.jpg”>
			   		<div class="overlay"></div>
			   		<div class="container-fluid">
			   			<div class="row">
				   			<div class="col-md-6 col-md-offset-3 text-center">
				   				<div class="slider-text">
					   				<div class="slider-text-inner">
					   					<h1>Welcome !</h1>
											<h2>Dear Diary :D  <a href="/" target="_blank">freehtml5.co</a></h2>
											<p><a class="btn btn-primary btn-demo popup-vimeo" href="/board/mydiarywrite"> <i class="icon-play4"></i> Write record</a> 
											
											<sec:authorize access="isAnonymous()">	 
											<a class="btn btn-primary btn-learn" href="/member/register">Join us here! <i class="icon-arrow-right3"></i></a></p>
											</sec:authorize>
							
					   				</div>
					   			</div>
				   			</div>
				   		</div>
			   		</div>
			   	</li>
			   <%-- 	<li style="background-image: url(${pageContext.request.contextPath }/resources/images/img_bg_7.jpg);">
			   		<div class="overlay"></div>
			   		<div class="container-fluids">
			   			<div class="row">
				   			<div class="col-md-6 col-md-offset-3 text-center">
				   				<div class="slider-text">
					   				<div class="slider-text-inner text-center">
					   					<h1>Know More About Jesus</h1>
											<h2>Free html5 templates Made by <a href="http://freehtml5.co/" target="_blank">freehtml5.co</a></h2>
											<p><a class="btn btn-primary btn-demo popup-vimeo" href="https://vimeo.com/channels/staffpicks/93951774"> <i class="icon-play4"></i> Watch Video</a> <a class="btn btn-primary btn-learn">Join us here! <i class="icon-arrow-right3"></i></a></p>
					   				</div>
					   			</div>
				   			</div>
				   		</div>
			   		</div>
			   	</li> --%>
			  	</ul>
		  	</div>
		</aside>
		<div id="fh5co-intro">
			<div class="row animate-box">
				<div class="col-md-12 col-md-offset-0 text-center">
					<h2>Write down your own Story !</h2>
					<span>We are open Sunday to Monday.</span>
				</div>
			</div>
		</div>
		
	
		<!-- 
		<div id="fh5co-bible-verse">
			<div class="overlay"></div>
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<div class="row animate-box">
						<div class="owl-carousel owl-carousel-fullwidth">
							<div class="item">
								<div class="bible-verse-slide active text-center">
									<blockquote>
										<p>&ldquo;우리의 믿음이나 가치관은 다른 사람이 알 수 있도록 말이나 글로 표현될 때 생명력을 얻고 더욱 구체화된다.&rdquo;</p>
										<span>0113</span>
									</blockquote>
								</div>
							</div>
							<div class="item">
								<div class="bible-verse-slide active text-center">
									<blockquote>
										<p>&ldquo;The LORD [is] my strength and my shield; my heart trusted in him, and I am helped: therefore my heart greatly rejoiceth; and with my song will I praise him.&rdquo;</p>
										<span>Psalms 28:7</span>
									</blockquote>
								</div>
							</div>
							<div class="item">
								<div class="bible-verse-slide active text-center">
									<blockquote>
										<p>&ldquo;And we have known and believed the love that God hath to us. God is love; and he that dwelleth in love dwelleth in God, and God in him.&rdquo;</p>
										<span>1 John 4:16</span>
									</blockquote>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div> --><hr>
		<div id="fh5co-events">
			<div class="row animate-box">
				<div class="col-md-6 col-md-offset-3 text-center fh5co-heading">
					<h2>Recent</h2>
					<p> How are you feeling? </p>
				</div>
			</div>
			<div class="row">
					<c:forEach var="i" items="${recentList }">
				<div class="col-md-4 animate-box">
					<div class="events-entry">
						<span class="date">${i.write_date }</span>
						<h3><a href="#">${i.title }</a></h3>
						<p>${i.content }</p>
						<a href="/board/mydiaryread?dno=${i.dno }">Read More <i class="icon-arrow-right3"></i></a>
					</div>
				</div>
					</c:forEach>
					
				<c:if test="${num == 0 }">
					<h3 class="text-center">Still no Record. <a href="/board/mydiarywrite" target="_blank">"keep a diary. Now!"</a></h3>
				</c:if>
			
			
				<sec:authorize access="isAnonymous()">	
					<h3 class="text-center">Still no Record. <a href="/member/register" target="_blank">"Be our Member. Now!"</a></h3>
				</sec:authorize>
			
			</div> 
			
			
			
		</div>
		
	</div><!-- END container-wrap -->

</html>
<jsp:include page="./include/footer.jsp" />
