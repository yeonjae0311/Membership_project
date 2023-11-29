<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Membership</title>
	</head>
	<body>
		<form>
			<!-- 나중에 이미지 누르면 해당 상품으로 이동하도록 추가 -->
			<a href="shop_item">
				<img src="resources/img/title_04.gif" >
			</a>
			<div>
				<c:forEach var="vo" items="${list}">
					<div onclick="location.href =''" style="cursor:pointer;">
						<img src="resources/img/title_04.gif"><br>
						<a>${vo.i_name}</a><br>
						<a>${vo.i_price}</a><br>					
					</div>
				</c:forEach>
			</div>	
		</form>
	</body>
</html>