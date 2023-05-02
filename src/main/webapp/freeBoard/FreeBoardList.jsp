<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>자유게시판메인</title>
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
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<style>
* {
	box-sizing: border-box;
}

.header {
	position: relative;
}

.navi {
	position: sticky;
	top: 0;
	background-color: white;
	z-index: 999;
}

#head {
	height: 70px;
}

#freeboard_img {
	height: 200px;
}

#footer {
	height: 120px;
}

#searchDiv {
	margin: auto;
	display: relative;
	margin-top: 5px;
}

#headMypage {
	display: relative;
	margin-top: 15px;
}

.header {
	position: relative;
}

.navi {
	position: sticky;
	top: 0;
	background-color: white;
	z-index: 999;
}

.margin {
	height: 28px;
}

#freeBoardList {
	width: 100%;
}

.table {
	width: 100%;
}

.writeBtnRow {
	height: 50px;
}

.btn-success {
	float: right;
	position: relative;
	top: 10%;
	height: 35px;
}

.center {
	text-align: center;
}

#button-addon2:hover {
	background-color: green;
}


.pageNavi * {
	height: 30px;
	width: 30px;
	vertical-align: baseline;
	display: inline-block;
}


a {
	text-decoration: none;
	color: inherit;
}


.page-item{
float:left;
}

#select{
}


</style>




</head>

