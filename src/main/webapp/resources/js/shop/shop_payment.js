let check_update_addr = 0;
let check_oninput_addr = 1;

const order_item_list_obj = JSON.parse(sessionStorage.getItem("order_list"));

const order_item_list = order_item_list_obj["items"];
const totals = order_item_list_obj["final_amount"];
const final_info = {
    "total_count": {...totals},
    "items": [{}]
};

const order_item_list_div = document.getElementById("order_item_list_div");
const total_amount_div = document.getElementById("total_amount_div");
const button_bar_div = document.getElementById("button_bar_div");

const ITEM_IMG_PATH = window.location.origin + "/membership/resources/";

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

function update_addr(){

	let postcode = document.getElementById("postcode").value;
	let address = document.getElementById("address").value;
	let detail_address = document.getElementById("detailAddress").value;
	
	if(postcode == ""){
		alert("우편번호 입력이 필요합니다.");
		return;
	}
	
	if(detail_address == ""){
		alert("상세 주소를 입력하세요");
		 document.getElementById("detailAddress").focus();
		return;
	}
	
	const url = "insert_addr";
	
	let param = {
		"postcode": encodeURIComponent(postcode),
		"address": encodeURIComponent(address),
		"detail_address": encodeURIComponent(detail_address)
	};
	
	send_request(url, param, callback_addr, "post");
	
}

function callback_addr(...args){
	alert("배송지가 등록되었습니다.")
	check_update_addr = 1;
	check_oninput_addr = 1;
}

for(const key in order_item_list){
    const item = order_item_list[key];

    const item_div = document.createElement("div");
    item_div.id = item["i_idx"];
    item_div.className = "item_div"

    const item_photo = document.createElement("img");
    item_photo.className = "item_photo";
    item_photo.src = ITEM_IMG_PATH + "upload/shop/" + item["i_photo_name"];
    item_div.appendChild(item_photo);

    const item_info = document.createElement("div");
    item_info.className = "item_info";

    const item_info_left = document.createElement("div");
    item_info_left.className = "item_info_left";

    const item_info_right = document.createElement("div");
    item_info_right.className = "item_info_right";

    const item_name = document.createElement("div");
    item_name.className = "item_name";
    item_name.innerHTML = "이름: " + item["i_name"];
    item_info_left.appendChild(item_name);

    const item_color = document.createElement("div");
    item_color.className = "item_color";
    item_color.innerHTML = item["i_color"];
    item_info_left.appendChild(item_color);

    item_info.appendChild(item_info_left);

    const item_amount = document.createElement("div");
    item_amount.className = "cd_amount";
    item_amount.innerHTML = item["cd_amount"];
    item_info_right.appendChild(item_amount);

    const item_price = document.createElement("div");
    item_price.className = "total_price";
    item_price.innerHTML = item["total_price"] + "₩";
    item_info_right.appendChild(item_price);

    item_info.appendChild(item_info_right);

    item_div.appendChild(item_info)

    order_item_list_div.appendChild(item_div);
}

for(const key in totals){
    let total_amount = document.createElement("div");
    total_amount.id = key;
    total_amount.className = "totals";
    total_amount.innerHTML = `${key.split("_").join(" ")}:`;

    let total_amount_input = document.createElement("input");
    total_amount_input.type = "text";
    total_amount_input.className = "total_amount_input";
    total_amount_input.value = totals[key];
    
    total_amount.appendChild(total_amount_input);

    total_amount_div.appendChild(total_amount);
}

const tos_checkbox_div = document.createElement("div");

const tos_checkbox = document.createElement("input");
tos_checkbox.id = "tos_checkbox";
tos_checkbox.type = "checkbox";

tos_checkbox_div.innerHTML = "주문자는 개인정보 제공 약관에 모두 동의합니다.";
tos_checkbox_div.appendChild(tos_checkbox);

button_bar_div.appendChild(tos_checkbox_div);

const payment_button = document.createElement("input");
payment_button.type = "button";
payment_button.value = "결제하기";
payment_button.addEventListener("click", () => {
    sessionStorage.removeItem("order_list");
    order_insert_fn();
});

