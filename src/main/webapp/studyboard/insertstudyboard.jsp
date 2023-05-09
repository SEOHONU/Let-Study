<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.js"></script>
    <script src="https://kit.fontawesome.com/09115628a5.js" crossorigin="anonymous"></script>
	<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4d79f132798324278c93739a54ae859c&libraries=services"></script>
    <style>
        * {
            box-sizing: border-box;
        }

        div {
            <!--border: 1px solid black;-->
            position: relative;
        }
        
        .container{
        	border: 1px solid black;
        }
        
        .footer{
        	border: 1px solid black;
        }

        #studyprint {
            margin-top: 12px;
            margin-bottom: 12px;
            border-radius: 100%;
            border: 1px solid black;
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
            border: 1px solid black;
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
        
        .btns{
        	border: 1px solid black;
			background-color: white;
			border-radius: 5px;
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
        
        #opendetailcontents{
        	border: 1px solid black;
        }
        
        #opencontents{
        	border: 1px solid black;
        }
        
    </style>
</head>

<body>
    <div class="container">
        <c:import url="/board/topMenu.jsp"></c:import>
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
                        	<div class="ratio ratio-1x1">
                        		<div id="map" style="width:100%;height:100%"></div>
                        	</div>
                    	</div>
                	</div>
                	<div class="row">
                    	<div class="col-12">
                    		<input type="text" placeholder="주소입력" name="mapname" id="target" required>
                    		<input type="button" value="검색" id="mapsearch" class="btns">
                    		<input type="hidden" name="lat" value="위도" id="Lat" required>
                    		<input type="hidden" name="lng" value="경도" id="Lng" required>
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
                	<button type="submit" class="btns">작성 완료</button>
                	<a href="/select.studyboard?cpage=1"><button type="button" class="btns">목록으로</button></a>
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
    		if($("#hiddentitle").val()==""){
    			alert("제목을 입력해주세요.");
    			return false;
    		}
    		if($("#hiddencontents").val()==""){
    			alert("내용을 입력해주세요.");
    			return false;
    		}
    		if($("#hiddendetailcontents").val()==""){
    			alert("상세내용을 입력해주세요.");
    			return false;
    		}
    		if($("#Lat").val()=="위도"){
    			alert("위치를 지정해주세요.");
    			return false;
    		}
    	})
    </script>
    <script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

        // 지도를 생성합니다    
        var map = new kakao.maps.Map(mapContainer, mapOption);

        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();

        // 주소로 좌표를 검색합니다
        $("#mapsearch").on("click", function () {
            let target = $("#target").val();
            geocoder.addressSearch(target, function (result, status) {

                // 정상적으로 검색이 완료됐으면 
                if (status === kakao.maps.services.Status.OK) {
                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                    let Lat = coords.getLat();
                    let Lng = coords.getLng();
                    $("#Lat").val(Lat);
                    $("#Lng").val(Lng);
                    if ($("#Lat").val() != "위도") {
                        $("#submit").removeAttr("disabled");
                    }
                    // 결과값으로 받은 위치를 마커로 표시합니다
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: coords
                    });
                    // 인포윈도우로 장소에 대한 설명을 표시합니다
                    var infowindow = new kakao.maps.InfoWindow({
                        content: '<div style="width:150px;text-align:center;padding:6px 0;">만날위치</div>'
                    });
                    infowindow.open(map, marker);
                    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                    map.setCenter(coords);
                }
            });
        });
    </script>
</body>
</html>