<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>MEMBERSHIP</title>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
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
 			#item_detail_img{height: 100%;
 							 width: 100%;}			  		 

		</style>
		<script>
		
			function send_shopping_cart(f){
					
				const i_name = f.i_name.value.trim();
				const i_color = f.i_color.value.trim();
				
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
			}
		</script>
	</head>
	<body>	
		<form name="selected_item" action="shopping_cart_insert" method="POST">
			<div id=item_info_div>
				<div class=item_img_div>
					<img id=item_img src="${pageContext.request.contextPath}/resources/upload/${vo.i_photo_name}"><br>
				</div>
				<input type="hidden" name="i_name" value="${vo.i_name}">
				${vo.i_name}<br>
				${vo.i_price}<br>
				<select class="color_option" id="color" name="i_color" required>
				    <c:forEach var="colors" items="${colors}">
				    	<option value="${colors}">${colors}</option>
				    </c:forEach>	   
				</select>
    		</div><br><br><br>
    		<div class=item_detail_img_div>		
    			<img id=item_detail_img src="${pageContext.request.contextPath}/resources/upload/${vo.i_detail_photo_name}">
    		</div>
    		<div id=shop_button_bar>
    			<input type="button" value="장바구니" onclick=send_shopping_cart(this.form)>
    			<input type="button" value="결제하기" onclick=send_shop_payment()>
    		</div>
		</form>
	</body>
</html>