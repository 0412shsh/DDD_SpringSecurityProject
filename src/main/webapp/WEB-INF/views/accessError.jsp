<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<jsp:include page="./include/header.jsp" />
	<body>
		
	<div class="fh5co-loader"></div>
	
	
	<div class="container-wrap">
			   	
			  
		<div id="fh5co-events">
			<div class="row animate-box">
				<div class="col-md-6 col-md-offset-3 text-center fh5co-heading">
					<h2>Error</h2>
					<p> 접근이 거부되었습니다.관리자에게 문의하세요. </p>
					${msg }<br>
					${auth}<br>
					${SPRING_SECURITY_403_EXCEPTION.getMessage() }</div>
				</div>
				
			</div>
			
			
			
		</div>
		

</html>
<jsp:include page="./include/footer.jsp" />
