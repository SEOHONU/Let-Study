<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
	integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.js"></script>
    <script src="https://kit.fontawesome.com/09115628a5.js" crossorigin="anonymous"></script>
	<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4d79f132798324278c93739a54ae859c&libraries=services"></script>
	
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script src="https://kit.fontawesome.com/09115628a5.js" crossorigin="anonymous"></script>
              
<style>
* {
	box-sizing: border-box;
}

div {
	<!--border: 1px solid black;-->
}


.inbox{
	padding-left: 3%;
	padding-right: 3%;
}

#mainstudyfont {
	height: 150px;
	padding-top: 60px;
	padding-left: 60px;
	background-color: rgb(72,143,149,1);
}

#mainstudyfont>h3 {
	font-weight: 900;
}

.studyfont {
	font-weight: 600;
}

.carousel-item{
	height: 600px;
}

.d-block{
	width:100%;
	height:100%;
}

.ratio{
	background-color: red;
}

.title{
	background-color: orange;
}

.content {
	height: 100px;
	word-break: break-word;
	overflow: hidden;
	background-color: yellow;
}

.box-bottom{
	background-color: green;
}

.leftorrightbtn {
	padding-top: 120px;
	padding-bottom: 120px;
	background-color: rgb(72,143,149,1);
}

.box{
	background-color: rgb(72,143,149,1);
}

.btns{
	background-color: white;
	border-radius: 5px;
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
							<img src="/image/study.jpg" class="d-block">
						</div>
						<div class="carousel-item">
							<img src="/image/studytotal.jpg" class="d-block">
						</div>
						<div class="carousel-item">
							<img src="/image/다운로드.jpg" class="d-block">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row body">
			<div class="col-12" id="mainstudyfont">
				<h3>스터디 목록</h3>
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
											<div class="col-10 title">${j.title}</div>
											<div class="col-12 content">${j.contents}</div>
											<div class="col-12 box-bottom" align="right">${j.writer}</div>
											<div class="col-12 box-bottom" align="right">${j.write_date}</div>
											<div class="col-12 box-bottom" align="right">조회수:${j.view_count}</div>
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
				<div class="row box">
					<div class="col-2"></div>
					<div class="col-8" align="right"><a href="/studyboard/insertstudyboard.jsp"><button class="btns">글쓰기</button></a></div>
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