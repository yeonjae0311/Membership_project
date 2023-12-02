<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>MEMBERSHIP</title>
		<style>
			#shop_button_bar{background-color: red;}
			#item_img{object-fit:cover;}
			#item_info_div{width: 200px; 
					   	   height: 300px;}
			.item_img_div{height:300px;
 						  width: 300px;}		 
			#item_img {height: 100%;
				 	   width: 100%;
				       object-fit: contain;}  	   
			.item_detail_img_div{height:600px;
 						  		 width: 300px;}	

		</style>
		<script>
			function send_shopping_cart(f){
				f.submit();
			}
		</script>
	</head>
	<body>	
		<form name="selected_item" action="shopping_cart" method="POST">
			<input type="hidden" name="i_name" value="${vo.i_name}">
			<div id=item_info_div>
				<div class=item_img_div>
					<img id=item_img src="${pageContext.request.contextPath}/resources/upload/${vo.i_photo_name}"><br>
				</div>
				${vo.i_name}<br>
				${vo.i_price}<br>
				<select class="color_option" id="color" name="i_color" required>
				    <c:forEach var="colors" items="${colors}">
				    	<option value="${colors}">${colors}</option>
				    </c:forEach>	   
				</select>
    		</div>
    		<div class=item_detail_img_div>
    			<img id=item_detail_img src="resources/img/ktda">
    		</div>
    		<div id=shop_button_bar>
    			<input type="button" value="장바구니" onclick=send_shopping_cart(this.form)>
    			<input type="button" value="결제하기" onclick=send_shop_payment()>
    		</div>
		</form>
	</body>
</html>