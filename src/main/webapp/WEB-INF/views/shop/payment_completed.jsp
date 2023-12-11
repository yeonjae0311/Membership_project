<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head data-id="shop">
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_css.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_js.js"></script>
	<script>
		localStorage.removeItem("order_list_json");
	</script>

</head>

<body>
	<div id="header_bar"></div>
	
	<div>
		<input id="isMembership" type="hidden" value="${isMembership}">
		<div>감사합니다. 고객님의 주문이 완료되었습니다. </div>
		
		<div>주문 내역 및 배송에 관한 안내는 Mypage > 나의 주문내역 에서 확인하실 수 있습니다.</div>
		
		<div>
			<span id="order_date">주문일자 : ${order_date}</span>
		</div>
		
		<div>
			<span id="order_num">주문번호 : ${order_num}</span>
		</div>				
		
	</div>
	
	<div id="footer_bar"></div>
</body>
</html>