<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 폼</title>
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
						maxlength = "20" required>
					<div id="idFeedback"></div>
				</div>
				<div class="col-3"></div>
			</div>
			<div class="row form-group">
				<div class="col-3"></div>
				<div class="col-6">
					<label for="pwInput">비밀번호*</label> <input type="password"
						class="form-control" id="pw" name="pw"
						placeholder="비밀번호 입력 (문자, 숫자, 특수문자 포함 8~20자)" maxlength="20" required>
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
						class="form-control" id="name" name="name"
						placeholder="이름을 입력해주세요." maxlength="5" required>
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
						class="form-control" name="birthMonth" required>
						<option selected>월</option>
						<option value="01">01</option>
						<option value="02">02</option>
						<option value="03">03</option>
						<option value="04">04</option>
						<option value="05">05</option>
						<option value="06">06</option>
						<option value="07">07</option>
						<option value="08">08</option>
						<option value="09">09</option>
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
					<label for="nicknameInput">닉네임*</label> <input type="text"
						class="form-control" id="nickname" name="nickname"
						placeholder="2~10글자" maxlength="10" required>
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
				<button type="submit" class="btn btn-primary" id="btnJoin">가입하기</button>
				<button type="button" class="btn btn-light" id="btnCancel">취소하기</button>
			</div>
		</div>
	</form>

	<script>
		var idValidFlag = false;

		$("#id").on("keyup", function() {
			idValIdFlag = false;
		});
		// 아이디 중복체크 ajax 
		$("#id").focusout(function() {

			let id = $("#id").val();

			$.ajax({
				url : "/idCheck.member",
				type : "post",
				dataType : "json",
				data : {
					id : id
				},
				success : function(resp) {
					if (resp) {
						console.log(resp);
						$("#idFeedback").html("이미 존재하는 아이디입니다.");
						$("#idFeedback").css({
							color : "red"
						});
					} else {
						$("#idFeedback").html("사용가능한 아이디입니다.");
						$("#idFeedback").css({
							color : "blue"
						});
						idValIdFlag = true;
					}
				},
				error : function(xhr, status, error) {
					console.log(xhr);
					console.log(status);
					console.log(error);
				}

			});
		});

		// 비밀번호가 일치하는지 검사
		// 둘 다 입력된 경우에만 비교하여 일치 여부를 확인 
		$(document).ready(function() {
			// html문서가 모두 로드되면 실행 
			$("#pwCheck").on("keyup", function() {
				var pw = $("#pw").val();
				var pwCheck = $("#pwCheck").val();
				console.log(pw, pwCheck);

				// 두 필드 모두 값이 입력되었을 때 
				// 둘 다 값이 존재할 때 조건을 만족 
				if (pw && pwCheck) {
					// 비밀번호 일치 여부 확인
					if (pw == pwCheck) {
						$("#pwFeedback").html("비밀번호가 일치합니다.").css({
							color : "blue"
						});
					} else {
						$("#pwFeedback").html("비밀번호가 일치하지 않습니다.").css({
							color : "#fd1d1d"
						});
					}

				} else {
					// 두 필드 중 하나라도 값이 입력되지 않았을 때
					$("#pwFeedback").html("").css({
						color : "#fd1d1d"
					});
				}
			});
		});
		// 유효성 검사를 위한 정규식 

		let regexId = /^[a-z]+[a-z0-9]{5,19}$/;
		let regexPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,20}$/;
		let regexName = /^[가-힣]{2,5}$/;
		let regexBirthYear = /^[12][0-9]{3}$/;
		let regexBirthDay = /^[0-9]{2}$/;
		let regexNickname = /^[a-zA-Z0-9가-힣]{2,10}$/;
		let regexContact = /^(01[016789])([1-9]\d{2,3})\d{4}$/;
		let regexEmail = /[a-zA-Z0-9._+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9.]+/;

		let joinMember = document.getElementById("joinMember");
		// onsubmit 이벤트는 버튼에 주는게 아니라 form태그에 준다

		joinMember.onsubmit = function() {
			let id = $("#id").val();
			let resultId = regexId.test(id);
			let pw = $("#pw").val();
			let resultPw = regexPw.test(pw);
			let name = $("#name").val();
			let resultName = regexName.test(name);
			let birthYear = $("#birthYear").val();
			let resultBirthYear = regexBirthYear.test(birthYear);
			let birthDay = $("#birthDay").val();
			let resultBirthDay = regexBirthDay.test(birthDay);
			let nickname = $("#nickname").val();
			let reusultNickname = regexNickname.test(nickname);
			let contact = $("#contact").val();
			let resultContact = regexContact.test(contact);
			let email = $("#email").val();
			let resultEmail = regexEmail.test(email);

			if (!resultId) {
				alert("아이디는 6~20자 영소문자와 숫자를 사용하세요.");
				return false;
			}
			if (!resultPw) {
				alert("비밀번호는 8~20자 영문 대 소문자, 숫자, 특수문자를 사용하세요. ");
				return false;
			}
			if (!resultName) {
				alert("이름은 2~5자 한글을 사용하세요.");
				return false;
			}

			if (!resultBirthYear) {
				alert("태어난 년도 4자리를 정확하게 입력해주세요");
				return false;
			}

			if (!resultBirthDay) {
				alert("생년월일을 다시 확인해주세요.");
				return false;
			}

			if (!reusultNickname) {
				alert("닉네임은 2~10자의 영문, 소문자, 대문자만 사용 가능합니다.");
				return false;
			}
			if (!resultContact) {
				alert("휴대전화번호를 다시 확인해주세요.");
				return false;
			}

			if (!resultEmail) {
				alert("이메일 양식을 확인해주세요.");
				return false;
			}
		};
		// 우편번호 카카오 api
		document.getElementById("searchZipcode").onclick = function() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							document.getElementById("zipcode").value = data.zonecode;
							document.getElementById("roadAddress").value = data.address;
						},
					}).open();
		};
	</script>
</body>
</html>