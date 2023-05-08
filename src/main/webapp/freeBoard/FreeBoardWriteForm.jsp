<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글쓰기</title>

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
	 <script src="https://code.jquery.com/jquery-3.6.4.js"
        integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
	 <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
   

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

.writingHeader {
	height: 50px;
}

.titleRow {
	height: 50px;
}

#titleInput {
	width: 95%;
	border: none;
}

.btn-success {
	width: 60px;
}

#title {
	display: flex;
	justify-content: center;
	width: 100%;
}

.margin {
	height: 20px;
}

#content {
	width: 100%;
	height: 500px;
	border: 0.5px solid #C8C8C9;
}


#freeboard_img {
	width:100%;
	height: 200px;
}

#freeBoardInsert{
background-color : #254F4C;
}

.margin5{
position:relative;
float:left;
height:5px;
display:block;
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

/* 헤더 스타일 */
.container {
                    position: relative;
                }

                .top {
                    background-color: #3c757980;
                    border: 1px solid #ddd;
                    border-radius: 5px;
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

                .profile {
                    text-align: center;
                }

                .logout {
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


/* 헤더 스타일 */


</style>


</head>

<body>


	<div class="container">
	<!-- 헤더 -->
	  <div class="row navi">

                    <div class="col-12 top">
                        <div class="row">
                            <div class="col-6 col-lg-2 order-2 order-lg-first" id="logo">
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

                            <div class="col-lg-4 d-none d-lg-block order-lg-1">여백</div>
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
                                                    <div class="col-12 naviname" style="text-align: center;"
                                                        onclick="javascript:checkLogin('/select.studyboard');">
                                                        Study
                                                    </div>
                                                    <div class="col-12 naviname" style="text-align: center;"
                                                        onclick="javascript:checkLogin('/selectBound.secondHand');">
                                                        second
                                                    </div>
                                                    <div class="col-12 naviname" style="text-align: center;"
                                                        onclick="javascript:checkLogin('/contentList.freeBoard');">
                                                        free
                                                    </div>
                                                    <div class="col-12 naviname" style="text-align: center;"
                                                        onclick="javascript:checkLogin('/contentList.freeBoard');">
                                                        licence
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
                                Study
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
	
   		<!-- 바디 -->
		<!-- 자유게시판 이미지 -->
		<div class="row">
			<div class="col-12 " id="freeboard_img">
			<a href="/contentList.freeBoard">
			<img src="/image/freeboardImg.jpg">
			<h1 id=imgTitle>자유게시판</h1>
			</a>
			</div>
		</div>
		<div class="row">
			<div class="col margin5"></div>
			<hr style="width: 100%;">
		</div>
		<div class="row margin"></div>
		<div class="row writingHeader">
			<h3>자유게시판 글쓰기</h3>
			<hr style="width: 98%; margin-left: 10px;">

		</div>
		<form action="/write.freeBoard" method="post" id="insertForm">
			<div class="row titleRow">
				<div class="col titleCol ">
					<div id="title">
						<input type="text" placeholder="제목을 입력해주세요" id="titleInput"
							name="title">
						<button type="submit" class="btn btn-success" id="freeBoardInsert">저장</button>
					</div>
				</div>
			</div>
			<div class="row" style="height: 10px;">
				<hr style="width: 98%; margin-left: 10px;">
			</div>
			<div class="row content">
				<div class="col-12" id="body">
					 <textarea name="contents" id="summernote" class="summernote" required></textarea>
				</div>
			</div>
		</form>

		 <c:import url="/board/footer.jsp"></c:import>
	</div>

	<script>
	 $("#summernote").summernote({
         height: 500, // 에디터 높이
         minHeight: null, // 최소 높이
         maxHeight: null, // 최대 높이
         focus: true, // 에디터 로딩후 포커스를 맞출지 여부
         lang: "ko-KR", // 한글 설정
         placeholder: '자유롭게 글을 작성해주세요.', //placeholder 설정
         toolbar: [
             ['style', ['style']],
             ['font', ['bold', 'underline', 'clear']],
             ['fontname', ['fontname']],
             ['color', ['color']],
             ['para', ['ul', 'ol', 'paragraph']],
             ['table', ['table']],
             ['insert', ['picture']],
             ['view', ['fullscreen', 'codeview', 'help']]
         ],
         callbacks: { //여기 부분이 이미지를 첨부하는 부분
             onImageUpload: function (files) {
                 for (let i = 0; i < files.length; i++) {
                     uploadImg(files[i], this);
                     console.log(this);
                 }
             }
         }
     });
     function uploadImg(img, summerNote) {
         data = new FormData();
         data.append("img", img);
         $.ajax({
             data: data,
             type: "POST",
             url: "/insertFile.freeBoard",
             contentType: false,
             processData: false
         }).done(function (url) {
             img = JSON.parse(url);
             console.log("url : " + url);
             console.log("img.url : " + img.url);
             $(summerNote).summernote("insertImage", img.url);
         });
     }
     
     /* 헤더이벤트 */
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
	</script>

</body>

</html>
</html>