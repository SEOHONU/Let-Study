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
a>.btn {
    background-color: #1e3c3e;
}
#searchBtn {
    background-color: #1e3c3e;
}
#shWrite {
    background-color: #1e3c3e;
}
</style>
<script>
        $(function () {
            $("#shWrite").on("click", function () {
                location.href = "/secondHandWriteForm.secondHand";
            });
        });
    </script>
</head>

<body>
	<div class="container">
		<c:import url="/board/topMenu.jsp"></c:import>
	<div align="center">
		<img src="/image/shBanner_main.jpg">
	</div>
		<div class="row">
			<div class="col-4"></div>
			<div class="col-4" align="center">
				<a href="/selectBound.secondHand?currentPage=1" class="btn_a"><button type="button" class="btn btn-primary p-0">1페이지로</button></a>
				<a href="/secondHand/secondHandClusterer.jsp?currentPage=${currentPage}" class="btn_a"><button type="button" class="btn btn-primary p-0">동네 중고거래 찾기</button></a>
			</div>
			<div class="col-4"></div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="row">
					<div class="col-lg-2 d-none d-lg-block"></div>
					<div class="col-lg-3"></div>
					<div class="col-lg-5">
						<form action="/searchSecondHand.secondHand">
							<select name="option" id="option">
								<option value="title">글 제목</option>
								<option value="writer">작성자</option>
							</select>
							<input type="text" placeholder="검색어 입력" name="searchText">
							<button type="submit" class="btn btn-primary p-0" id="searchBtn">검색하기</button>
						</form>
					</div>
					<div class="col-lg-2 d-none d-lg-block"></div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="row">
					<div class="col-lg-2 d-none d-lg-block"></div>
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
                                <div align="right">
                                    <a href="/secondHandBoardContents.secondHand?seq=${i.seq}&currentPage=${currentPage}">
                                        <button type="button" class="btn btn-primary p-0">이동하기</button>
                                    </a>
                                </div>
                            </div>
						</div>
					</c:forEach>
					<c:if test="${recordList.size() > 4}">
					<div class="col-lg-2 d-none d-lg-block"></div>
					<div class="col-lg-2 d-none d-lg-block"></div>
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
                                <div align="right">
                                    <a href="/secondHandBoardContents.secondHand?seq=${i.seq}&currentPage=${currentPage}">
                                        <button type="button" class="btn btn-primary p-0">이동하기</button>
                                    </a>
                                </div>
                            </div>
						</div>
					</c:forEach>
					</c:if>
					<c:if test="${recordList.size() > 8}">
					<div class="col-lg-2 d-none d-lg-block"></div>
					<div class="col-lg-2 d-none d-lg-block"></div>
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
                                <div align="right">
                                    <a href="/secondHandBoardContents.secondHand?seq=${i.seq}&currentPage=${currentPage}">
                                        <button type="button" class="btn btn-primary p-0">이동하기</button>
                                    </a>
                                </div>
                            </div>
						</div>
					</c:forEach>
					<div class="col-lg-2 d-none d-lg-block"></div>
					</c:if>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="row">
					<div class="col-4"></div>
					<div class="col-4" align="center">
						<nav aria-label="Page navigation example" align="center">
  						<ul class="pagination d-flex justify-content-center">
						<c:choose>
							<c:when test="${searchText != null}">
								<c:forEach var="i" items="${pageNavi}" varStatus="status">
									<c:choose>
										<c:when test="${i eq '◀' }">
 											<li class="page-item">
											<a class="page-link"
												href="/searchSecondHand.secondHand?
												currentPage=${pageNavi[status.index+1]-1}&
												option=${option}&
												searchText=${searchText}">${i }
											</a>
 											</li>
										</c:when>
										<c:when test="${i eq '▶' }">
										<li class="page-item">
											<a class="page-link"
												href="/searchSecondHand.secondHand?
												currentPage=${pageNavi[status.index-1]+1}&
												option=${option}&
												searchText=${searchText}">${i }
											</a>
										</li>
										</c:when>
										<c:otherwise>
										<li class="page-item">
											<a class="page-link" href="/searchSecondHand.secondHand?
											currentPage=${i}&
											option=${option}&
											searchText=${searchText}">${i}</a>
										</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:forEach var="i" items="${pageNavi}" varStatus="status">
									<c:choose>
										<c:when test="${i eq '◀' }">
										<li class="page-item">
											<a class="page-link"
												href="/selectBound.secondHand?currentPage=${pageNavi[status.index+1]-1 }">${i }
											</a>
										</li>
										</c:when>
										<c:when test="${i eq '▶' }">
										<li class="page-item">
											<a class="page-link"
												href="/selectBound.secondHand?currentPage=${pageNavi[status.index-1]+1 }">${i }
											</a>
										</li>
										</c:when>
										<c:otherwise>
										<li class="page-item">
											<a class="page-link" href="/selectBound.secondHand?currentPage=${i}">${i}</a>
										</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:otherwise>						
						</c:choose>
						  </ul>
						</nav>
					</div>
					<div class="col-4" align="right">
						<button type="button" class="btn btn-primary p-0" id="shWrite">글쓰기</button>
					</div>
				</div>
			</div>
		</div>
		<c:import url="/board/footer.jsp"></c:import>
	</div>
</body>

</html>