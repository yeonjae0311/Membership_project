<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${pageContext.request.contextPath}/resources/css/shop/shop_payment.css" rel="stylesheet" type="text/css">
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script type="module" src="${pageContext.request.contextPath}/resources/js/shop_js/shop_payment.js" defer></script>
	<script>
	    function addr() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                let addr = ''; // 주소 변수
	                let extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                
	                } else {
	                    document.getElementById("extraAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("address").value = addr + extraAddr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("detailAddress").focus();
	            }
	        }).open();
	    }

	    function kakao_pay(){
			let postcode =  document.getElementById('postcode').value;
		    let address = document.getElementById("address").value;
		    let detail_address = document.getElementById("detailAddress").value;
		    
	    	if((postcode == '') || (address == '') || (detail_address = '')){
	    		alert("정확한 배송지를 입력해주세요")
	    		return;
	    	}
	    	
	    	if(!document.getElementById("ToS").checked){
	    		alert("약관 동의가 필요합니다.")
	    		return;
	    	} else{
	    		location.href="kakao_pay";
	    	}
	    }
	</script>
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
					<input id="postcode" placeholder="우편번호">
				</td>
				<td>
					<input type="button" onclick="addr()" value="우편번호 찾기">
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" id="address" placeholder="주소">
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" id="detailAddress" placeholder="상세주소">
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