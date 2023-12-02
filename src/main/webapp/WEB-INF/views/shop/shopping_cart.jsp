<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			#shopping_cart_item{background-color: skyblue;
								height: 350px;
								width: 300px;}
			#button_bar{background-color: pink;}
			#shopping_cart_item_img_div{height:300px;
 						  				width: 300px;}
 			#shopping_cart_item_img{height: 100%;
				 	  		 		width: 100%;
				       				object-fit: contain;}  	 
		</style>
	</head>
	<body>
		<input type="checkbox">
		<div>
			<c:forEach var="vo" items="${list}">
				<div id=shopping_cart_item>
					<input type="checkbox">
					<div id=shopping_cart_item_img_div>
						<img id=shopping_cart_item_img src="${pageContext.request.contextPath}/resources/upload/${vo.i_photo_name}"><br>
					</div>
					${vo.i_name}<br>
					${vo.i_price}
				</div>
			</c:forEach>	
		</div>
		<p>총가격</p>
		<div id=button_bar>
			<input type="button" value="결제하기" onclick="">
			<input type="button" value="취소하기" onclick="">			
		</div>
	</body>
</html>