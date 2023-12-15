const IMG_PATH = window.location.origin + "/membership/resources/img/";

// tab icon
const icon_link = document.createElement("link");
icon_link.rel = "icon";
icon_link.href = IMG_PATH + "default/icon.ico";

document.head.appendChild(icon_link);

// header 만들기
const header_bar = document.getElementById("header_bar");
const buttons = ["Story", "Board", "Shop"];

const left_header = document.createElement("div");
left_header.id = "left_header";
const right_header = document.createElement("div");
right_header.id = "right_header";
const header_border = document.createElement("div");
header_border.id = "header_border";

const home_img = document.createElement("img");
home_img.id = "home_img";
home_img.src = IMG_PATH + "default/home_img.png";
home_img.addEventListener("click", () => {
	location.href = "main";
});
	
left_header.appendChild(home_img);

const button_header = document.createElement("div");
button_header.id = "button_header";

for(const element of buttons){
	const button = document.createElement("input");
	button.type = "button";
	button.className = "header_button";
	button.value = element;
	button.addEventListener("click", () => {
		if(localStorage.getItem("idx") == null || localStorage.getItem("idx") == ""){
			send_to("login_form");

			return;
		}

		if(localStorage.getItem("isMembership") != "1"){
			alert("멤버십 가입이 필요한 서비스입니다.");
			
			return;
		}

		send_to(element);
	});
	
	button_header.appendChild(button);
}

left_header.appendChild(button_header);

if(localStorage.getItem("idx") == null || localStorage.getItem("idx") == ""){

	const shopping_cart_div = document.createElement("div");
	shopping_cart_div.id = "shopping_cart_div";
	shopping_cart_div.addEventListener("click", () => {
		send_to("login_form");
	});
	
	right_header.appendChild(shopping_cart_div);
	
	const my_page_div = document.createElement("div");
	my_page_div.id = "my_page_div";	
	my_page_div.addEventListener("click", () => {
		send_to("login_form");
	});
	
	right_header.appendChild(my_page_div);
	
	const shopping_cart_img = document.createElement("img");
	shopping_cart_img.src = IMG_PATH + "user/cart.png";
	
	shopping_cart_div.appendChild(shopping_cart_img);
	
	const my_page_img = document.createElement("img");
	my_page_img.src = IMG_PATH + "user/user_profile.png";
	
	my_page_div.appendChild(my_page_img);

}else{

	const shopping_cart_div = document.createElement("div");
	shopping_cart_div.id = "shopping_cart_div";
	shopping_cart_div.addEventListener("click", () => {
		send_to("shopping_cart");
	});
	
	right_header.appendChild(shopping_cart_div);
	
	const my_page_div = document.createElement("div");
	my_page_div.id = "my_page_div";	
	my_page_div.addEventListener("click", () => {
		send_to("user_edit");
	});
	
	right_header.appendChild(my_page_div);
	
	const shopping_cart_img = document.createElement("img");
	shopping_cart_img.src = IMG_PATH + "user/cart.png";
	
	shopping_cart_div.appendChild(shopping_cart_img);
	
	const my_page_img = document.createElement("img");
	my_page_img.src = IMG_PATH + "user/user_profile.png";
	
	my_page_div.appendChild(my_page_img);


}

header_bar.appendChild(left_header);
header_bar.appendChild(right_header);
header_bar.appendChild(header_border);

function send_to(page){
	location.href = page;
}

// footer 만들기
let footer = document.createElement("div");
footer.innerHTML = "membership page(newjeans)";

document.getElementById("footer_bar").appendChild(footer);

// localStorage login
const m_id = localStorage.getItem("id");
const m_password = localStorage.getItem("password");
const session = sessionStorage.getItem("session");

if(m_id != null && m_password != null && session === null){
	let url = "login";

	let param = {
		"m_id": encodeURIComponent(m_id),
		"m_password": encodeURIComponent(m_password)
	};
	send_request(url, param, my_check, "post");
}

function my_check(...args){
	let res = args[0];

	let form = document.getElementsByTagName("form")[0];
	
	localStorage.setItem("idx", res.m_idx);
	localStorage.setItem("id", res.m_id);
	localStorage.setItem("password", res.m_password);
	localStorage.setItem("isMaster", res.m_ismaster);
	localStorage.setItem("isMembership", res.m_ismembership);

	sessionStorage.setItem("session", true);

	if(res["param"] == 'no_m_id'){
		alert('아이디가 존재하지 않습니다.');
		form.m_id.focus();
		return;
	} else if(res["param"] == 'no_m_password'){
		alert('비밀번호가 일치하지 않습니다');
		form.m_password.focus();
		return;
	} else {
		location.href='main';
	}
}