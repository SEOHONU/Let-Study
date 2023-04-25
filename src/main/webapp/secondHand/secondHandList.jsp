<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>secondHandList</title>
<script src="https://code.jquery.com/jquery-3.6.4.js"
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<style>
* {
	box-sizing: border-box;
	border: 0px solid black;
}
</style>
<script>
        $(function () {
            $("#shWrite").on("click", function () {
                location.href = "/secondHandWriteForm.secondHand
                ";
            });
        });
    </script>
</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="row">
					<div class="col-4 col-lg-2 order-2 order-lg-first">logo</div>
					<div class="col-lg-4 d-none d-lg-block order-lg-1">여백</div>
					<div class="col-4 d-block d-lg-none order-1">햄버거</div>
					<div class="col-lg-1 d-none d-lg-block order-lg-2">menu1</div>
					<div class="col-lg-1 d-none d-lg-block order-lg-3">menu2</div>
					<div class="col-lg-1 d-none d-lg-block order-lg-4">menu3</div>
					<div class="col-lg-1 d-none d-lg-block order-lg-5">menu4</div>
					<div class="col-4 col-lg-2 order-3 order-lg-last">icons</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="row">
					<div class="col-lg-2 d-none d-lg-block">여백</div>
					<div class="col-lg-3">중고책</div>
					<div class="col-lg-5">
						<form action="">
							<select name="" id="">
								<option value="">옵션</option>
								<option value="">옵션</option>
								<option value="">옵션</option>
							</select> <select name="" id="">
								<option value="">옵션</option>
								<option value="">옵션</option>
								<option value="">옵션</option>
							</select> <select name="" id="">
								<option value="">옵션</option>
								<option value="">옵션</option>
								<option value="">옵션</option>
							</select> <input type="text" placeholder="검색창">
							<button>검색</button>
						</form>
					</div>
					<div class="col-lg-2 d-none d-lg-block">여백</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="row">
					<div class="col-lg-2 d-none d-lg-block">여백</div>
					<c:forEach var="i" items="${recordList}" begin="0" end="3" step="1">
						<div class="col-4 col-lg-2">
							<div>
                                <div>
                                    제목 : ${i.title}
                                </div>
                                <div>
                                    작성자 : ${i.writer}
                                </div>
                                <div>
                                    조회수 : ${i.view_count}
                                </div>
                                <div>
                                    작성일 : ${i.detailDate}
                                </div>
                                <div>
                                    <a href="/secondHandBoardContents.secondHand?seq=${i.seq}&currentPage=${currentPage}">
                                        <input type="button" value="이동하기">
                                    </a>
                                </div>
                            </div>
						</div>
					</c:forEach>
					<c:if test="${recordList.size() > 4}">
					<div class="col-lg-2 d-none d-lg-block">여백</div>
					<div class="col-lg-2 d-none d-lg-block">여백</div>
					<c:forEach var="i" items="${recordList}" begin="4" end="7" step="1">
						<div class="col-4 col-lg-2">
							<div>
                                <div>
                                    제목 : ${i.title}
                                </div>
                                <div>
                                    작성자 : ${i.writer}
                                </div>
                                <div>
                                    조회수 : ${i.view_count}
                                </div>
                                <div>
                                    작성일 : ${i.detailDate}
                                </div>
                                <div>
                                    <a href="/secondHandBoardContents.secondHand?seq=${i.seq}&currentPage=${currentPage}">
                                        <input type="button" value="이동하기">
                                    </a>
                                </div>
                            </div>
						</div>
					</c:forEach>
					</c:if>
					<c:if test="${recordList.size() > 8}">
					<div class="col-lg-2 d-none d-lg-block">여백</div>
					<div class="col-lg-2 d-none d-lg-block">여백</div>
					<c:forEach var="i" items="${recordList}" begin="8" end="11"
						step="1">
						<div class="col-4 col-lg-2">
							<div>
                                <div>
                                    제목 : ${i.title}
                                </div>
                                <div>
                                    작성자 : ${i.writer}
                                </div>
                                <div>
                                    조회수 : ${i.view_count}
                                </div>
                                <div>
                                    작성일 : ${i.detailDate}
                                </div>
                                <div>
                                    <a href="/secondHandBoardContents.secondHand?seq=${i.seq}&currentPage=${currentPage}">
                                        <input type="button" value="이동하기">
                                    </a>
                                </div>
                            </div>
						</div>
					</c:forEach>
					<div class="col-lg-2 d-none d-lg-block">여백</div>
					</c:if>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="row">
					<div class="col-4"></div>
					<div class="col-4" align="center">
						<c:forEach var="i" items="${pageNavi }" varStatus="status">
							<c:choose>
								<c:when test="${i eq '◀' }">
									<a
										href="/selectBound.secondHand?currentPage=${pageNavi[status.index+1]-1 }">${i }
									</a>
								</c:when>
								<c:when test="${i eq '▶' }">
									<a
										href="/selectBound.secondHand?currentPage=${pageNavi[status.index-1]+1 }">${i }
									</a>
								</c:when>
								<c:otherwise>
									<a href="/selectBound.secondHand?currentPage=${i}">${i}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
					<div class="col-4" align="right">
						<input type="button" value="글쓰기" id="shWrite">
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>