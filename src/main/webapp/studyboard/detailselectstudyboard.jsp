<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
</head>
<body>
	<c:choose>
		<c:when test="${dto.writer == 2132}">
			<style>
        * {
            box-sizing: border-box;
        }

        div {
            border: 1px solid black;
            position: relative;
            word-break: break-word;
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
    </style>
    <script>
    	$(function(){
    		$("#acceptbtn").css("display","none");
    		$("#cancelbtn").css("display","none");
    	})
    </script>
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
        <form action="/update.studyboard" method="post" id="updateForm">
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
        	<div class="row body">
            	<div class="col-3">
                	<div class="row">
                    	<div class="ratio ratio-1x1">지도</div>
                	</div>
            	</div>
            	<div class="col-6">상세 내역<br>
            		<div id="detailcontents">${dto.detailcontents}</div>
            		<input type="hidden" name="detailcontents" id="hiddendetailcontents">
            	</div>
            	<div class="col-3 p-0">
                	<div class="row m-0">
                   		<div class="col-12 ratio" style="--bs-aspect-ratio: 130%;">
                        	<div class="row m-0" id="applybox">
                            	<div>신청자1</div>
                            	<div>신청자2</div>
                            	<div>신청자3</div>
                            	<div>신청자4</div>
                            	<div>신청자5</div>
                        	</div>
                    	</div>
                	</div>
            	</div>
            	<div class="col-12">
                	<div class="row">
                    	<div class="col-1 p-0 m-0">스터디 멤버</div>
                    	<div class="col-1">
                        	<div class="ratio ratio-1x1 studyguestprint"></div>
                        	<div class="d-none d-md-block nicknamebox" align="center">host</div>
                        	<div align="center">${dto.writer}</div>
                    	</div>
                    	<div class="col-1">
                        	<div class="ratio ratio-1x1 studyguestprint"></div>
                        	<div class="d-none d-md-block nicknamebox" align="center">확정아이디</div>
                    	</div>
                	</div>
            	</div>
            	<div class="col-12" id="btnbox">
            		<button type="submit" id="acceptbtn">확인</button>
            		<button type="button" id="cancelbtn">취소</button>
                	<button type="button" id="updatebtn">수정하기</button>
                	<button type="button" id="deletebtn">삭제하기</button>
                	<a href="/select.studyboard?cpage=${cpage}"><button>목록으로</button></a>
            	</div>
        	</div>
        	<input type="hidden" name="cpage" value="${cpage}">
        	<input type="hidden" name="writer" value="${dto.writer}">
        	<input type="hidden" name="seq" value="${dto.seq}">
        </form>
        <form action="/insert.studyreply" method="post" id="replyForm">
        	<div class="row footer">
        		<div class="col-12" id="replyfont">
                	댓글
            	</div>
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
                				<c:if test="${i.writer == 213}">
                					<div align="right">
                						<button type="button" class="replyupdatebtn">수정하기</button>
                						<button type="button" class="replydeletebtn">삭제하기</button>
                					</div>
                				</c:if>
                			</div>
                		</c:forEach>
                	</div>
            	</div>
            	<div class="col-12 p-0" id="replywritebox">
                	<div contenteditable="true" id="replytext"></div>
                	<input type="hidden" name="studyreplycontents" id="studyreplycontents">
                	<button type="submit" id="replywritebtn">작성하기</button>
            	</div>
            	<div class="col-12">아래 대충 띄어놓기</div>
        	</div>
        	<input type="hidden" name="studyreplywriter" value="213">
        	<input type="hidden" name="cpage" value="${cpage}">
        	<input type="hidden" name="parent_seq" value="${dto.seq}">
        </form>
    </div>
    <script>
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
    		$("#title").attr("contenteditable","true");
    		$("#contents").attr("contenteditable","true");
    		$("#detailcontents").attr("contenteditable","true");
    	})
    	$("#cancelbtn").on("click",function(){
    		if(confirm("수정을 취소하시겠습니까?")){
    			location.reload();
    		}
    	})
    	$("#updateForm").on("submit",function(){
    		$("#hiddentitle").val($("#title").html());
    		$("#hiddencontents").val($("#contents").html());
    		$("#hiddendetailcontents").val($("#detailcontents").html());
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
    </script>
		</c:when>
		<c:otherwise>
			<style>
        *{box-sizing: border-box;}
        div{
        border: 1px solid black;
        word-break: break-word;
        }
        #studyprint{
            margin-top: 12px;
            margin-bottom: 12px;
            border-radius: 100%;
        }
        .ratio{
            padding: 0px;
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
            overflow: hidden;
        }
        #totitle{
        	text-align: right;
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
    </style>
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
                            <button id="reportbtn">신고하기</button>
                            <button id="applybtn">신청하기</button>    
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row body">
            <div class="col-3">
                <div class="row">
                    <div class="ratio ratio-1x1">지도</div>
                </div>
            </div>
            <div class="col-6">상세내역<br>
            	<div>${dto.detailcontents}</div>
            </div>
            <div class="col-3 p-0">
                <div class="row m-0">
                    <div class="col-12 ratio" style="--bs-aspect-ratio: 130%;">
                        <div class="row m-0" id="similarbox">
                            <div id="similarstudyfont"><h5>연관 스터디 추천</h5></div>
                            <div class="similarstudybox"><div class="similarstudy">연관 스터디1</div></div>
                            <div class="similarstudybox"><div class="similarstudy">연관 스터디2</div></div>
                            <div class="similarstudybox"><div class="similarstudy">연관 스터디3</div></div>
                            <div class="similarstudybox"><div class="similarstudy">연관 스터디4</div></div>
                            <div class="similarstudybox"><div class="similarstudy">연관 스터디5</div></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12">
                <div class="row">
                    <div class="col-1 p-0 m-0">스터디 멤버</div>
                    <div class="col-1">
                        <div class="ratio ratio-1x1" id="studyprint"></div>
                        <div class="nicknamebox" align="center">host</div>
                        <div align="center">${dto.writer}</div>
                    </div>
                    <div class="col-1">
                        <div class="ratio ratio-1x1" id="studyprint"></div>
                        <div class="nicknamebox" align="center">확정아이디</div>
                    </div>
                </div>
            </div>
            <div class="col-12" id="totitle">
            	<a href="/select.studyboard?cpage=${cpage}"><button>목록으로</button></a>
            </div>
        </div>
        <form action="/insert.studyreply" method="post" id="replyForm">
        	<div class="row footer">
        		<div class="col-12" id="replyfont">
                	댓글
            	</div>
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
                				<c:if test="${i.writer == 213}">
                					<div align="right">
                						<button type="button">수정하기</button>
                						<button type="button" class="replydeletebtn">삭제하기</button>
                					</div>
                				</c:if>
                			</div>
                		</c:forEach>
                	</div>
            	</div>
            	<div class="col-12 p-0" id="replywritebox">
                	<div contenteditable="true" id="replytext"></div>
                	<input type="hidden" name="studyreplycontents" id="studyreplycontents">
                	<button type="submit" id="replywritebtn">작성하기</button>
            	</div>
            	<div class="col-12">아래 대충 띄어놓기</div>
        	</div>
        	<input type="hidden" name="studyreplywriter" value="213">
        	<input type="hidden" name="cpage" value="${cpage}">
        	<input type="hidden" name="parent_seq" value="${dto.seq}">
        </form>
    </div>
    <script>
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
    </script>
		</c:otherwise>
	</c:choose>
</body>
</html>