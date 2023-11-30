<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Membership</title>
		<script>
			function shop_item_select(f){
				f.action = "shop_item_select";
				f.submit();
			}
		</script>
	</head>
	<body>	
		<div>
			<img src="resources/img/title_04.gif" >	
		</div>
		
		<div>
			<c:forEach var="vo" items="${list}" varStatus="number">
				<form id="shop_item_one_${number.current}" method="POST">
					<div onclick="shop_item_select(document.getElementById('shop_item_one_${number.current}'))" style="cursor:pointer;">
						<img src="resources/img/title_04.gif"><br>
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