sendRequest("shopping_cart_list", {}, loadPage, "post");

const order_list = {
	items: {},
	final_amount: {}
};

function loadPage(...args){
	let res = args[0];
	
	console.log(res)

	const IMG_PATH = window.location.origin + "/membership/resources/";

	const cart_item_list_div = document.getElementById("cart_item_list_div");
	const total_div = document.getElementById("total_div");

	for(let i = 0; i < res.length; i++){
		const item = res[i];

		let order_item = order_list.items;

		order_item[i] = {};

		order_item = order_item[i];

		order_item["i_amount"] = item.i_amount;
		order_item["i_color"] = item.i_color;
		order_item["i_idx"] = item.i_idx;
		order_item["i_name"] = item.i_name;
		order_item["i_photo_name"] = item.i_photo_name;
		order_item["i_price"] = item.i_price;

		const item_div = document.createElement("div");
		item_div.id = i;
		item_div.className = "item_div";

		const item_detail_total_amount = document.createElement("div");
		item_detail_total_amount.id = "item_detail_total_amount_" + i;
		item_detail_total_amount.type = "hidden";
		item_detail_total_amount.value = item.i_amount;
		item_div.appendChild(item_detail_total_amount);

		const item_detail_price = document.createElement("div");
		item_detail_price.id = "item_detail_price_" + i;
		item_detail_price.type = "hidden";
		item_detail_price.value = item.i_price;
		item_div.appendChild(item_detail_price);

		const item_detail_index = document.createElement("div");
		item_detail_index.id = "item_detail_index_" + i;
		item_detail_index.type = "hidden";
		item_detail_index.value = item.i_idx;
		item_div.appendChild(item_detail_index);
		
		const item_delete = document.createElement("input");
		item_delete.id = "item_delete_" + i;
		item_delete.type = "button";
		item_delete.className = "item_delete";
		item_delete.value = "x";
		item_div.appendChild(item_delete);

		const shop_item_div = document.createElement("div");
		shop_item_div.id = "shop_item_div_" + i;
		shop_item_div.className = "shop_item_div";

		const item_detail_photo = document.createElement("img");
		item_detail_photo.className = "item_detail_photo";
		item_detail_photo.src = IMG_PATH + "upload/shop/" + item.i_photo_name;
		shop_item_div.appendChild(item_detail_photo);

		const item_detail_div = document.createElement("div");
		item_detail_div.className = "item_detail_div";

		const item_detail = document.createElement("div");
		item_detail.className = "item_detail";

		const item_detail_name = document.createElement("div");
		item_detail_name.className = "item_detail_name";
		item_detail_name.innerHTML = item.i_name;
		item_detail.appendChild(item_detail_name);

		const item_detail_option = document.createElement("div");
		item_detail_option.className = "item_detail_option";
		item_detail_option.innerHTML = item.i_color;
		item_detail.appendChild(item_detail_option);

		item_detail_div.appendChild(item_detail);

		const item_detail_change = document.createElement("div");
		item_detail_change.className = "item_detail_change";

		const item_detail_amount_div = document.createElement("div");
		item_detail_amount_div.className = "item_detail_amount_div";

		const item_detail_amount_minus = document.createElement("input");
		item_detail_amount_minus.id = "item_detail_amount_minus_" + i;
		item_detail_amount_minus.className = "amount_button";
		item_detail_amount_minus.type = "button";
		item_detail_amount_minus.value = "-";
		item_detail_amount_minus.addEventListener("click", (event) => {
			calculate_amount(event, i);
		});
		item_detail_amount_div.appendChild(item_detail_amount_minus);

		const item_detail_amount = document.createElement("input");
		item_detail_amount.id = "item_detail_amount_" + i;
		item_detail_amount.className = "item_detail_amount";
		item_detail_amount.value = item.cd_count;
		item_detail_amount.readOnly = true;
		item_detail_amount_div.appendChild(item_detail_amount);

		const item_detail_amount_plus = document.createElement("input");
		item_detail_amount_plus.id = "item_detail_amount_plus_" + i;
		item_detail_amount_plus.className = "amount_button";
		item_detail_amount_plus.type = "button";
		item_detail_amount_plus.value = "+";
		item_detail_amount_plus.addEventListener("click", (event) => {
			calculate_amount(event, i);
		});
		item_detail_amount_div.appendChild(item_detail_amount_plus);

		if(item.cd_count <= 0){
			item_detail_amount.value = 1;
			item_detail_amount_minus.disabled = true;
		}
		
		if(item.cd_count >= item.i_amount){
			item_detail_amount.value = item.i_amount;
			item_detail_amount_plus.disabled = true;
		}

		item_detail_change.appendChild(item_detail_amount_div);

		const item_total_price_div = document.createElement("div");
		item_total_price_div.className = "item_total_price_div";
		item_total_price_div.innerHTML = "total: ";

		const item_total_price = document.createElement("input");
		item_total_price.id = "item_total_price_" + i;
		item_total_price.className = "item_total_price";
		item_total_price.readOnly = true;
		item_total_price.value = eval(item_detail_amount.value * item.i_price);

		item_total_price_div.appendChild(item_total_price);

		item_detail_change.appendChild(item_total_price_div);

		item_detail_div.appendChild(item_detail_change);

		shop_item_div.appendChild(item_detail_div);

		item_div.appendChild(shop_item_div);

		cart_item_list_div.appendChild(item_div);
	}

	const total_amount_div = document.createElement("div");
	total_amount_div.id = "total_amount_div";
	total_amount_div.innerHTML = "total: ";

	const total_amount = document.createElement("input");
	total_amount.id = "total_amount";
	total_amount.readOnly = true;
	total_amount.value = calc_total();

	total_amount_div.appendChild(total_amount);

	total_div.appendChild(total_amount_div);

	const final_price_div = document.createElement("div");
	final_price_div.id = "final_price_div";
	final_price_div.innerHTML = "total: ";

	const final_price = document.createElement("input");
	final_price.id = "final_price";
	final_price.readOnly = true;
	final_price.value = calc_price();

	final_price_div.appendChild(final_price);

	total_div.appendChild(final_price_div);

	const confirm_button_bar = document.createElement("div");
	confirm_button_bar.id = "confirm_button_bar";

	const cancel_button = document.createElement("input");
	cancel_button.id = "cancel_button";
	cancel_button.type = "button";
	cancel_button.value = "cancel";
	cancel_button.addEventListener("click", () => {
		console.log("cancel")
	})

	confirm_button_bar.appendChild(cancel_button);

	const buy_button = document.createElement("input");
	buy_button.id = "buy_button";
	buy_button.type = "button";
	buy_button.value = "buy";
	buy_button.addEventListener("click", () => {
		let final_list = order_list.final_amount;

		final_list["total_amount"] = calc_total();
		final_list["final_price"] = calc_price();

		sessionStorage.setItem("order_list", JSON.stringify(order_list));

		location.href = "shop_payment";
	})

	confirm_button_bar.appendChild(buy_button);

	total_div.appendChild(confirm_button_bar);
}

