function shop_payment(){
	location.href = 'shop_payment';
}

function master_board_first(){
	let unfixed_master_list = document.getElementById("unfixed_master_list");
	let unfixed_fan_list = document.getElementById("unfixed_fan_list");

	unfixed_master_list.style="display: block";
	unfixed_fan_list.style="display: none";

	document.getElementById("board_title").innerHTML = "NewJeans posts";
}

function all_board_first(){			
	let unfixed_master_list = document.getElementById("unfixed_master_list");
	let unfixed_fan_list = document.getElementById("unfixed_fan_list");

	unfixed_master_list.style="display: none";
	unfixed_fan_list.style="display: block";
	
	document.getElementById("board_title").innerHTML = "All posts";
}




//캐러셀 및 슬라이드 기능 구현

window.onload = function(){
	const container = document.querySelector(".img_container");
	const prevBtn = document.querySelector(".left");
	const nextBtn = document.querySelector(".right"); 

	(function addEvent(){
		prevBtn.addEventListener('click', translateContainer.bind(this, 6));
		nextBtn.addEventListener('click', translateContainer.bind(this, -6));
	})();

	function translateContainer(direction){
		const selectedBtn = (direction === 1) ? 'left' : 'right';
		container.style.transitionDuration = '2s';
		container.style.transform = `translateX(${direction * (100 / 6)}%)`;
		container.ontransitionend = () => reorganizeEl(selectedBtn);
	}

	function reorganizeEl(selectedBtn) {
		container.removeAttribute('style');
		(selectedBtn === 'left') ? container.insertBefore(container.lastElementChild, container.firstElementChild): container.appendChild(container.firstElementChild);
	}
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