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
			<div class="form_input_div">
				<p>
					상품 이름 :
				</p>
				<input type="text" name="i_name">		
			</div>
		
			<div class="form_input_div">
				<p>
					상품 가격 :
				</p>
				<input type="text" name="i_price">₩
			</div>
			
			<div class="form_input_div">
				<p>
					상품 색상 :
				</p>
				<input type="text" name="i_color">
			</div>
			
			<div class="form_input_div">
				<p>
					재고 수량 :
				</p>
				<input type="number" name="i_amount" min="1" max="99">
			</div>
			
			<div class="form_div">
				<p>
					상품 이미지 :
				</p>
				
				<div class="form_photo_div">
					<img id="i_main_photo_img">
					
					<input type="file" id="i_main_photo" name="i_photo" onchange="change_img(event)">
					<label id="file_upload" for="i_main_photo">
						<img class="img_button" src="${pageContext.request.contextPath}/resources/img/photo_upload_icon.png">
					</label>
				</div>
			</div>
			
			<div class="form_div">
				<p>
			   		상품 상세 이미지 :
				</p>
				
				<div class="form_photo_div">
					<img id="i_detail_photo_img">
					
			   		<input type="file" id="i_detail_photo" name="i_detail_photo" onchange="change_img(event)">
					<label id="file_upload" for="i_detail_photo">
						<img class="img_button" src="${pageContext.request.contextPath}/resources/img/photo_upload_icon.png">
					</label>
				</div>
			</div>

	    	<div id=button_bar> 
	    		<input type="button" value="등록하기" onclick="upload(this.form)" style="cursor: pointer;">
	    		<input type="button" value="취소하기" onclick="location.href='shop'" style="cursor: pointer;">
	    	</div>
	   	</form>
	</div>
   	
   	<div id="footer_bar"></div>
</body>
</html>