<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<<<<<<< HEAD
<head>
	<meta charset="UTF-8">
	<title>Membership</title>
	<script>
		function shop_item_select(f){
			f.action = "shop_item_select";
			f.submit();
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
	<div>
		<img src="resources/img/title_04.gif">	
	</div>
	
	<div>
		<c:forEach var="vo" items="${list}" varStatus="number">
			<form id="shop_item_one_${number.current}" method="POST">
				<div onclick="shop_item_select(document.getElementById('shop_item_one_${number.current}'))" style="cursor:pointer;">
					<div class="item_one_img_div">
						<img id="item_one" src="${pageContext.request.contextPath}/resources/upload/${vo.i_detail_photo_name}">
=======
	<head>
		<meta charset="UTF-8">
		<title>Membership</title>
		<script>
			function shop_item_select(f){
				f.action = "shop_item_select";
				f.submit();
			}
		</script>
		<style>
			.item_one_img_div{height:200px;
 						  width: 200px;}		 
			#item_one {height: 100%;
				 	   width: 100%;
		</style>
	</head>
	<body>	
		<div>
			<img src="${pageContext.request.contextPath}/resources/img/logo.jpg" >	
			<!-- 로고 사진 필요 -->
		</div>
		<input type="button" value="상품 등록하기" onclick="location.href='item_insert'">
		<div>
			<c:forEach var="vo" items="${list}" varStatus="number">
				<form id="shop_item_one_${number.current}" method="POST">
					<div onclick="shop_item_select(document.getElementById('shop_item_one_${number.current}'))" style="cursor:pointer;">
						<div class="item_one_img_div">
							<img id="item_one" src="${pageContext.request.contextPath}/resources/upload/${vo.i_detail_photo_name}">
						</div>
						<input type="hidden" name="i_idx" value="${vo.i_idx}">
						<input type="hidden" name="i_name" value="${vo.i_name}">
						${vo.i_name}<br>
						${vo.i_price}<br>					
>>>>>>> 9527fe2989bdf30e59bcf9165b2f8dc7fb02f821
					</div>
					<input type="hidden" name="i_idx" value="${vo.i_idx}">
					<input type="hidden" name="i_name" value="${vo.i_name}">
					${vo.i_name}<br>
					${vo.i_price}<br>					
				</div>
			</form>
		</c:forEach>
	</div>
</body>
</html>