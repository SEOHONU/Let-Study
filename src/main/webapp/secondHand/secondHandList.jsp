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
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
	<!-- <script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script> -->
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
	integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script src="https://kit.fontawesome.com/09115628a5.js" crossorigin="anonymous"></script>
              
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
#freeboard_img {
position:relative;
width:100%;
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

#freeboard_img img{
/* object-position : center -370px; */
opacity:0.5;
position:absolute;
top:0;
left:0;
width:100%;
height:100%;
object-fit:cover;
}

#imgTitle{
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 1; /* text 요소를 커버 위에 위치시킵니다. */
  color: white;
  text-align: center;
  font-size: 2rem;
}
.margin {
	height: 28px;
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
	
	<!-- 배너 -->
	
	<div class="row">
			<div class="col-12 " id="freeboard_img">
			<a href="/selectBound.secondHand">
			<img src="/image/shBannerMain.jpg" id="picture">
			<h1 id=imgTitle>중고책 거래 게시판</h1>
			</a>
			</div>
		</div>
	<!-- 배너끝 -->
	<div class="row">
			<div class="col margin"></div>
		</div>
		<!--검색 바  -->
		<form action="/searchSecondHand.secondHand" method="post">
		<div class="row" id="searchRow">
			<div class="col-12">
				<div class="d-flex justify-content-center row" id="searchDiv">
					<div class="col-2 p-0">
						<select class="form-select text-center" id="option" aria-label="Default select example" name="option">
							<option selected >-- 검색 선택 --</option>
							<option value="title" >제목</option>
							<option value="writer" >작성자</option>
						</select>
					</div>
					<div class="col-10 p-0">
						<div class="input-group mb-3">
							<input type="text" class="form-control" placeholder="검색어를 입력하세요"
								aria-label="Recipient's username" aria-describedby="basic-addon2" name="searchText">
							<button class="btn btn-outline-secondary" type="submit"
								id="searchBtn">
								<i class="fa-solid fa-magnifying-glass"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		</form>
	
	
		<!-- <div class="row">
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
		</div> -->
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
			<div class="col margin"></div>
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
				<a href="/selectBound.secondHand?currentPage=1" class="btn_a"><button type="button" class="btn btn-primary p-0">1페이지로</button></a>
				<a href="/secondHand/secondHandClusterer.jsp?currentPage=${currentPage}" class="btn_a"><button type="button" class="btn btn-primary p-0">동네 중고거래 찾기</button></a>
						<button type="button" class="btn btn-primary p-0" id="shWrite">글쓰기</button>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col margin"></div>
		</div>
		
		<c:import url="/board/footer.jsp"></c:import>
	</div>
</body>

</html>