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
			function shop_item_select(){
				var shop_item_one = document.shop_item_one;
				
				shop_item_one.submit();
			}
		</script>
	</head>
	<body>
		<form name="shop_item_one" action="shop_item_select" method="POST">
			<div onclick="shop_item_select()" style="cursor:pointer;">
				<img src="resources/img/title_04.gif" >		
				<c:forEach var="vo" items="${list}">
					<div>
						<img src="resources/img/title_04.gif"><br>
						<input type="hidden" name="i_idx" value="${vo.i_idx}">
						<input type="hidden" name="i_name" value="${vo.i_name}">
						${vo.i_idx}<br>
						${vo.i_name}<br>
						${vo.i_price}<br>					
					</div>
				</c:forEach>
			</div>	
		</form>
	</body>
</html>