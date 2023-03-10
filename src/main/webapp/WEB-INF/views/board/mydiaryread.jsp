<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
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
					<li><img src=”http://din1410.cdn1.cafe24.com/img_bg_5.jpg”>
						<div class="overlay"></div>
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-6 col-md-offset-3 text-center slider-text">
									<div class="slider-text-inner">
										<h1>Read a diary</h1>
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
					<h2>Read a diary</h2>
					<p>Talk with other people. Let's use the nice words.</p>
				</div>
			</div>
			<!-- 여기서 부터 board 내용 쓰기 @@@@@@@@@@@@@			-->
			<!-- form 시작 -->

			<div class="row">

				<div class="col-md-12 animate-box">
					<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<input type="text" class="form-control" name="title" value=${vo.title } readonly>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<input type="text" class="form-control" name="userid"
										value=${vo.userid }
										readonly>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<input type="text" class="form-control" placeholder="작성시간" value=${vo.write_date }
										readonly>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<textarea style="height: 400px;" name="content"
										class="form-control" readonly>${vo.content } </textarea>

								</div>
							</div>
							<input type="hidden" name="${_csrf.parameterName }"
								value="${_csrf.token }">

					<link href="${pageContext.request.contextPath }/resources/css/star.css" rel="stylesheet"/>
						
						<div class="col-md-12" id="heart">
							<span class="text-left">지금 내 기분은? </span>
							<fieldset>
							
							<c:if test="${vo.score == '1'}">
							<input type="radio" value="5" id="rate1" name=score><label
								for="rate1">♥</label>
							<input type="radio" value="4" id="rate2" name=score><label
								for="rate2" >♥</label>
							<input type="radio" value="3" id="rate3" name=score><label
								for="rate3" >♥</label>
							<input type="radio" value="2" id="rate4" name=score><label
								for="rate4" >♥</label>
							<input type="radio" value="1" id="rate5" name=score checked><label
								for="rate5" >♥</label>
							</c:if>
							
							<c:if test="${vo.score == '2'}">
							<input type="radio" value="5" id="rate1" name=score><label
								for="rate1">♥</label>
							<input type="radio" value="4" id="rate2" name=score><label
								for="rate2" >♥</label>
							<input type="radio" value="3" id="rate3" name=score><label
								for="rate3" >♥</label>
							<input type="radio" value="2" id="rate4" name=score checked><label
								for="rate4" >♥</label>
							<input type="radio" value="1" id="rate5" name=score><label
								for="rate5" >♥</label>
							</c:if>
							
							<c:if test="${vo.score == '3'}">
							<input type="radio" value="5" id="rate1" name=score><label
								for="rate1">♥</label>
							<input type="radio" value="4" id="rate2" name=score><label
								for="rate2" >♥</label>
							<input type="radio" value="3" id="rate3" name=score checked><label
								for="rate3" >♥</label>
							<input type="radio" value="2" id="rate4" name=score><label
								for="rate4" >♥</label>
							<input type="radio" value="1" id="rate5" name=score><label
								for="rate5" >♥</label>
							</c:if>
							
							<c:if test="${vo.score == '4'}">
							<input type="radio" value="5" id="rate1" name=score><label
								for="rate1">♥</label>
							<input type="radio" value="4" id="rate2" name=score checked><label
								for="rate2" >♥</label>
							<input type="radio" value="3" id="rate3" name=score><label
								for="rate3" >♥</label>
							<input type="radio" value="2" id="rate4" name=score><label
								for="rate4" >♥</label>
							<input type="radio" value="1" id="rate5" name=score><label
								for="rate5" >♥</label>
							</c:if>
							
							<c:if test="${vo.score == '5'}">
							<input type="radio" value="5" id="rate1" name=score checked readonly><label
								for="rate1">♥</label>
							<input type="radio" value="4" id="rate2" name=score><label
								for="rate2" >♥</label>
							<input type="radio" value="3" id="rate3" name=score><label
								for="rate3" >♥</label>
							<input type="radio" value="2" id="rate4" name=score><label
								for="rate4" >♥</label>
							<input type="radio" value="1" id="rate5" name=score><label
								for="rate5" >♥</label>
							</c:if>
							
							
							
							
							
							
							</fieldset>
						</div>

	
							<div class="col-md-12 text-right">
								<div class="form-group">
								<sec:authentication property="principal" var="pinfo"/>
									<sec:authorize access="isAuthenticated()">
									<c:if test="${pinfo.username eq vo.userid }">
									<button type="button" class="btn btn-primary btn-modify" onclick="location.href='/board/mydiaryupdate?dno='+'${vo.dno}'">수정</button>
									<button type="button" class="btn btn-primary btn-modify" onclick="location.href='/board/mydiarydelete?dno='+'${vo.dno}'">삭제</button>
									</c:if>									
									</sec:authorize>
									<a href="/board/mydiary" class="btn btn-primary btn-modify">목록</a>
									
								</div>
							</div>
						</form>
					</div>
				</div>




			
			</div>

			<!--form 끝  -->
		</div>
			


		<!-- 여기서 부터 board 내용 끝 @@@@@@@@@@@@@	-->



	</div>

</body>
</html>
<jsp:include page="../include/footer.jsp" />


