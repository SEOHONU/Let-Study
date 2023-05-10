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
    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4d79f132798324278c93739a54ae859c&libraries=services"></script>
</head>
<body style="background-color : #f3f3f3">

	<c:choose>
		<c:when test="${dto.writer == loggedID}">
			<style>
        * {
            box-sizing: border-box;
        }

        div {
            position: relative;
            word-break: break-word;
        }

        #studyprint {
        	border: 1px solid black;
            margin-top: 12px;
            margin-bottom: 12px;
            border-radius: 100%;
        }

        .studyguestprint {
        	border: 1px solid black;
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
            background-color: white;
        }
        .body{
        	background-color: white;
        }
        .body2{
        	background-color: white;
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
        	border: 1px solid black;
            overflow: auto;
        }

        #applybox::-webkit-scrollbar {
            display: none;
        }

        .applybtnyorn{
        	position: absolute;
        	bottom: 3%;
        	right: 1%;
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
        	border: 1px solid black;
            padding-right: 90px;
            min-height: 80px;
            max-height: 80px;
            overflow: auto;
        }
        
        #replytext::-webkit-scrollbar {
  			display: none;
		}

        #replywritebtn {
            position: absolute;
            right: 5px;
            bottom: 5px;
        }
        
        .btns{
			background-color: white;
			border-radius: 5px;
		}
		#applyguestcount{
			display:inline-block;
		}
		.applysolobox{
			height: 30%;
			position: relative;
			background-color: grey;
		}
		.studyapplybox{
			border: 1px solid black;
		}
		.nicknamebox{
			border: 1px solid black;
		}
    </style>
    <script>
    	$(function(){
    		$("#acceptbtn").css("display","none");
    		$("#cancelbtn").css("display","none");
    		$(".replyacceptbtn").css("display","none");
    		$(".replycancelbtn").css("display","none");
    		$("#update_map_search").css("display","none");
    	})
    </script>
    <div class="container">
        <c:import url="/board/topMenu.jsp"></c:import>
        <form action="/update.studyboard" method="post" id="updateForm">
        	<div class="row header">
            	<div class="col-12">
                	<div class="row">
                    	<div class="col-2">
                        	<div class="ratio ratio-1x1" id="studyprint">
                        	</div>
                    	</div>
                    	<div class="col-10">
                        	<div id="studybtnbox">
                            	<h3 id="title">${dto.title}</h3><br>
                            	<input type="hidden" name="title" id="hiddentitle">
                            	<div id="contents">${dto.contents}</div>
                            	<input type="hidden" name="contents" id="hiddencontents">
                           		<div id="writer">작성자 : ${dto.writer}</div>
                        	</div>
                    	</div>
                	</div>
            	</div>
        	</div>
        	<br>
        	<div class="row body">
            	<div class="col-3">
                	<div class="row">
                		<div class="col-12">
                    		<div class="ratio ratio-1x1">
                    			<div id="map" style="width:100%;height:100%"></div>
                    		</div>
                    	</div>
                	</div>
                	<div class="row" id="update_map_search">
                		<div class="col-12">
                    		<input type="text" placeholder="주소입력" name="mapname" value="${dto.mapname}" id="target" required>
                    		<input type="button" class="btns" value="검색" id="mapsearch">
                    		<input type="hidden" name="lat" value="${dto.lat}" id="Lat" required>
                    		<input type="hidden" name="lng" value="${dto.lng}" id="Lng" required>
                    	</div>
                	</div>
            	</div>
            	<div class="col-6">상세 내역<br>
            		참여 인원수 : <div id="applyguestcount">${guestcount}</div>/
            		<input type="text" value="${dto.guestcount}" id="guestcount" name="guestcount" readonly>
            		<div id="detailcontents">${dto.detailcontents}</div>
            		<input type="hidden" name="detailcontents" id="hiddendetailcontents">
            	</div>
            	<div class="col-3 p-0">
                	<div class="row m-0">
                   		<div class="col-12 ratio" style="--bs-aspect-ratio: 130%;">
                        	<div class="row m-0 p-0" id="applybox">
                        		<c:forEach var="sbm" items="${sbmlist}">
                        			<div class="col-12 p-0 applysolobox">
                        				<div>${sbm.id}</div>
                        				<div class="applybtnyorn" align="right">
                        					<button type="button" class="applyacceptbtn btns">수락</button>
                        					<input type="hidden" value="${sbm.yorN}">
                        					<button type="button" class="applycancelbtn btns">거절</button>
                        				</div>
                        			</div>
                        		</c:forEach>
                        	</div>
                    	</div>
                	</div>
            	</div>
            	<div class="col-12">
                	<div class="row">
                    	<div class="col-1 p-0 m-0">스터디 멤버</div>
                    	<div class="col-1 studyapplybox">
                        	<div class="ratio ratio-1x1 studyguestprint"></div>
                        	<div class="d-none d-md-block" align="center">host</div>
                        	<div align="center" class="nicknamebox">${dto.writer}</div>
                    	</div>
                    	<c:forEach var="cksbm" items="${cksbmlist}">
                    		<div class="col-1 studyapplybox">
                        	<div class="ratio ratio-1x1 studyguestprint"></div>
                        	<br>
                        	<div class="d-none d-md-block nicknamebox" align="center">${cksbm.id}</div>
                    	</div>
                    	</c:forEach>
                	</div>
            	</div>
            	<div class="col-12" id="btnbox">
            		<button type="submit" id="acceptbtn" class="btns">확인</button>
            		<button type="button" id="cancelbtn" class="btns">취소</button>
                	<button type="button" id="updatebtn" class="btns">수정하기</button>
                	<button type="button" id="deletebtn" class="btns">삭제하기</button>
                	<a href="/select.studyboard?cpage=${cpage}"><button type="button" class="btns">목록으로</button></a>
            	</div>
        	</div>
        	<input type="hidden" name="cpage" value="${cpage}">
        	<input type="hidden" name="writer" value="${dto.writer}">
        	<input type="hidden" name="seq" value="${dto.seq}">
        </form>
        <br>
        <form action="/insert.studyreply" method="post" id="replyForm">
        	<div class="row body2">
        		<div class="col-12" id="replyfont">
                	댓글
            	</div>
            	<hr>
            	<div class="col-12">
                	<div class="row" id="allreplybox">
                    	<c:forEach var="i" items="${replylist}">
                			<div class="col-12">
                				<div>
                					작성자 : ${i.writer}
                				</div>
                				<div>
                					${i.contents}
                				</div>
                				<input type="hidden" value="${i.seq}">
                				<c:if test="${i.writer == loggedID}">
                					<div align="right">
                						<button type="button" class="btns replyacceptbtn">확인</button>
                						<button type="button" class="btns replycancelbtn">취소</button>
                						<button type="button" class="btns replyupdatebtn">수정하기</button>
                						<button type="button" class="btns replydeletebtn">삭제하기</button>
                					</div>
                				</c:if>
                			</div>
                			<hr>
                		</c:forEach>
                	</div>
            	</div>
            	<div class="col-12 p-0" id="replywritebox">
                	<div contenteditable="true" id="replytext"></div>
                	<input type="hidden" name="studyreplycontents" id="studyreplycontents">
                	<button type="submit" id="replywritebtn" class="btns">작성하기</button>
            	</div>
        	</div>
        	<input type="hidden" name="studyreplywriter" value="213">
        	<input type="hidden" name="cpage" value="${cpage}">
        	<input type="hidden" name="parent_seq" value="${dto.seq}">
        </form>
        <br>
        <div class="row footer">
        <c:import url="/board/footer.jsp"></c:import>
        </div>
    </div>
    <script>
    	let regexguestcount = /^[1]{0,1}[0-9]{1}$/;
    	$("#applybox").on("click",".applyacceptbtn",function(){
    		$.ajax({
    			url:"/update.studyapply",
    			data:{
    				board_seq:${dto.seq},
    				id:$(this).next().val(),
    				cpage:${cpage}
    			}
    		}).done(function(){
    			location.href="/inner.studyboard?cpage="+${cpage}+"&seq="+${dto.seq};
    		})
    	})
    	$("#applybox").on("click",".applycancelbtn",function(){
    		$.ajax({
    			url:"/delete.studyapply",
    			data:{
    				board_seq:${dto.seq},
    				id:$(this).prev().val()
    			}
    		}).done(function(){
    			location.href="/inner.studyboard?cpage="+${cpage}+"&seq="+${dto.seq};
    		})
    	})
    	$("#deletebtn").on("click",function(){
    		if(confirm("게시글을 삭제 하시겠습니까?")){
    			location.href="/delete.studyboard?cpage="+${cpage}+"&seq="+${dto.seq};
    		}
    	})
    	$("#updatebtn").on("click",function(){
    		$("#updatebtn").css("display","none");
    		$("#deletebtn").css("display","none");
    		$("#acceptbtn").css("display","");
    		$("#cancelbtn").css("display","");
    		$("#writer").css("display","none");
    		$("#guestcount").removeAttr("readonly");
    		$("#title").attr("contenteditable","true");
    		$("#contents").attr("contenteditable","true");
    		$("#detailcontents").attr("contenteditable","true");
    		$("#update_map_search").css("display","");
    	})
    	$("#cancelbtn").on("click",function(){
    		if(confirm("게시글 수정을 취소하시겠습니까?")){
    			location.reload();
    		}
    	})
    	$("#updateForm").on("submit",function(){
    		let guestcount = $("#guestcount").val();
            let resultguestcount = regexguestcount.test(guestcount);
    		$("#hiddentitle").val($("#title").html());
    		$("#hiddencontents").val($("#contents").html());
    		$("#hiddendetailcontents").val($("#detailcontents").html());
    		if(!resultguestcount){
    			alert("참여인원수를 다시확인해주세요.");
                return false;
    		}
    	})
    	$("#replyForm").on("submit",function(){
    		$("#studyreplycontents").val($("#replytext").html());
    	})
    	$("#allreplybox").on("click",".replydeletebtn",function(){
    		if(confirm("댓글을 삭제하시겠습니까?")){
    			let seq = $(this).parent().prev().val();
    			console.log(seq);
    			location.href="/delete.studyreply?cpage="+${cpage}+"&parent_seq="+${dto.seq}+"&seq="+seq;
    		}
    	})
    	$("#allreplybox").on("click",".replyupdatebtn",function(){
    		$(this).css("display","none");
    		$(this).prev().css("display","");
    		$(this).prev().prev().css("display","");
    		$(".replyupdatebtn").attr("disabled","true");
    		$(".replydeletebtn").attr("disabled","true");
    		$(this).parent().prev().prev().attr("contenteditable","true");
    	})
    	$("#allreplybox").on("click",".replyacceptbtn",function(){
    		$.ajax({
    			url:"/update.studyreply",
    			type:"post",
    			data:{
    				seq:$(this).parent().prev().val(),
    				contents:$(this).parent().prev().prev().html()
    			}
    		}).done(function(){
    			location.reload();
    		})
    	})
    	$("#allreplybox").on("click",".replycancelbtn",function(){
    		if(confirm("댓글 수정을 취소하시겠습니까?")){
    			location.reload();
    		}
    	})
    </script>
    <script>
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
    </script>
    <script>
    	$("#target").on("click",function(){
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
    	})
    </script>
		</c:when>
		<c:otherwise>
			<style>
        *{box-sizing: border-box;}
        div{
        word-break: break-word;
        }
        #studyprint{
        	border: 1px solid black;
            margin-top: 12px;
            margin-bottom: 12px;
            border-radius: 100%;
        }
        .ratio{
            padding: 0px;
        }
        .header{
            position: relative;
            background-color: white;
        }
        .body{
        	background-color: white;
        }
        .body2{
        	background-color: white;
        }
        .navi {
            position:sticky;
            top: 0;
            background-color: white;
            z-index: 999;
        }
        #studybtnbox{
            height: 100%;
            position: relative;
            padding-bottom: 40px;
            padding-top: 40px;
        }
        #reportbtn{
            position: absolute;
            bottom: 5px;
            right: 90px;
        }
        #applybtn{
            position: absolute;
            bottom: 5px;
            right: 5px;
        }
        #similarbox{
            overflow: auto;
        }
        #similarbox::-webkit-scrollbar {
            display: none;
        }
        #similarstudyfont{
            height: 10%;
            overflow: hidden;
        }
        #similarstudyfont>h5{
           font-weight: 900; 
           margin-top: 3px;
        }
        #similarbox>.similarstudybox{
            height: 30%;
            padding-left: 7%;
            padding-bottom: 7%;
            padding-right: 7%;
        }
        .similarstudy{
            height: 100%;
        }
        .nicknamebox{
        	border: 1px solid black;
            overflow: hidden;
        }
        #totitle{
        	text-align: right;
        }
        #allreplybox{
        	background-color: white;
        }
        #btnbox{
            text-align: right;
        }
        #replyfont{
            font-weight: 900;
        }
        #replywritebox{
            position: relative;
        }
        #replytext{
        	border: 1px solid black;
            padding-right: 90px;
            min-height: 80px;
            max-height: 80px;
            overflow: auto;
        }
        
        #replytext::-webkit-scrollbar {
  			display: none;
		}
        
        #replywritebtn{
            position: absolute;
            right: 5px;
            bottom: 5px;
        }
        
        .studyguestprint {
        	border: 1px solid black;
            margin-top: 12px;
            margin-bottom: 12px;
            border-radius: 100%;
        }
        
        .btns{
			background-color: white;
			border-radius: 5px;
		}
		#applyguestcount{
			display:inline-block;
		}
		.studyapplybox{
			border: 1px solid black;
		}
		.bodybox{
			padding-top: 2%;
			padding-left: 3%;
		}
    </style>
    <script>
    	$(function(){
    		$(".replyacceptbtn").css("display","none");
    		$(".replycancelbtn").css("display","none");
    	})
    </script>
    <div class="container">
        <c:import url="/board/topMenu.jsp"></c:import>
        <div class="row header">
            <div class="col-12">
                <div class="row">
                    <div class="col-2">
                        <div class="ratio ratio-1x1" id="studyprint"></div>
                    </div>
                    <div class="col-10">
                        <div id="studybtnbox">
                            <h3>${dto.title}</h3>
                            <div>${dto.contents}</div>
                            <div>작성자 : ${dto.writer}</div>
                            <button type="button" id="applybtn" class="btns">신청하기</button>    
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <div class="row body">
            <div class="col-3 bodybox">약속 장소
                <div class="row m-0">
                    <div class="ratio ratio-1x1">
                    	<div id="map" style="width:100%;height:100%"></div>
                    </div>
                </div>
            </div>
            <div class="col-6 bodybox">상세내역<br>
            	참여 인원수 : <div id="applyguestcount">${guestcount}</div>/${dto.guestcount}
            	<div>${dto.detailcontents}</div>
            </div>
            <div class="col-3 p-0">
                <div class="row m-0">
                </div>
            </div>
            <p>
            <p>
            <div class="col-12">
                <div class="row">
                    <div class="col-1 p-0 m-0">스터디 멤버</div>
                    <div class="col-1 studyapplybox">
                        <div class="ratio ratio-1x1" id="studyprint"></div>
                        <div align="center">host</div>
                        <div align="center" class="nicknamebox">${dto.writer}</div>
                    </div>
                    <c:forEach var="cksbm" items="${cksbmlist}">
                    	<div class="col-1 studyapplybox">
                        	<div class="ratio ratio-1x1 studyguestprint"></div>
                        	<br>
                        	<div class="d-none d-md-block nicknamebox" align="center">${cksbm.id}</div>
                    	</div>
                    </c:forEach>
                </div>
            </div>
            <div class="col-12" id="totitle">
            	<a href="/select.studyboard?cpage=${cpage}"><button type="button" class="btns">목록으로</button></a>
            </div>
        </div>
        <br>
        <form action="/insert.studyreply" method="post" id="replyForm">
        	<div class="row body2">
        		<div class="col-12" id="replyfont">
                	댓글
            	</div>
            	<hr>
            	<div class="col-12">
                	<div class="row" id="allreplybox">
                    	<c:forEach var="i" items="${replylist}">
                			<div class="col-12">
                				<div>
                					작성자 : ${i.writer}
                				</div>
                				<div>
                					${i.contents}
                				</div>
                				<input type="hidden" value="${i.seq}">
                				<c:if test="${i.writer == loggedID}">
                					<div align="right">
                						<button type="button" class="replyacceptbtn btns">확인</button>
                						<button type="button" class="replycancelbtn btns">취소</button>
                						<button type="button" class="replyupdatebtn btns">수정하기</button>
                						<button type="button" class="replydeletebtn btns">삭제하기</button>
                					</div>
                				</c:if>
                			</div>
                			<hr>
                		</c:forEach>
                	</div>
            	</div>
            	<div class="col-12 p-0" id="replywritebox">
                	<div contenteditable="true" id="replytext"></div>
                	<input type="hidden" name="studyreplycontents" id="studyreplycontents">
                	<button type="submit" id="replywritebtn" class="btns">작성하기</button>
            	</div>
        	</div>
        	<input type="hidden" name="studyreplywriter" value="213">
        	<input type="hidden" name="cpage" value="${cpage}">
        	<input type="hidden" name="parent_seq" value="${dto.seq}">
        </form>
        <br>
        <div class="row footer">
        <c:import url="/board/footer.jsp"></c:import>
        </div>
    </div>
    
    <script>
    	$("#applybtn").on("click",function(){
    		console.log("123");
    		$.ajax({
    			url:"/insert.studyapply",
    			data:{
    				id:'${loggedID}',
    				board_seq:${dto.seq}
    			}
    		}).done(function(resp){
    			resp = JSON.parse(resp);
    			if(resp > 0){
    				alert("신청 완료");
    			}
    		})
    	})
    	$("#replyForm").on("submit",function(){
			$("#studyreplycontents").val($("#replytext").html());
		})
		$("#allreplybox").on("click",".replydeletebtn",function(){
			if(confirm("댓글을 삭제하시겠습니까?")){
				let seq = $(this).parent().prev().val();
				console.log(seq);
				location.href="/delete.studyreply?cpage="+${cpage}+"&parent_seq="+${dto.seq}+"&seq="+seq;
			}
		})
		$("#allreplybox").on("click",".replyupdatebtn",function(){
    		$(this).css("display","none");
    		$(this).prev().css("display","");
    		$(this).prev().prev().css("display","");
    		$(".replyupdatebtn").attr("disabled","true");
    		$(".replydeletebtn").attr("disabled","true");
    		$(this).parent().prev().prev().attr("contenteditable","true");
    	})
    	$("#allreplybox").on("click",".replyacceptbtn",function(){
    		$.ajax({
    			url:"/update.studyreply",
    			type:"post",
    			data:{
    				seq:$(this).parent().prev().val(),
    				contents:$(this).parent().prev().prev().html()
    			}
    		}).done(function(){
    			location.reload();
    		})
    	})
    	$("#allreplybox").on("click",".replycancelbtn",function(){
    		if(confirm("댓글 수정을 취소하시겠습니까?")){
    			location.reload();
    		}
    	})
    </script>
    <script>
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
    </script>
		</c:otherwise>
	</c:choose>
</body>
</html>