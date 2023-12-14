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
	
	<div>
		<div>
			<h1>결제하기</h1>	
		</div>
		
		<div id="member_info_div">
			<div>
				주문자명 : ${vo.m_name}
			</div>
			<div>
				전화번호 : ${vo.m_tel}
			</div>
		</div>
			
		<table>
			<tr>
				<td rowSpan="3">배송지</td>
				<td>
					<c:choose>
						<c:when test="${not empty id.m_addr1}">
							<input id="postcode" value="${id.m_addr1}" placeholder="우편번호" readonly="readonly">
						</c:when>
						<c:otherwise>
							<input id="postcode" placeholder="우편번호" readonly="readonly">
						</c:otherwise>
					</c:choose>
				</td>
				<td>
					<input type="button" onclick="addr()" value="우편번호 찾기">
				</td>
			</tr>
			<tr>
				<td>
					<c:choose>
						<c:when test="${not empty id.m_addr2}">
							<input type="text" value="${id.m_addr2}" id="address" placeholder="주소" readonly="readonly">
						</c:when>
						<c:otherwise>
							<input type="text" id="address" placeholder="주소" readonly="readonly">
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td>
					<c:choose>
						<c:when test="${not empty id.m_addr3}">
							<input type="text" value="${id.m_addr3}" id="detailAddress" placeholder="상세주소">
						</c:when>
						<c:otherwise>
							<input type="text" id="detailAddress" placeholder="상세주소">
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" onclick="update_addr()" value="배송지 등록">
				</td>
			</tr>
			
		</table>
			
		<div id="order_item_list_div"></div>	
			
		<div>
			<h5>결제 수단 선택</h5>
			<div>
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