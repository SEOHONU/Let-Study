<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
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

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
	integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
* {
	box-sizing: border-box;
}

div {
	border: 1px solid black;
}

/* 왼쪽프로필 ------------------- */
#profilecircle {
	width: 150px;
	height: 150px;
	border-radius: 50%;
	border: 1px solid black;
	margin: auto;
	margin-top: 10%;
	margin-bottom: 10%;
}

#circles>div {
	width: 60px;
	height: 60px;
	border-radius: 50%;
	margin: 10px auto;
	position: relative;
}

#message {
	font-size: 30px;
	float: left;
	position: relative;
	left: 20%;
	display: flex;
}

#message>a {
	margin: auto;
}

#profileSetting {
	font-size: 30px;
	float: left;
	position: relative;
	left: 35%;
	display: flex;
}

#profileSetting>a {
	margin: auto;
}

/* 오른쪽 ------------------- */
#myGrade {
	width: 100%;
	height: 100px;
	margin: 3%;
	margin-top: 1%;
}

#licenseBox {
	width: 100%;
	height: 200px;
	margin: 3%;
	margin-top: 1%;
}

#myReviewBox {
	width: 100%;
	height: 200px;
	margin: 3%;
	margin-top: 1%;
}
</style>
</head>

<body>

	<form action="">
		<div class="container">
			<div class="rowheader">
				 <div class="col-12">
                        <div class="row">
                            <div class="col-6 col-lg-2 order-2 order-lg-first" id="logo">
                                <div class="row">
                                    <div class="col-12">
                                        <a href="/index.jsp">logo</a>
                                    </div>

                                    

                                </div>
                            </div>
                            <div class="col-lg-4 d-none d-lg-block order-lg-1">여백</div>
                            <div class="col-4 d-block d-lg-none order-1">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="row">
                                            <div class="col-12">
                                                <i class="fa-solid fa-bars" id="hamberger"></i>
                                            </div>

                                            <!-- 네비햄버거 누를시 나오는거 -->
                                            <div class="col-12 navisub">
                                                <div class="row" style="text-align: right;">
                                                    <div class="col-12 navisubstudy">
                                                        <a href="/select.studyboard">스터디</a>
                                                    </div>
                                                    <div class="col-12 navisubjoongo">
                                                        <a href="/selectBound.secondHand">중고책</a>
                                                    </div>
                                                    <div class="col-12 navisubfreeboard">
                                                        <a href="/contentList.freeBoard">자유게시판</a>
                                                    </div>
                                                    <div class="col-12 navisublicence">
                                                        <a href="자격증 게시판으로">자격증</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <a href="회원가입 페이지로"><i class="fa-solid fa-user-plus"></i></a>
                                                <!--로그인안됐을때-->
                                            </div>
                                            <div class="col-6">
                                                <a href="/myPage/mypageMainForm.jsp"><i class="fa-solid fa-user"></i></a>
                                                <!--로그인됐을때-->
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="row">
                                            <div class="col-12">공백</div>
                                            <div class="col-12 subsearch">
                                                <i class="fa-solid fa-magnifying-glass" id="subsearchclick"></i>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-lg-1 d-none d-lg-block order-lg-2" style="text-align: center;">
                                <a href="/select.studyboard"> Study </a>
                            </div>
                            <div class="col-lg-1 d-none d-lg-block order-lg-3" style="text-align: center;">
                                <a href="/selectBound.secondHand"> Sencond </a>
                            </div>
                            <div class="col-lg-1 d-none d-lg-block order-lg-4" style="text-align: center;">
                                <a href="/contentList.freeBoard"> Board </a>
                            </div>
                            <div class="col-lg-1 d-none d-lg-block order-lg-5" style="text-align: center;">
                                <a href="자격증 게시판으로"> Licence </a>
                            </div>
                            <!-- <div class="col-2 d-block d-lg-none order-3"></div> -->
                            <div class="col-lg-2 d-none d-lg-block  order-lg-last">
                                <div class="row">
                                    <div class="col-3 login">
                                        <a href="/member/loginForm.jsp"><i class="fa-solid fa-right-to-bracket"></i></a>
                                        <!--로그인안됐을때-->
                                    </div>
                                    <div class="col-3 signup">
                                        <a href="회원가입 페이지로"><i class="fa-solid fa-user-plus"></i></a>
                                        <!--로그인안됐을때-->
                                    </div>
                                    <div class="col-3 profile">
                                        <a href="/myPage/mypageMainForm.jsp"><i class="fa-solid fa-user"></i></a>
                                        <!--로그인됐을때-->
                                    </div>
                                    <div class="col-3 logout">
                                        <a href="로그아웃 페이지로"><i class="fa-solid fa-right-from-bracket"></i></a>
                                        <!--로그인됐을때-->
                                    </div>
                                </div>
                            </div>

                            <div class="col-2 d-block d-lg-none order-last">
                                <div class="row">
                                    <div class="col-12">공백</div>
                                    <div class="col-6">
                                        <a href="/member/loginForm.jsp"><i class="fa-solid fa-right-to-bracket"></i></a>
                                    </div>

                                    <div class="col-6">
                                        <a href="로그아웃 페이지로"><i class="fa-solid fa-right-from-bracket"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
				<div class="col-12">
					<font size="5px"><b> 마이페이지</b></font>
				</div>
			
			<div class="row body">
				<div class="col-3">
					<div class="row">
						<div class="col-12 circle">
							<div id="profilecircle"></div>
							<div class="nickname" align="center">
								<b>${sessionScope.loggedNickname}</b>
							</div>
							<div class="greetings" align="center">Greetings</div>
							<div id="circles">
								<div id="message">
									<a href=""><i class="fa-regular fa-envelope" id="pictogram"></i></a>
								</div>
								<div id="profileSetting">
								
									<a href="/pofile_setting/profileForm.jsp">
									<i class="fa-solid fa-gear"></i></a>
								</div>
							</div>
						</div>
						<div class="col-12">
							<div class="myBoard">
								<a href="/myPage/myboard.jsp">
									<button type="button" id="myboardBtn">
										<i class="fa-solid fa-address-book"></i> 내 게시판
									</button>
								</a>
							</div>
							<hr>
							<div class="interestingMeeting">
							<a href="/">
								<button type="button">
									<i class="fa-solid fa-heart"></i> 관심 모임
								</button>
								</a>
							</div>
							<hr>
							<div class="myInfo">
								<a href="/member/memberInfo.jsp">
									<button type="button">
										<i class="fa-solid fa-gear"></i> 내 정보 관리
									</button>
								</a>
							</div>
							<hr>

						</div>
					</div>
				</div>
				<div class="col-9">
					<div class="row">
						<div class="myGrade">
							나의등급
							<div id=""></div>
						</div>
						<div class="">
							내가신청한 자격증
							<div id="licenseBox"></div>
						</div>

					</div>
				</div>
			</div>

			<div class="rowfooter">footer</div>
		</div>
	</form>

	<script>
		$(window).resize(function() {
			var cirWidth = $('#profilecircle').width();
			var subcirWidth = $('.circle').width();

			$('#profilecircle').height(subcirWidth * 1);
			$('#profilecircle').width(subcirWidth * 1);
		});
		
		$("#profileSettingBtn").on("click",function(){
			
		})
	</script>




</body>

</html>