<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Member Update</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
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
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

.container {
	margin-top: 70px;
}

h1, h2 {
	text-align: center;
	margin-bottom: 50px;
}

.join-header {
	margin-top: 0;
	margin-bottom: 10px;
}

h2 {
	font-size: small;
}

#idInput {
	width: calc(100% -120px);
}

/* 
    .btnsParent{
        display: flex;
        justify-content: center;

    } */
.btnsParent button {
	margin: 10px;
	background-color: #254F4C;
	border: none;
	border: 3px solid #254F4C;
	color: white;
	border-radius: 5%;
	padding-left: 1%;
	padding-right: 1%;
}

.btnsParent button:hover {
	background-color: #f3f3f3;
	color: #254F4C;
}

.btnsParent a {
	text-decoration-line: none;
	color: white;
}

.btnsParent a:hover {
	color: #254F4C;
}

#searchZipcode {
	position: absolute;
	right: 20px;
	top: 0;
	margin-top: 36px;
}
</style>
<body>
	<form method="post" action="/update.member" id="joinMember">
		<div class="container">
			<div class="row header">
				<div class="col-12">
					<h1 class="join-header text-center">개인정보수정</h1>
					<h2 class="text-center">${loggedNickname}님,LetStudy에오신걸환영합니다.</h2>
				</div>
			</div>
			<div class="row form-group">
				<div class="col-3"></div>
				<div class="col-6">
					<label for="idInput">아이디*</label> <input type="text"
						class="form-control" id="id" name="id" maxlength="20"
						value="${loggedID}" readonly>
					<div id="idFeedback"></div>
				</div>
				<div class="col-3"></div>
			</div>
			<div class="row form-group">
				<div class="col-3"></div>
				<div class="col-6">
					<label for="pwInput">비밀번호*</label> <input type="password"
						class="form-control" id="pw" name="pw"
						placeholder="비밀번호 입력 (문자, 숫자, 특수문자 포함 8~20자)" maxlength="20"
						required>
				</div>
				<div class="col-3"></div>
			</div>
			<div class="row form-group">
				<div class="col-3"></div>
				<div class="col-6">
					<label for="pwCheckInput">비밀번호 확인*</label> <input type="password"
						class="form-control" id="pwCheck" name="pwCheck"
						placeholder="비밀번호 재입력" maxlength="20" required>
					<div id="pwFeedback"></div>
				</div>
				<div class="col-3"></div>
			</div>
			<div class="row form-group">
				<div class="col-3"></div>
				<div class="col-6">
					<label for="nameInput">이름*</label> <input type="name"
						class="form-control" id="name" name="name" maxlength="5"
						value="${myInfo.name}" readonly>
				</div>
				<div class="col-3"></div>
			</div>
			<div class="row form-group">
				<div class="col-3"></div>

				<div class="col-6">
					<label for="birthInput" class="form-label">생년월일*</label> <input
						type="text" class="form-control" id="birthdate" name="birth_date"
						value="${myInfo.birth_date}">
				</div>
				<div class="col-3"></div>

			</div>
			<div class="row form-group">
				<div class="col-3"></div>
				<div class="col-6">
					<label for="nicknameInput">닉네임*</label> <input type="text"
						class="form-control" id="nickname" name="nickname"
						value="${loggedNickname}" maxlength="10" required>
				</div>
				<div class="col-3"></div>
			</div>
			<div class="row form-group">
				<div class="col-3"></div>
				<div class="col-6">
					<label for="contactInput">연락처*</label> <input type="text"
						class="form-control" id="contact" name="contact"
						value="${myInfo.contact}" maxlength="11" required>
				</div>
				<div class="col-3"></div>
			</div>
			<div class="row form-group">
				<div class="col-3"></div>
				<div class="col-6">
					<label for="emailInput">이메일*</label> <input type="text"
						class="form-control" id="email" name="email"
						value="${myInfo.email }" required>
				</div>
				<div class="col-3"></div>
			</div>
			<div class="row form-group">
				<div class="col-3"></div>
				<div class="col-6">
					<label for="zipcodeInput">우편번호</label> <input type="text"
						class="form-control" id="zipcode" name="zipcode"
						value="${myInfo.zipcode }" readonly> <input type="button"
						onclick="sample4_execDaumPostcode()" value="우편번호 찾기"
						id="searchZipcode">
				</div>
				<div class="col-3"></div>
			</div>
			<div class="row form-group">
				<div class="col-3"></div>
				<div class="col-6">
					<label for="roadAddressInput">도로명주소</label> <input type="text"
						class="form-control" id="roadAddress" name="roadAddress"
						value="${myInfo.zipcode }">
				</div>
				<div class="col-3"></div>
			</div>
			<div class="row form-group">
				<div class="col-3"></div>
				<div class="col-6">
					<label for="detailAddressInput">상세주소</label> <input type="text"
						class="form-control" id="detailAddress" name="detailAddress"
						value="${myInfo.zipcode }">
				</div>
				<div class="col-3"></div>
			</div>
			<div class="btnsParent text-center">
				<button type="submit" id="btnupdate">수정</button>
				<button type="button" id="btnCancel">
					<a href="/myPage/mypageMainForm.jsp">취소</a>
				</button>
				<button type="button" id="btnMemberOut">
					탈퇴
				</button>
			</div>
		</div>
	</form>

	<script>
	
	</script>
</body>
</html>