button_bar_div.appendChild(payment_button);

const cancel_button = document.createElement("input");
cancel_button.type = "button";
cancel_button.value = "취소하기";
cancel_button.addEventListener("click", () => {
    location.href = "shop";
})

button_bar_div.appendChild(cancel_button);

function addr_change() {
	check_oninput_addr = 0;
}

function order_insert_fn(){
	let postcode = document.getElementById("postcode").value;
	let address = document.getElementById("address").value;
	let detail_address = document.getElementById("detailAddress").value;
	
    const item_list_obj = final_info["items"];

    for(const key in order_item_list){
        item_list_obj[key] = {};
        const final_item_info = item_list_obj[key];
        const item_info_obj = order_item_list[key];

        final_item_info["i_idx"] = item_info_obj["i_idx"];
        final_item_info["od_count"] = item_info_obj["cd_amount"];
        final_item_info["od_sum"] = item_info_obj["total_price"];
    }
       
    localStorage.setItem("order_list_json", JSON.stringify(final_info));
	
	if(postcode == "" || detail_address == ""){
		alert("정확한 배송지를 입력해주세요.");
		return;
	}
	
	if(address != ""){
		check_update_addr = 1;
	}
	
	if(check_update_addr == 0) {
		alert("배송지 등록을 해주세요");
		return;
	}
	
	if(check_oninput_addr == 0) {
		alert("배송지 등록을 해주세요");
		return;
	}
	
	if(!document.getElementById("tos_checkbox").checked){
		alert("약관에 동의해야 구매가 가능합니다.");
		return;
	}
	
	let url = "";
	
	console.log(order_item_list[0].i_idx);
	console.log(totals.final_price);
	
	
	if(order_item_list[0].i_idx == 1) {
		console.log("kakao_m");
    	url = "membership_kakao";
    } else {
    	console.log("kakao");
		url = "kakao";
    }
    
    const param = {
		"o_sum": encodeURIComponent(totals.final_price)
	};

    send_request(url, param, go_to_payment, "post");
}

function go_to_payment(...args) { 
	let res = args[0].param;
	let payment_price = args[0].o_sum;
	let payment_name = args[0].payment_name;
	let membership = args[0].membership;
	
	let hidden_m_email = document.getElementById("hidden_m_email").value;
	let hidden_m_name = document.getElementById("hidden_m_name").value;
	let hidden_m_tel = document.getElementById("hidden_m_tel").value;
	let hidden_m_addr1 = document.getElementById("hidden_m_addr1").value;
	
	if(res == 'success'){
		
		let IMP = window.IMP;
	    IMP.init('imp57607280');
	    let msg;
	    let order_list_json = localStorage.getItem("order_list_json");
		IMP.request_pay({
            pg: 'kakaopay',
            pay_method: 'card',
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: payment_name,
            amount: payment_price,
            buyer_email: hidden_m_email,
            buyer_name: hidden_m_name,
            buyer_tel: hidden_m_tel,
            buyer_addr: hidden_m_addr1,
            buyer_postcode: "01181"
        },function (rsp) {
	    	console.log(rsp); 
	    	if(membership == 1 ) {
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
	                
	                location.href = 'completed_page';
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
	                location.href = 'completed_page';
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
		
		
	} 
	
}

function adjust_size(e){
    let switch_value = e.target.dataset;
    
    const toggle_img = document.getElementById("toggle_button");

    const order_item_list_div = document.getElementById("order_item_list_div").style;

    if(switch_value.value == "down"){
        switch_value.value = "up";
        toggle_img.src = window.location.origin + "/membership/resources/img/arrow_" + switch_value.value + "_icon.png";

        order_item_list_div.maxHeight = "100%";
    }else{
        switch_value.value = "down";
        toggle_img.src = window.location.origin + "/membership/resources/img/arrow_" + switch_value.value + "_icon.png";
        
        order_item_list_div.maxHeight = "18em";
    }
}