<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MEMBERSHIP</title>
	<link href="${pageContext.request.contextPath}/resources/css/shop/shop_item.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/shop_js/shop_item.js" defer></script>
	<script>
		function item_amount(amount_button_id){
			const url = "shopping_cart_insert";
			
			const param = {
				"i_name": encodeURIComponent(i_name),
				"i_color": encodeURIComponent(i_color)
			};

			sendRequest(url, param, return_page, "post");
		} 
		
		function return_page(...args){
			let res = args[0].param;

			if(res == 'yes'){
				if(confirm("상품이 추가되었습니다.\n장바구니로 이동하시겠습니까?")){
					location.href='shopping_cart' ;	
				} else{
					return;
				}	
			} 
			let amount_button_value = 
				document.getElementById(amount_button_id).value.trim();
					
			let cd_count = document.getElementById("cd_count").value;
			let i_amount = '${vo.i_amount}';
					
			if(amount_button_value == "+" && i_amount > cd_count){
				document.getElementById("cd_count").value = 
					parseInt(document.getElementById("cd_count").value) + 1;
			} else if(amount_button_value == "+" && i_amount <= cd_count){
				document.getElementById(amount_button_id).disabled = true;
			}
					
			if((amount_button_value == "-") && (cd_count > 1)){	
				document.getElementById("cd_count").value = 
					parseInt(document.getElementById("cd_count").value) - 1;
				document.getElementById("button_plus").disabled = false;
			}
		}
	</script>
</head>
<body>	
	<div id="header_bar"></div>
	<form name="selected_item" action="shopping_cart_insert" method="POST">

		<div>
			<input type="button" id="item_delete_id" value="상품 삭제하기" onclick="item_delete()">
		</div>
		
		<div id=item_info_div>
		
			<div class=item_img_div>
				<img id=item_img src="${pageContext.request.contextPath}/resources/upload/shop/${vo.i_photo_name}"><br>
			</div>
			
			<div>
				<input type="hidden" name="i_name" id="i_name" value="${vo.i_name}">
				${vo.i_name}<br>
			</div>
			
			<div>
				${vo.i_price}<br>
			</div>
			
			<div>
				<select class="color_option" id="color" name="i_color" required>
				    <c:forEach var="colors" items="${colors}">
				    	<option value="${colors}">${colors}</option>
				    </c:forEach>	   
				</select><br>
			</div>
			
			<div>
				<input type="button" id="button_plus" value=" + " onclick="item_amount(this.id)">
				<input id="cd_count" value="1" readonly="readonly">
				<input type="button" id="button_minus" value=" - " onclick="item_amount(this.id)">
			</div>	
			
   		</div>
   		   		
   		<div class=item_detail_img_div>		
   			<%-- <img id=item_detail_img src="${pageContext.request.contextPath}/resources/upload/${vo.i_detail_photo_name}"> --%>
   		</div>
   		
   		<div id=shop_button_bar>
   			<input type="button" value="장바구니" onclick="send_shopping_cart(this.form)">
   			<input type="button" value="결제하기" onclick="send_shop_payment()">
   		</div>
	</form>
	<div id="footer_bar"></div>
</body>
</html>