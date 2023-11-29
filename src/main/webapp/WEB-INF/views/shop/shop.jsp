<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	shop
	<input type="button" value="home" onclick="location.href='/membership/'">
</body>
	<head>
	<meta charset="UTF-8">
	<title>shop</title>
	</head>
	<body>
		<form>
			<!-- 나중에 이미지 누르면 해당 상품으로 이동하도록 추가 -->
			<img src="resources/img/title_04.gif">
			<div>
				<!-- 아이템 db읽어와서 각각 상품이름, 가격 수정하기 -->
				<c:forEach var="vo" items="${item}">
					<div OnClick="location.href =''" style="cursor:pointer;">
						<img src="resources/img/title_04.gif"><br>
						<a>상품 이름</a><br>
						<a>상품 가격</a><br>					
					</div>
				</c:forEach>
			</div>	
		</form>
	</body>
</html>