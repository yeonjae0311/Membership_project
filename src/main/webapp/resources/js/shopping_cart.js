sendRequest("shopping_cart_list", {}, loadPage, "post")

function loadPage(...args){
	let res = args[0];
	
	console.log(res)

	const IMG_PATH = window.location.origin + "/membership/resources/";

	const cart_item_list_div = document.getElementById("cart_item_list_div");
	
	for(let i = 0; i < res.length; i++){
		const item = res[i];

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
		
		const checkbox = document.createElement("input");
		checkbox.type = "checkbox";
		checkbox.id = "item_checkbox_" + i;
		checkbox.className = "item_checkbox";
		checkbox.checked = "checked";
		item_div.appendChild(checkbox);

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
		item_detail_amount.type = "number";
		item_detail_amount.min = "1";
		item_detail_amount.max = item.i_amount;
		item_detail_amount.value = item.cd_count;
		item_detail_amount.addEventListener("click", (event) => {
			event.target.select();
		});
		item_detail_amount.addEventListener("input", (event) => {
			input_amount(event, i);
		});
		item_detail_amount_div.appendChild(item_detail_amount);

		const item_detail_amount_plus = document.createElement("input");
		item_detail_amount_plus.id = "item_detail_amount_plus_" + i;
		item_detail_amount_plus.className = "amount_button";
		item_detail_amount_plus.type = "button";
		item_detail_amount_plus.value = "+";
		item_detail_amount_plus.addEventListener("click", (event) => {
			calculate_amount(event, i);
		});

		if(item.cd_count <= 0){
			item_detail_amount.value = 1;
			item_detail_amount_minus.disabled = true;
		}
		
		if(item.cd_count >= item.i_amount){
			item_detail_amount.value = item.i_amount;
			item_detail_amount_plus.disabled = true;
		}

		item_detail_amount_div.appendChild(item_detail_amount_plus);

		item_detail_change.appendChild(item_detail_amount_div);

		const item_total_price_div = document.createElement("div");
		item_total_price_div.className = "item_total_price_div";

		const item_total_price = document.createElement("input");
		item_total_price.id = "item_total_price_" + i;
		item_total_price.className = "item_total_price";
		item_total_price.readOnly = true;
		item_total_price.value = eval(item_detail_amount.value * item.i_price);

		item_total_price_div.innerHTML = "total: ";
		item_total_price_div.appendChild(item_total_price);

		item_detail_change.appendChild(item_total_price_div);

		item_detail_div.appendChild(item_detail_change);

		shop_item_div.appendChild(item_detail_div);

		item_div.appendChild(shop_item_div);

		cart_item_list_div.appendChild(item_div);
	}
}

function calculate_amount(e, idx){

	let operation = e.target.value;

	const total_amount = document.getElementById("item_detail_total_amount_" + idx).value;
	const price = document.getElementById("item_detail_price_" + idx).value;
	let price_input = document.getElementById("item_total_price_" + idx);
	let current_amount = document.getElementById("item_detail_amount_" + idx)

	current_amount.value = eval(`${current_amount.value} ${operation} 1`);

	price_input.value = eval(current_amount.value * price);

	if(current_amount.value <= total_amount && current_amount.value > 1){
		document.getElementById("item_detail_amount_minus_" + idx).disabled = false;
		document.getElementById("item_detail_amount_plus_" + idx).disabled = false;
	}

	if(current_amount.value >= total_amount){
		e.target.disabled = true;
		return;
	}

	if(current_amount.value <= 1){
		e.target.disabled = true;
		return;
	}
}

function input_amount(e, idx){
	let current_amount = e.target;
	const total_amount = document.getElementById("item_detail_total_amount_" + idx).value;
	const price = document.getElementById("item_detail_price_" + idx).value;
	let price_input = document.getElementById("item_total_price_" + idx);

	if(current_amount.value < total_amount || current_amount.value > 0){
		document.getElementById("item_detail_amount_minus_" + idx).disabled = false;
		document.getElementById("item_detail_amount_plus_" + idx).disabled = false;
	}


	if(current_amount.value > total_amount){
		document.getElementById("item_detail_amount_minus_" + idx).disabled = false;
		
		current_amount.value = total_amount;
	}

	if(current_amount.value < 1){
		document.getElementById("item_detail_amount_plus_" + idx).disabled = false;

		current_amount.value = 1;
	}

	price_input.value = eval(current_amount.value * price);
}