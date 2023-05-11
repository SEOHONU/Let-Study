<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://code.jquery.com/jquery-3.6.4.js"
        integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<!-- CSS only -->
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
	<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>




<style>
* {
	box-sizing: border-box;
	/* border: 1px solid grey; */
}


.reply_text {
	height: 50px;
	border: none;
	background-color: transparent;
}

.reply_info {
	font-size: 13px;
	color : grey;
}

.noBorderBtn {
	background-color: transparent;
	position: relative;
	left: 10px;
	color : grey;
	border : none;
}

#margin10 {
	height: 10px;
}

#titleInput {
	width: 100%;
	text-align: center;
	font-weight: bold;
	border: none;
	background: transparent;
	height:45px;
}

#writeDate {
	font-size: 12px;
	color: grey;
}

#replyContent {
	width: 100%;
	height: 80px;
	border: none;
	background-color: transparent;
	padding-left:10px;
}

.ReplyInputCol {
	padding: 0px;
	border: 0.5px solid grey;
	border-radius : 10px;
	background-color : #F2F2F2;
}

#replyInsert {
	float: right;
	position : relative;
}

.reply_area {
	padding: 0px;
}

.reply_text {
	width: 100%;
}

.headInfoCol {
	height: 30px;
	padding:0px;
}

#content {
	border: none;
	padding:5px;
	 min-height: 500px;
	
}

#btnsBoardCol {
	padding: 0px;
}

#btnsBoardCol input{
	background-color : transparent;
	float: right;
	position:relative;
	border : 0.5px solid #F2F2F2;
	font-size: 12px;
	color : grey;
	padding:5px;
	padding-left: 10px;
	padding-right: 10px;
} 

#replyForm {
	border: 0.5px solid #D6D6D6;
	border-radius: 10px;
}

.reply_nickname{
	padding-left:10px;
	padding-top : 10px;
	color : grey;
	font-size:14px;
}

.reply_text{
	padding-left:10px;
}

.reply_info{
	padding-left:10px;
	height:30px;
}

.replyInsertBtn{
border : none;
background-color : #254F4C;
font-size : 15px;
color : white;
width: 60px;
height:30px;
border-radius:10px;
margin-bottom:10px;
margin-right:10px;
}

#nick_name{
padding: 10px;
padding-bottom : 0px;
}

#file-upload-button{
border : none;
background-color : green;
font-size : 15px;
color : white;
width: 60px;
height:30px;
border-radius:10px;
margin-bottom:10px;
margin-right:10px;
}


.btnRow{
    height:20%;
}

.content{
    width:100%;
    height:60%;
    margin:0;
}


