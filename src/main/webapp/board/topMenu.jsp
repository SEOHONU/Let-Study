<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
                crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
                crossorigin="anonymous"></script>
            <script src="https://code.jquery.com/jquery-3.6.4.js"
                integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
            <script src="https://kit.fontawesome.com/09115628a5.js" crossorigin="anonymous"></script>


            <style>
            .container {
                    position: relative;
                }

                .top {
                    background-color: #3c757970;
                    border: 1px solid #ddd;
                    border-radius: 5px;
                    margin: 1px;
                }
                .navi {
                    position: sticky;
                    top: 0;
                    background-color: white;
                    z-index: 1;
                }
                .naviname {
                    cursor: pointer;
                    transition-duration: 0.5s
                }
                .naviname:hover {
                    background-color: #3c757970;
                    color:white;
                    
                }
            </style>
            <script>
                function checkLogin(url) {
                    var login = '<c:out value="${loggedID}"/>';
                    if (login == "") {
                        alert("로그인이 필요합니다.");
                        location.href = "/index.jsp";
                    } else {
                        location.href = url;
                    }
                }
            </script>
        </head>

        <body>
<c:import url=""></c:import>쓰기
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
                                            <form class="container-fluid" action="/allsearch.maincontroller"
                                                style="padding:0px;">
                                                <i class="fa-solid fa-arrow-left" id="searsubback"
                                                    style="display: inline;"></i> <select name="select">
                                                    <option value="제목">제목</option>
                                                    <option value="내용">내용</option>
                                                    <option value="작성자">작성자</option>
                                                </select> <input type="text" class="form-control" placeholder="통합검색창"
                                                    aria-label="Username" aria-describedby="basic-addon1"
                                                    style="width: 40%; padding: 0; display: inline;" name="title">
                                                <button type="submit" class="btn btn-success"
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
                                                <div class="col-12 navisubstudy">
                                                    <a href="/select.studyboard">스터디</a>
                                                </div>
                                                <div class="col-12 navisubjoongo">
                                                    <a href="/selectBound.secondHand">중고책</a>
                                                </div>
                                                <div class="col-12 navisubfreeboard">
                                                    <a href="/contentList.freeBoard">자유게시판</a>
                                                </div>
                                                <div class="col-12 navisublicence">
                                                    <a href="자격증 게시판으로">자격증</a>
                                                </div>
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


                        <div class="col-lg-1 d-none d-lg-block order-lg-2 naviname" style="text-align: center;"
                            onclick="javascript:checkLogin('/select.studyboard');">
                            <div>Study</div>
                        </div>
                        <div class="col-lg-1 d-none d-lg-block order-lg-3 naviname" style="text-align: center;"
                            onclick="javascript:checkLogin('/selectBound.secondHand');">
                            Sencond
                        </div>
                        <div class="col-lg-1 d-none d-lg-block order-lg-4 naviname" style="text-align: center;"
                            onclick="javascript:checkLogin('/contentList.freeBoard');">
                            Board
                        </div>
                        <div class="col-lg-1 d-none d-lg-block order-lg-5 naviname" style="text-align: center;"
                            onclick="javascript:checkLogin('/자격증 게시판으로');">
                            Licence
                        </div>

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
                                            <a href="/member/joinForm.jsp"><i class="fa-solid fa-user-plus"></i></a>
                                            <!--로그인안됐을때-->
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="col-6 profile">
                                            <a href="/myPage/mypageMainForm.jsp"><i class="fa-solid fa-user"></i></a>
                                            <!--로그인됐을때-->
                                        </div>
                                        <div class="col-6 logout">
                                            <a href="/logout.member"><i class="fa-solid fa-right-from-bracket"></i></a>
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
                                        <div class="col-12">　</div>
                                        <div class="col-12" style="text-align: right;">
                                            <a href="/member/loginForm.jsp"><i
                                                    class="fa-solid fa-right-to-bracket"></i></a>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="col-12">${sessionScope.loggedID}회원</div>
                                        <div class="col-12" style="text-align: right;">
                                            <a href="/logout.member"><i class="fa-solid fa-right-from-bracket"></i></a>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </body>

        <script>
            $("#subsearchclick").on("click", function () {
                if ($("#subsearch").css("display", "none")) {//돋보기있는 div
                    $("#subsearchback").css("display", "block")//검색창있는 div
                }
            })
            $("#searsubback").on("click", function () {
                if ($("#subsearchback").css("display", "none")) {//돋보기있는 div
                    $("#subsearch").css("display", "block");//검색창있는 div
                }
            })
            var hamberger = document.querySelector("#hamberger");
            var navisub = document.querySelector(".navisub");
            navisub.style.display = "none";

            hamberger.addEventListener("click", function () {
                if (navisub.style.display === "block") {
                    navisub.style.display = "none";
                } else {
                    navisub.style.display = "block";
                }
            });

        </script>
        </html>