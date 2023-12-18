<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head data-id="shop">
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_css.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/shop/shop_payment.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<div id="header_bar"></div>
	
	<div id="shop_payment_div">
		<div id="member_info_div">
			<div class="member_info">
				<p>
					주문자명:
				</p>
	
				<p>
					${vo.m_name}
				</p>
			</div>
			
			<div class="member_info">
				<p>
					전화번호:
				</p>
	
				<p>
					${vo.m_tel}
				</p>
			</div>
		</div>
			
		<table>
			<tr>
				<td id="post_code_title" rowspan="3">배송지</td>
				<td class="table_body">
					<c:choose>
						<c:when test="${not empty id.m_addr1}">
							<input class="post_code_input" id="postcode" value="${id.m_addr1}" placeholder="우편번호" readonly="readonly">
						</c:when>
						<c:otherwise>
							<input class="post_code_input" id="postcode" placeholder="우편번호" readonly="readonly">
						</c:otherwise>
					</c:choose>
				</td>
				<td id="post_code_button_td" rowspan="3">
					<input id="post_code_button" class="post_code_input" type="button" value="우편번호 찾기" onclick="addr()">
				</td>
			</tr>
			<tr>
				<td class="table_body">
					<c:choose>
						<c:when test="${not empty id.m_addr2}">
							<input class="post_code_input" type="text" value="${id.m_addr2}" id="address" placeholder="주소" readonly="readonly">
						</c:when>
						<c:otherwise>
							<input class="post_code_input" type="text" id="address" placeholder="주소" readonly="readonly">
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td class="table_body">
					<c:choose>
						<c:when test="${not empty id.m_addr3}">
							<input class="post_code_input" type="text" value="${id.m_addr3}" id="detailAddress" placeholder="상세주소" oninput="addr_change()">
						</c:when>
						<c:otherwise>
							<input class="post_code_input" type="text" id="detailAddress" placeholder="상세주소">
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td id="register_address" colspan="3">
					<input type="button" onclick="update_addr()" value="배송지 등록">
				</td>
			</tr>
			
		</table>
			
		<div id="order_item_list_parent">
			<div id="order_item_list_div"></div>
			
			<div id="order_item_toggle_div">
				<img id="toggle_button" data-value="down" src="${pageContext.request.contextPath}/resources/img/arrow_down_icon.png" onclick="adjust_size(event)">
			</div>
		</div>
			
		<div id="payment_option_div">
			<h5>결제 수단 선택</h5>
			<div id="payment_option_buttons">
				<input type="button" value="카카오페이"><br>
				<!-- 추후 추가 예정 텍스트는 흐리게 스타일 넣기 -->
				<input type="button" value="추후 추가 예정">
			</div>		
		</div>

	    <div id="total_amount_div"></div>	    

		<div id="button_bar_div"></div>
	</div>
	
	<div id="footer_bar"></div>
</body>
</html>