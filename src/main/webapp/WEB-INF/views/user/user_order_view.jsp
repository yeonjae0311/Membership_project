<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head data-id="user">
	<meta charset="UTF-8">
	<title>주문 상세 내역</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_css.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/user/user_order_view.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
</head>
<body>
	<div id="header_bar"></div>
	
	<div id="body_div">
		<!-- <div class="button_div">
			<input type="button" value="뒤로가기" onclick="location.href='user_order_list'">
		</div> -->
		<div id="user_order_view_div">
			<div id="user_order_view_head">
				<div id="user_order_view_head_title">주문상세내역</div> 
				<div id="user_order_view_head_num">주문번호 ${o_idx}</div>
			</div>
			<div id="user_order_view_item_list">
				<c:forEach items="${order_detail_list}" var="od">
					<div id="div_${od.od_idx}" class="od_div">						
						<div class="order_photo_div">
							<img class="order_photo" src="${pageContext.request.contextPath}/resources/upload/shop/${od.i_photo_name}">
						</div>
						<div class="order_item">				
							<div class="r1c4">
								${od.i_name}
							</div>
							
							<div class="r1c4">
								color · ${od.i_color}
							</div>
							
							<div class="r1c4"> 
								 ${od.i_price}원 · ${od.od_count}개
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="order_info">		
				<div class="order_info_title">결제 정보</div>
				<div class="order_info_content">결제 수단 : KAKAO PAY </div>
				<div class="order_info_content">결제 금액 : ${order_vo.o_sum}원</div>
			</div>
			<div class="order_info">
				<div class="order_info_title">주문자 정보</div>
				<div class="order_info_content">이름 : ${id.m_name}</div>
				<div class="order_info_content">번호 : ${id.m_tel}</div>		
				<div class="order_info_content">우편번호 : ${id.m_addr1}</div>
				<div class="order_info_content">주소 : ${id.m_addr2} ${id.m_addr3}</div>
			</div>		
		</div>
	</div>
	
	<div id="footer_bar"></div>
</body>
</html>

