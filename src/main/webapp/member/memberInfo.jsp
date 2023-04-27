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
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
        <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    </head>
<style>
    *{
        font-family: 'Noto Sans KR', sans-serif; 
    }
    .container{
        margin-top: 70px;
    }
    h1,h2{
      text-align: center; 
      margin-bottom: 50px; 
    }
    .join-header{
        margin-top: 0; 
        margin-bottom: 10px; 
    }
    h2{
        font-size: small;
    }

    #idInput{
        width: calc(100%-120px);
    }
    #idCheck{
        position: absolute;
        right: 20px;
        top:0; 
        margin-top: 36px;
    }
/* 
    .btnsParent{
        display: flex;
        justify-content: center;

    } */

    .btnsParent button{
        margin: 10px;
    }

    #searchZipcode{
        position: absolute;
        right: 20px;
        top:0; 
        margin-top: 36px;
    }


    
</style>
<body>
    
    <form method="post" action="/update.member">
    <div class="container">
        <div class="row header">
            <div class="col-12">
                <h1 class="join-header text-center">개인정보수정</h1>
                <h2 class="text-center">LetStudy에 오신 걸 환영합니다.</h2>
            
            </div>
        </div>
            <div class="row form-group">
                <div class="col-3"></div>
                <div class="col-6">
                    <label for="idInput">아이디*</label>
                    <input type="text" class="form-control" id="id" name="id" value="${myInfo.id}" readonly>
                </div>
                <div class="col-3"></div>
                
            </div> 

            <div class="row form-group">
                <div class="col-3"></div>
                <div class="col-6">
                    <label for="pwInput">비밀번호*</label>
                    <input type="password" class="form-control" id="pw" name="pw"  placeholder="비밀번호 입력 (문자, 숫자, 특수문자 포함 8~20자)" required>
                </div>
                <div class="col-3"></div>
            </div>     
            <div class="row form-group">
                <div class="col-3"></div>
                <div class="col-6">
                    <label for="pwCheckInput">비밀번호 확인*</label>
                    <input type="password" class="form-control" id="pwCheck" name="pwCheck" placeholder="비밀번호 재입력" required>
                    <div id="pwFeedback"></div>
                </div>
                <div class="col-3"></div>
            </div> 
            <div class="row form-group">
                <div class="col-3"></div>
                <div class="col-6">
                    <label for="nameInput">이름*</label>
                    <input type="name" class="form-control" id="name" name="name" value="${myInfo.name}" readonly>
                </div>
                <div class="col-3"></div>
            </div>
            <div class="row form-group">
                <div class="col-3">
                    
                </div>
                
                <div class="col-6">
                    <label for="birthInput" class="form-label">생년월일*</label>
                    <input type="text" class="form-control" id="birthYear" name="birthYear" value="${myInfo.birth_date}" readonly>
                </div>
               
                <div class="col-3">
                </div>
                
            </div>
            <div class="row form-group">
                <div class="col-3"></div>
                <div class="col-6">
                    <label for="nicknameInput">닉네임</label>
                    <input type="text" class="form-control" id="nickname" name="nickname" value="${myInfo.nickname}" placeholder="2~10글자" maxlength="10">
                </div>
                <div class="col-3"></div>
            </div>
            <div class="row form-group">
                <div class="col-3"></div>
                <div class="col-6">
                    <label for="contactInput">연락처*</label>
                    <input type="text" class="form-control" id="contact" name="contact" value="${myInfo.contact}" placeholder="휴대폰 번호 입력 ('-'제외 입력)" maxlength="11" required>
                </div>
                <div class="col-3"></div>
            </div>
            <div class="row form-group">
                <div class="col-3"></div>
                <div class="col-6">
                    <label for="emailInput">이메일*</label>
                    <input type="text" class="form-control" id="email" name="email" value="${myInfo.email }" required>
                </div>
                <div class="col-3"></div>
            </div>
            <div class="row form-group">
                <div class="col-3"></div>
                <div class="col-6">
                    <label for="zipcodeInput">우편번호</label>
                    <input type="text" class="form-control" id="zipcode" name="zipcode" value="${myInfo.zipcode }" readonly>
                    <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" id="searchZipcode">
                </div>
                <div class="col-3"></div>
            </div> 
            <div class="row form-group">
                <div class="col-3"></div>
                <div class="col-6">
                    <label for="roadAddressInput">도로명주소</label>
                    <input type="text" class="form-control" id="roadAddress" name="roadAddress" value="${myInfo.address1}">
                </div>
                <div class="col-3"></div>
            </div>  
            <div class="row form-group">
                <div class="col-3"></div>
                <div class="col-6">
                    <label for="detailAddressInput">상세주소</label>
                    <input type="text" class="form-control" id="detailAddress" name="detailAddress" value="${myInfo.address2}">
                </div>
                <div class="col-3"></div>
            </div>
            <div class="btnsParent text-center">
            <button type="submit" class="btn btn-primary" id="btnUpdat" >수정하기</button>
            <button type="button" class="btn btn-light" id="btnCancel">취소하기</button>
            </div>
        </form>
    </div>

    <script>
    $("#btnCancel").on("click",function(){
    	location.href="/myInfoSelect.member";
    }///////////////////////////취소 버트 누르면 마이페이지로 이동 수정하기

        var idValIdFlag = false;

        $("#idCheck").on("click",function(){
        
        window.open("/idCheck.member?id="+$("#id").val(),"","width=200px,height=200px"); 
        
        
        })

        $("#idInput").on("keyup",function(){
            idValIdFlag= false; 

        })

        let regexId = /^[a-z]+[a-z0-9]{6,20}$/;
        let regexPw =/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,20}$/; 
        let regexName = /^[가-힣]{2,5}$/; 
        let regexBirthYear = /^[12][0-9]{3}$/; 
        let regexBirthDay = /^[0-9]{2}$/; 
        let regexNickname = /^[a-zA-Z0-9가-힣]{2,10}$/; 
        let regexContact = /^(01[016789])([1-9]\d{2,3})\d{4}$/; 
        let regexEmail = /[a-zA-Z0-9._+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9.]+/; 

        $("#idCheck").on("click", function(){
            let id = $("id").val(); 
            let resultId = regexId.test(idInput);
            if (!resultId) {
                alert("아이디 양식이 다릅니다."); 
                return false; 
            } else {
                window.open("idCheck?id=" + document.getElementById("id").value,"??" ,"top=100px,left=100px,heigt=500px,width=800px")
            }
        })

        $("#pw").on("keyup", function(){
            if($("#pw").val() == $("#pwCheck").val()) {
                $("#pwFeedback").html("비밀번호가 일치합니다.").css({"color":"#fd1d1d"});
            } else {
                $("#pwFeedback").html("비밀번호가 일치하지 않습니다.").css({"color":"#fd1d1d"});
            }
        })

        $("#pwCheck").on("keyup",function(){
            if($("#pwCheck").val() == $("#pwCheck").val()) {
                $("#pwFeedback").html("비밀번호가 일치합니다.").css({"color":"#fd1d1d"});
            }else {
                $("#pwFeedback").html("비밀번호가 일치하지 않습니다.").css({"color":"#fd1d1d"}); 
            }
        })

        document.getElementById("searchZipcode").onclick = function() {
            new daum.Postcode({
        oncomplete: function(data) {
           document.getElementById("zipcodeInput").value = data.zonecode;
           document.getElementById("roadAddress").value =  data.address; 
        }
            }).open();

        }

        // 취소 버튼 누르면 전페이지로 
        // $("#btnCancel").on("click", function(){
        // })

       let joinMember = document.getElementById("joinmember");
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

        if(!resultId){
            alert("아이디 양식이 다릅니다.");
            return false; 
        }
        if(!resultPw){
            alert("비밀번호 양식이 다릅니다.");
            return false; 
        }
        if(!resultName){
            alert
        }

       } 


    </script>
    
</body>
</html>