<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html lang="en">

		<head>
			<meta charset="UTF-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>통합검색</title>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
				crossorigin="anonymous">
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
				crossorigin="anonymous"></script>
			<script src="https://code.jquery.com/jquery-3.6.4.js"
				integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/09115628a5.js" crossorigin="anonymous"></script>
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=06950442fcd14966ee4bef261d2ee0dd&libraries=services,clusterer,drawing"></script>
			<style>
				/* * {
                    box-sizing: border-box;
                }

                div {
                    border: 1px solid black;
                } */
				.container {
					position: relative;
				}

				.navi {
					position: sticky;
					top: 0;
					background-color: white;
					z-index: 999;
				}

				.map_wrap,
				.map_wrap * {
					margin: 0;
					padding: 0;
					font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
					font-size: 12px;
				}

				.map_wrap a,
				.map_wrap a:hover,
				.map_wrap a:active {
					color: #000;
					text-decoration: none;
				}

				.map_wrap {
					position: relative;
					width: 100%;
					height: 500px;
				}

				#menu_wrap {
					position: absolute;
					top: 0;
					left: 0;
					bottom: 0;
					width: 100%;
					margin: 0px;
					padding: 0px;
					overflow-y: auto;
					background: rgba(255, 255, 255, 0.7);
					z-index: 1;
					font-size: 12px;
				}

				.bg_white {
					background: #fff;
				}


				.banner {
					position: relative;
					height: 150px;
					background-color: #3c757980;
					border: 1px solid #ddd;
					border-radius: 20px;
					margin: 1px;
				}

				.bannersub {
					position: absolute;
					top: 0;
					left: 0;
					width: inherit;
					height: 100%;
					background-color: rgba(0, 0, 0, 0.5);
					z-index: 1;
					opacity: 0.7;
					border-radius: 20px;
				}


				#totalimg {
					border-radius: 20px;
					opacity: 0.5;
					position: relative;
					z-index: 0;
					display: block;
					width: 100%;
				}

				#totaltext {
					width: 100%;
					height: 100%;
					margin: 0px;
					text-align: center;
					color: white;
				}

				#menu_wrap hr {
					display: block;
					height: 1px;
					border: 0;
					border-top: 2px solid #5F5F5F;
					margin: 3px 0;
				}

				#menu_wrap .option {
					text-align: center;
				}

				#menu_wrap .option p {
					margin: 10px 0;
				}

				#menu_wrap .option button {
					margin-left: 5px;
				}

				#placesList li {
					list-style: none;
				}

				#placesList .item {
					position: relative;
					border-bottom: 1px solid #888;
					overflow: hidden;
					cursor: pointer;
					min-height: 65px;
				}

				#placesList .item span {
					display: block;
					margin-top: 4px;
				}

				#placesList .item h5,
				#placesList .item .info {
					text-overflow: ellipsis;
					overflow: hidden;
					white-space: nowrap;
				}

				#placesList .item .info {
					padding: 10px 0 10px 55px;
				}

				#placesList .info .gray {
					color: #8a8a8a;
				}

				#placesList .info .jibun {
					padding-left: 26px;
					background:
						url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;
				}

				#placesList .info .tel {
					color: #009900;
				}

				#placesList .item .markerbg {
					float: left;
					position: absolute;
					width: 36px;
					height: 37px;
					margin: 10px 0 0 10px;
					background:
						url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;
				}

				#placesList .item .marker_1 {
					background-position: 0 -10px;
				}

				#placesList .item .marker_2 {
					background-position: 0 -56px;
				}

				#placesList .item .marker_3 {
					background-position: 0 -102px
				}

				#placesList .item .marker_4 {
					background-position: 0 -148px;
				}

				#placesList .item .marker_5 {
					background-position: 0 -194px;
				}

				#placesList .item .marker_6 {
					background-position: 0 -240px;
				}

				#placesList .item .marker_7 {
					background-position: 0 -286px;
				}

				#placesList .item .marker_8 {
					background-position: 0 -332px;
				}

				#placesList .item .marker_9 {
					background-position: 0 -378px;
				}

				#placesList .item .marker_10 {
					background-position: 0 -423px;
				}

				#placesList .item .marker_11 {
					background-position: 0 -470px;
				}

				#placesList .item .marker_12 {
					background-position: 0 -516px;
				}

				#placesList .item .marker_13 {
					background-position: 0 -562px;
				}

				#placesList .item .marker_14 {
					background-position: 0 -608px;
				}

				#placesList .item .marker_15 {
					background-position: 0 -654px;
				}

				#pagination {
					margin: 10px auto;
					text-align: center;
				}

				#pagination a {
					display: inline-block;
					margin-right: 10px;
				}

				#pagination .on {
					font-weight: bold;
					cursor: default;
					color: #777;
				}
			</style>

		</head>



		<body>

			<div class="container">
				<c:import url="/board/topMenu.jsp"></c:import>
				<div class="row body">



					<div class="col-12 w-100 banner" style="padding:0px;"><img class="d-block" id="totalimg"
							src="/image/studytotal.jpg" style="object-fit: cover; height: 100%; width: 100%;">
						<div class="bannersub" style="height:100%; width:100%; background-color:black;">
							<h1 id="totaltext">통합검색</h1>
						</div>
					</div>
					<div class="col-12">
						<div class="row bodysub">

							<div class="col-2" style="background-color: #3c7579;">　</div>
							<div class="col-8">
								<div class="row">


									<div class="col-lg-12 d-none d-lg-block"
										style="text-align: center; background-color: rgb(30, 60, 62);">

										<form class="container-fluid" id="total_search"
											action="/allsearch.maincontroller">
											<div class="input-group" style="margin-top: 10px; margin-bottom: 10px;">
												<select name="select">
													<option value="제목">제목</option>
													<option value="내용">내용</option>
													<option value="작성자">작성자</option>
												</select> &nbsp; <input type="text" class="form-control"
													placeholder="통합검색창" aria-label="Username"
													aria-describedby="basic-addon1" name="title" value="${title}" />
												&nbsp;

												<button type="submit" class="btn btn-success"
													style="z-index: 0; background-color: rgb(60, 117, 121); border:0px;">검색</button>
											</div>
										</form>
									</div>
									<div class="col-12" style="text-align: center; background-color: #a0cbce;">　</div>


									<div class="col-12">
										중고책
										<div class="row bodysubstudy">
											<c:choose>
												<c:when test="${sdto.size()>0}">
													<c:forEach var="second" items="${sdto}" begin="0" end="3">
														<div class="col-6 d-none d-lg-block">
															<a
																href="/secondHandBoardContents.secondHand?seq=${second.seq}&currentPage=${cpage}">
																<div class="card" style="max-width: 540px;">
																	<div class="row g-0">
																		<div class="col-md-4" style="line-height:128px">
																			<img src="/image/다운로드.jpg"
																				class="img-fluid rounded-start"
																				alt="...">
																		</div>
																		<div class="col-md-8">
																			<div class="card-body">
																				<h5 class="card-title">${second.title}
																				</h5>
																				<p class="card-text">${second.writer}
																				</p>
																				<p class="card-text">
																					<small
																						class="text-body-secondary">${second.contents}</small>
																				</p>
																			</div>
																		</div>
																	</div>
																</div>
															</a>
														</div>
													</c:forEach>
													<div class="col-12" style="text-align: right;">
														<c:choose>
															<c:when test="${select eq '제목'}">
																<a
																	href="/searchSecondHand.secondHand?option=title&searchText=${title}&currentPage=${cpage}">
																	더보기</a>
															</c:when>
															<c:when test="${select eq '내용'}">
																<script>
																	alert("내용으로는 찾을 수 없습니다.")
																</script>
															</c:when>
															<c:otherwise>
																<a
																	href="/searchSecondHand.secondHand?option=writer&searchText=${title}&currentPage=${cpage}">
																	더보기</a>
															</c:otherwise>
														</c:choose>
													</div>
												</c:when>
												<c:otherwise>
													<div class="col-12">검색한 결과가 없습니다.</div>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
									<div class="col12" style="text-align: center; background-color: #a0cbce;">　</div>


									<div class="col-12">
										자유게시판
										<div class="row bodysubstudy">
											<c:choose>
												<c:when test="${fdto.size()>0}">
													<div class="col-9">제목</div>
													<div class="col-3">작성자</div>
													<c:forEach var="free" items="${fdto}" begin="0" end="5">
														<div class="col-9">
															<a
																href="/detail.freeBoard?seq=${free.seq}">${free.title}</a>
														</div>
														<div class="col-3">
															<a
																href="/detail.freeBoard?seq=${free.seq}">${free.writer}</a>
														</div>
													</c:forEach>
										</div>
									</div>
									<div class="col-12" style="text-align: right;">

										<c:choose>
											<c:when test="${select eq '제목'}">
												<a
													href="/searchByOption.freeBoard?optionValue=제목&searchValue=${title}&currentPage=${cpage}">
													더보기</a>
											</c:when>
											<c:when test="${select eq '작성자'}">
												<a
													href="/searchByOption.freeBoard?optionValue=닉네임&searchValue=${title}&currentPage=${cpage}">
													더보기</a>
											</c:when>
											<c:otherwise>
												<a
													href="/searchByOption.freeBoard?optionValue=내용&searchValue=${title}&currentPage=${cpage}">
													더보기</a>
											</c:otherwise>
										</c:choose>


									</div>
									</c:when>
									<c:otherwise>
										<div class="col-12">검색한 결과가 없습니다.</div>
									</c:otherwise>
									</c:choose>
									<div class="col-12" style="text-align: center; background-color: #a0cbce;">　</div>
									<div class="col-12 maptotal" style="text-align: center; padding: 0px">
										<div class="row map_wrap" style="margin: 0px;">
											<div class="col-7 mapsize" style="padding: 0px;">
												<div id="map"
													style="width: 100%; height: 100%; position: relative; overflow: hidden;">
												</div>
											</div>

											<div class="col-5 placelist" style="position: relative;">
												<div id="menu_wrap" class="bg_white">
													<div class="option">
														<div>
															<form onsubmit="searchPlaces(); return false;">
																<input type="hidden" value="${title}스터디카페" id="keyword"
																	size="15" readonly>
															</form>
														</div>
													</div>
													<ul id="placesList"></ul>
													<div id="pagination"></div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							
						</div>
						
					</div>
					<div class="col-2" style="background-color: #3c7579;">　</div>
				</div>
				<c:import url="/board/footer.jsp"></c:import>
			</div>
		</body>
		<script>

			$(window).on("load", function () {
				$(".btn-success").click(function () {
					const targetForm = $(this).closest("form");
					var login = '<c:out value="${loggedID}"/>';
					const inputText = targetForm.find(".form-control");
					if (login != "") { //성공
						if (inputText.val() == "") {
							alert("검색어를 입력해주세요");
							return;
						}
						targetForm.submit();
					} else {
						alert("로그인이 필요합니다");
					}
				});
			});

			$(window).resize(function () {
				$(".mapsize").height($(".mapsize").width());
				$(".placelist").height($(".mapsize").width());
				$(".maptotal").height($(".mapsize").width());
				$(".map_wrap").height($(".mapsize").width());
				var bannerWidth = $(".banner").width();
				var bannerHeight = bannerWidth * 0.15;
				$(".banner").height(bannerHeight);
				$("#totaltext").css("line-height", bannerHeight + "px");
			});

			$(document).ready(function () {
				$(".mapsize").height($(".mapsize").width());
				$(".placelist").height($(".mapsize").width());
				$(".maptotal").height($(".mapsize").width());
				$(".map_wrap").height($(".mapsize").width());
				var bannerWidth = $(".banner").width();
				var bannerHeight = bannerWidth * 0.15;
				$(".banner").height(bannerHeight);
				$("#totaltext").css("line-height", bannerHeight + "px");
			});
		</script>

		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=06950442fcd14966ee4bef261d2ee0dd&libraries=services"></script>
		<script>
			// 마커를 담을 배열입니다
			var markers = [];

			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
					level: 3
					// 지도의 확대 레벨
				};

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);

			// 장소 검색 객체를 생성합니다
			var ps = new kakao.maps.services.Places();

			// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				zIndex: 1
			});

			// 키워드로 장소를 검색합니다
			searchPlaces();

			// 키워드 검색을 요청하는 함수입니다
			function searchPlaces() {

				var keyword = document.getElementById('keyword').value;

				// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
				ps.keywordSearch(keyword, placesSearchCB);
			}

			// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
			function placesSearchCB(data, status, pagination) {
				if (status === kakao.maps.services.Status.OK) {

					// 정상적으로 검색이 완료됐으면
					// 검색 목록과 마커를 표출합니다
					displayPlaces(data);

					// 페이지 번호를 표출합니다
					displayPagination(pagination);

				} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

					$(".placelist").html('검색 결과가 존재하지 않습니다.');

				}
			}

			// 검색 결과 목록과 마커를 표출하는 함수입니다
			function displayPlaces(places) {

				var listEl = document.getElementById('placesList'), menuEl = document
					.getElementById('menu_wrap'), fragment = document
						.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

				// 검색 결과 목록에 추가된 항목들을 제거합니다
				removeAllChildNods(listEl);

				// 지도에 표시되고 있는 마커를 제거합니다
				removeMarker();

				for (var i = 0; i < places.length; i++) {

					// 마커를 생성하고 지도에 표시합니다
					var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x), marker = addMarker(
						placePosition, i), itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

					// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
					// LatLngBounds 객체에 좌표를 추가합니다
					bounds.extend(placePosition);

					// 마커와 검색결과 항목에 onclick 했을때
					// 해당 장소에 인포윈도우에 장소명을 표시합니다
					// onclick 했을 때는 인포윈도우를 닫습니다
					(function (marker, title) {
						kakao.maps.event.addListener(marker, 'onclick', function () {
							displayInfowindow(marker, title);
						});

						kakao.maps.event.addListener(marker, 'onclick', function () {
							infowindow.close();
						});

						itemEl.onmouseover = function () {
							displayInfowindow(marker, title);
						};

						itemEl.onmouseout = function () {
							infowindow.close();
						};
					})(marker, places[i].place_name);

					fragment.appendChild(itemEl);
				}

				// 검색결과 항목들을 검색결과 목록 Element에 추가합니다
				listEl.appendChild(fragment);
				menuEl.scrollTop = 0;

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				map.setBounds(bounds);
			}

			// 검색결과 항목을 Element로 반환하는 함수입니다
			function getListItem(index, places) {

				var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
					+ (index + 1)
					+ '"></span>'
					+ '<div class="info">'
					+ '   <h5>'
					+ places.place_name + '</h5>';

				if (places.road_address_name) {
					itemStr += '    <span>' + places.road_address_name + '</span>'
						+ '   <span class="jibun gray">' + places.address_name
						+ '</span>';
				} else {
					itemStr += '    <span>' + places.address_name + '</span>';
				}

				itemStr += '  <span class="tel">' + places.phone + '</span>' + '</div>';

				el.innerHTML = itemStr;
				el.className = 'item';

				return el;
			}

			// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
			function addMarker(position, idx, title) {
				var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
					imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
					imgOptions = {
						spriteSize: new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
						spriteOrigin: new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
						offset: new kakao.maps.Point(13, 37)
						// 마커 좌표에 일치시킬 이미지 내에서의 좌표
					}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
						imgOptions), marker = new kakao.maps.Marker({
							position: position, // 마커의 위치
							image: markerImage
						});

				marker.setMap(map); // 지도 위에 마커를 표출합니다
				markers.push(marker); // 배열에 생성된 마커를 추가합니다

				return marker;
			}

			// 지도 위에 표시되고 있는 마커를 모두 제거합니다
			function removeMarker() {
				for (var i = 0; i < markers.length; i++) {
					markers[i].setMap(null);
				}
				markers = [];
			}

			// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
			function displayPagination(pagination) {
				var paginationEl = document.getElementById('pagination'), fragment = document
					.createDocumentFragment(), i;

				// 기존에 추가된 페이지번호를 삭제합니다
				while (paginationEl.hasChildNodes()) {
					paginationEl.removeChild(paginationEl.lastChild);
				}

				for (i = 1; i <= pagination.last; i++) {
					var el = document.createElement('a');
					el.href = "#";
					el.innerHTML = i;

					if (i === pagination.current) {
						el.className = 'on';
					} else {
						el.onclick = (function (i) {
							return function () {
								pagination.gotoPage(i);
							}
						})(i);
					}

					fragment.appendChild(el);
				}
				paginationEl.appendChild(fragment);
			}

			// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
			// 인포윈도우에 장소명을 표시합니다
			function displayInfowindow(marker, title) {
				var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
				infowindow.setContent(content);
				infowindow.open(map, marker);
			}

			// 검색결과 목록의 자식 Element를 제거하는 함수입니다
			function removeAllChildNods(el) {
				while (el.hasChildNodes()) {
					el.removeChild(el.lastChild);
				}
			}
		</script>

		</html>