<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
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

#idCheck {
	position: absolute;
	right: 20px;
	top: 0;
	margin-top: 36px;
}
/* 
    .btnsParent{
        display: flex;
        justify-content: center;

    } */
.btnsParent button {
	margin: 10px;
}

#searchZipcode {
	position: absolute;
	right: 20px;
	top: 0;
	margin-top: 36px;
}
</style>



<body>

	<form method="post" action="/joinMember.member" id="joinMember">
		<div class="container">
			<div class="row header">
				<div class="col-12">
					<h1 class="join-header text-center">회원가입</h1>
					<h2 class="text-center">회원이 되어 다양한 혜택을 경험해보세요</h2>

				</div>
			</div>
			<div class="row form-group">
				<div class="col-3"></div>
				<div class="col-6">
					<label for="idInput">아이디*</label> <input type="text"
						class="form-control" id="id" name="id" placeholder="아이디 입력(6~20자)"
						required>
					<button class="btn btn-primary btn-sm" id="idCheck" type="button">중복확인</button>
				</div>
				<div class="col-3"></div>

			</div>

			<div class="row form-group">
				<div class="col-3"></div>
				<div class="col-6">
					<label for="pwInput">비밀번호*</label> <input type="password"
						class="form-control" id="pw" name="pw"
						placeholder="비밀번호 입력 (문자, 숫자, 특수문자 포함 8~20자)" required>
				</div>
				<div class="col-3"></div>
			</div>
			<div class="row form-group">
				<div class="col-3"></div>
				<div class="col-6">
					<label for="pwCheckInput">비밀번호 확인*</label> <input type="password"
						class="form-control" id="pwCheck" name="pwCheck"
						placeholder="비밀번호 재입력" required>
					<div id="pwFeedback"></div>
				</div>
				<div class="col-3"></div>
			</div>
			<div class="row form-group">
				<div class="col-3"></div>
				<div class="col-6">
					<label for="nameInput">이름*</label> <input type="name"
						class="form-control" id="name" name="name"
						placeholder="이름을 입력해주세요." required>
				</div>
				<div class="col-3"></div>
			</div>
			<div class="row form-group">
				<div class="col-3"></div>

				<!-- 생년 -->
				<div class="col-2">
					<label for="birthInput" class="form-label">생년월일*</label> <input
						type="text" class="form-control" id="birthYear" name="birthYear"
						placeholder="년(4자)" maxlength="4" required>
				</div>
				<!-- 월 -->
				<div class="col-2">
					<label for="#" style="color: transparent;">.</label> <select
						class="form-control" required>
						<option selected>월</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select>
				</div>
				<!-- 일 -->
				<div class="col-2">
					<label for="#" style="color: transparent;">.</label> <input
						type="text" class="form-control" name="birthDay" id="birthDay"
						placeholder="일" maxlength="2" required>
				</div>
				<div class="col-3"></div>

			</div>
			<div class="row form-group">
				<div class="col-3"></div>
				<div class="col-6">
					<label for="nicknameInput">닉네임</label> <input type="text"
						class="form-control" id="nickname" name="nickname"
						placeholder="2~10글자">
				</div>
				<div class="col-3"></div>
			</div>
			<div class="row form-group">
				<div class="col-3"></div>
				<div class="col-6">
					<label for="contactInput">연락처*</label> <input type="text"
						class="form-control" id="contact" name="contact"
						placeholder="휴대폰 번호 입력 ('-'제외 입력)" maxlength="11" required>
				</div>
				<div class="col-3"></div>
			</div>
			<div class="row form-group">
				<div class="col-3"></div>
				<div class="col-6">
					<label for="emailInput">이메일*</label> <input type="text"
						class="form-control" id="email" name="email" required>
				</div>
				<div class="col-3"></div>
			</div>
			<div class="row form-group">
				<div class="col-3"></div>
				<div class="col-6">
					<label for="zipcodeInput">우편번호</label> <input type="text"
						class="form-control" id="zipcode" name="zipcode" readonly>
					<input type="button" onclick="sample4_execDaumPostcode()"
						value="우편번호 찾기" id="searchZipcode">
				</div>
				<div class="col-3"></div>
			</div>
			<div class="row form-group">
				<div class="col-3"></div>
				<div class="col-6">
					<label for="roadAddressInput">도로명주소</label> <input type="text"
						class="form-control" id="roadAddress" name="roadAddress">
				</div>
				<div class="col-3"></div>
			</div>
			<div class="row form-group">
				<div class="col-3"></div>
				<div class="col-6">
					<label for="detailAddressInput">상세주소</label> <input type="text"
						class="form-control" id="detailAddress" name="detailAddress">
				</div>
				<div class="col-3"></div>
			</div>
			<div class="btnsParent text-center">
				<button class="btn btn-primary" id="btnJoin">가입하기</button>
				<button type="button" class="btn btn-light" id="btnCancel">취소하기</button>
			</div>
	</form>
	</div>

	<script>
	
	
		let regexId = /^[a-z]+[a-z0-9]{6,20}$/;
		let regexPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,20}$/;
		let regexName = /^[가-힣]{2,5}$/;
		let regexBirthYear = /^[12][0-9]{3}$/;
		let regexBirthDay = /^[0-9]{2}$/;
		let regexNickname = /^[a-zA-Z0-9가-힣]{2,10}$/;
		let regexContact = /^(01[016789])([1-9]\d{2,3})\d{4}$/;
		let regexEmail = /[a-zA-Z0-9._+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9.]+/;
	</script>


</body>
</html>