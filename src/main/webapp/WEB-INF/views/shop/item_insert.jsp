<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>NewJeans Membership</title>
	<link rel="stylesheet" href="resources/css/item_insert.css">
	<script>

		/* // 옵션 추가
		function add(){
			 let element = document.createElement("input");
			 element.setAttribute("name","i_color")  
		     document.getElementById("option").appendChild(element);
		} 
		 */
		 function upload(){
			 
			 const item_upload = document.item_upload;
			 
			 if(item_upload.i_name.value == ''){
				alert('상품명을 입력하세요');
				item_upload.i_name.focus();
				return;
			 }
			 
			 item_upload.submit();
		 }
		 
	</script>
	</head>
	<body>
		<form name="item_upload" action="item_insert_upload" method="POST" enctype="multipart/form-data">
			상품 이름 : <input name="i_name"><br>		
			상품 가격 : <input name="i_price">원<br>
			상품 색상 : <input name="i_color"><br>
			재고 수량 : <input type="number" name="i_amount"><br>
			상품 이미지 : <input type="file" name="i_photo"><br> 
    		상품 상세 이미지 : <input type="file" name="i_detail_photo"><br>	
	    	<div id=button_bar>
	    		<input type="button" value="등록하기" onclick="upload()">
	    		<input type="button" value="취소하기" onclick="location.href='shop'">
	    	</div>
    	</form>
	</body>
</html>




