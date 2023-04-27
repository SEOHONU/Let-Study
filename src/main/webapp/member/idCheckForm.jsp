<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<style>
table{
width:100%;
height: 100vh;
text-align: center;
}

</style>

</head>
<body>

	<c:choose>
		<c:when test="${checkedId}">
			<table border=1>
				<tr>
					<th>중복 검사 결과</th>
				</tr>
				<tr>
					<td>이미 사용중인 ID입니다.</td>
				</tr>
				<tr>
					<td><button type="button" class="btn btn-light" id="btnClose">닫기</button></td>

					<script>
						$("#btnClose").on("click", function() {
							opener.documnet.getElementById("id").value = "";
							window.close();
						})
					</script>
				</tr>

			</table>

		</c:when>
		<c:otherwise>
		
		<table border=1>
			<tr>
				<th colspan=2>중복 검사 결과</th>
			</tr>
			<tr>
				<td colspan=2>사용 가능 아이디입니다. <br> 이 아이디를 사용하시겠습니까?
				</td>
			</tr>
				<td><button type="button" class="btn btn-primary" id="use">사용</button></td>
				<td><button type="button" class="btn btn-light" id="cancel">취소</button></td>
				
				<script>
					$("#use").on("click",function(){
						opener.idValidFlag = true; 
						window.close(); 
					})
					$("#cancel").on("click",function(){
						opener.document.getElementById("id").value="";
						window.close(); 
					})
				
				
				</script>
		
		
		</table>
		
		







		</c:otherwise>
	</c:choose>










</body>
</html>