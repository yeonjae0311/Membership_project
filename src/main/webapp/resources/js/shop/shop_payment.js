

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

	console.log(order_item_list[0].i_idx);

	let url = "";
	
	if(order_item_list[0].i_idx == 4) {
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