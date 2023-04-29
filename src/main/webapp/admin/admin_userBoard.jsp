<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
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
<!-- https://bootdey.com/ 라이브러리 -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" />

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

.admin_top_btn {
	float: right;
}

.card {
	position: relative;
	display: flex;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 0 solid transparent;
	border-radius: 0;
}

.btn-circle.btn-lg, .btn-group-lg>.btn-circle.btn {
	width: 50px;
	height: 50px;
	padding: 14px 15px;
	font-size: 18px;
	line-height: 23px;
}

.text-muted {
	color: #8898aa !important;
}

[type=button]:not(:disabled), [type=reset]:not(:disabled), [type=submit]:not(:disabled),
	button:not(:disabled) {
	cursor: pointer;
}

.btn-circle {
	border-radius: 100%;
	width: 40px;
	height: 40px;
	padding: 10px;
}

.user-table tbody tr .category-select {
	max-width: 150px;
	border-radius: 20px;
}

.btn-outline-danger {
	width: 60px;
	margin: 0 auto;
}

.font_1 {
	font-size: 16px;
}

.input-group {
	position: relative;
	left: 20%;
	margin-bottom: 20px;
}

.th_nul {
	width: 10px;
}

.btn_header {
	float: right;
	margin-bottom: 10px;
	position: relative;
	bottom: 8px;
}
</style>

</head>
<body>
	<!-- <div class="col header_topLine col-lg-12">
        관리자 페이지입니다. 
        <button type="button" class="btn btn-outline-dark btn_header admin_top_btn">수정하기</button>
        <button type="button" class="btn btn-outline-dark btn_header admin_top_btn">로그아웃</button>
        </div> -->

	<div class="col header_topLine col-lg-12">
		관리자 페이지입니다.
		<!-- <button type="button" class="btn btn-outline-dark btn_header">수정하기</button> -->
		<form action="/admin_logout.admin" method="post">
			<button type="submit" class="btn btn-outline-dark btn_header">로그아웃</button>
		</form>
	</div>
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
						href="/admin_userBoard.jsp">회원관리</a></li>
					<!--<li class="nav-item"><a class="nav-link disabled" href="#"
              tabindex="-1" aria-disabled="true">배너관리</a></li>-->

					<!-- 배너관리는 추후 -->

				</ul>
			</div>
		</div>
	</nav>
	<!-- 회원 관리페이지 시작 -->



	<!-- 회원 목록 출력 시작 -->
	<div class="container font_1">
		<div class="row">
			<h1>이걸 가입한 닝겐들..</h1>
			<div class="col">
				<table
					summary="This table shows how to create responsive tables using Datatables' extended functionality"
					class="table table-bordered table-hover dt-responsive">
					<caption class="text-center">
						An example of a responsive table based on <a
							href="https://datatables.net/extensions/responsive/"
							target="_blank">DataTables</a>:
					</caption>
					<thead>
						<tr>
							<th class="col col-md-1">ID</th>
							<th class="col col-md-2">이름</th>
							<th class="col col-md-2">생년월일</th>
							<th class="col d-none d-md-block">이메일</th>
							<th class="col col-md-2">가입일</th>
							<th>버튼</th>
							<!-- <th class="col col-md-1 th_nul"></th> -->
						</tr>



						<!-- 추후 이렇게 수정할거임 -->

					</thead>
					<tbody>
						<c:forEach var="i" items="${userList}">
							<tr>
								<td>${i.id}</td>
								<td>${i.name}</td>
								<td>${i.birth_date}</td>
								<td class="col d-none d-md-block">${i.email}</td>
								<td>${i.join_date}</td>
								<td><a
									href="/userList_delete.adminBoard?id=${i.id}&cpage=${cpage}"><button
											type="button" class="btn btn-outline-danger btn_del">현생으로</button></a></td>

							</tr>
						</c:forEach>




					</tbody>
					<tfoot>
						<tr>
							<td colspan="5" class="text-center">Data retrieved from <a
								href="http://www.infoplease.com/ipa/A0855611.html"
								target="_blank">infoplease</a> and <a
								href="http://www.worldometers.info/world-population/population-by-country/"
								target="_blank">worldometers</a>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
	<!-- 회원 정보 출력 종료  -->

	<!-- 회원검색폼 시작-->
	<div class="container">
		<div class="input-group" style="width: 60%;">
			<input type="text" class="form-control"
				aria-label="Text input with dropdown button">
			<button class="btn btn-outline-secondary dropdown-toggle"
				style="width: 110px;" type="button" data-bs-toggle="dropdown"
				aria-expanded="false">찾기</button>
			<ul class="dropdown-menu dropdown-menu-end">
				<li><a class="dropdown-item" href="#">회원이름</a></li>
				<li><a class="dropdown-item" href="#">회원닉네임</a></li>
				<!-- <li><a class="dropdown-item" href="#">가입일순</a></li> -->
				<li><hr class="dropdown-divider"></li>
				<!-- <li><a class="dropdown-item" href="#">Separated link</a></li> -->
			</ul>
		</div>
		<!-- 회원검색폼 종료-->

		<!-- 하단 네비 시작 -->

		<nav aria-label="Page navigation example" align="center">
			<ul class="pagination justify-content-center">



				<div class="col-12" align="center">
					<c:forEach var="i" items="${navi}">
						<c:choose>
							<c:when test="${i eq '<<'}">
								<a href="/freeBoard.adminBoard?cpage=${start}">${i}</a>
							</c:when>
							<c:when test="${i eq '<'}">
								<a href="/freeBoard.adminBoard?cpage=${cpage-1}">${i}</a>
							</c:when>
							<c:when test="${i eq '>'}">
								<a href="/freeBoard.adminBoard?cpage=${cpage+1}">${i}</a>
							</c:when>
							<c:when test="${i eq '>>'}">
								<a href="/freeBoard.adminBoard?cpage=${end}">${i}</a>
							</c:when>
							<c:otherwise>
								<a href="/freeBoard.adminBoard?cpage=${i}">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>



				<nav>
					<ul class="pagination">
						<!-- JavaScript 코드로 페이지 내비게이션 생성 -->
					</ul>
				</nav>

			</ul>
		</nav>
	</div>
	<!-- 하단 네비 종료 -->


	<!-- 
삭제 버튼 누를때 탈퇴시키겠습니까? 
안내나오게해야함 




          -->




</body>
</html>