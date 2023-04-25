<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.js"></script>
    <style>
        * {
            box-sizing: border-box;
        }

        div {
            border: 1px solid black;
            position: relative;
        }

        #studyprint {
            margin-top: 12px;
            margin-bottom: 12px;
            border-radius: 100%;
        }

        .studyguestprint {
            margin-top: 12px;
            margin-bottom: 12px;
            border-radius: 100%;
        }

        .ratio {
            padding: 0px;
            position: relative;
            overflow: hidden;
        }
        .header{
            position: relative;
        }
        .navi {
            position:sticky;
            top: 0;
            background-color: white;
            z-index: 999;
        }
        .imgs{
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        #studybtnbox {
            height: 100%;
            padding-top: 40px;
            padding-bottom: 40px;
        }

        #applybox {
            overflow: auto;
        }

        #applybox::-webkit-scrollbar {
            display: none;
        }

        #applybox>div {
            height: 30%;
        }

        .nicknamebox {
            overflow: hidden;
        }

        #btnbox {
            text-align: right;
        }

        #replyfont {
            font-weight: 900;
        }

        #replywritebox {
            position: relative;
        }

        #replytext {
            padding-right: 90px;
            min-height: 80px;
        }

        #replywritebtn {
            position: absolute;
            right: 5px;
            bottom: 5px;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="row navi">
            <div class="col-12">
                <div class="row">

                    <div class="col-6 col-lg-2 order-2 order-lg-first">
                        logo
                    </div>
                    <div class="col-lg-4 d-none d-lg-block order-lg-1">
                        여백
                    </div>
                    <div class="col-4 d-block d-lg-none order-1">
                        <div class="row">
                            <div class="col-6">
                                <div class="row">
                                    <div class="col-12">
                                        네비햄버거
                                    </div>
                                    <div class="col-12">회원가입</div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="row">
                                    <div class="col-12 subsearch">검색</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-1 d-none d-lg-block order-lg-2">
                        <button type="button" class="btn btn-primary btn-lg">hi</button>
                    </div>
                    <div class="col-lg-1 d-none d-lg-block order-lg-3">
                        <button type="button" class="btn btn-primary btn-lg">hi</button>
                    </div>
                    <div class="col-lg-1 d-none d-lg-block order-lg-4">
                        <button type="button" class="btn btn-primary btn-lg">hi</button>
                    </div>
                    <div class="col-lg-1 d-none d-lg-block order-lg-5">
                        <button type="button" class="btn btn-primary btn-lg">hi</button>
                    </div>
                    <div class="col-lg-2 d-none d-lg-block  order-lg-last">
                        ㅎㅇ
                    </div>
                    <div class="col-2 d-block d-lg-none order-last">
                        <div class="row">
                            <div class="col-12">공백</div>
                            <div class="col-12">로그인</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <form action="/insert.studyboard" method="post" id="insertForm">
        	<div class="row header">
            	<div class="col-12">
                	<div class="row">
                    	<div class="col-2">
                        	<div class="ratio ratio-1x1" id="studyprint">
                            	<img src="행복해요.gif" class="imgs">
                        	</div>
                    	</div>
                    	<div class="col-10">
                        	<div id="studybtnbox">
                            	<h3 contenteditable="true" id="opentitle">스터디 이름</h3>
                            	<input type="hidden" name="title" id="hiddentitle">
                            	<div contenteditable="true" id="opencontents"></div>
                            	<input type="hidden" name="contents" id="hiddencontents">
                        	</div>
                    	</div>
                	</div>
            	</div>
        	</div>
        	<div class="row body">
            	<div class="col-3">
                	<div class="row">
                    	<div class="col-12">
                        	<div class="ratio ratio-1x1">지도</div>
                    	</div>
                	</div>
                	<div class="row">
                    	<div class="col-12">
                        	<input type="text">
                        	<button>여기</button>
                    	</div>
                	</div>
            	</div>
            	<div class="col-6">
            		상세 내역<br>
            		<div contenteditable="true" id="opendetailcontents"></div>
            	</div>
            	<input type="hidden" name="detailcontents" id="hiddendetailcontents">
            	<div class="col-3 p-0">
                	<div class="row m-0">
                    	<div class="col-12 ratio" style="--bs-aspect-ratio: 130%;">
                        	<div class="row m-0" id="applybox">
                        	</div>
                    	</div>
                	</div>
            	</div>
            	<div class="col-12" id="btnbox">
                	<button type="submit">작성 완료</button>
                	<a href="/select.studyboard?cpage=1"><button type="button">목록으로</button></a>
            	</div>
        	</div>
        </form>
        <div class="row footer">
            <div class="col-12">아래 대충 띄어놓기</div>
        </div>
    </div>
    <script>
    	$("#insertForm").on("submit",function(){
    		$("#hiddentitle").val($("#opentitle").html());
    		$("#hiddencontents").val($("#opencontents").html());
    		$("#hiddendetailcontents").val($("#opendetailcontents").html());
    	})
    </script>
</body>
</html>