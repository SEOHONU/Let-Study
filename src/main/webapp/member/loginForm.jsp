<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet" />
</head>
<style>
* {
	font-family: "Noto Sans KR", sans-serif;
}

.container {
	margin-top: 200px;
}

.loginBox {
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.2);
	text-align: center;
	max-width: 400px;
	margin: 0 auto;
}

.form-group {
	margin-top: 20px;
	margin-bottom: 20px;
}

.rememberIdWrap {
	display: block;
}

.checkBox {
	/* margin-bottom: 10px; */
	display: block;
	float: left;
	margin-left: 3px;
}

.findIdPw {
	display: block;
	float: right;
}

.btn {
	border-radius: 10px;
	display: block;
	width: 100%;
	margin-top: 10px;
}

#errorMessage {
	margin-top: 10px;
	display: block;
}

#btnLogin {
	margin-top: 40px;
}

a {
	text-decoration: none;
	color: #6c6c81;
}

/* 하단 링크 스타일 */
.bottom-link {
	margin-top: 10px;
	text-align: center;
}

/* 링크 스타일 */
.bottom-link a {
	color: #6c6c81;
	text-decoration: none;
	font-weight: bold;
}

/* 링크 호버 스타일 */
.bottom-link a:hover {
	color: #ed4e12;
}
</style>

<body>
	<form>
		<div class="container">
			<div class="loginBox">
				<h2>로그인</h2>
				<div class="form-group">
					<input type="text" class="form-control" id="id" name="id"
						maxlength="20" placeholder="아이디" />
				</div>
				<div class="form-group">
					<input type="password" class="form-control" id="pw" name="pw"
						maxlength="20" placeholder="비밀번호" />
				</div>
				<div class="rememberIdWrap">
					<div class="checkBox">
						<label><input type="checkbox" name="rememberId" value="1" />
							아이디 기억하기</label>
					</div>
				</div>
				<br>
				<div class="errorMessage" id="errorMessage"></div>

				<div class="btn">
					<button type="button" class="btn btn-primary" id="btnLogin">로그인</button>
					<button type="button" class="btn btn-light" id="btnJoin">회원가입</button>
				</div>
				<div class="bottom-link">
					<a href="/member/findId.jsp">아이디 찾기</a> | <a href="#">비밀번호 찾기 </a>
				</div>
			</div>
		</div>
	</form>

	<script>
		$("#btnJoin").on("click", function() {
			location.href = "/member/joinForm.jsp";
		})

		// ajax로 페이지 전환없이 데이터 전송

		$("#btnLogin").on("click", function() {
			let id = $("#id").val();
			let pw = $("#pw").val();
			$.ajax({
				url : "/login.member",
				type : "post",
				dataType : "json",
				// 데이터 타입을 json형태로 돌려받겠다 
				data : {
					id : id,
					pw : pw
				},
				// id랑 pw를 보내겠다 
				success : function(resp) {
					//로그인이 실패한 경우 
					if (!resp) {
						console.log(resp);
						$("#errorMessage").html("아이디 또는 비밀번호를 잘못 입력했습니다.");
						$("#errorMessage").css({
							color : "red"
						});
						//로그인 폼 초기화 
						$("#id").val("");
						$("#pw").val("");
						// 로그인이 성공할 경우 
					} else {
						location.href = "/index.jsp";
						console.log("로그인이 성공할 경우");
					}
				},
				error : function(xhr, status, error) {
					console.log(xhr);
					console.log(status);

					console.log(error);
				}

			});

		});
	</script>
</body>
</html>