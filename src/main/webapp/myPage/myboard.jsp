<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
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

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
	integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
* {
	box-sizing: border-box;
}

div {
	border: 1px solid black;
}

/* 왼쪽프로필 ------------------- */
#profilecircle {
	width: 150px;
	height: 150px;
	border-radius: 50%;
	border: 1px solid black;
	margin: auto;
	margin-top: 10%;
	margin-bottom: 10%;
}

#circles>div {
	width: 60px;
	height: 60px;
	border-radius: 50%;
	margin: 10px auto;
	position: relative;
}

#message {
	font-size: 30px;
	float: left;
	position: relative;
	left: 20%;
	display: flex;
}

#message>a {
	margin: auto;
}

#profileSetting {
	font-size: 30px;
	float: left;
	position: relative;
	left: 35%;
	display: flex;
}

#profileSetting>a {
	margin: auto;
}

/* 오른쪽---판매구매내역 -------------------*/
.navi {
	height: 5%;
}

.navi>ul {
	overflow: hidden;
	margin: 0%;
	padding: 0%;
	height: 100%;
}

.navi>ul>li {
	float: left;
	list-style-type: none;
	width: 33%;
	height: 100%;
	line-height: 30px;
	transition-duration: 1s;
}

.navi>ul>li:hover {
	cursor: pointer;
	background-color: rgb(90, 89, 89);
}

.navi>ul>li>button {
	border: none;
	background-color: transparent;
}
</style>
</head>

<body>

	<form action="">
		<div class="container">
			<div class="rowheader">
				<div class="col-12">navi</div>
				<div class="col-12">
					<font size="5px"><b> 마이페이지</b></font>
				</div>
		<div class="row body">
				<div class="col-3">
					<div class="row">
						<div class="col-12 circle">
							<div id="profilecircle"></div>
							<div class="nickname" align="center">
								<b>${sessionScope.loggedNickname}</b>
							</div>
							<div class="greetings" align="center">${update.profile_introduce}</div>
							<div id="circles">
								<div id="message">
									<a href=""><i class="fa-regular fa-envelope" id="pictogram"></i></a>
								</div>
								<div id="profileSetting">
								
									<a href="/select.profile_settingController">
									<i class="fa-solid fa-gear"></i></a>
								</div>
							</div>
						</div>

						<div class="col-12">
							<div class="myBoard">
								<a href="/mypageboard.mypageboardController">
									<button type="button" id="myboardBtn">
										<i class="fa-solid fa-address-book"></i> 내 게시판
									</button>
								</a>
							</div>
							<hr>
							<div class="interestingMeeting">
							<a href="/">
								<button type="button">
									<i class="fa-solid fa-heart"></i> 관심 모임
								</button>
								</a>
							</div>
							<hr>
							<div class="myInfo">
								<a href="/myInfoSelect.member">
									<button type="button">
										<i class="fa-solid fa-gear"></i> 내 정보 관리
									</button>
								</a>
							</div>
							<hr>

						</div>
					</div>
				</div>
				<div class="col-9">
					<div class="row">
						<input type="hidden" name="id" value="${loggedID}">
						<strong>스터디 게시판</strong>
						<div class="study">
							<table
								summary="This table shows how to create responsive tables using Datatables' extended functionality"
								class="table table-bordered table-hover dt-responsive">
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
							</table>
						</div>
						
						<strong>중고 거래 게시판</strong>
						<div id="secondhand">
							

								<table
									summary="This table shows how to create responsive tables using Datatables' extended functionality"
									class="table table-bordered table-hover dt-responsive">
									<thead>
										<tr>
											<th class="col col-lg-1 col-sm-2">no.</th>
											<th class="col col-lg-9 col-sm-8">상품명</th>
										</tr>
									</thead>
									<c:forEach var="sh" items="${secondhandboard}">
										<tr>
											<td>${sh.seq}</td>
											<td><a href="/secondHandBoardContents.secondHand?seq=${sh.seq}&currentPage=1">${sh.title}</a>
										</tr>
									</c:forEach>
								</table>
						</div>

						<strong>자유게시판</strong>
						<div id="free">
							<table
								summary="This table shows how to create responsive tables using Datatables' extended functionality"
								class="table table-bordered table-hover dt-responsive">
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
							</table>

						</div>
					</div>
				</div>
			</div>

			<div class="row footer">
				<div class="col-12">footer</div>
			</div>
		</div>
	</form>



</body>

</html>