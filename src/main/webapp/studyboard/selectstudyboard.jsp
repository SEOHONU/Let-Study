<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<style>
* {
	box-sizing: border-box;
}

div {
	border: 1px solid black;
}


.inbox{
	padding-left: 3%;
	padding-right: 3%;
	padding-bottom: 2%;
}

#mainstudyfont {
	height: 150px;
	padding-top: 60px;
	padding-left: 60px;
}

#mainstudyfont>h3 {
	font-weight: 900;
}

.studyfont {
	font-weight: 600;
}

.content {
	height: 100px;
	word-break: break-word;
	overflow: hidden;
}

.writer {
	text-align: right;
}

.leftorrightbtn {
	padding-top: 120px;
	padding-bottom: 120px;
}

.fastfindstudy {
	max-height: 200px;
}

.card-img-top {
	max-height: 120px;
}

.card-body {
	max-height: 200px;
}

#gap {
	height: 150px;
}

.selectbox {
	height: 12%;
	position: relative;
	line-height: 53px;
	padding-left: 15px;
}

.searchbtnbox {
	position: relative;
	height: 12%;
	padding-left: 15px;
}

#searchbtn {
	position: absolute;
	width: 100px;
	height: 32px;
	right: 0px;
	bottom: 0px;
}
</style>
</head>

<body>
	<div class="container">
		<c:import url="/board/topMenu.jsp"></c:import>
		<div class="row header">
			<div class="col-12 p-0">
				<div id="carouselExampleSlidesOnly" class="carousel slide"
					data-bs-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="안아줘요.gif" class="d-block">
						</div>
						<div class="carousel-item">
							<img src="으아아앙.jpg" class="d-block">
						</div>
						<div class="carousel-item">
							<img src="행복해요.gif" class="d-block">
						</div>
						<div class="carousel-item">
							<img src="푸하하.jpg" class="d-block">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row body">
			<div class="col-12" id="mainstudyfont">
				<h3>이달의 스터디</h3>
			</div>
			<div class="col-12" class="fastfindstudy">
				<div class="row">
					<div class="col-2 leftorrightbtn"></div>
					<div class="col-8">
						<div class="row">
							<c:forEach var="j" items="${list}">
								<div class="col-6 inbox">
									<a href="/inner.studyboard?seq=${j.seq}&cpage=${cpage}">
										<div class="row ininbox">

											<div class="col-2 p-0" align="center">
												<div class="ratio ratio-1x1" align="center">
													<div>${j.seq}</div>
												</div>
											</div>
											<div class="col-10">${j.title}</div>
											<div class="col-12 content">${j.contents}</div>
											<div class="col-12 writer">${j.writer}</div>
											<div class="col-12">${j.write_date}</div>
											<div class="col-12">${j.view_count}</div>
										</div>
									</a>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="col-2 leftorrightbtn"></div>
				</div>
			</div>
			<div classs="col-12">
				<div class="row">
					<div class="col-2"></div>
					<div class="col-8" align="right"><a href="/studyboard/insertstudyboard.jsp"><button>아싸라비야 콜롬비야</button></a></div>
					<div class="col-2"></div>
				</div>
				
			</div>
			<div class="col-12" align="center">
				<c:forEach var="i" items="${navi}">
					<c:choose>
						<c:when test="${i eq '<<'}">
							<a
								href="/select.studyboard?cpage=${start}&search=${searchvalue}&option=${optionvalue}">${i}</a>
						</c:when>
						<c:when test="${i eq '<'}">
							<a
								href="/select.studyboard?cpage=${cpage-1}&search=${searchvalue}&option=${optionvalue}">${i}</a>
						</c:when>
						<c:when test="${i eq '>'}">
							<a
								href="/select.studyboard?cpage=${cpage+1}&search=${searchvalue}&option=${optionvalue}">${i}</a>
						</c:when>
						<c:when test="${i eq '>>'}">
							<a
								href="/select.studyboard?cpage=${end}&search=${searchvalue}&option=${optionvalue}">${i}</a>
						</c:when>
						<c:otherwise>
							<a
								href="/select.studyboard?cpage=${i}&search=${searchvalue}&option=${optionvalue}">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>

		</div>
		<div class="row footer">
			<div class="col-12">아래 대충 띄어놓기</div>
		</div>
	</div>
</body>
</html>