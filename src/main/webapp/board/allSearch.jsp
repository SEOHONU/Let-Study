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
            integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
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
    
            .container{
                position: relative;
            }
            .navi {
                position:sticky;
                top: 0;
                background-color: white;
                z-index: 999;
            }
    
        </style>
    
    </head>
    
    
    
    <body>
    
        <div class="container">
    
            <div class="row navi">
                <div class="col-12">
                    <div class="row">
    
                        <div class="col-6 col-lg-2 order-2 order-lg-first">
                            <a href="/index.jsp"> logo </a>
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
                                        <div class="col-12 navisub">
                                            <div class="row" style="text-align: right;">
                                                <div class="col-12 navisubstudy"><a href="스터디 게시판으로">스터디</a></div>
                                                <div class="col-12 navisubjoongo"><a href="중고책 게시판으로">중고책</a></div>
                                                <div class="col-12 navisubfreeboard"><a href="자유 게시판으로">자유게시판</a></div>
                                                <div class="col-12 navisublicence"><a href="자격증 게시판으로">자격증</a></div>
                                            </div>
    
                                        </div>
                                        <div class="col-12"><a href="회원가입 페이지">회원가입</a></div>
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
                            <a href="스터디 게시판으로">스터디</a>
                        </div>
                        <div class="col-lg-1 d-none d-lg-block order-lg-3">
                            <a href="중고책 게시판으로">중고책</a>
                        </div>
                        <div class="col-lg-1 d-none d-lg-block order-lg-4">
                            <a href="자유 게시판으로">자유게시판</a>
                        </div>
                        <div class="col-lg-1 d-none d-lg-block order-lg-5">
                            <a href="자격증 게시판으로">자격증</a>
                        </div>
                        <div class="col-lg-2 d-none d-lg-block  order-lg-last">
                            <div class="row">
                                <div class="col-6"><a href="로그인 페이지로">로그인</a></div>
                                <div class="col-6"><a href="회원가입 페이지로">회원가입</a></div>
                            </div>
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
    
            <!-- <div class="row header">
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
                    버튼
                </div>
                <div class="col-lg-1 d-none d-lg-block order-lg-3">
                    버튼
                </div>
                <div class="col-lg-1 d-none d-lg-block order-lg-4">
                    버튼
                </div>
                <div class="col-lg-1 d-none d-lg-block order-lg-5">
                    버튼
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
            </div> -->
    
    
            <div class="row body">
    
                <div class="col-12" style="height: 100px;">통합검색</div>
                <div class="col-12">
                    <div class="row bodysub">
                        <div class="col-2">공백</div>
                        <div class="col-8">
                            <div class="row bodysub">
    
                                <div class="col12" style="text-align: center;">공백</div>
    
                                <div class="col-lg-12 d-none d-lg-block" style="text-align: center;">
    
                                    <nav class="navbar navbar-light bg-light">
                                        <form class="container-fluid" action="/board/allSearch.jsp">
                                            <div class="input-group">
                                                <select>
                                                    <option value="제목">제목</option>
                                                    <option value="내용">내용</option>
                                                    <option value="작성자">작성자</option>
                                                </select>
                                                &nbsp;
                                                <input type="text" class="form-control" placeholder="통합검색창" aria-label="Username"
                                                    aria-describedby="basic-addon1">
                                                &nbsp;
                                                <button type="submit" class="btn btn-success" style="z-index: 0;">검색</button>
                                            </div>
                                        </form>
                                    </nav>
                                </div>
                                <div class="col12" style="text-align: center;">공백</div>
                                <div class="col-12">스터디
                                    <div class="row bodysubstudy">
                                        <div class="col-12 col-lg-3">
                                            <a href="스터디 관련검색 최신">
                                                <div class="card">
                                                    <img src="..." class="card-img-top" alt="...">
                                                    <div class="card-body" style="text-align: center;">
                                                        <h5 class="card-title">스터디</h5>
                                                        <p class="card-text">상세정보</p>
                                                        <a href="#" class="btn btn-primary">참여하기</a>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-12 col-lg-3">
                                            <a href="스터디 관련검색 최신">
                                                <div class="card">
                                                    <img src="..." class="card-img-top" alt="...">
                                                    <div class="card-body" style="text-align: center;">
                                                        <h5 class="card-title">스터디</h5>
                                                        <p class="card-text">상세정보</p>
                                                        <a href="#" class="btn btn-primary">참여하기</a>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-3 d-none d-lg-block">
                                            <a href="스터디 관련검색 최신">
                                                <div class="card">
                                                    <img src="..." class="card-img-top" alt="...">
                                                    <div class="card-body" style="text-align: center;">
                                                        <h5 class="card-title">스터디</h5>
                                                        <p class="card-text">상세정보</p>
                                                        <a href="#" class="btn btn-primary">참여하기</a>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-3 d-none d-lg-block">
                                            <a href="스터디 관련검색 최신">
                                                <div class="card">
                                                    <img src="..." class="card-img-top" alt="...">
                                                    <div class="card-body" style="text-align: center;">
                                                        <h5 class="card-title">스터디</h5>
                                                        <p class="card-text">상세정보</p>
                                                        <a href="#" class="btn btn-primary">참여하기</a>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col12" style="text-align: right;">
                                            <a href="스터디 관련검색 최신순으로 정리되어 있게 전부 보여주는거">
                                                더보기
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col12" style="text-align: center;">공백</div>
                                <div class="col-12">중고책
                                    <div class="row bodysubstudy">
                                        <div class="col-6">
                                            <a href="중고책 관련검색 최신">
                                                <div class="card mb-3" style="max-width: 540px;" >
                                                    <div class="row g-0">
                                                        <div class="col-md-4">
                                                            <img src="..." class="img-fluid rounded-start" alt="...">
                                                        </div>
                                                        <div class="col-md-8">
                                                            <div class="card-body">
                                                                <h5 class="card-title">중고책 이름</h5>
                                                                <p class="card-text"></p>
                                                                <p class="card-text"><small class="text-body-secondary">중고책
                                                                        내용</small></p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-6">
                                            <a href="중고책 관련검색 최신">
                                                <div class="card mb-3" style="max-width: 540px;">
                                                    <div class="row g-0">
                                                        <div class="col-md-4">
                                                            <img src="..." class="img-fluid rounded-start" alt="...">
                                                        </div>
                                                        <div class="col-md-8">
                                                            <div class="card-body">
                                                                <h5 class="card-title">중고책 이름</h5>
                                                                <p class="card-text"></p>
                                                                <p class="card-text"><small class="text-body-secondary">중고책
                                                                        내용</small></p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-6 col-sm-6">
                                            <a href="중고책 관련검색 최신">
                                                <div class="card mb-3" style="max-width: 540px;">
                                                    <div class="row g-0">
                                                        <div class="col-md-4">
                                                            <img src="..." class="img-fluid rounded-start" alt="...">
                                                        </div>
                                                        <div class="col-md-8">
                                                            <div class="card-body">
                                                                <h5 class="card-title">중고책 이름</h5>
                                                                <p class="card-text"></p>
                                                                <p class="card-text"><small class="text-body-secondary">중고책
                                                                        내용</small></p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-6 col-sm-6">
                                            <a href="중고책 관련검색 최신">
                                                <div class="card mb-3" style="max-width: 540px;">
                                                    <div class="row g-0">
                                                        <div class="col-md-4">
                                                            <img src="..." class="img-fluid rounded-start" alt="...">
                                                        </div>
                                                        <div class="col-md-8">
                                                            <div class="card-body">
                                                                <h5 class="card-title">중고책 이름</h5>
                                                                <p class="card-text"></p>
                                                                <p class="card-text"><small class="text-body-secondary">중고책 
                                                                    내용</small></p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-12" style="text-align: right;">
                                            <a href="중고책  관련검색 최신순으로 정리되어 있게 전부 보여주는거">
                                                더보기
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col12" style="text-align: center;">공백</div>
                                <div class="col-12">자유게시판
                                    <div class="row bodysubstudy">
                                        <div class="col-12"><a href="자유게시판 관련검색 최신순">검색어 1</a></div>
                                        <div class="col-12"><a href="자유게시판 관련검색 최신순">검색어 1</a></div>
                                        <div class="col-12"><a href="자유게시판 관련검색 최신순">검색어 1</a></div>
                                        <div class="col-12"><a href="자유게시판 관련검색 최신순">검색어 1</a></div>
                                        <div class="col-12"><a href="자유게시판 관련검색 최신순">검색어 1</a></div>
                                        <div class="col-12"><a href="자유게시판 관련검색 최신순">검색어 1</a></div>
                                    </div>
                                </div>
                                <div class="col12" style="text-align: right;">
                                    <a href="자유게시판 관련검색 최신순으로 정리되어 있게 전부 보여주는거">
                                        더보기
                                    </a>
                                </div>
                                <div class="col12" style="text-align: center;">공백</div>
                            </div>
    
                        </div>
                        <div class="col-2">공백</div>
                    </div>
                </div>
            </div>
            <div class="row footer">풋터</div>
    </body>
    </html>
