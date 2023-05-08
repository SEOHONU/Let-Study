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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <style>
        * {
            box-sizing: border-box;
            border: 0px solid black;
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
        .btn {
            background-color: #1e3c3e;
        }
        #title {
        	background-color: #1e3c3e;
        	font-size: 18pt;
        	color: white;
        }
    </style>
</head>

<body>
    <div class="container">
    <c:import url="/board/topMenu.jsp"></c:import>
		<div align="center">
			<img src="/image/shBanner_main.jpg">
		</div>
        <div class="row">
            <div class="col-lg-2 d-none d-lg-block"></div>
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
                        <td colspan="3">
                            <textarea name="contents" id="summernote" class="summernote"
                                required>${dto.contents}</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" id="mapTd">
                            <div id="map" style="width: 100%; height: 350px;"></div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <c:if test="${dto.writer == loggedID}">
                                <button type="button" id="modify" class="btn btn-primary">수정하기</button>
                                <button type="button" id="modify" class="btn btn-primary"
                                    onclick="confirmDel()">삭제하기</button>
                            </c:if>
                            <button type="button" class="btn btn-primary"
                                onclick="location.href='/selectBound.secondHand?currentPage=${currentPage}'">목록으로</button>
                        </td>
                    </tr>
                </table>
            </form>
            <div class="col-lg-2 d-none d-lg-block"></div>
        </div>
        <hr>
        <div class="row">
            <div class="col-lg-2 d-none d-lg-block"></div>
            <form action="/insertComments.shComments" method="post" class="col-lg-8 col-12">
                <table border="1" align="center">
                    <tr>
                        <td colspan="2">${loggedID}<input type="hidden" name="writer" value="${loggedID}"> <input
                                type="hidden" name="seq" value="${dto.seq}"> <input type="hidden" name="currentPage"
                                value="${currentPage}">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="commentTd"><textarea name="contents" id="writeComment"
                                placeholder="댓글 내용을 작성해주세요" required></textarea></td>
                        <td align="right">
                            <button type="submit" id="modify" class="btn btn-primary writeComment p-0">댓글쓰기</button>
                        </td>
                    </tr>
                </table>
            </form>
            <div class="col-lg-2 d-none d-lg-block"></div>
        </div>
        <hr>
        <c:forEach var="i" items="${list}">
            <c:choose>
                <c:when test="${i.parent_seq != 0}">
                    <script>
                        console.log("i.parent_seq : " + ${ i.parent_seq });
                        var modForm = $("<form action='/modifyComments.shComments' class='col-lg-7 col-11'>");
                        modForm.onsubmit = "return confirm('답글을 수정하시겠습니까?')";
                        var hidden_currentPage = $("<input type='hidden' name='currentPage' value='${currentPage}'>");
                        var hidden_board_seq = $("<input type='hidden' name='board_seq' value='${dto.seq}'>");
                        var hidden_com_seq = $("<input type='hidden' name='com_seq' value='${i.com_seq}'>");

                        var table = $("<table border='1' align='center' class='comment'>");

                        var tr1 = $("<tr>");
                        var tr2 = $("<tr>");

                        var space1 = $("<div class='col-lg-2 d-none d-lg-block'>");
                        var space2 = $("<div class='col-lg-2 d-none d-lg-block'>");

                        var arrowSpace = $("<div class='col-1'>");
                        var icon = $("<i class='fa-solid fa-square-caret-down'></i>");
                        arrowSpace.append(icon);
                        var com_writer = "${i.com_writer}";
                        var td_writer = $("<td align='left'>");
                        td_writer.append(com_writer);
                        var td_date = $("<td align='right'>");
                        td_date.text("${i.detailDate}");

                        td_comment = $("<td align='left' class='commentTd'>");
                        textarea = $("<textarea name='contents' class='comment' readonly required>");
                        textarea.text("${i.com_contents}");
                        td_comment.append(textarea);

                        td_control = $("<td align='right'>");
                        if (${ i.com_writer == loggedID }) {
                        let modBtn = $("<button type='button' class='btn btn-primary modCom p-0'>수정</button>");
                        let delBtn = $("<button type='button' class='btn btn-primary delCom p-0' seq='${i.com_seq}'>삭제</button>");
                        td_control.append(modBtn);
                        td_control.append(delBtn);
                        }
                        modForm.append(hidden_currentPage);
                        modForm.append(hidden_board_seq);
                        modForm.append(hidden_com_seq);
                        modForm.append(table);

                        table.append(tr1);
                        table.append(tr2);

                        tr1.append(td_writer);
                        tr1.append(td_date);
                        tr2.append(td_comment);
                        tr2.append(td_control);
                        var targetDiv = $(document).find($("div[com_seq=${i.parent_seq}]"));
                        targetDiv.append(space1);
                        targetDiv.append(arrowSpace);
                        targetDiv.append(modForm);
                        targetDiv.append(space2);
                    </script>
                </c:when>
                <c:otherwise>
                    <div class="row" com_seq="${i.com_seq}">
                        <div class="col-lg-2 d-none d-lg-block"></div>
                        <form action="/modifyComments.shComments" class="col-lg-8 col-12"
                            onsubmit="return confirm('댓글을 수정하시겠습니까?')">
                            <input type="hidden" name="currentPage" value="${currentPage}">
                            <input type="hidden" name="board_seq" value="${dto.seq}">
                            <input type="hidden" name="com_seq" value="${i.com_seq}">
                            <table border="1" align="center" class="comment">
                                <tr>
                                    <td align="left">${i.com_writer}</td>
                                    <td align="right">${i.detailDate}</td>
                                </tr>
                                <tr>
                                    <td align="left" class="commentTd"><textarea name="contents" class="comment"
                                            readonly>${i.com_contents}</textarea>
                                    </td>
                                    <td align="right">
                                        <c:if test="${i.com_writer == loggedID}">
                                            <button type="button" class="btn btn-primary modCom p-0">수정</button>
                                            <button type="button" class="btn btn-primary delCom p-0" seq="${i.com_seq}">삭제</button>
                                        </c:if>
                                        <button type="button" class="btn btn-primary writeReplyBtn p-0" com_seq="${i.com_seq}">답글</button>
                                    </td>
                                </tr>
                            </table>
                        </form>
                        <div class="col-lg-2 d-none d-lg-block"></div>
                    </div>
                    <hr>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:import url="/board/footer.jsp"></c:import>
    </div>
    <script>
        $("#summernote").summernote({
            height: 500, // 에디터 높이
            minHeight: null, // 최소 높이
            maxHeight: null, // 최대 높이
            focus: true, // 에디터 로딩후 포커스를 맞출지 여부
            disableDragAndDrop: true,
            lang: "ko-KR", // 한글 설정
            placeholder: '내용을 입력하세요', //placeholder 설정
            toolbar: [
                ['style', ['style']],
                ['font', ['bold', 'underline', 'clear']],
                ['fontname', ['fontname']],
                ['color', ['color']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['table', ['table']],
                ['insert', ['picture']],
                ['view', ['fullscreen', 'codeview', 'help']]
            ],
            callbacks: { //여기 부분이 이미지를 첨부하는 부분
                onImageUpload: function (files) {
                    for (let i = 0; i < files.length; i++) {
                        uploadImg(files[i], this);
                        console.log(this);
                    }
                }
            }
        });
        $("#summernote").summernote("disable");

        function uploadImg(img, summerNote) {
            data = new FormData();
            data.append("img", img);
            $.ajax({
                data: data,
                type: "POST",
                url: "/insertFile.secondHand",
                contentType: false,
                processData: false
            }).done(function (url) {
                img = JSON.parse(url);
                console.log("url : " + url);
                console.log("img.url : " + img.url);
                $(summerNote).summernote("insertImage", img.url);
            });
        }
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(${ dto.lat }, ${ dto.lng }), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

        // 마커가 표시될 위치입니다 
        var markerPosition = new kakao.maps.LatLng(${ dto.lat }, ${ dto.lng });



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
            let com_seq = $(this).attr("com_seq");
            let replyForm = $("<form action='/insertReply.shReply'>");
            let replyWriter = $("<input type='text' value='${loggedID}' readonly>");
            let replyContents = $("<textarea class='writeReply' name='contents'>");
            let replySubmit = $("<button type='submit' class='btn btn-primary'>답글</button>");
            let replyCancle = $("<button type='button' class='btn btn-primary modCom'>취소</button>");
            let hidden_board_seq = $("<input type='hidden' name='board_seq'>");
            hidden_board_seq.val("${dto.seq}");
            let hidden_currentPage = $("<input type='hidden' name='currentPage'>");
            hidden_currentPage.val("${currentPage}");
            let hidden_com_seq = $("<input type='hidden' name='com_seq'>");
            hidden_com_seq.val(com_seq);
            replyCancle.on("click", function () {
                location.reload();
            });
            let table = $("<table border='1' align='center'>");
            let tr1 = $("<tr>");
            let tr2 = $("<tr>");
            let td1 = $("<td colspan='2'>");
            let td2 = $("<td class='replyTd'>");
            let td3 = $("<td align='right'>");
            tr1.append(td1);
            tr1.append(hidden_com_seq);
            tr1.append(hidden_board_seq);
            tr1.append(hidden_currentPage);

            tr2.append(td2);
            tr2.append(td3);
            table.append(tr1);
            table.append(tr2);
            td1.append(replyWriter);
            td2.append(replyContents);
            td3.append(replySubmit);
            td3.append(replyCancle);
            replyForm.append(table);
            $(this).closest($(".comment")).after(replyForm);
            $(this).hide();
        });
        function confirmDel() {
            if (confirm("정말 ${dto.title} 글을 삭제하시겠습니까?")); {
                alert("삭제 완료되었습니다");
                location.href = "/deleteContents.secondHand?seq=${dto.seq}&currentPage=${currentPage}";
            }
        }
        $(".delCom").on("click", function () {
            let seq = $(this).attr("seq");
            if (confirm("댓글을 삭제하시겠습니까?")) {
                alert("삭제 완료되었습니다.");
                location.href = "/deleteComments.shComments?com_seq=" + seq +
                    "&currentPage=${currentPage}&board_seq=${dto.seq}";
            }
        });
        $(".modCom").on("click", function () {
            $(this).parent().prev().find($(".comment")).removeAttr("readonly");
            let submit = $("<button type='submit' class='btn btn-primary'>수정하기</button>");
            let cancle = $("<button type='button' class='btn btn-primary'>취소</button>");
            cancle.on("click", function () {
                location.reload();
            })
            let target = $(this).closest($("td"));
            $(this).next().next().hide();
            $(this).next().hide();
            $(this).hide();
            target.append(submit);
            target.append(cancle);
        })
        $("#modify").on("click", function () {
        	$("#title").removeAttr("readonly");
            $("#summernote").summernote("enable");	
            marker.setMap(null);
            infowindow.setMap(null);
            let searchText = $("<input type='text' placeholder='주소를 입력하세요' id='target'>");
            let searchBtn = $("<button type='button' id='search' class='btn btn-primary'>검색</button>");
            let cancleBtn = $("<button type='button' id='cancle' class='btn btn-primary'>취소</button>");
            let submit = $("<button type='submit' id='submit' class='btn btn-primary' disabled>수정완료</button>");
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