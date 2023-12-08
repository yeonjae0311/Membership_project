<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
    <script>
    document.addEventListener("DOMContentLoaded", function () {
        var IMP = window.IMP;
        IMP.init('imp57607280');
        var msg;

        IMP.request_pay({
            pg: 'kakaopay',
            pay_method: 'card',
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: 'membership 1개월 외' ,
            amount: 9900,
            buyer_email: '${id.m_email}',
            buyer_name: '${id.m_name}',
            buyer_tel: '${id.m_tel}',
            buyer_addr: '${id.m_addr1}',
            buyer_postcode: "01181"
        }, function (rsp) {
            if (rsp.success) {
                // 서버단에서 결제정보 조회를 위해 fetch로 imp_uid 전달하기
                fetch('/membership/payment_completed', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json;charset=UTF-8'
                    },
                    body: JSON.stringify({
                        imp_uid: rsp.imp_uid
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
                location.href = '<%=request.getContextPath()%>/payment_completed';
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '\에러내용 : ' + rsp.error_msg;
                // 실패시 이동할 페이지
                alert(msg);
                location.href = "shop_payment";
            }
        });
    });
    </script>
</body>
</html>