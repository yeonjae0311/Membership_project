<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head data-id="shop">
	<meta charset="UTF-8">
	<title>Membership</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default.js" defer></script>
	<script>
		function shop_item_select(f){
			f.action = "shop_item";
			f.submit();
		}
		
		window.onload = function(){
			let is_master = ${is_master};
	
			if(is_master == 0){
				document.getElementById("item_insert_form").style.display = "none"
			}
		}
	</script>
	<style>
		.item_one_img_div{
			height:200px;
			width: 200px;
		}
				 
		#item_one {
			height: 100%;
			width: 100%;
		}
	</style>
</head>
<body>	
	<div id="header_bar"></div>
	
	<div>
		<input type="button" id="item_insert_form" value="상품 등록하기" onclick="location.href='item_insert'">
	</div>
	
	<div>
		<c:forEach var="vo" items="${list}" varStatus="number">
			<form id="shop_item_one_${number.current}" method="POST">
				<div onclick="shop_item_select(document.getElementById('shop_item_one_${number.current}'))" style="cursor:pointer;">
					
					<div class="item_one_img_div">
						<img id="item_one" src="${pageContext.request.contextPath}/resources/upload/shop/${vo.i_detail_photo_name}">
					</div>
					
					<div>
						<input type="hidden" name="i_idx" value="${vo.i_idx}">
						<input type="hidden" name="i_name" value="${vo.i_name}">
						${vo.i_name}<br>
						${vo.i_price}<br>		
					</div>		
						
				</div>
			</form>
		</c:forEach>
	</div>
	
	<div id="footer_bar"></div>
</body>
</html>