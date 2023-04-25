<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>secondHandContents</title>
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
            border: 1px solid black;
        }

        table {
            width: 100%;
        }

        #contents,
        #title,
        #writeComment,
        .comment,
        .writeReply {
            width: 100%;
            resize: none;
        }

        .commentTd,
        .replyTd {
            width: 70%;
        }

        .writeReply {
            resize: none;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-lg-2 d-none d-lg-block">여백</div>
            <form action="/modifyContents.secondHand" class="col-lg-8 col-12"
                onsubmit="return confirm('${dto.title} 글을 수정하시겠습니까?')">
                <table align="center" width="100%">
                    <tr>
                        <td><input type="hidden" name="seq" value="${dto.seq}">
                            <input type="hidden" name="currentPage" value="${currentPage}">
                            ${dto.writer}
                        </td>
                        <td>${dto.formedDate}</td>
                        <td>${dto.view_count}</td>
                    </tr>
                    <tr>
                        <th colspan="3" align="center"><input type="text" value="${dto.title}" name="title" id="title"
                                readonly></th>
                    </tr>
                    <tr>
                        <td colspan="3"><textarea name="contents" id="contents" readonly>${dto.contents}</textarea></td>
                    </tr>
                    <tr>
                        <td colspan="3" id="mapTd">
                            <div id="map" style="width: 100%; height: 350px;"></div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <c:if test="${dto.writer == loginId}">
                                <input type="button" value="수정하기" id="modify">
                                <input type="button" value="삭제하기" onclick="confirmDel()">
                                <input type="button" value="판매완료" onclick="confirmSell()">
                            </c:if> <input type="button"
                                onclick="location.href='/selectBound.secondHand?currentPage=${currentPage}'" value="돌아가기">
                        </td>
                    </tr>
                </table>
            </form>
            <div class="col-lg-2 d-none d-lg-block">여백</div>
        </div>
        <hr>
        <div class="row">
            <div class="col-lg-2 d-none d-lg-block">여백</div>
            <form action="/insertComments.comments" method="post" class="col-lg-8 col-12">
                <table border="1" align="center">
                    <tr>
                        <td colspan="2">${loginId} <input type="hidden" name="writer" value="${loginId}"> <input
                                type="hidden" name="seq" value="${dto.seq}"> <input type="hidden" name="currentPage"
                                value="${currentPage}">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="commentTd"><textarea name="contents" id="writeComment"
                                placeholder="댓글 내용을 작성해주세요"></textarea></td>
                        <td align="right"><input type="submit" value="댓글쓰기" class="writeComment"></td>
                    </tr>
                </table>
            </form>
            <div class="col-lg-2 d-none d-lg-block">여백</div>
        </div>
        <hr>
        <c:forEach var="i" items="${list}">
            <div class="row">
                <div class="col-lg-2 d-none d-lg-block">여백</div>
                <form action="" class="col-lg-8 col-12">
                    <table border="1" align="center" class="comment">
                        <tr>
                            <td align="left">${i.com_writer}</td>
                            <td align="right">${i.detailDate}</td>
                        </tr>
                        <tr>
                            <td align="left" class="commentTd"><textarea name=""
                                    class="comment">${i.com_contents}</textarea></td>
                            <td align="right"><input type="button" value="수정"> <input type="button" value="삭제"> <input
                                    type="button" value="대댓글" class="writeReplyBtn"></td>
                        </tr>
                    </table>
                </form>
                <div class="col-lg-2 d-none d-lg-block">여백</div>
            </div>
            <hr>
        </c:forEach>
    </div>
    <script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(37.5582053468995, 127.027507006183), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

        // 마커가 표시될 위치입니다 
        var markerPosition = new kakao.maps.LatLng(37.5582053468995, 127.027507006183);

        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            position: markerPosition
        });
        // 마커가 지도 위에 표시되도록 설정합니다
        marker.setMap(map);

        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">만날위치</div>'
        });
        infowindow.open(map, marker);

        // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
        // marker.setMap(null);    
        $(".writeReplyBtn").on("click", function () {
            let replyForm = $("<form action='reply'>");
            let replyWriter = $("<input type='text' value='${loginId}' readonly>");
            let replyContents = $("<textarea class='writeReply'>");
            let replySubmit = $("<button>");
            let replyCancle = $("<input type='button' value='취소'>");
            replyCancle.on("click", function () {
                location.reload();
            })
            let table = $("<table border='1' align='center'>");
            let tr1 = $("<tr>");
            let tr2 = $("<tr>");
            let td1 = $("<td colspan='2'>");
            let td2 = $("<td class='replyTd'>");
            let td3 = $("<td align='right'>");
            tr1.append(td1);
            tr2.append(td2);
            tr2.append(td3);
            table.append(tr1);
            table.append(tr2);
            td1.append(replyWriter);
            td2.append(replyContents);
            replySubmit.text("대댓글쓰기");
            td3.append(replySubmit);
            td3.append(replyCancle);
            replyForm.append(table);
            $(this).closest($(".comment")).after(replyForm);
            $(this).hide();
        });
        function confirmDel() {
            if (confirm("정말 ${dto.title} 글을 삭제하시겠습니까?")); {
                alert("삭제 완료");
                location.href = "/deleteContents.secondHand?seq=${dto.seq}&currentPage=${currentPage}";
            }
        }
        function confirmSell() {
            if (confirm("${dto.title} 판매완료 처리 하시겠습니까?")); {
                alert("판매완료 처리 되었습니다");
            }
        }
        $("#modify").on("click", function () {
            marker.setMap(null);
            infowindow.setMap(null);
            $("#title").removeAttr("readonly");
            $("#contents").removeAttr("readonly");
            $("#title").focus();
            let searchText = $("<input type='text' placeholder='주소를 입력하세요' id='target'>");
            let searchBtn = $("<input type='button' id='search' value='검색'>");
            let cancleBtn = $("<input type='button' id='cancle' value='취소'>");
            let submit = $("<input type='submit' value='수정완료' id='submit' disabled>");
            let lat = $("<input type='hidden' name='lat' value='위도' id='Lat' required>");
            let lng = $("<input type='hidden' name='lng' value='경도' id='Lng' required>");
            cancleBtn.on("click", function () {
                location.reload();
            });
            $("#mapTd").append(searchText);
            $('#mapTd').append(searchBtn);
            $("#mapTd").append(cancleBtn);
            $("#mapTd").append(submit);
            $("#mapTd").append(lat);
            $("#mapTd").append(lng);
            $(this).hide();
        });
        $("#mapTd").on("click", "#search", function () {
            var geocoder = new kakao.maps.services.Geocoder();
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