<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.footer{
background-color : #254F4C;
}

.bold{
    font-size : 14px;
    font-weight: bold;
    color : white;
}

.medium{
 font-size : 13px;
 font-weight:500;
 color : white;
}

.copyright{
margin-top:5px;
font-size:11px;
font-weight:500;
color : white;
font-family:'Courier New', Courier, monospace;
font-style:oblique;
text-align: center;
}

</style>
</head>
<body>
 <div class="container footer">
        <div class="row" style="height:10px;"></div>
        <div class="row">
            <div class="col-1"></div>
            <div class="col-12 col-md-2" id="company_name">
                <span class="bold">상호명</span>
                <span class="medium">LetStudy</span>
            </div>
    
            <div class="col-12 col-md-2">
                <span class="bold">대표전화</span>
                <span class="medium">02-0000-0000</span>
            </div>
            <div class="col-12 col-md-4" id="address">
                <span class="bold">주소</span>
                <span class="medium">서울 중구 남대문로 120 대일빌딩 2층, 3층</span>
            </div>
            <div class="col-12 col-md-3" id="email">
                <span class="bold">이메일</span>
                <span class="medium">let_study@asd.com</span>
            </div>
        </div>
        <div class="row" style="height:10px;"></div>
    
        <div class="row">
            <div class="col-12 col-md-11 copyright">
                <span>@ kh정보교육원 All right reserved Designed by kh</span>
            </div>
    
        </div>
    </div></body>
</html>