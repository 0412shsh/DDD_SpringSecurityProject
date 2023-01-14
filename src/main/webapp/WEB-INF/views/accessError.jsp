<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core"  prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h1 style="background-color:orange;">accessError.jsp - 접근이 거부되었습니다. </h1>
		<div style="background-color:yellow; ">
		관리자에게 문의하세요.<br>
		${msg }<br>
		${SPRING_SECURITY_403_EXCEPTION.getMessage() }</div>		 
		
</body>
</html>