function calculate_amount(e, idx){

	let operation = e.target.value;

	const total_amount = document.getElementById("item_detail_total_amount_" + idx).value;
	const price = document.getElementById("item_detail_price_" + idx).value;
	let current_amount = document.getElementById("item_detail_amount_" + idx)

	current_amount.value = eval(`${current_amount.value} ${operation} 1`);
	document.getElementById("item_total_price_" + idx).value = eval(current_amount.value * price);

	document.getElementById("total_amount").value = calc_total();
	document.getElementById("final_price").value = calc_price();

	if(current_amount.value <= total_amount && current_amount.value >= 1){
		document.getElementById("item_detail_amount_minus_" + idx).disabled = false;
		document.getElementById("item_detail_amount_plus_" + idx).disabled = false;
	}

	if(current_amount.value >= total_amount){
		e.target.disabled = true;
	}

	if(current_amount.value <= 1){
		e.target.disabled = true;
	}

	const url = "item_count_change";

	let item_update_amount = document.getElementById("item_detail_amount_" + idx).value;
	let i_idx = document.getElementById("item_detail_index_" + idx).value;

	let param = {
		"item_count": encodeURIComponent(item_update_amount),
		"i_idx": encodeURIComponent(i_idx)
	};

	sendRequest(url, param, update_callback, "post");

}

function update_callback(...args){
	
}

function calc_total(){
	let total = 0;
	let final_total_list = document.getElementsByClassName("item_detail_amount");

	for(let item of final_total_list){
		total += parseInt(item.value);
	}

	return total;
}

function calc_price(){
	let price = 0;
	let final_price_list = document.getElementsByClassName("item_total_price");

	for(let item of final_price_list){
		price += parseInt(item.value);
	}

	return price;
}