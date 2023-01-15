<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<jsp:include page="../include/header.jsp" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   
   <div class="container-wrap">


        
        <aside id="fh5co-hero">
			<div class="flexslider">
				<ul class="slides">
			   	<li style="background-image: url(/images/img_bg_4.jpg);">
			   		<div class="overlay"></div>
			   		<div class="container-fluid">
			   			<div class="row">
				   			<div class="col-md-6 col-md-offset-3 text-center slider-text">
				   				<div class="slider-text-inner">
				   					<h1>Login</h1>
										<h2>Let me check your ID Card Please</h2>
				   				</div>
				   			</div>
				   		</div>
			   		</div>
			   	</li>
			  	</ul>
		  	</div>
		</aside>
		<div id="fh5co-contact">
			<div class="row animate-box">
				<div class="col-md-6 col-md-offset-3 text-center fh5co-heading">
					<h2>Login</h2>
					<p>Welcome to Dear Diary :D </p>
				</div>
			</div>
		<!-- 로그인  -->
		<div class="row animate-box">
			<div class="col-md-6 col-md-offset-3 text-center fh5co-heading">
		  <form class="form-signin" action="/login" method="post">
			<a><img class="mb-4" src="/images/logo.png" alt="" width="72" height="72"></a>
			<h1 class="h3 mb-3 font-weight-normal">Please Login</h1>
				
				<c:if test="${error != null}">
				<div class="alert alert-warning"><c:out value="${error }" /></div>
				</c:if>
				
				<c:if test="${logout != null}">
				<div class="alert alert-success"><c:out value="${logout }" /></div>
				</c:if>
				   					
			<label for="username" class="sr-only">ID</label>
			<input type="text" id="username" name="username" class="form-control" placeholder="ID" required autofocus>  
			<label for="inputPassword" class="sr-only">Password</label>
			<input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>
			<input type="hidden" name="${_csrf.parameterName }" 
                 value="${_csrf.token }"> 
			<br>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
			<a href="/member/register"><p>Not member?</p></a>
			<p class="mt-5 mb-3 text-muted">&copy; 2023</p>
			<br>
		  </form>
		  </div>
		  </div>
		<!-- 로그인 -->




		
		</div>
		
				</div>	
		   
</body>
</html>
<jsp:include page="../include/footer.jsp" />


