<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>writeForm</title>
    <script src="https://code.jquery.com/jquery-3.6.4.js"
        integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e7252ffaa17ffd29198c0279af09c9f9&libraries=services"></script>
    <style>
        * {
            box-sizing: border-box;
        }

        #title {
            width: 100%;
        }

        #contents {
            resize: none;
        }
    </style>
</head>

<body>
    <form action="/insert.secondHand" method="post" id="insertForm">
        <table border="1" align="center">
            <tr>
                <th colspan="2">
                    중고거래 게시판 글 작성하기
                </th>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="text" id="title" placeholder="제목" name="title" required>
                </td>
            </tr>
            <tr>
                <td align="right" colspan="2">
                    <input type="file" id="file" name="file">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <textarea name="contents" id="contents" cols="100" rows="10" placeholder="내용" required></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div id="map" style="width:100%;height:250px;">
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" placeholder="주소입력" id="target" required>
                    <input type="button" value="검색" id="search">
                    <input type="hidden" name="lat" value="위도" id="Lat" required>
                    <input type="hidden" name="lng" value="경도" id="Lng" required>
                </td>
                <td align="right">
                    <input type="submit" value="작성하기" id="submit" disabled>
                    <input type="button" value="목록으로">
                </td>
            </tr>
        </table>
    </form>
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
        $("#search").on("click", function () {
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