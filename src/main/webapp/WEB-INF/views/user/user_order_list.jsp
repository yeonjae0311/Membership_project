<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head data-id="user">
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_css.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/user/user_order_list.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
</head>
<body>
	<div id="header_bar"></div>
	
	<input type="button" value="back" onclick="location.href='user_edit'">
		구매 내역
	<div id="user_order_list">
		<c:choose>
			<c:when test="${empty order_list}">
				<span>주문 목록이 없습니다.</span>
			</c:when>
			<c:otherwise>
				<c:forEach items="${order_list}" var="order_i">											
					<div id="div_order_${order_i.o_idx}">
						<div>
							${order_i.o_idx} <br>
						</div>
					</div>
					<div>
						주문 총 수량 : ${order_i.o_count} <br>
						주문 총 금액 : ${order_i.o_sum} <br>
					</div>
				</c:forEach>			
			</c:otherwise>
		</c:choose>
	</div>
	<div id="footer_bar"></div>
</body>
</html>