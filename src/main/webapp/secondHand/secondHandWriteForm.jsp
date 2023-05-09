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
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>
	
	<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
	<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
	integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
	
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e7252ffaa17ffd29198c0279af09c9f9&libraries=services"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
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

.note-frame {
	max-width: 750px;
}

.p-0, #submit, #back {
	background-color: #1e3c3e;
}
</style>
</head>

<body>
<div class="container">
<c:import url="/board/topMenu.jsp"></c:import>
<div align="center">
	<img src="/image/shBanner_write.jpg">
</div>
	<form action="/insert.secondHand" method="post" id="insertForm">
		<table border="1" align="center">
			<tr>
				<th colspan="2">
					중고거래 게시판 글 작성하기
				</th>
			</tr>
			<tr>
				<td colspan="2"><input type="text" id="title" placeholder="제목"
					name="title" required maxlength="50"></td>
			</tr>
			<tr>
				<td colspan="2"><textarea name="contents" id="summernote"
						class="summernote" required maxlength="4000"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<div id="map" style="width: 100%; height: 250px;"></div>
				</td>
			</tr>
			<tr>
				<td><input type="text" placeholder="주소입력" id="target" required>
					<button type="button" class="btn btn-primary p-0" id="search">검색</button> 
					<input
					type="hidden" name="lat" value="위도" id="Lat" required> <input
					type="hidden" name="lng" value="경도" id="Lng" required></td>
				<td align="right">
					<button type="submit" id="submit" class="btn btn-primary p-0" disabled>작성하기</button>
					<button type="button" id="back" class="btn btn-primary p-0">목록으로</button>
				</td>
			</tr>
		</table>
	</form>
	<c:import url="/board/footer.jsp"></c:import>
</div>
	<script>
		$("#back").on("click",function(){
			location.href="/selectBound.secondHand?currentPage=1";
		});
		$("#summernote").summernote(
				{
					height : 500, // 에디터 높이
					minHeight : null, // 최소 높이
					maxHeight : null, // 최대 높이
					focus : true, // 에디터 로딩후 포커스를 맞출지 여부
					lang : "ko-KR", // 한글 설정
					placeholder : '내용을 입력해주세요', //placeholder 설정
					disableDragAndDrop : true,
					toolbar : [ [ 'style', [ 'style' ] ],
							[ 'font', [ 'bold', 'underline', 'clear' ] ],
							[ 'fontname', [ 'fontname' ] ],
							[ 'color', [ 'color' ] ],
							[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
							[ 'table', [ 'table' ] ],
							[ 'insert', [ 'picture' ] ],
							[ 'view', [ 'fullscreen', 'codeview', 'help' ] ] ],
					callbacks : { //여기 부분이 이미지를 첨부하는 부분
						onImageUpload : function(files) {
							for (let i = 0; i < files.length; i++) {
								uploadImg(files[i], this);
								console.log(this);
							}
						}
					}
				});
		function uploadImg(img, summerNote) {
			data = new FormData();
			data.append("img", img);
			$.ajax({
				data : data,
				type : "POST",
				url : "/insertFile.secondHand",
				contentType : false,
				processData : false
			}).done(function(resp) {
				imgInfo = JSON.parse(resp);
				console.log("url : " + imgInfo[0]);
				console.log("oriName : " + imgInfo[1]);
				console.log("sysName : "+ imgInfo[2]);
				$(summerNote).summernote("insertImage", imgInfo[0]);
// 				server 저장소에 저장만 하고 DB에는 저장 안함
			});
		}
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		$("#search").on("click", function() {
			let target = $("#target").val();
			geocoder.addressSearch(target, function(result, status) {
			// 정상적으로 검색이 완료됐으면 
				if (status === kakao.maps.services.Status.OK) {
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					let Lat = coords.getLat();
					let Lng = coords.getLng();
					$("#Lat").val(Lat);
					$("#Lng").val(Lng);
					if ($("#Lat").val() != "위도"){
							$("#submit").removeAttr("disabled");
						}
					// 결과값으로 받은 위치를 마커로 표시합니다
					var marker = 
						new kakao.maps.Marker({
												map : map,
												position : coords
												});
					// 인포윈도우로 장소에 대한 설명을 표시합니다
					var infowindow = 
						new kakao.maps.InfoWindow({
							content : '<div style="width:150px;text-align:center;padding:6px 0;">만날위치</div>'
							});
					infowindow.open(map, marker);
					// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					map.setCenter(coords);
					}
				});
		});
		$("#insertForm").on("submit", function() {
			let titleLength = $("#title").val().trim().length;
			if (titleLength == 0) {
				alert("제목에는 공백을 넣을 수 없습니다.");
				return false;
			}
		});
	</script>
</body>

</html>