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

.checkBox {
	/* margin-bottom: 10px; */
	display: inline-block;
	float: left;
	margin-left: 3px;
}

.findIdPw {
	display: inline-block;
	float: right;
}

.btn {
	border-radius: 10px;
	display: block;
	width: 100%;
	margin-top: 15px;
}

#btnLogin {
	margin-top: 40px;
}

a {
	text-decoration: none;
	color: #6c6c81;
}
</style>

<body>
	<div class="container">
		<div class="loginBox">
			<h2>로그인</h2>
			<form action="/login.member" method="post">
				<div class="form-group">
					<input type="text" class="form-control" id="id" name="id"
						placeholder="아이디" />
				</div>
				<div class="form-group">
					<input type="password" class="form-control" id="pw" name="pw"
						placeholder="비밀번호" />
				</div>
				<div class="checkBox">
					<label><input type="checkbox"
						name="rememberId" value="1" /> 아이디 기억하기</label>
				</div>
				<div class="findIdPw">
					<a href="#">아이디/비밀번호 찾기</a>
				</div>

				<div class="btn">
					<button class="btn btn-primary" id="btnLogin">로그인</button>
					<button class="btn btn-light" id="btnJoin" type="button">회원가입</button>
				</div>
			</form>
		</div>
	</div>

	<script>
		$("#btnJoin").on("click", function() {
			location.href = "/member/joinForm.jsp";
		});
	</script>


</body>
</html>