.margin{
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
		<!-- 자유게시판 이미지 -->
		
		<div class="row">
			<div class="col-12 " id="freeboard_img">
			<a href="/contentList.freeBoard">
			<img src="/image/freeboardImg.jpg">
			<h1 id=imgTitle>자유게시판</h1>
			</a>
			</div>
		</div>
				
		
		<!-- 바디 -->
		<div class="row">
			<div class="col margin"></div>
			<hr style="width: 100%;">
		</div>
		<form action="/update.freeBoard" method="post" >
			<div class="row rowTitle">
				<div class="col colTitle">
					<input type="hidden" value="${list.seq}" name="seq" id="board_seq">
					<h3>
						<input type="text" placeholder="제목을 입력해주세요" id="titleInput"
							name="title" value="${list.title}" readonly>
					</h3>
				</div>
			</div>
			<div class="row">
				<div class="col headInfoCol">
					<span>${nickname}</span> <span id="writeDate">${list.formedDate}</span>
				</div>
				<hr style="width: 100%;">
			</div>
			<!-- 게시글 출력 -->
			<div class="row">
			<div id=hiddenSummernote style="display:none;">
			 <textarea name="contents" id="summernote" class="summernote" required>${list.content}</textarea>
				</div>
				<div contenteditable="false" id="content" placeholder="내용을 입력해주세요"
					>${list.content}</div>
						<hr style="width: 100%; margin-bottom:5px;">
			</div>

			<!-- 수정, 삭제하기 버튼 -->

			<div class="row btnsBoardRow">
				<div class="col btnsBoardCol" id="btnsBoardCol">
					<a href="/contentList.freeBoard"> <input type="button"
						value="돌아가기"></a>
					<c:choose>
						<c:when test="${sessionScope.loggedID eq list.writer}">
							<input type="button" value="수정" id="updateBtn">
							 <input type="button" value="삭제" onclick="delContent()">
							</a>
						</c:when>
					</c:choose>
				</div>
			</div>
			<div id="margin10"></div>
		</form>
		<!-- 댓글출력 -->
		<div class="row">
			<div class="col reply_area">
				<c:forEach var="i" items="${replyResult}">
					<form action="/update.reply" method="post">
						<div id="replyForm">
							<div class="reply_nickname" readonly>${i.nickname}</div>
							<input type="text" class="reply_text" name="replyContent"
								value="${i.contents}" readonly>
							<div class="reply_info">
								<span class="reply_date" readonly>${i.write_date}</span>

								<c:choose>
									<c:when test="${sessionScope.loggedID eq i.writer}">
										<input type="button" class="noBorderBtn replyUpdate"
											value="댓글수정">
											<input type="button" class="noBorderBtn replyDel" value="댓글삭제" seq="${i.seq}">
										<input type="submit" class="noBorderBtn" value="수정완료"
											style="display: none">
									</c:when>
								</c:choose>
								<input type="hidden" value="${i.seq}" name="replySeq"> 
								<input type="hidden" value="${list.seq}" name="seq">
							</div>
						</div>
						<div id="margin10"></div>
					</form>
					<div id="margin10"></div>
				</c:forEach>
			</div>
		</div>
		<!-- 댓글입력 -->
		<div class="row ReplyInputRow">

			<div class="col ReplyInputCol">
				<div id="nick_name">${sessionScope.loggedNickname}</div>
				<input type="text" name="replyContent" id="replyContent"
					placeholder="댓글을 입력해주세요"> <input type=button class="replyInsertBtn" value="등록"
					id="replyInsert">
			</div>
	<hr style="width: 100%;">
		</div>
		 <c:import url="/board/footer.jsp"></c:import>
	</div>
	</div>

	<script>
	 $("#summernote").summernote({
         height: 500, // 에디터 높이
         minHeight: null, // 최소 높이
         maxHeight: null, // 최대 높이
         focus: true, // 에디터 로딩후 포커스를 맞출지 여부
         disableDragAndDrop: true,
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
             url: "/insertFile.secondHand",
             contentType: false,
             processData: false
         }).done(function (url) {
             img = JSON.parse(url);
             console.log("url : " + url);
             console.log("img.url : " + img.url);
             $(summerNote).summernote("insertImage", img.url);
         });
     }
	
	
	
		/* 댓글 입력 */
		$("#replyInsert").on("click", function() {
			location.href = "/insert.reply?seq=" + ${list.seq}
			+"&replyContent=" + $('#replyContent').val();
		})

		/* 게시글 수정하기, 수정 버튼 숨기기*/
		$("#updateBtn").on("click", function() {
			$("#titleInput").removeAttr("readonly");
			$("#hiddenSummernote").css("display","block");
			$("#content").css("display","none");
			$("#updateBtn").hide();

			$(".reply_area").hide();
			$(".ReplyInputRow").hide();
			
			let updateComplete = $("<button>");
			updateComplete.text("수정완료");
			updateComplete.attr("type", "submit");
			updateComplete.css({
				'background-color': '#254F4C',
				'color':'white',
				'font-weight':'bold',
				'border': 'none',
				'position': 'relative',
				'font-size': '13px',
				'border' : '0.5px solid #F2F2F2',
					'padding':'5px',
			'padding-left': '10px',
			'padding-right': '10px'
				});

			$("#btnsBoardCol").append(updateComplete);
			 $("#file").css({
				'background-color': 'transparent',
				'position': 'relative',
				'color' : 'grey',
				'font-size': '13px',
				'border' : '0.5px solid #F2F2F2',
				'width' : '100%',
				'height' : '40px',
				'padding' : '5px'
		
			}); 
		})

		/* 댓글 수정하기  */
		$(".replyUpdate").on("click", function() {
			$(this).parent().prev().removeAttr("readonly");
			$(this).hide();
			$(this).next().css("display", "none");
			$(this).next().next().css("display", "inline-block");
			
		})
		
		/* 댓글 삭제 확인  */
		$(".replyDel").on("click", function(){
			let replySeq = $(this).attr("seq");
			console.log(replySeq);
			if(confirm("댓글을 삭제하시겠습니까?")){
				alert("삭제 완료되었습니다.");
				location.href = "/delete.reply?seq=${list.seq}&replySeq="+replySeq;
			}
		})
		
		
		/* 게시글 삭제 확인 */
		function delContent(){
			if(confirm("게시글을 삭제하시겠습니까?")){
				alert("삭제 완료되었습니다.");
				location.href="delete.freeBoard?seq=${list.seq}";
			}
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