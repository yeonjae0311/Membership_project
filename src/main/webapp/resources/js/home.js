function shop_payment(){
	const order_list = {
		"items": {},
		"final_amount": {}
	};
	
	let cd_count = 1;
	let i_price = 9900;
	
	let final_list = order_list.final_amount;
	final_list["total_amount"] = 1;
	final_list["final_price"] = 9900;
	
	let order_item = order_list.items;
	
	order_item[0] = {};
	
	order_item = order_item[0];
	
	order_item["i_idx"] = 4;
	order_item["i_name"] = "Membership 1개월";
	order_item["i_color"] = "none";
	order_item["i_photo_name"] = "membership_img.jpg";
	order_list.items[0]["cd_amount"] = 1;
	order_list.items[0]["total_price"] = 9900;
	
	sessionStorage.setItem("order_list", JSON.stringify(order_list));
	
    location.href = 'shop_payment';
}