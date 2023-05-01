<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Admin Panel</title>
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
	bottom: 8px;
}

.dashboard {
	height: 300px;
}

.freeboard_start {
	margin-top: 20px;
}
</style>
</head>

<body>
	<div class="container">
		<div class="row header">
			<!-- justify-content-center -->
			<!-- 페이지 최 상단 관리자페이지 이름과 수정하기/로그아웃 버튼 시작 -->
			<div class="col header_topLine col-lg-12">
				관리자 페이지입니다.
				<!-- <button type="button" class="btn btn-outline-dark btn_header">수정하기</button> -->
				<form action="/admin_logout.admin"method="post">
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

				<h1>대시보드</h1>
				<div class="row">
					<div class="col-md-4 col-md-push-4 dashboard">
						<img src="/icon3.jpg" alt="" class="w-75 p-3">
					</div>
					<div class="col-md-4 col-md-push-4 dashboard">
						<img src="/icon3.jpg" alt="" class="w-75 p-3">
					</div>
					<div class="col-md-4 col-md-push-4 dashboard">
						<img src="/icon3.jpg" alt="" class="w-75 p-3">
					</div>
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
										<td>${i.title}</td>
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
										<td>${i.title}</td>
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
										<td>${i.title}</td>
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
</body>

</html>