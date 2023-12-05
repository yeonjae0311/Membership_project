//header 만들기
const header_bar = document.getElementById("header_bar");

const buttons = ["story", "board", "shop"];

let left_header = document.createElement("div");
left_header.id = "left_header";

for(const element of buttons){
	let button = document.createElement("input");
	
	button.type = "button";
	button.value = element;
	button.addEventListener("click", () => {
		send(element);
	});
	
	left_header.appendChild(button);
}

header_bar.appendChild(left_header);

function send(page){
	console.log(page);

	location.href = page;
}

//footer 만들기
let footer = document.createElement("div");
footer.innerHTML = "membership page(newjeans)";

document.getElementById("footer_bar").appendChild(footer);