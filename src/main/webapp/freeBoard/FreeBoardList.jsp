<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>자유게시판메인</title>
            <!-- CSS only -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
                crossorigin="anonymous">
            <!-- JavaScript Bundle with Popper -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
                crossorigin="anonymous"></script>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
                integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
                crossorigin="anonymous" referrerpolicy="no-referrer" />

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

                #listNavi {
                    height: 50px;
                }

                #list {
                    height: 400px;
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

                #pageNavi {
                    height: 50px;
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

                ul {
                    padding: 0px;
                    margin: 0px;
                    list-style: none;
                }

                li {
                    float: left;
                    list-style-type: none;
                    width: 40px;
                    height: 40px;
                    border: 0.5px solid #e4e3e3;
                    line-height: 40px;

                }

                .block {
                    width: 100%;
                    text-align: center;
                }

                .pagination {
                    display: inline-block;
                    width: 400px;
                }
            </style>




        </head>

        <body>
            <div class="container">
                <!-- 헤더 네비 -->
                <div class="row navi">
                    <div class="col-12">
                        <div class="row">

                            <div class="col-6 col-lg-2 order-2 order-lg-first">
                                logo
                            </div>
                            <div class="col-lg-4 d-none d-lg-block order-lg-1">
                                여백
                            </div>
                            <div class="col-4 d-block d-lg-none order-1">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="row">
                                            <div class="col-12">
                                                네비햄버거
                                            </div>
                                            <div class="col-12">회원가입</div>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="row">
                                            <div class="col-12 subsearch">검색</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-1 d-none d-lg-block order-lg-2">
                                <button type="button" class="btn btn-primary btn-lg">hi</button>
                            </div>
                            <div class="col-lg-1 d-none d-lg-block order-lg-3">
                                <button type="button" class="btn btn-primary btn-lg">hi</button>
                            </div>
                            <div class="col-lg-1 d-none d-lg-block order-lg-4">
                                <button type="button" class="btn btn-primary btn-lg">hi</button>
                            </div>
                            <div class="col-lg-1 d-none d-lg-block order-lg-5">
                                <button type="button" class="btn btn-primary btn-lg">hi</button>
                            </div>
                            <div class="col-lg-2 d-none d-lg-block  order-lg-last">
                                ㅎㅇ
                            </div>
                            <div class="col-2 d-block d-lg-none order-last">
                                <div class="row">
                                    <div class="col-12">공백</div>
                                    <div class="col-12">로그인</div>
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

                <div class="row" id="searchRow">
                    <div class="col">
                        <div class="d-flex justify-content-center" id="searchDiv">
                            <div class="input-group mb-3">
                                <input type="text" class="form-control" placeholder="검색어를 입력하세요"
                                    aria-label="Recipient's username" aria-describedby="basic-addon2">
                                <button class="btn btn-outline-secondary" type="button" id="button-addon2"><i
                                        class="fa-solid fa-magnifying-glass"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
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
                            <td class="col-8 col-md-5 "><a href="/detail.freeBoard?seq=${i.seq}">${i.title}</a></td>
                            <td class="d-none d-md-block col-md-3 center">${i.writer}</td>
                            <td class="d-none d-md-block col-md-2 center">${i.detailDate}</td>
                            <td class="d-none d-md-block col-md-1 center">${i.view_count}</td>
                        </tr>
                    </c:forEach>
                </table>


                <!-- 글쓰기 버튼 -->
                <div class="row writeBtnRow">
                    <div class="col writeBtnCol">
                        <a href="/freeBoard/FreeBoardWriteForm.jsp">
                            <button type="button" class="btn btn-success">글쓰기</button></a>
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
                
                			<div class="col-12" align="center">
				<c:forEach var="i" items="${navi}">
					<c:choose>
						<c:when test="${i eq '<<'}">
							<a
								href="/contentList.freeBoard?cpage=${start}">${i}</a>
						</c:when>
						<c:when test="${i eq '<'}">
							<a
								href="/contentList.freeBoard?cpage=${cpage-1}">${i}</a>
						</c:when>
						<c:when test="${i eq '>'}">
							<a
								href="/contentList.freeBoard?cpage=${cpage+1}">${i}</a>
						</c:when>
						<c:when test="${i eq '>>'}">
							<a
								href="/contentList.freeBoard?cpage=${end}">${i}</a>
						</c:when>
						<c:otherwise>
							<a
								href="/contentList.freeBoard?cpage=${i}">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>


                <!-- 푸터 -->
                <div class="block text-center" id="footer">

                </div>

            </div>
        </body>

        </html>