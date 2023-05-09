<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mypage</title>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
	integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css"
	integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA="
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/ti-icons@0.1.2/css/themify-icons.css">
<style>
* {
	box-sizing: border-box;
}

body {
	margin-top: 20px;
}

/* header ---------------------------------------------------- */
.rowheader {
	height: 300px;
	overflow: hidden;
}

#studyimg {
	position: relative;
}

#studyimg>img {
	object-fit: cover;
	filter: brightness(0.4);
}

.imgInText {
	text-align: center;
	color: white;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.imgInText2 {
	text-align: center;
	color: white;
	position: absolute;
	top: 65%;
	left: 50%;
	transform: translate(-50%, -50%);
}

/* 왼쪽 프로필 ---------------------------------------------------- */
#profilecircle>img {
	width: 150PX;
	height: 150PX;
	margin: auto;
	filter: invert(23%) sepia(78%) saturate(303%) hue-rotate(126deg)
		brightness(90%) contrast(87%);
	margin-top: 10%;
}

/* 아이콘 */
.icon-style2 a {
	display: inline-block;
	font-size: 18px;
	text-align: center;

	background: #254F4C;
	height: 41px;
	line-height: 41px;
	width: 41px;
}

.icon-style2 {
	margin-bottom: 0;
	display: inline-block;
	padding-left: 25%;
	position: relative;
}

.icon-style2>div {
	vertical-align: middle;
	display: inline-block;
	margin: 20px;
	border-radius: 50px;
}

.list-unstyled>.email {
	margin-left: 17%
}

.list-unstyled>.contact {
	margin-left: 18%;
}

/* 왼쪽 네비 ---------------------------------------------------- */
a, a:active, a:focus {
	color: #616161;
	text-decoration: none;
	transition-timing-function: ease-in-out;
	-ms-transition-timing-function: ease-in-out;
	-moz-transition-timing-function: ease-in-out;
	-webkit-transition-timing-function: ease-in-out;
	-o-transition-timing-function: ease-in-out;
	transition-duration: .2s;
	-ms-transition-duration: .2s;
	-moz-transition-duration: .2s;
	-webkit-transition-duration: .2s;
	-o-transition-duration: .2s;
}

.text-secondary, .text-secondary-hover:hover {
	color: #254F4C !important;
}

.display-25 {
	font-size: 1.4rem;
}

p {
	margin: 0 0 20px;
}

.mb-1-6, .my-1-6 {
	margin-bottom: 1.6rem;
}

/* 왼쪽 네비 ---------------------------------------------------- */
#leftNavi {
	padding: 10%;
	background-color: white;
	border-radius: 3%;
}

#leftNavi i {
	font-size: medium;
	color: inherit;
	color: #254F4C;
	text-decoration: none;
}

#leftNavi div:hover {
	background-color: #f3f3f3;
	border-radius: 4%;
}

/* 오른쪽 ---------------------------------------------------- */
.box {
	background-color: white;
	border-radius: 3%;
}

.B {
	width: 100%;
	height: 300px;
	overflow: auto;
	background-color: white;
	border-radius: 10px;
	padding: 3%;
}

.B>strong {
	font-size: 20px;
}

.B>table {
	margin-top: 2%;
}

#emptyText {
	text-align: center;
	margin-top: 10%;
}

/* 박스사이공간 */
.empty {
	background-color: none;
	height: 25px;
}
</style>
</head>

