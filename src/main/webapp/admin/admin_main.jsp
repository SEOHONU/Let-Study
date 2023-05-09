<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Admin Panel</title>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>




<!-- Bootstrap CSS -->
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

<!-- 구글 폰트  -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet">

<!-- calender style -->
<link rel="stylesheet" href="/calendar/style.css">
<!-- calender js -->
<script src="/calendar/main.js"></script>
<script src="/calendar/jquery.min.js"></script>
<script src="/calendar/bootstrap.min.js"></script>


	<!-- Bootstrap JS -->
			<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
				integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
				crossorigin="anonymous"></script>
			<script
				src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
				integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
				crossorigin="anonymous"></script>
			<script
				src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
				integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
				crossorigin="anonymous"></script>


<style>
* {
	font-family: 'Gowun Dodum', sans-serif;
	font-weight: bold;
}

/* div {
	border: 1px solid black;
} */
.dash_title {
	font-size: 40px;
}

.btn_header {
	float: right;
	margin-bottom: 10px;
	position: relative;
	top: 70px;
	background-color: white;
}

.dashboard {
	height: 300px;
}

.freeboard_start {
	margin-top: 20px;
}

.header_topLine {
	background-color: #1e3c3e;
}
</style>
</head>

<body>
	<div class="container">
		<div class="row header top_banner">
			<!-- justify-content-center -->
			<!-- 페이지 최 상단 관리자페이지 이름과 수정하기/로그아웃 버튼 시작 -->
			<div class="col header_topLine col-lg-12">
				<!-- <button type="button" class="btn btn-outline-dark btn_header">수정하기</button> -->
				<form action="/admin_logout.admin" method="post">
					<img alt="" src="새 프로젝트.png" style="height: 100%;">

					<button type="submit" class="btn btn-outline-dark btn_header">로그아웃</button>
				</form>
			</div>
			<!-- 페이지 최 상단 관리자페이지 이름과 수정하기/로그아웃 버튼 종료 -->
			<!-- 상단 네비게이션 시작 -->
			<nav class="navbar navbar-expand-lg navbar-light bg-light col-12">
				<div class="container">
					<a class="navbar-brand" href="/admin_mainboard.admin_main">메인으로</a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarNav"
						aria-controls="navbarNav" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<!-- 상단 네비 클릭부분 -->
					<!-- 추후 다시 하이퍼링크 변경해야함 23/04/24 -->
					<div class="collapse navbar-collapse" id="navbarNav">
						<ul class="navbar-nav">
							<li class="nav-item "><a class="nav-link active"
								aria-current="page" href="#">대시보드</a></li>


							<li class="nav-item"><a class="nav-link"
								href="/freeBoard.adminBoard?cpage=1">자유게시판 관리</a></li>


							<li class="nav-item"><a class="nav-link"
								href="/study_select.adminBoard?cpage=1">스터디게시판 관리</a></li>
							<li class="nav-item"><a class="nav-link"
								href="/secondHand.adminBoard?cpage=1">중고책게시판 관리</a></li>
							<li class="nav-item"><a class="nav-link"
								href="/user_Board.adminBoard?cpage=1">회원관리</a></li>
							<!--<li class="nav-item"><a class="nav-link disabled" href="#"
								tabindex="-1" aria-disabled="true">배너관리</a></li>-->

							<!-- 배너관리는 추후 -->

						</ul>
					</div>
				</div>
			</nav>
		</div>
		<!-- 상단 네비게이션 종료 -->
		<!-- 바디 부분 시작 -->
		<div class="row body">
			<!-- 바디 > 대시보드 시작 -->
			<div class="col body_header ">
				<h1>공지사항</h1>
				<div class="row">
					<section class="ftco-section">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-md-6 text-center mb-5">
									<h2 class="heading-section">Calendar #04</h2>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="content w-100">
										<div class="calendar-container">
											<div class="calendar">
												<div class="year-header">
													<span class="left-button fa fa-chevron-left" id="prev">
													</span> <span class="year" id="label"></span> <span
														class="right-button fa fa-chevron-right" id="next">
													</span>
												</div>
												<table class="months-table w-100">
													<tbody>
														<tr class="months-row">
															<td class="month">Jan</td>
															<td class="month">Feb</td>
															<td class="month">Mar</td>
															<td class="month">Apr</td>
															<td class="month">May</td>
															<td class="month">Jun</td>
															<td class="month">Jul</td>
															<td class="month">Aug</td>
															<td class="month">Sep</td>
															<td class="month">Oct</td>
															<td class="month">Nov</td>
															<td class="month">Dec</td>
														</tr>
													</tbody>
												</table>

												<table class="days-table w-100">
													<td class="day">Sun</td>
													<td class="day">Mon</td>
													<td class="day">Tue</td>
													<td class="day">Wed</td>
													<td class="day">Thu</td>
													<td class="day">Fri</td>
													<td class="day">Sat</td>
												</table>
												<div class="frame">
													<table class="dates-table w-100">
														<tbody class="tbody">
														</tbody>
													</table>
												</div>
												<button class="button" id="add-button">Add Event</button>
											</div>
										</div>
										<div class="events-container"></div>
										<div class="dialog" id="dialog">
											<h2 class="dialog-header">Add New Event</h2>
											<form class="form" id="form">
												<div class="form-container" align="center">
													<label class="form-label" id="valueFromMyButton" for="name">Event
														name</label>
														 <input class="input" type="text" id="name"maxlength="36"> 
														 <label class="form-label"id="valueFromMyButton" for="count">Number of people to invite</label> 
														 <input class="input" type="number"id="count" min="0" max="1000000" maxlength="7"> 
														 <input type="button" value="Cancel" class="button"id="cancel-button"> 
														 <input type="button" value="OK" class="button button-white" id="ok-button">
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>
			</div>
			<!-- 바디 > 대시보드 종료 -->
			<!-- 관리자 메인 게시글 시작 -->
			<!-- 자유게시판 시작 -->
			<div class="col freeboard_start col-12">
				<div class="col freeboard_start col-12">
					<h1>
						<a href="/freeBoard.adminBoard?cpage=1">자유게시판</a>
					</h1>
					<table class="table">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">작성자</th>
								<th scope="col">제목</th>
								<th scope="col">조회수</th>
								<th scope="col">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="i" items="${boardList}" varStatus="status">
								<c:if test="${status.index < 5}">
									<tr>
										<td>${i.seq}</td>
										<td>${i.writer}</td>
										<td><a href="/detail.freeBoard?seq=${i.seq}">${i.title}</a></td>
										<td>${i.view_count}</td>
										<td>${i.write_date}</td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- 자유게시판 끝 -->
				<!-- 유머게시판 시작 -->
				<div class="col freeboard_start col-12">
					<h1>
						<a href="/study_select.adminBoard?cpage=1">스터디게시판</a>
					</h1>
					<table class="table">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">작성자</th>
								<th scope="col">제목</th>
								<th scope="col">조회수</th>
								<th scope="col">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="i" items="${studylist}" varStatus="status">
								<c:if test="${status.index < 5}">
									<tr>

										<td>${i.seq}</td>
										<td>${i.writer}</td>
										<td><a href="inner.studyboard?seq=${i.seq}&cpage=1">${i.contents}</a></td>
										<td>${i.view_count}</td>
										<td>${i.write_date}</td>

									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- 유머게시판 종료 -->
				<div class="col freeboard_start col-12">
					<h1>
						<a href="/secondHand.adminBoard?cpage=1">중고책게시판</a>
					</h1>
					<table class="table">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">작성자</th>
								<th scope="col">제목</th>
								<th scope="col">조회수</th>
								<th scope="col">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="i" items="${recordList}" varStatus="status">
								<c:if test="${status.index < 5}">
									<tr>

										<td>${i.seq}</td>
										<td>${i.writer}</td>
										<td><a
											href="secondHandBoardContents.secondHand?seq=${i.seq}&currentPage=1">${i.title}</a></td>
										<td>${i.view_count}</td>
										<td>${i.write_date}</td>

									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<!-- 바디 부분 종료 -->





		

</body>

</html>