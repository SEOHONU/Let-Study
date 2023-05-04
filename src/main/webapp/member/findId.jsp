<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
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

.findIdBox {
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

.btn {
	border-radius: 10px;
	display: block;
	width: 100%;
	margin-top: 15px;
}
</style>
<body>
	<div class="container">
		<div class="findIdBox">
			<h1>아이디 찾기</h1>

			<form action="/findId.member" method="post">
				<div class="row form-group">
					<input type="text" class="form-control" id="name" name="name"
						placeholder="이름" maxlength="5" required />
				</div>
				<div class="row form-group">
					<input type="text" class="form-control" id="email" name="email"
						placeholder="이메일" required />
				</div>
				<div class="row form-group">
					<input type="text" class="form-control" id="contact" name="contact"
						placeholder="전화번호" required />
				</div>
				<div class="btn">
					<button class="btn btn-primary" id="btnFind">찾기</button>
				</div>
			</form>
		</div>
	</div>

</body>
</html>