<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>통합검색</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
                crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
                crossorigin="anonymous"></script>
            <script src="https://code.jquery.com/jquery-3.6.4.js"
                integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
            <style>
                * {
                    box-sizing: border-box;
                }

                div {
                    border: 1px solid black;
                }

                .container {
                    position: relative;
                }

                .navi {
                    position: sticky;
                    top: 0;
                    background-color: white;
                    z-index: 999;
                }
            </style>

        </head>



        <body>

            <div class="container">
                <c:import url="/board/topMenu.jsp"></c:import>

                <div class="row body">

                    <div class="col-12" style="height: 100px;">
                        통합검색
                    </div>
                    <div class="col-12">
                        <div class="row bodysub">
                            <div class="col-2">공백</div>
                            <div class="col-8">
                                <div class="row bodysub">

                                    <div class="col-12" style="text-align: center;">공백</div>

                                    <div class="col-lg-12 d-none d-lg-block" style="text-align: center;">

                                        <nav class="navbar navbar-light bg-light">
                                            <form class="container-fluid" action="/allsearch.maincontroller">
                                                <div class="input-group">
                                                    <select name="select">
                                                        <option value="제목">제목</option>
                                                        <option value="내용">내용</option>
                                                        <option value="작성자">작성자</option>
                                                    </select>
                                                    &nbsp;
                                                    <input type="text" class="form-control" placeholder="통합검색창"
                                                        aria-label="Username" aria-describedby="basic-addon1"
                                                        name="title" value="${title}">
                                                    &nbsp;
                                                    <button type="submit" class="btn btn-success"
                                                        style="z-index: 0;">검색</button>
                                                </div>
                                            </form>
                                        </nav>
                                    </div>
                                    <div class="col-12" style="text-align: center;">공백</div>
                                    <div class="col-12">스터디
                                        <div class="row bodysubstudy">

                                            <c:choose>
                                                <c:when test="${stdto.size()>0}">
                                                    <c:forEach var="study" items="${stdto}" begin="0" end="3">
                                                        <div class="col-3">
                                                            <a href="스터디 관련검색 최신">
                                                                <div class="card">
                                                                    <img src="..." class="card-img-top" alt="...">
                                                                    <div class="card-body" style="text-align: center;">
                                                                        <h5 class="card-title">${study.title}</h5>
                                                                        <p class="card-text">${study.contents}</p>
                                                                        <a href="#" class="btn btn-primary">참여하기</a>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </c:forEach>
                                                    <div class="col-12" style="text-align: right;">
                                                        <a href="스터디 관련검색 최신순으로 정리되어 있게 전부 보여주는거">
                                                            더보기
                                                        </a>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="col-12">
                                                        검색한 결과가 없습니다.
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                    <div class="col12" style="text-align: center;">공백</div>


                                    <div class="col-12">중고책
                                        <div class="row bodysubstudy">

                                            <c:choose>
                                                <c:when test="${sdto.size()>0}">
                                                    <c:forEach var="second" items="${sdto}" begin="0" end="3">
                                                        <div class="col-6 d-none d-lg-block">
                                                            <a href="중고책 관련검색 최신">
                                                                <div class="card mb-3" style="max-width: 540px;">
                                                                    <div class="row g-0">
                                                                        <div class="col-md-4">
                                                                            <img src="..."
                                                                                class="img-fluid rounded-start"
                                                                                alt="...">
                                                                        </div>
                                                                        <div class="col-md-8">
                                                                            <div class="card-body">
                                                                                <h5 class="card-title">${second.title}
                                                                                </h5>
                                                                                <p class="card-text">${second.writer}
                                                                                </p>
                                                                                <p class="card-text">
                                                                                    <small
                                                                                        class="text-body-secondary">${second.contents}</small>
                                                                                </p>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </c:forEach>
                                                    <div class="col-12" style="text-align: right;">
                                                        <a href="중고책  관련검색 최신순으로 정리되어 있게 전부 보여주는거">
                                                            더보기
                                                        </a>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="col-12">
                                                        검색한 결과가 없습니다.
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                    <div class="col12" style="text-align: center;">공백</div>
                                    <div class="col-12">자유게시판
                                        <div class="row bodysubstudy">
                                            <c:choose>
                                                <c:when test="${fdto.size()>0}">
                                                    <div class="col-9">제목</div>
                                                    <div class="col-3">작성자</div>
                                                    <c:forEach var="free" items="${fdto}" begin="0" end="5">
                                                        <div class="col-9"><a href="자유게시판 관련검색 최신순">${free.title}</a>
                                                        </div>
                                                        <div class="col-3"><a href="자유게시판 관련검색 최신순">${free.writer}</a>
                                                        </div>
                                                    </c:forEach>

                                        </div>
                                    </div>
                                    <div class="col12" style="text-align: right;">
                                        <a href="자유게시판 관련검색 최신순으로 정리되어 있게 전부 보여주는거">
                                            더보기
                                        </a>
                                    </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="col12">
                                            검색한 결과가 없습니다.
                                        </div>
                                    </c:otherwise>
                                    </c:choose>
                                    <div class="col12" style="text-align: center;">공백</div>
                                </div>

                            </div>
                            <div class="col-12">공백</div>
                        </div>
                    </div>
                </div>
                <div class="row footer">풋터</div>
            </div>
        </body>

        </html>