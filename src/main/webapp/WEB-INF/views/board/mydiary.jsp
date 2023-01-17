<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<jsp:include page="../include/header.jsp" />
<html>
<head>
<meta charset="UTF-8">
<title>DDD - MyDiary</title>
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
										<h1>Read My Diary.</h1>
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</aside>
		<div id="fh5co-contact">
			<div class="row animate-box ">
				<div class="col-md-6 col-md-offset-3 text-center fh5co-heading ">
					<h2>Read</h2>
					<p>Look! We made lots of stories.</p>
				</div>
			</div>
			<!-- 여기서 부터 board 내용 쓰기 @@@@@@@@@@@@@			-->
			<!-- form 시작 -->

			<div class="row">

				<div class="col-md-12 animate-box">
					<div class="row">
						<table class="table table-bodered">
						total : ${total }
							<tr>
								<th class="text-center" >date</th>
								<th class="text-center">title</th>
								<th class="text-center" >writer</th>
								<th class="text-center" >mood</th>

							</tr>
							<c:forEach var="i" items="${boardList }">
								<tr>
									<td class="text-center">${i.write_date }</td>
									<td class="text-center"><a href="/board/mydiaryread?dno=${i.dno }">${i.title }</a></td>
									<td class="text-center">${i.userid }</td>
									
									<c:if test="${i.score == '1'}">
									<td class="text-center">♥</td>
									</c:if>
									<c:if test="${i.score == '2'}">
									<td class="text-center">♥♥</td>
									</c:if>
									<c:if test="${i.score == '3'}">
									<td class="text-center">♥♥♥</td>
									</c:if>
									<c:if test="${i.score == '4'}">
									<td class="text-center">♥♥♥♥</td>
									</c:if>
									<c:if test="${i.score == '5'}">
									<td class="text-center">♥♥♥♥♥</td>
									</c:if>
									
									
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>

		<!-- 글쓰기 버튼 -->
		  <div class="col-md-12">
			<div class="form-group text-right">
				<a href="/board/mydiarywrite" type="button" class="btn btn-primary btn-modify" >글쓰기</a>
			</div>
		  </div>

		</div>

		<!--form 끝  -->
		
		
		
	</div>



	<!-- 여기서 부터 board 내용 끝 @@@@@@@@@@@@@	-->




</body>
</html>
<jsp:include page="../include/footer.jsp" />


