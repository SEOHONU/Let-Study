<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
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




<style>
* {
	box-sizing: border-box;
	/* border: 1px solid grey; */
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
	height: 20px;
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
	border:none;
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

.nickname{
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
background-color : green;
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

.fileCol{
padding:0px;
height:30px;
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

		<div class="row">
			<div class="col margin"></div>
		</div>
		<form action="/update.freeBoard" method="post" id="updateFreeBoard"
			enctype="multipart/form-data">
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
			<!--파일 첨부 출력 -->
			<c:choose>
				<c:when test="${fileResult!=null}">
					<div class="row fileRow">
						<div class="col fileCol">
						<span>첨부파일 : </span>
							<a
								href="/download.file?sysName=${fileResult.sysName}&oriName=${fileResult.oriName} id="fileList">${fileResult.oriName}</a>
							<input type="button" class="noBorderBtn fileDel" value="x"
								style="display: none"> <input type="hidden"
								name="file_seq" id="file_seq" value="${fileResult.seq}">
						</div>
						<hr style="width: 100%;">
					</div>
				</c:when>
			</c:choose>
			<div class="row fileRow">
					<input type="file" name="file" id="file" dir="rtl"
						style="display: none">
			</div>
			<!-- 게시글 출력 -->
			<div class="row">
				<div contenteditable="false" id="content" placeholder="내용을 입력해주세요"
					style="height: 500px">${list.content}</div>
				<input type="hidden" name="realContent" id="realContent">
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
							<a href="delete.freeBoard?seq=${list.seq}"> <input
								type="button" value="삭제">
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
							<div class="nickname" readonly>${i.writer}</div>
							<input type="text" class="reply_text" name="replyContent"
								value="${i.contents}" readonly>
							<div class="reply_info">
								<span class="reply_date" readonly>${i.write_date}</span>

								<c:choose>
									<c:when test="${sessionScope.loggedID eq i.writer}">
										<input type="button" class="noBorderBtn replyUpdate"
											value="댓글수정">
										<a href="/delete.reply?seq=${list.seq}&replySeq=${i.seq}">
											<input type="button" class="noBorderBtn" value="댓글삭제">
										</a>
									</c:when>
								</c:choose>

								<input type="submit" class="noBorderBtn" value="수정완료"
									style="display: none"> <input type="hidden"
									value="${i.seq}" name="replySeq"> <input type="hidden"
									value="${list.seq}" name="seq">
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

		</div>
		<div class="col-12" id="footer">푸터입니다.</div>
	</div>
	</div>

	<script>
		/* 댓글 입력 */
		$("#replyInsert").on("click", function() {
			location.href = "/insert.reply?seq=" + ${list.seq}
			+"&replyContent=" + $('#replyContent').val();
		})

		/* 게시글 수정하기, 수정 버튼 숨기기*/
		$("#updateBtn").on("click", function() {
			$("#titleInput").removeAttr("readonly");
			$("#content").attr("contenteditable", true);
			$("#updateBtn").hide();

			let updateComplete = $("<button>");
			updateComplete.text("수정완료");
			updateComplete.attr("type", "submit");
			updateComplete.css({
				'background-color': 'transparent',
				'border': 'none',
				'position': 'relative',
				'color' : 'grey',
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
			$("#file").css("display", "block");
	/* 		$('#file-upload-button').show(); */

			$(".fileDel").css("display", "inline-block");
		})

		$("#updateFreeBoard").on("submit", function() {
			$("#realContent").val($("#content").html());
		})

		/* 댓글 수정하기  */
		$(".replyUpdate").on("click", function() {
			$(this).parent().prev().removeAttr("readonly");
			$(this).hide();
			$(this).next().css("display", "none");
			$(this).next().next().css("display", "inline-block");
			
		})

		/* 파일 삭제  */
		$(".fileDel").on("click", function() {
			var $target = $(event.target);
			$.ajax({
				url : "/delete.file",
				dataType : "json",
				type : "post",
				data : {
					file_seq : $("#file_seq").val(),
					board_seq : $("#board_seq").val()
				}
			}).done(function(resp) {
				$target.parent("div").remove();
			});
		})
	</script>
</body>

</html>