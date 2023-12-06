<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>NewJeans Membership</title>
	<link href="${pageContext.request.contextPath}/resources/css/shop/item_insert.css" rel="stylesheet" type="text/css">
	<script>	
		 function upload(item_upload){
			 
			 if(item_upload.i_name.value == ''){
				alert('상품명을 입력하세요');
				item_upload.i_name.focus();
				return;
			 }
			 
			 if(item_upload.i_price.value == ''){
				alert('상품 가격을 입력하세요');
				item_upload.i_price.focus();
				return;
			 }
			 
			 if(item_upload.i_color.value == ''){
				alert('상품 색상을 입력하세요');
				item_upload.i_color.focus();
				return;
			 }
			 
			 if(item_upload.i_amount.value == ''){
				alert('재고 수량을 입력하세요');
				return;
			 }
			 
			 if(item_upload.i_photo.value == ''){
				alert('상품이미지를 등록하세요');
				return;
			 }
			 
			 if(item_upload.i_detail_photo.value == ''){
				alert('상품 상세 이미지를 등록하세요');
				return;
			 }
			 
			 item_upload.submit();
		 }
	</script>
</head>
<body>
	<div id="header_bar"></div>
	<form id="item_upload" action="item_insert_upload" method="POST" enctype="multipart/form-data">
		<div>
			<div>
				상품 이름 : <input name="i_name"><br>	
			</div>
			
			<div>
				상품 가격 : <input name="i_price">원<br>
			</div>
			
			<div>
				상품 색상 : <input name="i_color"><br>
			</div>
			
			<div>
				재고 수량 : <input type="number" name="i_amount" min="1" max="99"><br>
			</div>
			
			<div>
				상품 이미지 : <input type="file" name="i_photo"><br> 
			</div>
			
			<div>
	    		상품 상세 이미지 : <input type="file" name="i_detail_photo"><br>	
	    	</div>
	    	
		    <div id=button_bar>
		    	<input type="button" value="등록하기" onclick="upload(this.form)">
		    	<input type="button" value="취소하기" onclick="location.href='shop'">
		    </div>
		 </div>
    </form>
    <div id="footer_bar"></div>
</body>
</html>