<body style="background-color: #f3f3f3;">

	<div class="container">
		<!--------- 상단네비,헤더 ---------->
		<c:import url="/board/topMenu.jsp"></c:import>
		<div class="rowheader">
			<div class="col-12" id="studyimg">
				<img src="/image/studyMypage.jpg" width="100%" height="300px";>
				<h1 class="imgInText" style="font-size: 50px;">마이페이지</h1>
				<div class="imgInText2">${loggedNickname}님,LetStudy에오신것을
					환영합니다.</div>
			</div>
		</div>
		<div class="empty"></div>

		<!--------- 왼쪽프로필 ---------->
		<div class="row justify-content-center">
			<div class="col-md-7 col-lg-3 mb-5 mb-lg-0 wow fadeIn">
				<div class="card border-0 shadow" id="profilecircle">
					<img src="/image/person.png">
					<div class="card-body p-0-0 p-xl-1">
						<div class="mb-4">
							<h3 class="h4 mb-0" align="center">
								<b>${loggedNickname}</b>
							</h3>
						</div>
						

						<ul class="list-unstyled">
							<li class="email"><i
								class="far fa-envelope display-25 me-3 text-secondary"></i>${myInfoMain.email}
							</li>
							<li class="contact"><i
								class="fas fa-mobile-alt display-25 me-3 text-secondary"></i>${myInfoMain.contact}
							</li>
						</ul>

						<div class="icon-style2 ">
							<div class="message">
								<a href="쪽지" class="rounded-5" > <i
									class="fa-regular fa-envelope" id="pictogram"></i></a>
							</div>
							<div class="prorileSetting">
								<a href="/select.profile_settingController"
									 class="rounded-5"> <i
									class="fa-solid fa-gear"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="empty"></div>

				<!--------- 왼쪽네비 ---------->
				<div class="col-12" id="leftNavi">
					<div class="myBoard">
						<a href="/mypageboard.mypageboardController"> <input
							type="button" style="opacity: 0;"> <i
							class="fa-solid fa-address-book"> 내 게시판</i></input>
						</a>
					</div>

					<hr>
					<div class="myInfo">
						<a href="/myInfoSelect.member"> <input type="button"
							style="opacity: 0;"> <i class="fa-solid fa-gear"> 내정보
								관리</i></input>
						</a>
					</div>
					<hr>
				</div>
			</div>

			<!--------- 오른쪽 게시판 ---------->
			<div class="col-lg-9">
				<div class="row">
					<input type="hidden" name="id" value="${loggedID}">

					<div id="borders">
						<div class="study B">
							<strong>스터디 게시판</strong>
							<table
								summary="This table shows how to create responsive tables using Datatables' extended functionality"
								class="table table-bordered table-hover dt-responsive">

								<c:choose>
									<c:when test="${empty studyboard}">
										<div id="emptyText">작성한 게시글이 없습니다.</div>
									</c:when>

									<c:otherwise>

										<thead>
											<tr>
												<th class="col col-lg-1 col-sm-2">no.</th>
												<th class="col col-lg-9 col-sm-8">상품명</th>
											</tr>
										</thead>

										<c:forEach var="s" items="${studyboard}">
											<tr>
												<td>${s.seq}</td>
												<td><a href="/inner.studyboard?seq=${s.seq}&cpage=1">${s.title}</a></td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</table>
						</div>
						<div class="empty"></div>

						<div class="secondhand B">
							<strong>중고 거래 게시판</strong>

							<table
								summary="This table shows how to create responsive tables using Datatables' extended functionality"
								class="table table-bordered table-hover dt-responsive">
								<c:choose>
									<c:when test="${empty secondhandboard}">
										<div id="emptyText">작성한 게시글이 없습니다.</div>
									</c:when>
									<c:otherwise>
										<thead>
											<tr>
												<th class="col col-lg-1 col-sm-2">no.</th>
												<th class="col col-lg-9 col-sm-8">상품명</th>
											</tr>
										</thead>
										<c:forEach var="sh" items="${secondhandboard}">
											<tr>
												<td>${sh.seq}</td>
												<td><a
													href="/secondHandBoardContents.secondHand?seq=${sh.seq}&currentPage=1">${sh.title}</a>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</table>
						</div>
						<div class="empty"></div>

						<div class="free B">
							<strong>자유게시판</strong>
							<table
								summary="This table shows how to create responsive tables using Datatables' extended functionality"
								class="table table-bordered table-hover dt-responsive">
								<c:choose>
									<c:when test="${empty freeboard}">
										<div id="emptyText">작성한 게시글이 없습니다.</div>
									</c:when>
									<c:otherwise>
										<thead>
											<tr>
												<th class="col col-lg-1 col-sm-2">no.</th>
												<th class="col col-lg-9 col-sm-10">제목</th>
											</tr>
										</thead>
										<c:forEach var="f" items="${freeboard}">
											<tr>
												<td>${f.seq}</td>
												<td><a href="/detail.freeBoard?seq=${f.seq}">${f.title}</a></td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</table>
						</div>
						<div class="empty"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="rowfooter">
			<c:import url="/board/footer.jsp"></c:import>
		</div>
	</div>



</body>

</html>