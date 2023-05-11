<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>자유게시판메인</title>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
	integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<style>
* {
	box-sizing: border-box;
}

.header {
	position: relative;
}

.navi {
	position: sticky;
	top: 0;
	background-color: white;
	z-index: 999;
}

#head {
	height: 70px;
}

#freeboard_img {
	height: 200px;
}

#footer {
	height: 120px;
}

#searchDiv {
	margin: auto;
	display: relative;
	margin-top: 5px;
}

#headMypage {
	display: relative;
	margin-top: 15px;
}

.margin {
	height: 28px;
}

#freeBoardList {
	width: 100%;
}

.table {
	width: 100%;
	min-height:350px;
}

.writeBtnRow {
	height: 50px;
}

.btn-success {
	float: right;
	position: relative;
	top: 10%;
	height: 35px;
}
#writeBtn{
background-color : #254F4C;
}

.center {
	text-align: center;
}

#button-addon2:hover {
	background-color: green;
}


.pageNavi * {
	height: 30px;
	width: 30px;
	vertical-align: baseline;
	display: inline-block;
}


a {
	text-decoration: none;
	color: inherit;
}

.page-item{
float:left;
}

#freeboard_img {
position:relative;
width:100%;
height: 200px;
}

#freeboard_img::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: black;
  opacity: 0.5;
}

#freeboard_img img{
opacity:0.5;
position:absolute;
top:0;
left:0;
width:100%;
height:100%;
object-fit:cover;
}

#imgTitle{
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 1; /* text 요소를 커버 위에 위치시킵니다. */
  color: white;
  text-align: center;
  font-size: 2rem;
}


</style>




</head>

<body>
            <div class="container">
                <!-- 헤더 네비 -->
                <c:import url="/board/topMenu.jsp"></c:import>
		<!-- 바디 -->
		<!-- 자유게시판 이미지 -->
		<div class="row">
			<div class="col-12 " id="freeboard_img">
			<a href="/contentList.freeBoard">
			<img src="/image/freeboardImg.jpg">
			<h1 id=imgTitle>자유게시판</h1>
			</a>
			</div>
		</div>
		<div class="row">
			<div class="col "></div>
		</div>
		<!--검색 바  -->
		<form action="/searchByOption.freeBoard" method="post">
		<div class="row" id="searchRow">
			<div class="col-12">
				<div class="d-flex justify-content-center row" id="searchDiv">
					<div class="col-2 p-0">
						<select class="form-select text-center" id="select" aria-label="Default select example" name="optionValue">
							<option selected >-- 검색 선택 --</option>
							<option value="제목" >제목</option>
							<option value="내용" >내용</option>
							<option value="닉네임" >닉네임</option>
						</select>
					</div>
					<div class="col-10 p-0">
						<div class="input-group mb-3">
							<input type="text" class="form-control" placeholder="검색어를 입력하세요"
								aria-label="Recipient's username" aria-describedby="basic-addon2" name="searchValue">
							<button class="btn btn-outline-secondary" type="submit"
								id="button-addon2">
								<i class="fa-solid fa-magnifying-glass"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		</form>
		<!-- 자유게시판 리스트 -->
		<div class="row "></div>
		<table class="table">
			<thead class="table-light">
				<tr class="row">
					<th class="col-4 col-md-1 center">순번</th>
					<th class="col-8 col-md-5 center">제목</th>
					<th class="d-none d-md-block col-md-3 center">닉네임</th>
					<th class="d-none d-md-block col-md-2 center">작성일</th>
					<th class="d-none d-md-block col-md-1 center">조회수</th>
				</tr>
			</thead>
			<c:forEach var="i" items="${list}">
				<tr class="row">
					<td class="col-4 col-md-1 center">${i.seq}</td>
					<td class="col-8 col-md-5 "><a
						href="/detail.freeBoard?seq=${i.seq}">${i.title}</a></td>
					<td class="d-none d-md-block col-md-3 center">${i.nickname}</td>
					<td class="d-none d-md-block col-md-2 center">${i.detailDate}</td>
					<td class="d-none d-md-block col-md-1 center">${i.view_count}</td>
				</tr>
			</c:forEach>
		</table>


		<!-- 글쓰기 버튼 -->
		<div class="row writeBtnRow">
			<div class="col writeBtnCol">
				<a href="/freeBoard/FreeBoardWriteForm.jsp">
					<button type="button" class="btn btn-success" id="writeBtn" >글쓰기</button>
				</a>
			</div>
		</div>
		<!-- 페이지 네비 -->

			<nav aria-label="Page navigation example" align="center">
  <ul class="pagination d-flex justify-content-center">
    <c:forEach var="i" items="${navi}">
      <c:choose>
        <c:when test="${i eq '<<'}">
          <li class="page-item"><a class="page-link" href="/contentList.freeBoard?cpage=${start}">${i}</a></li>
        </c:when>
        <c:when test="${i eq '<'}">
          <li class="page-item"><a class="page-link" href="/contentList.freeBoard?cpage=${cpage - 1}">${i}</a></li>
        </c:when>
        <c:when test="${i eq '>'}">
          <li class="page-item"><a class="page-link" href="/contentList.freeBoard?cpage=${cpage + 1}">${i}</a></li>
        </c:when>
        <c:when test="${i eq '>>'}">
          <li class="page-item"><a class="page-link" href="/contentList.freeBoard?cpage=${end}">${i}</a></li>
        </c:when>
        <c:otherwise>
          <li class="page-item">
            <a class="page-link ${i == cpage ? 'current-page' : ''}" 
               href="/contentList.freeBoard?cpage=${i}" 
               ${i == cpage ? "disabled" : ""} 
               onclick="${i == cpage ? "event.preventDefault()" : ""}" >
              ${i}
            </a>
          </li>
        </c:otherwise>
      </c:choose>
    </c:forEach>
  </ul>
</nav>

<script>
  var currentPage = ${cpage}; // 현재 페이지 번호
  var pageLinks = document.querySelectorAll(".page-link"); // 페이지 링크 요소들을 가져옴

  for (var i = 0; i < pageLinks.length; i++) {
    // 페이지 링크 요소들에 클릭 이벤트를 추가
    pageLinks[i].addEventListener("click", function(event) {
      if (parseInt(event.target.textContent) === currentPage) {
        // 현재 페이지 번호와 클릭한 페이지 번호가 같으면 클릭 이벤트를 막음
        event.preventDefault();
        
      } else {
        // 현재 페이지 번호와 클릭한 페이지 번호가 다르면 링크를 따라 이동
        window.location.href = event.target.getAttribute("href");
      }
      
    });
  }
  
  const currentPage2 = document.querySelector('.current-page');
  currentPage2.style.backgroundColor = '#1e3c3e';
  currentPage2.style.color = 'white';
  
</script>
		<!-- 푸터 -->
		 <c:import url="/board/footer.jsp"></c:import>
	</div>
	
	
	
</body>

</html>