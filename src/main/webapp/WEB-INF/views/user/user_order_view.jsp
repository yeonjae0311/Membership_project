<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세 내역</title>
</head>
<body>
	<c:forEach items="${order_detail_list}" var="od">
		<div id="div_${od.od_idx}">
			아이템 명 : (${od.i_color}) ${od.i_name} <br> 
			<img src="${pageContext.request.contextPath}/resources/upload/shop/${od.i_photo_name}" alt="이미지 유실"> <br>
			아이템 가격 : ${od.i_price} <br> 
			주문 수량 : ${od.od_count} <br>
			이 아이템 주문 합계: ${od.od_sum} <br>
		</div>
	</c:forEach>
	<input type="button" value="뒤로가기" onclick="location.href='user_order_list'">
</body>
</html>

