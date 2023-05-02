<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	margin: 0%;
}

#picture {
	width: 150px;
	height: 150px;
	border-radius: 50%;
	border: 1px solid black;
	margin: auto;
	margin-top: 15%;
	margin-bottom: 10%;
}

#camera {
	width: 50px;
	height: 50px;
	font-size: 30px;
	border-radius: 50%;
	border: 2px solid black;
	background-color: white;
	display: flex;
	margin-top: 70%;
	margin-left: 60%;
}

#camera>i {
	display: flex;
}

#camera>a {
	margin: auto;
}

#navi>div>button {
	width: 100%;
	border: none;
	background-color: none;
}

/* 오른쪽 -------------------*/
#profile {
	margin-top: 5%;
	margin-left: 3%;
}

#introduceMyslef {
	width: 100%;
}

#counter {
	margin-left: 70%;
}
</style>

</head>


<body>



	<form action="/update.profile_settingController" method="get"
		id="profileBox">
		<div class="container">
			<div class="row body">
				<div class="col-4" id="leftSide">
					<div class="col-12">
						사진
						<div id="picture">
							<div id="camera">
								<a href=""><i class="fa-solid fa-camera"></i></a>
							</div>
						</div>
					</div>

				</div>
				<div class="col-8">
					<div id="profile">
						<font size="6px"><b>Profile</b></font><br> 닉네임<br> 
						<input type="text" id="nickname" name="nickname" size='50'
							value="${loggedNickname}" readonly><br>

						자기소개
						<div id="introduce1">
							<textarea name="introduceMyslef1" id="introduceMyslef1"
								value="${update.profile_introduce}" readonly></textarea>
							
							<br>
						</div>

						<div id="introduce2">
							<span id="counter"> 0 자 / 180자</span><br>
							<textarea placeholder="내용을 입력하세요.(최대 180자)" id="introduceMyslef2"
								name="introduceMyslef2" maxlength="180">${select.profile_introduce}</textarea>
							<br>
						</div>

						SNS<br>
						<div class="instgram">
							<i class="fa-brands fa-instagram"></i> 
							<input type="text" id="instagram" name ="instargram" size='50'
								value="www.instargram/${select.profile_instargram }" readonly>
						</div>
						<div class="facebook">
							<i class="fa-brands fa-facebook-f"></i> 
							<input type="text" id="facebook" name="facebook" size='50'
								value="www.facebook/${select.profile_facebook }" readonly>
						</div>
						<div class="url">
							<i class="fa-brands fa-internet-explorer"></i> 
							<input type="text" id="urlAdd" name="url" size='50'
								value="${select.profile_url}" readonly>
						</div>
						<input type="button" id="backBtn" value="취소" style="float: right"
							onclick="location.href='/myPage/mypageMainForm.jsp'"> 
							<input type="submit" id="okBtn" value="확인" style="float: right">
						<input type="button" id="updateBtn" value="수정" style="float: right">


					</div>
				</div>
			</div>
		</div>
		<input  type="hidden" name="id" value="${loggedID}">
	</form>


	<script>
$(function(){
	$("#okBtn").css("display","none");
	$("#introduce2").css("display","none");
	})
	
</script>

	<script>
    $("#introduceMyslef2").keyup(function(e){
        var introduceMyslef = $(this).val();
    $("#counter").html( introduceMyslef.length +'자 / 180자');
    
    if(introduceMyslef.length>180){
        $(this).val(introduceMyslef.substring(0,180));
        $("#counter").html("180자 / 180자");
    }
    });
    
   $("#updateBtn").on("click",function(){
	 $("input").removeAttr("readonly");
	 $("textarea").removeAttr("readonly");
	 
	 $("#introduce1").css("display","none");
	 $("#introduce2").css("display","");
	 
	 $("#updateBtn").css("display","none");
	 $("#okBtn").css("display","");
   })

   
   
     
    
    </script>


</body>
</html>