<body>
	<div class="container">
		<!-- 헤더 네비 -->

		<!-- 헤더 네비 -->
		<div class="row navi">

			<div class="col-12 top">
				<div class="row">
					<div class="col-8 col-lg-2 order-2 order-lg-first" id="logo">
						<div class="row">
							<div class="col-12">
								<a href="/index.jsp">logo</a>

							</div>
							<div class="col-12 d-lg-none d-block">
								<div class="row">
									<div class="col-12" id="subsearch">
										<i class="fa-solid fa-magnifying-glass" id="subsearchclick"
											style="display: inline;"></i>
									</div>


									<div class="col-12" id="subsearchback">
										<form class="container-fluid" id="total_search"
											action="/allsearch.maincontroller" style="padding: 0px;">
											<i class="fa-solid fa-arrow-left" id="searsubback"
												style="display: inline;"></i> <select name="select">
												<option value="제목">제목</option>
												<option value="내용">내용</option>
												<option value="작성자">작성자</option>
											</select> <input type="text" class="form-control" placeholder="통합검색창"
												aria-label="Username" aria-describedby="basic-addon1"
												style="width: 40%; padding: 0; display: inline;"
												name="title">
											<button type="button" class="btn btn-success"
												style="z-index: 0; background-color: rgb(60, 117, 121); padding: 0;">검색</button>
										</form>

									</div>
								</div>
							</div>
						</div>

					</div>

					<div class="col-lg-4 d-none d-lg-block order-lg-1">여백</div>
					<div class="col-2 d-block d-lg-none order-1">
						<div class="row">
							<div class="col-12">
								<div class="row">
									<div class="col-12">
										<i class="fa-solid fa-bars" id="hamberger"></i>
									</div>

									<!-- 네비햄버거 누를시 나오는거 -->
									<div class="col-12 navisub">
										<div class="row" style="text-align: right;">
											<div class="col-12 naviname" style="text-align: center;"
												onclick="javascript:checkLogin('/select.studyboard');">
												Study</div>
											<div class="col-12 naviname" style="text-align: center;"
												onclick="javascript:checkLogin('/selectBound.secondHand');">
												second</div>
											<div class="col-12 naviname" style="text-align: center;"
												onclick="javascript:checkLogin('/contentList.freeBoard');">
												free</div>
											<div class="col-12 naviname" style="text-align: center;"
												onclick="javascript:checkLogin('/contentList.freeBoard');">
												licence</div>
										</div>
									</div>
									<c:choose>
										<c:when test="${loggedID==null}">
											<div class="col-12">
												<a href="/member/joinForm.jsp"><i
													class="fa-solid fa-user-plus"></i></a>
												<!--로그인안됐을때-->
											</div>
										</c:when>
										<c:otherwise>
											<div class="col-12">
												<a href="/myPage/mypageMainForm.jsp"><i
													class="fa-solid fa-user"></i></a>
												<!--로그인됐을때-->
											</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>


						</div>
					</div>


					<div class="col-lg-1 d-none d-lg-block order-lg-2 naviname"
						style="text-align: center;"
						onclick="javascript:checkLogin('/select.studyboard');">
						Study</div>
					<div class="col-lg-1 d-none d-lg-block order-lg-3 naviname"
						style="text-align: center;"
						onclick="javascript:checkLogin('/selectBound.secondHand');">
						Sencond</div>
					<div class="col-lg-1 d-none d-lg-block order-lg-4 naviname"
						style="text-align: center;"
						onclick="javascript:checkLogin('/contentList.freeBoard');">
						Board</div>
					<div class="col-lg-1 d-none d-lg-block order-lg-5 naviname"
						style="text-align: center;"
						onclick="javascript:checkLogin('/자격증 게시판으로');">Licence</div>

					<div class="col-lg-2 d-none d-lg-block  order-lg-last">
						<div class="row">

							<c:choose>
								<c:when test="${loggedID==null}">
									<div class="col-6 login">
										<a href="/member/loginForm.jsp"><i
											class="fa-solid fa-right-to-bracket"></i></a>
										<!--로그인안됐을때-->
									</div>
									<div class="col-6 signup">
										<a href="/member/joinForm.jsp"><i
											class="fa-solid fa-user-plus"></i></a>
										<!--로그인안됐을때-->
									</div>
								</c:when>
								<c:otherwise>
									<div class="col-6 profile">
										<a href="/myPage/mypageMainForm.jsp"><i
											class="fa-solid fa-user"></i></a>
										<!--로그인됐을때-->
									</div>
									<div class="col-6 logout">
										<a href="/logout.member"><i
											class="fa-solid fa-right-from-bracket"></i></a>
										<!--로그인됐을때-->
									</div>
								</c:otherwise>
							</c:choose>

						</div>
					</div>

					<div class="col-2 d-block d-lg-none order-last">
						<div class="row">

							<c:choose>
								<c:when test="${loggedID==null}">
									<div class="col-12"></div>
									<div class="col-12" style="text-align: right;">
										<a href="/member/loginForm.jsp"><i
											class="fa-solid fa-right-to-bracket"></i></a>
									</div>
								</c:when>
								<c:otherwise>
									<div class="col-12">${sessionScope.loggedID}회원</div>
									<div class="col-12" style="text-align: right;">
										<a href="/logout.member"><i
											class="fa-solid fa-right-from-bracket"></i></a>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 바디 -->

		<!-- 자유게시판 이미지 -->
		<div class="row">
			<div class="col-12 " id="freeboard_img">자유게시판 이미지</div>
		</div>
		<!--검색 바  -->
		<form action="/searchByOption.freeBoard" method="post">
		<div class="row" id="searchRow">
			<div class="col-12">
				<div class="d-flex justify-content-center row" id="searchDiv">
					<div class="col-2 p-0">
						<select class="form-select text-center" id="select" aria-label="Default select example" name="optionValue">
							<option selected >-- 검색 선택 --</option>
							<option value="제목" >제목</option>
							<option value="내용" >내용</option>
							<option value="닉네임" >닉네임</option>
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
		<!-- 자유게시판 리스트 -->
		<div class="row margin"></div>
		<table class="table">
			<thead class="table-light">
				<tr class="row">
					<th class="col-4 col-md-1 center">순번</th>
					<th class="col-8 col-md-5 center">제목</th>
					<th class="d-none d-md-block col-md-3 center">작성자</th>
					<th class="d-none d-md-block col-md-2 center">작성일</th>
					<th class="d-none d-md-block col-md-1 center">조회수</th>
				</tr>
			</thead>
			<c:forEach var="i" items="${list}">
				<tr class="row">
					<td class="col-4 col-md-1 center">${i.seq}</td>
					<td class="col-8 col-md-5 "><a
						href="/detail.freeBoard?seq=${i.seq}">${i.title}</a></td>
					<td class="d-none d-md-block col-md-3 center">${i.nickname}</td>
					<td class="d-none d-md-block col-md-2 center">${i.detailDate}</td>
					<td class="d-none d-md-block col-md-1 center">${i.view_count}</td>
				</tr>
			</c:forEach>
		</table>


		<!-- 글쓰기 버튼 -->
		<div class="row writeBtnRow">
			<div class="col writeBtnCol">
				<a href="/freeBoard/FreeBoardWriteForm.jsp">
					<button type="button" class="btn btn-success">글쓰기</button>
				</a>
			</div>
		</div>
		<!-- 페이지 네비 -->
		<!-- <div class="block" id="pageNavi">
                    <ul class="pagination">
                        <li class="previous first">
                            <a href="">
                                <i class="fa-solid fa-angles-left"></i>
                            </a>
                        </li>
                        <li class="previous">
                            <a href="">
                                <i class="fa-solid fa-chevron-left"></i>
                            </a>
                        </li>
                        <li>1</li>
                        <li>2</li>
                        <li>3</li>
                        <li>4</li>
                        <li>5</li>
                        <li>6</li>
                        <li class="next">
                            <a href="">
                                <i class="fa-solid fa-chevron-right"></i>
                            </a>
                        </li>
                        <li class="next last">
                            <a href="">
                                <i class="fa-solid fa-angles-right"></i>
                            </a>
                        </li>

                    </ul>
                </div> -->

	<!-- 	<div class="col-12 pageNavi" align="center">
			<c:forEach var="i" items="${navi}">
				<c:choose>
					<c:when test="${i eq '<<'}">
						<a href="/contentList.freeBoard?cpage=${start}"> <i
							class="fa-solid fa-angles-left naviIcon"></i></a>
					</c:when>
					<c:when test="${i eq '<'}">
						<a href="/contentList.freeBoard?cpage=${cpage-1}"> <i
							class="fa-solid fa-chevron-left naviIcon"></i></a>
					</c:when>
					<c:when test="${i eq '>'}">
						<a href="/contentList.freeBoard?cpage=${cpage+1}"> <i
							class="fa-solid fa-chevron-right naviIcon"></i></a>
					</c:when>
					<c:when test="${i eq '>>'}">
						<a href="/contentList.freeBoard?cpage=${end}"> <i
							class="fa-solid fa-angles-right naviIcon"></i></a>
					</c:when>
					<c:otherwise>
						<a href="/contentList.freeBoard?cpage=${i}" class="asdfg">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div> -->



