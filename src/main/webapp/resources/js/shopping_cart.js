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
		item_div.class = "item_div";

		const item_detail_total_amount = document.createElement("div");
		item_detail_total_amount.id = "item_detail_total_amount_" + i;
		item_detail_total_amount.type = "hidden";
		item_detail_total_amount.value = item.i_amount;
		item_div.appendChild(item_detail_total_amount);
		
		const checkbox = document.createElement("input");
		checkbox.type = "checkbox";
		checkbox.id = "item_checkbox_" + i;
		checkbox.class = "item_checkbox";
		checkbox.checked = "checked";
		item_div.appendChild(checkbox);

		const item_detail_photo = document.createElement("img");
		item_detail_photo.class = "item_detail_photo";
		item_detail_photo.src = IMG_PATH + "img/newjeans1.jpg";
		item_div.appendChild(item_detail_photo);

		const item_detail_div = document.createElement("div");
		item_detail_div.class = "item_detail_div";

		const item_detail = document.createElement("div");
		item_detail.class = "item_detail";

		const item_detail_name = document.createElement("div");
		item_detail_name.class = "item_detail_name";
		item_detail_name.innerHTML = item.i_name;
		item_detail.appendChild(item_detail_name);

		const item_detail_option = document.createElement("div");
		item_detail_option.class = "item_detail_option";
		item_detail_option.innerHTML = item.i_color;
		item_detail.appendChild(item_detail_option);

		item_detail_div.appendChild(item_detail);

		item_div.appendChild(item_detail_div);

		const item_detail_amount_div = document.createElement("div");
		item_detail_amount_div.class = "item_detail_amount_div";

		const item_detail_amount_minus = document.createElement("input");
		item_detail_amount_minus.id = "item_detail_amount_minus_" + i;
		item_detail_amount_minus.class = "amount_button";
		item_detail_amount_minus.type = "button";
		item_detail_amount_minus.value = "-";
		item_detail_amount_minus.addEventListener("click", (event) => {
			calculate_amount(event);
		});

		item_detail_amount_div.appendChild(item_detail_amount_minus);

		const item_detail_amount = document.createElement("input");
		item_detail_amount.id = "item_detail_amount_" + i;
		item_detail_amount.class = "item_detail_amount";
		item_detail_amount.type = "number";
		item_detail_amount.min = "1";
		item_detail_amount.max = item.i_amount;
		item_detail_amount.value = item.cd_count;
		item_detail_amount.addEventListener("click", (e) => {
			e.target.select();
		});
		item_detail_amount.addEventListener("input", (event) => {
			input_amount(event);
		});
		item_detail_amount_div.appendChild(item_detail_amount);

		const item_detail_amount_plus = document.createElement("input");
		item_detail_amount_plus.id = "item_detail_amount_plus_" + i;
		item_detail_amount_plus.class = "amount_button";
		item_detail_amount_plus.type = "button";
		item_detail_amount_plus.value = "+";
		item_detail_amount_plus.addEventListener("click", (event) => {
			calculate_amount(event);
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

		item_div.appendChild(item_detail_amount_div);

		cart_item_list_div.appendChild(item_div);
	}
}

function calculate_amount(e){
	let item_id = e.target.parentElement.parentElement.id;
	let operation = e.target.value;

	const total_amount = document.getElementById("item_detail_total_amount_" + item_id).value;
	let current_amount = document.getElementById("item_detail_amount_" + item_id)

	current_amount.value = eval(`${current_amount.value} ${operation} 1`)

	if(current_amount.value <= total_amount && current_amount.value > 1){
		document.getElementById("item_detail_amount_minus_" + item_id).disabled = false;
		document.getElementById("item_detail_amount_plus_" + item_id).disabled = false;
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

function input_amount(e){
	let item_id = e.target.parentElement.parentElement.id;
	let current_amount = e.target;
	const total_amount = document.getElementById("item_detail_total_amount_" + item_id).value;

	if(current_amount.value > total_amount){
		document.getElementById("item_detail_amount_minus_" + item_id).disabled = false;
		
		current_amount.value = total_amount;
	}

	if(current_amount.value < 1){
		document.getElementById("item_detail_amount_plus_" + item_id).disabled = false;

		current_amount.value = 1;
	}
}