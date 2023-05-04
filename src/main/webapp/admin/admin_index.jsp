<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>


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
<!-- https://bootdey.com/ 라이브러리 -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" />






<style>
.top_nul1 {
	height: 150px;
}

.bt_nul1 {
	height: 370px;
}
</style>
</head>
<body>


	<div class="container top_nul1">
		<img style="width: 100%;" src="https://img.khan.co.kr/news/2014/01/18/2014011801002854400208051.jpg" alt="">
	</div>
	<section class="vh-100">
		<div class="container h-custom">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-md-9 col-lg-6 col-xl-5">
					<img
						src=""
						class="img-fluid" alt="Sample image">
				</div>
				<div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
					<form action="/admin_login.admin" method="post">
						<!-- 입력창 시작 -->
						<!-- text input -->
						<div class="form-outline mb-4">
							<input type="text" id="form3Example3"
								class="form-control form-control-lg" name="admin_id"
								placeholder="Enter id" /> <label
								class="form-label" for="form3Example3">Admin ID</label>
						</div>

						<!-- Password input -->
						<div class="form-outline mb-3">
							<input type="password" id="form3Example4"
								class="form-control form-control-lg" name="admin_pw"
								placeholder="Enter password" /> <label class="form-label"
								for="form3Example4">Admin Password</label>
						</div>

						<div class="d-flex justify-content-between align-items-center">
							<!-- Checkbox -->
							<div class="form-check mb-0"></div>
						</div>

						<div class="text-center text-lg-start mt-4 pt-2">
							<button type="submit" class="btn btn-primary btn-lg"
								style="padding-left: 2.5rem; padding-right: 2.5rem;">Login</button>
						</div>

					</form>
				</div>
			</div>
		</div>
		<div class="container bt_nul1"></div>
		<div
			class="d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-4 px-4 px-xl-5 bg-primary">
			<!-- Copyright -->
			<div class="text-white mb-3 mb-md-0">Copyright © 2020. All
				rights reserved.</div>
			<!-- Copyright -->


		</div>
	</section>
</body>
</html>

