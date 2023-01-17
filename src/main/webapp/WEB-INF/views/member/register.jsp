<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    


<!DOCTYPE html>
<jsp:include page="../include/header.jsp" />
<html>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
<script type="text/javascript">



</script>

<script>



	$(document).ready(function(){
		
		//alert("얌");
		
		$('#username').keyup(function(){
			let userid = $('#username').val();
			$.ajax({
				url:"/member/idcheck",
				type:"get",
				data : {
						userid: userid
				},
				success : function(result){
					if(result == 1){
						$("#id_feedback").html('이미 사용중인 아이디입니다.');
						$("#id_feedback").attr('color','#dc3545');
						$("#idCheck1").attr("value", "N");
					} else{
						$("#id_feedback").html('사용할 수 있는 아이디입니다.');
						$("#id_feedback").attr('color','#72FBC6');
						$("#idCheck1").attr("value", "Y");
					} 
				},
				error : function(){
					alert("서버요청실패");
				}
			});
				 
		});
		
		$('#email').keyup(function(){
			let email = $('#email').val();
			$.ajax({
				url:"/member/emailcheck",
				type:"get",
				data : {
						email: email
				},
				success : function(result){
					if(result == 1){
						$("#phone_feedback").html('이미 사용중인 이메일입니다.');
						$("#phone_feedback").attr('color','#dc3545');
						$("#idCheck2").attr("value", "N");
					} else{
						$("#phone_feedback").html('사용할 수 있는 이메일입니다.');
						$("#phone_feedback").attr('color','#72FBC6');
						$("#idCheck2").attr("value", "Y");
					} 
				},
				error : function(){
					alert("서버요청실패");
				}
			});
				 
		});
		
		
		$('#join').submit(function() { 
			
			if($('#idCheck1').val() == 'N') {
				return false;
			}
			if($('#idCheck2').val() == 'N') {
				return false;
			}
			
		});
		
		
		
	}); //document.ready
	
	
	
	
</script>
<head>
<meta charset="UTF-8">
<title>DDD- 회원가입</title>
</head>
<body>




   
   <div class="container-wrap">


        
        <aside id="fh5co-hero">
			<div class="flexslider">
				<ul class="slides">
			   	<li><img src=”http://din1410.cdn1.cafe24.com/img_bg_5.jpg”>
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
		  <form class="form-signin" id="join" action="/member/register"  method="post">
			<a><img class="mb-4" src="${pageContext.request.contextPath }/resources/images/logo.png" alt="" width="72" height="72"></a>
			<h1 class="h3 mb-3 font-weight-normal">JOIN</h1>
				
				<c:if test="${error != null}">
				<div class="alert alert-warning"><c:out value="${error }" /></div>
				</c:if>
				
				<c:if test="${logout != null}">
				<div class="alert alert-success"><c:out value="${logout }" /></div>
				</c:if>
			
			<br>
			<label for="username" class="sr-only">ID or NickName</label>
			<input type="text" id="username" name="userid" class="form-control" placeholder="ID & NickName" required autofocus>
			<input type="hidden" id="idCheck1" value="0"> 
			<div><font id="id_feedback" size="2"></font></div>
			<br>
			<label for="inputPassword" class="sr-only">Password</label>
			<input type="password" id="inputPassword" name="userpw" class="form-control" placeholder="Password" required>   					
			<br>
			<label for="inputPassword" class="sr-only">Email</label>
			<input type="email" id="email" name="email" class="email form-control" placeholder="Email" required>
			<input type="hidden" id="idCheck2" value="0"> 
			<div><font id="phone_feedback" size="2"></font></div>
			<br>
			<input id="csrf" type="hidden" name="${_csrf.parameterName }" 
                 value="${_csrf.token }"> 
			<br>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
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





