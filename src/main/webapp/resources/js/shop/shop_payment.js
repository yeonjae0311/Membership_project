let check_update_addr = 0;
let check_oninput_addr = 1;
let postcode = document.getElementById("postcode").value;
let address = document.getElementById("address").value;
let detail_address = document.getElementById("detailAddress").value;

const order_item_list_obj = JSON.parse(sessionStorage.getItem("order_list"));
console.log(sessionStorage.getItem("order_list"))

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
    item_name.innerHTML = item["i_name"];
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
    item_price.innerHTML = item["total_price"];
    item_info_right.appendChild(item_price);

    item_info.appendChild(item_info_right);

    item_div.appendChild(item_info)

    order_item_list_div.appendChild(item_div);
}

for(const key in totals){
    let total_amount = document.createElement("div");
    total_amount.id = key;
    total_amount.innerHTML = `${key}: ${totals[key]}`

    total_amount_div.appendChild(total_amount);
}

const tos_checkbox_div = document.createElement("div");

const tos_checkbox = document.createElement("input");
tos_checkbox.id = "tos_checkbox";
tos_checkbox.type = "checkbox";

tos_checkbox_div.appendChild(tos_checkbox);
tos_checkbox_div.innerHTML = "주문자는 개인정보 제공 약관에 모두 동의합니다.";

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

console.log(totals.final_price);

function handleAddressInputChange() {
    // 사용자가 값을 변경할 때 이 함수가 호출됩니다.
    var addressInput = document.getElementById("address");
    console.log("변경된 주소 값: " + addressInput.value);

    // check_oninput_addr 변수를 0으로 변경합니다.
    check_oninput_addr = 0;
    console.log("check_oninput_addr 변수 값 변경: " + check_oninput_addr);
}

// 초기화할 때 onchange 이벤트를 추가합니다.
window.onload = function () {
    var addressInput = document.getElementById("address");
    addressInput.addEventListener("input", handleAddressInputChange);
};

function order_insert_fn(){
	
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
	
	if(check_update_addr != 1 && check_oninput_addr != 1) {
		alert("배송지 등록을 해주세요");
		return;
	}
	
	

	let url = "";
	
	if(order_item_list[0].i_idx == 1) {
    	url = "membership_kakao";
    } else {
		url = "kakao";
    }
    
    const param = {
		"o_sum": encodeURIComponent(totals.final_price)
	};

    send_request(url, param, go_to_payment, "post");
}

function go_to_payment(...args) {  
  	
	location.href = "kakao_pay";
  	
}