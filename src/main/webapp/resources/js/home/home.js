function shop_payment(){
	location.href = 'shop_payment';
}

//캐러셀 및 슬라이드 기능 구현

window.onload = function(){
	let images = document.querySelectorAll(".banner_img");
	let current_idx = 0;
	let position = 0;
	const img_width = 1105;  // css에서 설정한 width 값과 동일하게 맞춰주세요
	const left_btn = document.querySelector(".left")
	const right_btn = document.querySelector(".right")
	const container = document.querySelector(".img_container")

	/*function previous(){
	if(current_idx > 0){
	// right_btn.removeAttribute("disabled")
		position += img_width;
		container.style.transform = `translateX(${position}px)`;
		current_idx = current_idx - 1;
	}
	else if(current_idx == 0){
		//left_btn.setAttribute('disabled', 'true');
		current_idx = images.length-1;
		position = -(images.length-1) * img_width;
		container.style.transform = `translateX(${position}px)`;
	}
	}*/

	function next(){
		if(current_idx < images.length-1){
			//left_btn.removeAttribute("disabled")
			position -= img_width;
			container.style.transition = '2s';
			container.style.transform = `translateX(${position}px)`;
			current_idx = current_idx + 1;
		}
		else if(current_idx == images.length-1){
			//right_btn.setAttribute('disabled', 'true');
			current_idx = 0;
			position = 0;
			container.style.transition = 'none';
			container.style.transform = `translateX(${position}px)`;
		}
	}
	
	function init(){
		//left_btn.addEventListener("click", previous)
		right_btn.addEventListener("click", next)
	}
	
	setInterval(next, 6000);
	
	init();
}



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

order_item["i_idx"] = 1;
order_item["i_name"] = "Membership 1개월";
order_item["i_color"] = "none";
order_item["i_photo_name"] = "membership_img.jpg";
order_list.items[0]["cd_amount"] = 1;
order_list.items[0]["total_price"] = 9900;

sessionStorage.setItem("order_list", JSON.stringify(order_list));
