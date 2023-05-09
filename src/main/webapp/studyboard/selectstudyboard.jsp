<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
				integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
				crossorigin="anonymous" referrerpolicy="no-referrer" />

			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
				crossorigin="anonymous">
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
					< !--border: 1px solid black;
					-->
				}


				.inbox {
					padding-left: 3%;
					padding-right: 3%;
					padding-bottom: 2%;
				}

				a {
					text-decoration: none;
					color: black;
				}

				#mainstudyfont {
					height: 150px;
					padding-top: 60px;
					padding-left: 60px;
					background-color: rgb(72, 143, 149, 1);
				}

				#mainstudyfont>h3 {
					font-weight: 900;
				}

				.studyfont {
					font-weight: 600;
				}

				.carousel-item {
					height: 600px;
				}

				.d-block {
					width: 100%;
					height: 100%;
				}

				.ratio {
					background-color: white;
				}

				.title {
					display: block;
					background-color: white;
					overflow: hidden;
					text-overflow: ellipsis;
					white-space: nowrap;
					font-size: x-large;

				}

				.content {
					height: 100px;
					word-break: break-word;
					overflow: hidden;
					background-color: white;
				}

				.box-bottom {
					background-color: white;
				}

				/* .leftorrightbtn {
	padding-top: 120px;
	padding-bottom: 120px;
	background-color: rgb(72,143,149,1);
} */


				.btns {
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

				#freeboard_img {
					position: relative;
					width: 100%;
					height: 200px;
				}

				#freeboard_img::before {
					content: "";
					position: absolute;
					top: 0;
					left: 0;
					width: 100%;
					height: 100%;
					background-color: black;
					opacity: 0.5;
				}

				#freeboard_img img {
					/* object-position : center -370px; */
					opacity: 0.5;
					position: absolute;
					top: 0;
					left: 0;
					width: 100%;
					height: 100%;
					object-fit: cover;
				}

				#imgTitle {
					position: absolute;
					top: 50%;
					left: 50%;
					transform: translate(-50%, -50%);
					z-index: 1;
					/* text 요소를 커버 위에 위치시킵니다. */
					color: white;
					text-align: center;
					font-size: 2rem;
				}

				#searchDiv {
					margin: auto;
					display: relative;
					margin-top: 5px;
				}

				.margin {
					height: 28px;
				}

				.ininbox {
					border-radius: 10px;
					overflow: hidden;
				}

				.line {
					border: 1px solid gray;

				}

				.seq {
					background-color: white;
				}

				.box {
					position: relative;
					height: 30px;
				}

				.writebtn {
					position: absolute;
					right: 2%;
				}
			</style>
		</head>

		<body style="background-color: #f3f3f3">
			<div class="container">
				<c:import url="/board/topMenu.jsp"></c:import>
				<div class="row">
					<div class="col-12 " id="freeboard_img">
						<a href="/select.studyboard">
							<img src="/image/study.jpg" id="picture">
							<h1 id=imgTitle>스터디 모임 게시판</h1>
						</a>
					</div>
				</div>

				<div class="row">
					<div class="col margin"></div>
				</div>

				<!-- 검색 -->
				<!-- <form action="/searchByOption.freeBoard" method="post">
		<div class="row" id="searchRow">
			<div class="col-12">
				<div class="d-flex justify-content-center row" id="searchDiv">
					<div class="col-2 p-0">
						<select class="form-select text-center" id="select" aria-label="Default select example" name="optionValue">
							<option selected >-- 검색 선택 --</option>
							<option value="제목" >제목</option>
							<option value="내용" >내용</option>
							<option value="호스트">호스트</option>
						</select>
					</div>
					<div class="col-10 p-0">
						<div class="input-group mb-3">
							<input type="text" class="form-control" placeholder="검색어를 입력하세요"
								aria-label="Recipient's username" aria-describedby="basic-addon2" name="searchValue">
							<button class="btn btn-outline-secondary" type="submit"
								id="button-addon2">
								<i class="fa-solid fa-magnifying-glass"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		</form>
		
		<div class="row">
			<div class="col margin"></div>
		</div> -->

				<!-- 검색까지  -->

				<div class="row body">
					<div class="col-12" class="fastfindstudy">
						<div class="row">
							<div class="col-1"></div>
							<div class="col-10">
								<div class="row">
									<c:forEach var="j" items="${list}">
										<div class="col-6 inbox">
											<a href="/inner.studyboard?seq=${j.seq}&cpage=${cpage}">
												<div class="row ininbox">

													<div class="col-2 p-0 seq" align="center">
														${j.seq}
													</div>
													<div class="col-10 title p-2">${j.title}</div>
													<div class="col-12 line"></div>
													<div class="col-12 content">
														인원 : ${j.guestcount} 명<br>
														${j.detailcontents}
													</div>
													<div class="col-12 line"></div>
													<div class="col-12 box-bottom" align="right">${j.writer}</div>
													<div class="col-12 box-bottom" align="right">조회수:${j.view_count}
													</div>
												</div>
											</a>
										</div>
									</c:forEach>
								</div>
							</div>
							<div class="col-1"></div>
						</div>
					</div>
					<div classs="col-12">
						<div class="row">
							<div class="col-1"></div>
							<div class="col-10 box"><a href="/studyboard/insertstudyboard.jsp"><button
										class="btns writebtn">글쓰기</button></a></div>
							<div class="col-1"></div>
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
					<c:import url="/board/footer.jsp"></c:import>
				</div>
			</div>

			<script>
				$(window).on("load", function () {
					const bodySize = parseInt($("body").css("width"));
					if (bodySize > 1399) {
						$("#picture").css("object-position", "center -370px");
					}
					else if (bodySize <= 1399 && bodySize > 1199) {
						$("#picture").css("object-position", "center -305px");
					}
					else if (bodySize <= 1199 && bodySize > 991) {
						$("#picture").css("object-position", "center -250px");
					}
					else if (bodySize <= 991) {
						$("#picture").css("object-position", "center -155px");
					}
					else if (bodySize <= 767) {
						$("#picture").css("object-position", "center -95px");
					}
				});

				addEventListener("resize", function (event) {
					const bodySize = parseInt($("body").css("width"));
					if (bodySize > 1399) {
						$("#picture").css("object-position", "center -370px");
					}
					else if (bodySize <= 1399 && bodySize > 1199) {
						$("#picture").css("object-position", "center -305px");
					}
					else if (bodySize <= 1199 && bodySize > 991) {
						$("#picture").css("object-position", "center -250px");
					}
					else if (bodySize <= 991 && bodySize > 767) {
						$("#picture").css("object-position", "center -155px");
					}
					else if (bodySize <= 767) {
						$("#picture").css("object-position", "center -95px");
					}
				});

			</script>
		</body>

		</html>