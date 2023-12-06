<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/shopping_cart.js" defer></script>
	<style>
		#shopping_cart_item{
			background-color: skyblue;
			height: 250px;
			width: 200px;}
			
		#button_bar{
			background-color: pink;}
		
		#shopping_cart_item_img_div{
			height:150px;
 			-width: 150px;}
 			
 		#shopping_cart_item_img{
 			height: 100%;
			width: 100%;
			object-fit: contain;}  
				 
		.cart_item_list_div{
			display: flex;}
 		
 		.option_div{
 			display: none;
 		}
	</style>
	
</head>
<body>
	<div id="shopping_cart_div">
		<div id="cart_item_list_div"></div>
	</div>
</body>
</html>