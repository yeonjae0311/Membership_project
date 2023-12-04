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
	<style>
		#shopping_cart_item{
			background-color: skyblue;
			height: 250px;
			width: 200px;
		}
		
		#button_bar{
			background-color: pink;
		}
		
		#shopping_cart_item_img_div{
			height:150px;
			width: 150px;
		}
		
		#shopping_cart_item_img{
			height: 100%;
 			width: 100%;
 			object-fit: contain;
 		}
	</style>
	<script>
		function select_all(select_all)  {
			const checkboxes = document.getElementsByName('item_checkbox');
			  
			checkboxes.forEach((checkbox) => {
			checkbox.checked = select_all.checked;
			});
		}
		
		function select_option_fn(f){
			const i_name = f.i_name.value.trim();
			const url = "select_option";
			
			const param = {
				"i_name": encodeURIComponent(i_name),
			};
				
			sendRequest(url, param, resultFn, "post");
		}
		
		function resultFn(...args){
			let res = args[0].param;

			if(res == 'yes'){
				alert("옵션 선택 가능")
			} 
		}
	</script>
</head>
<body>
	<input type='checkbox'
    	   name='item_checkbox'
    	   value='select_all'
    	   onclick='select_all(this)'/> 
    	전체 선택
	<div>
		<c:forEach var="vo" items="${list}" varStatus="count">
			<form id="shopping_cart_item_${count.current}">
				<div id=shopping_cart_item>
					<input type="checkbox" name="item_checkbox" value="${vo}">
					<div id=shopping_cart_item_img_div>
						<img id=shopping_cart_item_img src="${pageContext.request.contextPath}/resources/upload/${vo.i_photo_name}"><br>
					</div>
					<input type="hidden" name=i_name value="${vo.i_name}">
					${vo.i_name}<br>
					${vo.i_price}<br>
					<input type="button" name="select_option" value="옵션 변경" 
							onclick="select_option_fn(document.getElementById('shopping_cart_item_${count.current}'))">
					<select class="color_option" id="color" name="i_color" required>
					    <c:forEach var="colors" items="${colors}">
					    	<option value="${colors}">${colors}</option>
					    </c:forEach>	   
					</select>
					옵션 : ${vo.i_color}<br>
					수량 : <input type="number" name="od_count" value="1" min="1" max="99">
				</div>
			</form>
		</c:forEach>	
	</div>
	<p>총가격 : </p>
	<div id=button_bar>
		<input type="button" value="선택한 상품 주문하기" onclick="">
		<input type="button" value="전체 상품 주문하기" onclick="">			
	</div>
</body>
</html>