<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head data-id="user">
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_css.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_js.js"></script>
</head>
<body>
	<div id="header_bar"></div>
	
	<div id="body_div">
		<input type="button" value="user_edit" onclick="location.href='user_edit'">
			user_order_list
		<div id="user_order_list">
			<c:choose>
				<c:when test="${empty order_list}">
				주문 목록이 없습니다.
				</c:when>
				<c:otherwise>
					<c:forEach items="${order_list}" var="order_i">
						<div onclick="location.href='user_order_view?o_idx=${order_i.o_idx}'" class="order_div">
							<div class="o_idx_div">
								주문 번호 : ${order_i.o_idx}
							</div>
							<div class="i_names_div">
								${order_i.i_names}
							</div>
							<div class="o_count_div">
								${order_i.o_count}개 · ${order_i.o_sum}원
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div id="footer_bar"></div>
</body>
</html>