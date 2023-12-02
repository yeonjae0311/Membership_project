<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<script type="text/javascript">
			const message = "장바구니로 이동하시겠습니까?"
			const returnUrl = "shopping_cart";
			var result = confirm(message);
			
			if(result){
				document.location.href = returnUrl;
			} else{
				document.location.href= "shop_item_select";
			}
		</script>
	</body>
</html>