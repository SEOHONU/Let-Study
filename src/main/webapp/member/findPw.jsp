<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
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

.findPwBox {
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
		<div class="findPwBox">
			<h1>비밀번호 찾기</h1>

			<form>
				<div class="row form-group">
					<input type="text" class="form-control" id="id" name="id"
						placeholder="아이디" maxlength="20" required />
				</div>
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
						placeholder="휴대폰 번호 입력 ('-'제외 입력)" required />
				</div>
				<div class="btn">
					<button type="button" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#exampleModal" id="btnFind">찾기</button>
				</div>
			</form>
		</div>
	</div>

	<!-- 비밀번호 변경 모달창 -->
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">비밀번호 변경</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form>
						<div class="mb-3">
							<label for="newPw" class="form-label">비밀번호</label> <input
								type="password" class="form-control" id="newPw"
								aria-describedby="emailHelp"
								placeholder="비밀번호 입력 (문자, 숫자, 특수문자 포함 8~20자)" required />
							<div id="pwFeedback" class="form-text"></div>
						</div>
						<div class="mb-3">
							<label for="newPwConfirm" class="form-label">비밀번호 확인</label> <input
								type="password" id="newPwCheck" placeholder="비밀번호 재입력"
								class="form-control" required />
							<div id="pwFeedback2" class="form-text"></div>


						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button id="btnChangePw" type="button" class="btn btn-primary">변경</button>
				</div>
			</div>
		</div>
	</div>


	<script>
		$("#btnFind").on("click", function() {
			let id = $("#id").val();
			let name = $("#name").val();
			let email = $("#email").val();
			let contact = $("#contact").val();

			$.ajax({
				url : "/findPw.member", // 서버 측에서 비밀번호 변경 가능 여부를 판단하는 로직이 구현된 URL을 입력합니다.
				method : "post",
				dataType : "json",
				data : { // 요청 파라미터로 사용자가 입력한 값들을 전달합니다.
					id : id,
					name : name,
					email : email,
					contact : contact
				},
				success : function(data) {
					// data는 controller에서 받은 값  
					if (data == true) { // 서버에서 전달된 결과가 true인 경우, 비밀번호 변경 모달창을 띄웁니다.
						$("#exampleModal").modal("show");
					} else {
						location.href = "/member/findPwResult.jsp";
					}
				},
				error : function(xhr, status, error) {
					alert("오류가 발생했습니다.");
					console.log(xhr);
					console.log(status);
					console.log(error);
				}
			});
		});

		// 비밀번호 정규식

		let regexPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,20}$/;

		// 비밀번호 변경 정규식 검사 
		$("#newPw").focusout(function() {
			let pw = $("#newPw").val();
			console.log(pw);
			let resultPw = regexPw.test(pw);
			// 정규식에 맞게 안썼을 경우
			if (!resultPw) {
				$("#pwFeedback").html("비밀번호는 문자, 숫자, 특수문자 포함 8~20자입니다.");
				$("#pwFeedback").css({
					color : "red"
				});
				// 정규식에 맞게 썼을 경우	- 비밀번호 불일치 체크
			} else {
				$("#pwFeedback").html("");

				let pwCheck = $("#newPwCheck").val();
				console.log(pwCheck);
				// 두 필드 모두 값이 입력되었을 때 
				// 둘 다 값이 존재할 때 조건을 만족 
				if (pw && pwCheck) {
					// 비밀번호 일치 여부 확인
					if (pw == pwCheck) {
						$("#pwFeedback2").html("비밀번호가 일치합니다.").css({
							color : "#284ee3"
						});
						$("#btnChangePw").on("click", function() {

							$.ajax({
								url : "/updatePw.member", // 서버 측에서 비밀번호 변경 가능 여부를 판단하는 로직이 구현된 URL을 입력합니다.
								method : "post",
								dataType : "json",
								data : { // 요청 파라미터로 사용자가 입력한 값들을 전달합니다.
									newPw : newPw
								},
								success : function(data) {
									console.log(data);

								},
								error : function(xhr, status, error) {
									alert("오류가 발생했습니다.");
									console.log(xhr);
									console.log(status);
									console.log(error);
								}
							});
						});

					} else {
						$("#pwFeedback2").html("비밀번호가 일치하지 않습니다.").css({
							color : "#fd1d1d"
						});
					}

				}

			}
		});
	</script>

</body>
</html>