<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head data-id="shop">
	<meta charset="UTF-8">
	<title>Membership</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_css.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/shop/shop.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
</head>
<body>	
	<div id="header_bar"></div>
	
	<div id="shop_div">
		<input id="is_master" type="hidden" value="${is_master}">
		
		<div id="shop_banner_div">
			<img id="shop_banner" src="${pageContext.request.contextPath}/resources/img/photo_banner/photocard.jpg">
		</div>
		
		<div id="shop_items_div">
			<c:forEach var="vo" items="${list}" varStatus="number">
				<form id="shop_item_one_${number.current}" class="shop_item" method="POST" onclick="shop_item_select(document.getElementById('shop_item_one_${number.current}'))">
					<div style="cursor:pointer;">
						
						<div class="item_one_img_div">
							<img id="item_one" class="shop_photo" src="${pageContext.request.contextPath}/resources/upload/shop/${vo.i_photo_name}">
						</div>
						
						<div class="item_button_bar">
							<input type="hidden" name="i_idx" value="${vo.i_idx}">
							<input type="hidden" name="i_name" value="${vo.i_name}">
							<div class="item_name">
								${vo.i_name}
							</div>
							
							<div class="item_price">
								${vo.i_price}
							</div>
						</div>		
							
					</div>
				</form>
			</c:forEach>
			<c:if test="${id.m_ismaster eq '1' }">
			<div id="add_item" class="shop_item">
				<img src="${pageContext.request.contextPath}/resources/img/add_icon.png" onclick="location.href='item_insert'">
			</div>
			</c:if>
		</div>
		
	</div>
	
	<div id="footer_bar"></div>
</body>
</html>