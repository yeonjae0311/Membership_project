const IMG_PATH = window.location.origin + "/membership/resources/img/";

// tab icon
const icon_link = document.createElement("link");
icon_link.rel = "icon";
icon_link.href = IMG_PATH + "default/icon.ico";

document.head.appendChild(icon_link);

// header 만들기
const header_bar = document.getElementById("header_bar");
const buttons = ["story", "board", "shop"];

const left_header = document.createElement("div");
left_header.id = "left_header";
const right_header = document.createElement("div");
right_header.id = "right_header";

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
			send_to("main");

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
	const login_button = document.createElement("input");
	login_button.type = "button";
	login_button.value = "로그인";
	login_button.addEventListener("click", () => {
		send_to("login_form");
	});

	right_header.appendChild(login_button);

	const register_button = document.createElement("input");
	register_button.type = "button";
	register_button.value = "회원가입";
	register_button.addEventListener("click", () => {
		send_to("member_insert_form");
	});

	right_header.appendChild(register_button);

	const my_page_button = document.createElement("input");
	my_page_button.type = "button";
	my_page_button.value = "마이페이지";
	my_page_button.addEventListener("click", () => {
		send_to("login_form");
	});

	right_header.appendChild(my_page_button);
}else{
	const logout_button = document.createElement("input");
	logout_button.type = "button";
	logout_button.value = "로그아웃";
	logout_button.addEventListener("click", logout);

	right_header.appendChild(logout_button);

	const my_page_button = document.createElement("input");
	my_page_button.type = "button";
	my_page_button.value = "마이페이지";
	my_page_button.addEventListener("click", () => {
		send_to("user_edit");
	});

	right_header.appendChild(my_page_button);
}

header_bar.appendChild(left_header);
header_bar.appendChild(right_header);

function send_to(page){
	location.href = page;
}

function logout(){
	localStorage.clear();
	location.href='logout';
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