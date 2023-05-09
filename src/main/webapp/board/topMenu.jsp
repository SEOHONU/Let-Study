<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>
<!--            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
               integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
              crossorigin="anonymous"> --> 
            <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
              crossorigin="anonymous"></script> -->
<!--             <script src="https://code.jquery.com/jquery-3.6.4.js" -->
<!--                 integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script> -->
<!--             <script src="https://kit.fontawesome.com/09115628a5.js" crossorigin="anonymous"></script> -->
            <style>
                /* * {
                    box-sizing: border-box;
                }

                div {
                    border: 1px solid black;
                } */
                .container {
                    position: relative;
                }

                .top {
                    background-color: #1e3c3e;
                    border: 1px solid #ddd;
                    border-radius: 10px;
                    margin: 1px;
                }

                .li {
                    border: 1px solid #ddd;
                    border-radius: 5px;
                    padding: 10px;
                }

                .navi {
                    position: sticky;
                    top: 0;
                    z-index: 999;
                }

                .loggedid {
                    text-align: right;
                }

                .profile, .logout, .signup, .login {
                    text-align: center;
                }

                #logo {
                    z-index: 2;
                }


                #subsearch {
                    display: block;
                }

                #subsearchback {
                    display: none;
                    text-align: center;
                }

                .naviname {
                    cursor: pointer;
                    transition-duration: 0.5s
                }

                .naviname:hover {
                    background-color: #3c757970;
                    color: white;

                }
                i{
                color:#aebabb;
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
            <%-- <c:import url=""></c:import> --%>
                <div class="row navi">
                    <div class="col-12 top">
                        <div class="row">
                            <div class="col-6 col-lg-2 order-2 order-lg-first" id="logo" style="text-align:center">
                                <div class="row">
                                    <div class="col-12" style="padding:0%">
                                        <a href="/index.jsp"><img src="/image/logo.png" style="border-radius: 10px;"></a>

                                    </div>
                                    <div class="col-12 d-lg-none d-block">
                                        <div class="row">
                                            <div class="col-12" id="subsearch">
                                                <i class="fa-solid fa-magnifying-glass" id="subsearchclick"
                                                    style="display: inline;"></i>
                                            </div>


                                            <div class="col-12" id="subsearchback">
                                                <form class="container-fluid" id="total_search"
                                                    action="/allsearch.maincontroller" style="padding:0px;">
                                                    <i class="fa-solid fa-arrow-left" id="searsubback"
                                                        style="display: inline;"></i> <select name="select">
                                                        <option value="제목">제목</option>
                                                        <option value="내용">내용</option>
                                                        <option value="작성자">작성자</option>
                                                    </select> <input type="text" class="form-control"
                                                        placeholder="통합검색창" aria-label="Username"
                                                        aria-describedby="basic-addon1"
                                                        style="width: 40%; padding: 0; display: inline;" name="title">
                                                    <button type="button" class="btn btn-success"
                                                        style="z-index: 0; background-color: rgb(60, 117, 121); padding: 0;">검색</button>
                                                </form>


                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="col-lg-4 d-none d-lg-block order-lg-1"></div>
                            <div class="col-3 d-block d-lg-none order-1">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="row">
                                            <div class="col-12">
                                                <i class="fa-solid fa-bars" id="hamberger"></i>
                                            </div>

                                            <!-- 네비햄버거 누를시 나오는거 -->
                                            <div class="col-12 navisub">
                                                <div class="row" style="text-align: right;">
                                                    <div class="col-12 naviname" style="text-align: center;font-size:12px; color:#aebabb;"
                                                        onclick="javascript:checkLogin('/select.studyboard');">
                                                        스터디
                                                    </div>
                                                    <div class="col-12 naviname" style="text-align: center;font-size:12px; color:#aebabb;"
                                                        onclick="javascript:checkLogin('/selectBound.secondHand');">
                                                        중고책거래
                                                    </div>
                                                    <div class="col-12 naviname" style="text-align: center;font-size:12px; color:#aebabb;"
                                                        onclick="javascript:checkLogin('/contentList.freeBoard');">
                                                        자유게시판
                                                    </div>
                                                    <div class="col-12 naviname licence" style="text-align: center;font-size:12px; color:#aebabb;">
                                                        <!-- onclick="javascript:checkLogin('/contentList.freeBoard');" -->
                                                        자격증게시판
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


                            <div class="col-lg-1 d-none d-lg-block order-lg-2 naviname" style="text-align: center;padding:0px; font-size:12px; line-height: 100px; color:#aebabb"
                                onclick="javascript:checkLogin('/select.studyboard');">
                                스터디
                            </div>
                            <div class="col-lg-1 d-none d-lg-block order-lg-3 naviname" style="text-align: center;padding:0px; font-size:12px; line-height: 100px; color:#aebabb"
                                onclick="javascript:checkLogin('/selectBound.secondHand');">
                                중고책거래
                            </div>
                            <div class="col-lg-1 d-none d-lg-block order-lg-4 naviname" style="text-align: center;padding:0px; font-size:12px; line-height: 100px; color:#aebabb"
                                onclick="javascript:checkLogin('/contentList.freeBoard');">
                                자유게시판
                            </div>
                            <div class="col-lg-1 d-none d-lg-block order-lg-5 naviname licence" style="text-align: center;padding:0px; font-size:12px; line-height: 100px; color:#aebabb">
                                <!-- onclick="javascript:checkLogin('/contentList.freeBoard');" -->
                                자격증게시판
                            </div>

                            <div class="col-lg-2 d-none d-lg-block  order-lg-last">
                                <div class="row">

                                    <c:choose>
                                        <c:when test="${loggedID==null}">
                                            <div class="col-6 login" style="line-height: 100px;">
                                                <a href="/member/loginForm.jsp"><i
                                                        class="fa-solid fa-right-to-bracket"></i></a>
                                                <!--로그인안됐을때-->
                                            </div>
                                            <div class="col-6 signup" style="line-height: 100px;">
                                                <a href="/member/joinForm.jsp"><i class="fa-solid fa-user-plus"></i></a>
                                                <!--로그인안됐을때-->
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="col-6 profile" style="line-height: 100px;">
                                                <a href="/mypageboard.mypageboardController"><i
                                                        class="fa-solid fa-user"></i></a>
                                                <!--로그인됐을때-->
                                            </div>
                                            <div class="col-6 logout" style="line-height: 100px;">
                                                <a href="/logout.member"><i
                                                        class="fa-solid fa-right-from-bracket"></i></a>
                                                <!--로그인됐을때-->
                                            </div>
                                        </c:otherwise>
                                    </c:choose>

                                </div>
                            </div>

                            <div class="col-3 d-block d-lg-none order-last">
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
                                            <div class="col-12 loggedid">${sessionScope.loggedID}회원</div>
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

            $(".btn-success").click(function () {
                const targetForm = $(this).closest("form");
                var login = '<c:out value="${loggedID}"/>';
                const inputText = targetForm.find(".form-control");
                if (login != "") { //성공
                    if (inputText.val() == "") {
                        alert("검색어를 입력해주세요");
                        return;
                    }
                    targetForm.submit();
                } else {
                    alert("로그인이 필요합니다");
                }
            });

            addEventListener("resize", function (event) {
                const bodySize = parseInt($("body").css("width"));
                if (bodySize > 992) {
                    const navisub = $(".navisub");
                    const divsearch = $("#subsearchback")
                    const addsearch = $("#subsearch")
                    if (navisub.css("display") == "block") {
                        navisub.css("display", "none");
                    }
                    addsearch.css("display", "block")
                    divsearch.css("display", "none")
                }
            });
            
            $(".licence").on("click",function(){
            	alert("아직 미구현 입니다.")
                location.reload();
            })

        </script>

        </html>