<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
   <meta charset="UTF-8">
   <title>Profile</title>
   <script src="https://code.jquery.com/jquery-3.6.4.js"></script>
   <!-- CSS only -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   <!-- JavaScript Bundle with Popper -->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"></script>

   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">

   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
      crossorigin="anonymous"></script>

   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
      integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
      crossorigin="anonymous" referrerpolicy="no-referrer" />

   <style>
      * {
         box-sizing: border-box;
      }


      /* div {
         border: 1px solid black;
         margin: 0%;
      } */

      .container-sm {
         position: relative;
         top: 100px;
         width: 800px;
         height: 600px;
      }

      .body {
         height: 100%;
      }

      #profile input[type='text'] {
         border-radius: 5px;
         border: 1px solid #254F4C;
         width: 90%;
      }

      #profile textarea {
         border-radius: 5px;
         border: 1px solid #254F4C;
         width: 90%;
         height: 100px;

      }

      /* 왼쪽 프로필 사진-------------------*/
      #leftSide {
         background-color: #254F4C;
      }

      #picture>img {
         width: 150PX;
         height: 150PX;
         margin: auto;
         /* filter: invert(23%) sepia(78%) saturate(303%) hue-rotate(126deg) brightness(90%) contrast(87%); */
         filter: invert(100%) sepia(0%) saturate(7489%) hue-rotate(249deg) brightness(106%) contrast(98%);
         margin-top: 30%;
         margin-left: 3%;

      }

      #camera {
         width: 40px;
         height: 40px;
         font-size: 20px;
         border-radius: 50%;
         background-color: #ffffff;
         display: flex;
         margin-top: -6%;
         margin-left: 14%;
         position: absolute;
      }

      #camera>i {
         display: flex;

      }

      #camera>a {
         margin: auto;
         color: #758988;
      }

      /* #navi>div>button {
         width: 100%;
         border: none;
         background-color: none;
      } */

      /* 오른쪽 프로필 정보-------------------*/
      #profile {
         margin-top: 5%;
         margin-left: 3%;
      }

      .P{
         margin-top: 2%;
      }
  

      /* 글자수 */
      #counter {
         margin-left: 70%;
      }

      /* 버튼 */
      .button {
         position: absolute;
         right: 8%;
         bottom: 3%;
      }
      .button input {
         background-color: #254F4C;
         color: #f3f3f3;
         border: none;
         border: 1px solid #254F4C;
         transition-duration: 0.8s;
         width: 80px;
         border-radius: 5%;
         margin: 5px;
      }
      .button input:hover {
         background-color: #f3f3f3;
         color: #254F4C;
      }


      .snsbox input {
         display: block;
      }

      /* 박스사이공간 */
      .empty {
         background-color: none;
         height: 25px;
      }
   </style>

</head>


<body style="background-color:#f3f3f3;">

   <form action="/update.profile_settingController" method="get" id="profileBox">
      <div class="container-sm" style="background-color:white;">
      
         <div class="row body">

            <div class="col-3" id="leftSide">
               <div class="col-12" style="background-color:#254F4C;">
                  <div id="picture">
                     <img src="/image/person.png">
                     <div id="camera">
                        <a href=""><i class="fa-solid fa-camera"></i></a>
                     </div>
                  </div>
               </div>
            </div>
            <div class="col-9">
               <div id="profile">
                  <font size="6px" color="#254F4C"><b>Profile</b></font>
                  <div class="empty"></div>

                  <div class="nicknamebox P">
                     <b>닉네임</b><br>
                     <input type="text" id="nickname" name="nickname" value="${loggedNickname}" maxlength="10" readonly><br>
                  </div>

                  <div class="introducebox P">
                     <b>자기소개</b>
                     <div id="introduce1">
                        <textarea name="introduceMyslef1" id="introduceMyslef1" style="resize: none;"
                           readonly>${select.profile_introduce}</textarea>
                        <br>
                     </div>
                  </div>
                  <div id="introduce2">
                     <textarea placeholder="내용을 입력하세요.(최대 180자)" id="introduceMyslef2" name="introduceMyslef2"
                        style="resize: none;" maxlength="180">${select.profile_introduce}</textarea>
                     <span id="counter"> 0 자 / 180자</span>
                  </div>


                  <div class="snsbox P">
                     <b>SNS</b><br>
                     <i class="fa-brands fa-instagram"></i> Instagram
                     <input type="text" id="instagram" name="instagram" placeholder="www.instargram/"
                        value="${select.profile_instargram }" readonly>

                     <i class="fa-brands fa-facebook-f"></i> Facebook
                     <input type="text" id="facebook" name="facebook" placeholder="www.facebook/"
                        value="${select.profile_facebook }" readonly>

                     <i class="fa-brands fa-internet-explorer"></i> URL
                     <input type="text" id="urlAdd" name="url" value="${select.profile_url}" readonly>

                  </div>

                  <div class="button">
                     <input type="button" id="backBtn" value="취소" style="float: right"
                        onclick="location.href='/mypageboard.mypageboardController'">
                     <input type="submit" id="okBtn" value="확인">
                     <input type="button" id="updateBtn" value="수정">
                  </div>

               </div>
            </div>
         </div>
      </div>
      <input type="hidden" name="id" value="${loggedID}">
   </form>

   <script>
      $(function () {
         $("#okBtn").css("display", "none");
         $("#introduce2").css("display", "none");
      })

   </script>

   <script>
      $("#introduceMyslef2").keyup(function (e) {
         var introduceMyslef = $(this).val();
         $("#counter").html(introduceMyslef.length + '자 / 180자');

         if (introduceMyslef.length > 180) {
            $(this).val(introduceMyslef.substring(0, 180));
            $("#counter").html("180자 / 180자");
         }
      });

      $("#updateBtn").on("click", function () {
         $("input").removeAttr("readonly");
         $("textarea").removeAttr("readonly");

         $("#introduce1").css("display", "none");
         $("#introduce2").css("display", "");

         $("#updateBtn").css("display", "none");
         $("#okBtn").css("display", "");
      })

     
		let ok = document.getElementById("okBtn");
		ok.onsubmit = function() {
    	  let regexName = /^[가-힣]{2,5}$/;
			let nickname = $("#nickname").val();
			let reusultNickname = regexNickname.test(nickname);
			if (!resultName) {
				alert("닉네임은 2~10자의 영문, 소문자, 대문자만 사용 가능합니다.");
				return false;
			}
		}
   </script>
</body>
</html>