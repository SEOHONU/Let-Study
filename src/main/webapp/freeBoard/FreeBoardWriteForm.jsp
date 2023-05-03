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
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
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

.note-insert {
	display: none;
}

#content {
	width: 100%;
	height: 500px;
	border:0.5px solid #C8C8C9;
}

.fileRow {
height:45px;
}


#file {
	width: 100%;
	float: right;

}

input[type=file]::file-selector-button {
	width: 90px;
	height: 35px;
	background-color: #408558;
	border: none;
	border-radius: 10px;
    color : white;
     cursor: pointer;
}

.fileCol{
margin:0;
}
</style>


</head>

<body>


	<div class="container">
		<!-- 헤더 -->
		
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
		<div class="row margin"></div>
		<div class="row writingHeader">
			<h3>자유게시판 글쓰기</h3>
			<hr style="width: 98%; margin-left: 10px;">

		</div>
		<form action="/write.freeBoard" method="post" enctype="multipart/form-data" id="insertForm">
			<div class="row titleRow">
				<div class="col titleCol ">
					<div id="title">
						<input type="text" placeholder="제목을 입력해주세요" id="titleInput"
							name="title">
						<button type="submit" class="btn btn-success" >저장</button>
					</div>
				</div>
			</div>
            <div class="row" style="height:10px;">
                    <hr style="width: 98%; margin-left: 10px;">
               <!-- 파일 입력 -->
            </div>
			<div class="row fileRow">
				<div class="col fileCol">
					<input class="form-control form-control-sm" id="formFileSm" name="file" type="file" dir="rtl">
				</div>



			</div>
			<div class="row content">
				<div class="col-12" id="body">
					<div contenteditable="true" id="content" name="content" placeholder="내용을 입력해주세요"></div>
					<input type="hidden" name="realContent" id="realContent" >
				</div>

			</div>
		</form>

		<div class="col-12" id="footer">푸터입니다.</div>
	</div>

	<script>
	/* texteditable에 있는 값을 넘겨주기 위한 함수 */
	$("#insertForm").on("submit", function(){
		$("#realContent").val($("#content").html());
	})
	
	
    </script>

</body>

</html>
</html>