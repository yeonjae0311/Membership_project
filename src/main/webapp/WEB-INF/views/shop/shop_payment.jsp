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
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/shop/shop_payment.js" defer></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" defer>
	function go_to_payment(...args) { 
		let res = args[0];

		if(res["param"] == 'success'){
			alert('결제 굿');
			
			let IMP = window.IMP;
		    IMP.init('imp57607280');
		    let msg;
		    let order_list_json = localStorage.getItem("order_list_json");
			console.log("여기"); 
			IMP.request_pay({
	            pg: 'kakaopay',
	            pay_method: 'card',
	            merchant_uid: 'merchant_' + new Date().getTime(),
	            name: '${payment_name}',
	            amount: '${payment_price}',
	            buyer_email: '${id.m_email}',
	            buyer_name: '${id.m_name}',
	            buyer_tel: '${id.m_tel}',
	            buyer_addr: '${id.m_addr1}',
	            buyer_postcode: "01181"
	        },function (rsp) {
		    	console.log(rsp); 
		    	if('${membership}' == 1 ) {
		    		if (rsp.success) {
		                // 서버단에서 결제정보 조회를 위해 fetch로 imp_uid 전달하기
		                fetch('membership_payment_completed', {
		                    method: 'POST',
		                    headers: {
		                        'Content-Type': 'application/json;charset=UTF-8'
		                    },
		                    body: JSON.stringify({
		                        
		                        // 기타 필요한 데이터가 있으면 추가 전달
		                    })
		                })
		                .then(response => {
		                    if (!response.ok) {
		                        throw new Error('Network response was not ok');
		                    }
		                    return response.json();
		                })
		                .then(data => {
		                    if (data.everythings_fine) {
		                        msg = '결제가 완료되었습니다.';
		                        msg += '\n고유ID : ' + rsp.imp_uid;
		                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		                        msg += '\n결제 금액 : ' + rsp.paid_amount;
		                        msg += '\n카드 승인번호 : ' + rsp.apply_num;
		
		                        alert(msg);
		                    } else {
		                        // 결제가 아직 완료되지 않았습니다.
		                        // 결제된 금액이 요청한 금액과 달라 결제를 자동 취소처리하였습니다.
		                    }
		                })
		                .catch(error => {
		                    console.error('Error:', error.message);
		                });
		                window.localStorage.setItem("isMembership", "1");
		                // 성공시 이동할 페이지
		                
		                location.href = '<%=request.getContextPath()%>/completed_page';
		            } else {
		                msg = '결제에 실패하였습니다.';
		                // msg += '\에러내용 : ' + rsp.error_msg;
		                // 실패시 이동할 페이지
		                alert(msg);
		                location.href = "shop";
		            }
		    	} else {
		    		console.log(rsp);
		    		if (rsp.success) {
		                // 서버단에서 결제정보 조회를 위해 fetch로 imp_uid 전달하기
		                fetch("payment_completed", {
		                    method: 'POST',
		                    headers: {
		                        'Content-Type': 'application/json;charset=UTF-8'
		                    },
		                    body: JSON.stringify({
		                       order_list_json
		                        // 기타 필요한 데이터가 있으면 추가 전달
		                    })
		                })
		                .then(response => {
		                    if (!response.ok) {
		                        throw new Error('Network response was not ok');
		                    }
		                    return response.json();
		                })
		                .then(data => {
		                    if (data.everythings_fine) {
		                        msg = '결제가 완료되었습니다.';
		                        msg += '\n고유ID : ' + rsp.imp_uid;
		                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		                        msg += '\n결제 금액 : ' + rsp.paid_amount;
		                        msg += '\n카드 승인번호 : ' + rsp.apply_num;
		
		                        alert(msg);
		                    } else {
		                        // 결제가 아직 완료되지 않았습니다.
		                        // 결제된 금액이 요청한 금액과 달라 결제를 자동 취소처리하였습니다.
		                    }
		                })
		                .catch(error => {
		                    console.error('Error:', error.message);
		                });
		                // 성공시 이동할 페이지
		                location.href = '<%=request.getContextPath()%>/completed_page';
		            } else {
		                msg = '결제에 실패하였습니다.';
		                // msg += '\에러내용 : ' + rsp.error_msg;
		                // 실패시 이동할 페이지
		                alert(msg);
		                location.href = "shop";
		            }
		    	}
		        
		    });
		} else {
			alert('결제 노굿');
			
			
		} 
		
	}
	</script>
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