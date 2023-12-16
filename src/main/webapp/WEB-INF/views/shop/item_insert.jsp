<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head data-id="shop">
	<meta charset="UTF-8">
	<title>NewJeans Membership</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_css.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/shop/item_insert.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
</head>
<body>
	<div id="header_bar"></div>
	
	<div>
		<form id="item_upload" action="item_insert_upload" method="POST" enctype="multipart/form-data">
			상품 이름 : <input name="i_name"><br>		
			상품 가격 : <input name="i_price">원<br>
			상품 색상 : <input name="i_color"><br>
			재고 수량 : <input type="number" name="i_amount" min="1" max="99"><br>
			상품 이미지 : <input type="file" name="i_photo"><br> 
	   		상품 상세 이미지 : <input type="file" name="i_detail_photo"><br>	
	    	<div id=button_bar> 
	    		<input type="button" value="등록하기" onclick="upload(this.form)" style="cursor: pointer;">
	    		<input type="button" value="취소하기" onclick="location.href='shop'" style="cursor: pointer;">
	    	</div>
	   	</form>
	</div>
   	
   	<div id="footer_bar"></div>
</body>
</html>