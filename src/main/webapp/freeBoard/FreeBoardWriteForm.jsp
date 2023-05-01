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
}

.fileRow {
	height: 50px;
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
</style>


</head>

<body>


	<div class="container">
		<!-- 헤더 -->
		<div class="row navi">
			<div class="col-12">
				<div class="row">

					<div class="col-6 col-lg-2 order-2 order-lg-first">logo</div>
					<div class="col-lg-4 d-none d-lg-block order-lg-1">여백</div>
					<div class="col-4 d-block d-lg-none order-1">
						<div class="row">
							<div class="col-6">
								<div class="row">
									<div class="col-12">네비햄버거</div>
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
					<div class="col-lg-2 d-none d-lg-block  order-lg-last">ㅎㅇ</div>
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
            <div class="row">
             
                    <hr style="width: 98%; margin-left: 10px;">
               <!-- 파일 입력 -->
            </div>
			<div class="row fileRow">
				<div class="col fileCol">
					<input type="file" name="file" id="file" dir="rtl">
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