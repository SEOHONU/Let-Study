<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 결과창</title>
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
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

body {
	font-family: "Noto Sans KR", sans-serif;
	background-color: #f5f5f5;
}

.container {
	max-width: 600px;
	margin: 0 auto;
	padding: 40px;
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	margin-top: 250px;
}

h1 {
	font-size: 36px;
	font-weight: 700;
	text-align: center;
	margin-bottom: 20px;
	color: #333;
}

.result {
	margin-bottom: 40px;
	text-align: center;
}

.result p {
	font-size: 24px;
	font-weight: 500;
	color: #333;
}

.result strong {
	font-weight: 700;
	color: #428bca;
}

.btnToFindPw{
	display: block;
	width: 100%;
	max-width: 200px;
	margin: 0 auto;
	padding: 12px;
	background-color: #428bca;
	color: #fff;
	font-size: 16px;
	font-weight: 700;
	text-align: center;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.2s ease;
}

.btnToFindPw:hover {
	background-color: #3071a9;
}
</style>

<body>
	<c:choose>
		<c:when test="${result == false }">
			<div class="container">
				<h1>비밀번호 찾기 결과</h1>
				<div class="result">
					<p>
						회원님의 비밀번호를 찾을 수 없습니다.<br> 다시 한 번 확인해주세요.
					</p>
				</div>
				<button class="btnToFindPw" id="btnToFindPw">비밀번호 찾기로 이동</button>
			</div>
		</c:when>




	</c:choose>



	<script>
		$("#btnToFindPw").on("click", function() {
			location.href = "/member/findPw.jsp";
		});
	</script>
</head>
<body>

</body>
</html>