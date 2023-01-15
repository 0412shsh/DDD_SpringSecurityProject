<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<jsp:include page="../include/header.jsp" />
<html>
<head>
<meta charset="UTF-8">
<title>DDD- 회원가입</title>
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
				   					<h1>Register</h1>
										<h2>Thank you for join out service.</h2>
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
					<h2>Register</h2>
					<p>Welcome to Dear Diary :D </p>
				</div>
			</div>
		<!-- 회원가입  -->
		<div class="row animate-box">
			<div class="col-md-6 col-md-offset-3 text-center fh5co-heading">
		  <form class="form-signin" action="/member/register"  method="post">
			<a><img class="mb-4" src="/images/logo.png" alt="" width="72" height="72"></a>
			<h1 class="h3 mb-3 font-weight-normal">JOIN</h1>
				
				<c:if test="${error != null}">
				<div class="alert alert-warning"><c:out value="${error }" /></div>
				</c:if>
				
				<c:if test="${logout != null}">
				<div class="alert alert-success"><c:out value="${logout }" /></div>
				</c:if>
			
			<br>
			<label for="username" class="sr-only">ID</label>
			<input type="text" id="username" name="userid" class="form-control" placeholder="ID" required autofocus>
			<br>
			<label for="inputPassword" class="sr-only">Password</label>
			<input type="password" id="inputPassword" name="userpw" class="form-control" placeholder="Password" required>   					
			<br>
			<label for="username" class="sr-only">Name</label>
			<input type="text" id="username" name="username" class="form-control" placeholder="Name" required autofocus>  
			<br>
			<label for="inputPassword" class="sr-only">Email</label>
			<input type="email" id="inputPassword" name="email" class="form-control" placeholder="Email" required>
			<br>
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
		<!-- 회원가입 -->




		
		</div>
		
				</div>	
		   
</body>
</html>
<jsp:include page="../include/footer.jsp" />





