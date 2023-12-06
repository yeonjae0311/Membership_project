//header 만들기
const header_bar = document.getElementById("header_bar");

const buttons = ["main", "story", "board", "shop"];

let left_header = document.createElement("div");
left_header.id = "left_header";

for(const element of buttons){
	let button = document.createElement("input");
	
	button.type = "button";
	button.value = element;
	button.addEventListener("click", () => {
		send_main(element);
	});
	
	left_header.appendChild(button);
}

header_bar.appendChild(left_header);

function send_main(page){
	console.log(page);

	location.href = page;
}

//footer 만들기
let footer = document.createElement("div");
footer.innerHTML = "membership page(newjeans)";

document.getElementById("footer_bar").appendChild(footer);

//localStorage login
const m_id = localStorage.getItem("id");
const m_password = localStorage.getItem("password");
const session = sessionStorage.getItem("session");

if(m_id != null && m_password != null && session === null){
	let url = "login";

	let param = {
		"m_id": encodeURIComponent(m_id),
		"m_password": encodeURIComponent(m_password)
	};
	sendRequest(url, param, myCheck, "post");
}
