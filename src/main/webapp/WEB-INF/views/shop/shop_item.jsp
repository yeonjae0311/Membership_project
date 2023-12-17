<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head data-id="shop">
	<meta charset="UTF-8">
	<title>MEMBERSHIP</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_css.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/shop/shop_item.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
	<script>
		function item_amount(amount_button_id){
	
			let amount_button_value = 
				document.getElementById(amount_button_id).value.trim();
					
			let cd_count = document.getElementById("cd_count").value;
			let i_amount = parseInt('${vo.i_amount}');
					
			if(amount_button_value == "+" && i_amount > cd_count){
				document.getElementById("cd_count").value = parseInt(document.getElementById("cd_count").value) + 1;
			} else if(amount_button_value == "+" && i_amount <= cd_count){
				document.getElementById(amount_button_id).disabled = true;
			}
					
			if((amount_button_value == "-") && (cd_count > 1)){	
				document.getElementById("cd_count").value = parseInt(document.getElementById("cd_count").value) - 1;
				document.getElementById("button_plus").disabled = false;
			}
		}
	</script>
</head>
<body>	
	<div id="header_bar"></div>
	
	<div>
		<form name="selected_item" action="shopping_cart_insert" method="POST">
			<div id=item_info_div>
				<img id="item_delete_id" src="${pageContext.request.contextPath}/resources/img/x_icon.png" onclick="item_delete()">
				
				<div class=item_img_div>
					<input type="hidden" id="item_img_id" value="${vo.i_photo_name}"> 
					
					<img id=item_img src="${pageContext.request.contextPath}/resources/upload/shop/${vo.i_photo_name}">
					
					<div class=item_detail_img_div>		
			   			<img id=item_detail_img src="${pageContext.request.contextPath}/resources/upload/shop/${vo.i_detail_photo_name}">
			   		</div>
				</div>
	   		</div>
	   		
	   		<div id="side_bar">
		   		<div>
					<div class="shop_item_div">
						<input type="hidden" id="i_idx" value="${vo.i_idx}">
						<input type="hidden" name="i_name" id="i_name" value="${vo.i_name}">
						
						<div id="shop_item_name">
							${vo.i_name}
						</div>
					</div>
					
					<div id="item_detail" class="shop_item_div">
						<input type="hidden" id="i_price" value="${vo.i_price}">
						
						<div>
							${vo.i_price}₩
						</div>
						
						<div>
							<select class="color_option" id="i_color" name="i_color" required>
							    <c:forEach var="colors" items="${colors}">
							    	<option value="${colors}">${colors}</option>
							    </c:forEach>	   
							</select>
						</div>
					</div>
					
					<div id="item_count_div">
						<input type="button" id="button_plus" value=" + " onclick="item_amount(this.id)">
						<input type="text" id="cd_count" value="1" readonly="readonly">
						<input type="button" id="button_minus" value=" - " onclick="item_amount(this.id)">
					</div>
			   		   		
			   		<div id=shop_button_bar>
			   			<input type="button" value="장바구니" onclick="send_shopping_cart(this.form)" style="cursor: pointer;">
			   			<input type="button" value="결제하기" onclick="send_shop_payment()" style="cursor: pointer;">
			   		</div>
		   		</div>
	   		</div>
		</form>
	</div>
	
	<div id="footer_bar"></div>
</body>
</html>