<nav aria-label="Page navigation example ">
                  <ul class="pagination d-flex justify-content-center">
                     <c:forEach var="i" items="${navi}">
                        <c:choose>
                           <c:when test="${i eq '<<'}">
                              <li class="page-item"><a class="page-link" href="/contentList.freeBoard?cpage=${start}">${i}</a></li>
                           </c:when>
                           <c:when test="${i eq '<'}">
                              <li class="page-item"><a class="page-link" href="/contentList.freeBoard?cpage=${cpage-1}">${i}</a></li>
                           </c:when>
                           <c:when test="${i eq '>'}">
                              <li class="page-item"><a class="page-link" href="/contentList.freeBoard?cpage=${cpage+1}">${i}</a></li>
                           </c:when>
                           <c:when test="${i eq '>>'}">
                              <li class="page-item"><a class="page-link" href="/contentList.freeBoard?cpage=${end}">${i}</a></li>
                           </c:when>
                           <c:otherwise>
                              <li class="page-item"><a class="page-link" href="/contentList.freeBoard?cpage=${i}">${i}</a></li>
                           </c:otherwise>
                        </c:choose>
                     </c:forEach>
                  </ul>
               </nav>



		<!-- 푸터 -->
		<div class="block text-center" id="footer"></div>

	</div>

	<script>

	</script>
</body>

</html>