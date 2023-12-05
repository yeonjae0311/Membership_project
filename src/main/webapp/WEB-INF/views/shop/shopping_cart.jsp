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

	<div class="cart_item_list_div">
		<c:forEach var="vo" items="${list}" varStatus="count">
			<form id="shopping_cart_item_${count.current}">
				<div id=shopping_cart_item>
					<input type="checkbox" name="item_checkbox" id="item_checkbox" value="${vo}" checked="checked">
					<div id=shopping_cart_item_img_div>
						<img id=shopping_cart_item_img src="${pageContext.request.contextPath}/resources/upload/${vo.i_photo_name}"><br>
					</div>
					<input type="hidden" name="i_idx" value="${vo.i_idx}">
					<input type="hidden" name="i_name" value="${vo.i_name}">
						${vo.i_name}<br>
					<input type="hidden" class="i_price" name="i_price" value="${vo.i_price}">
					<span>
						원
					</span><br>
					옵션 : ${vo.i_color}<br>
					수량 : <input type="number" 
						  class="cd_count" 
						  name="item_count"
						  value="${vo.cd_count}" 
						  min="1" max="99"
						  oninput="item_count_change(document.getElementById('shopping_cart_item_${count.current}'))">
				</div>
			</form>
		</c:forEach>	
	</div> <br>
	<form id=total action="post">
		<div>
			<input id="od_count" value="0">
			총가격 : <input id="total_price" value="0" readonly="readonly"> 
		</div>
		<div id=button_bar>
			<input type="button" value="선택한 상품 주문하기" onclick="">
			<input type="button" value="전체 상품 주문하기" onclick="go_to_shop_payment(this.form)">			
		</div>
	</form>
	<script>
		function select_option_fn(f, count){
			
			document.getElementById("option_div_" + count).style.display = "block";
			
			const i_name = f.i_name.value.trim();
			const url = "select_option";
			
			const param = {
				"i_name": encodeURIComponent(i_name),
			};
			
				
			sendRequest(url, param, result_fn, "post");
		}
		
		function result_fn(...args){
			let res = args[0];

			let parent_id = "color_" + document.getElementById("item_checkbox").value;
			console.log(parent_id);
			let parent = document.getElementById(parent_id);
			
			for(let index in res){
				let option = document.createElement("option");
				option.value = res[index];
				option.innerHTML = res[index];
				
				console.log(option)
				console.log(parent)
				
				parent.appendChild(option);
			}					
		}
		
		function item_count_change(f){
			let item_count = f.item_count.value.trim();
			let i_idx = f.i_idx.value.trim();

			const url = "item_count_change";
			
			const param = {
				"item_count": encodeURIComponent(item_count),
				"i_idx": encodeURIComponent(i_idx)
			};
							
			sendRequest(url, param, result_count_change, "post");
			
		}
		
		function result_count_change(...args){
			console.log(args)
			let res = args[0].param;
			sum_price();
			
			if(res == 'yes'){
				return;
			} else{
				alert("오류가 발생했습니다")	
			}
		}
		
		function go_to_shop_payment(f){
			
			f.submit();
			
		}
		
		// 페이지 진입 후 바로 실행
		window.onload=function(){
			sum_price()
		}
		
		// 합계 구하기(오래걸림... 어떡하지)
		function sum_price(){
			let price = document.getElementsByClassName("i_price");
			let count = document.getElementsByClassName("cd_count");
			let total_count = parseInt("0");
			let total_price_sum = parseInt("0");
			for(let i = 0; i < price.length; i++ ){
				total_price_sum = total_price_sum 
					+ parseInt(price.item(i).value)*parseInt(count.item(i).value);
				total_count = total_count + parseInt(count.item(i).value)
			}
			
			 document.getElementById('total_price').value = total_price_sum;
			 document.getElementById('od_count').value = total_count;
		}
		 
	</script>
</body>
</html>