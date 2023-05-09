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



</style>


</head>

<body>


	<div class="container">
	<!-- 헤더 -->
	    <c:import url="/board/topMenu.jsp"></c:import>
	
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
                     console.log("this : "+this);
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
             url = JSON.parse(url);
             console.log("url : " + url);
             $(summerNote).summernote("insertImage", url);
         });
     }
	</script>

</body>

</html>
</html>