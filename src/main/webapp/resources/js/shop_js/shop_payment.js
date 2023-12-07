const order_item_list_obj = JSON.parse(sessionStorage.getItem("order_list"));

const order_item_list = order_item_list_obj["items"];
const totals = order_item_list_obj["final_amount"];

const order_item_list_div = document.getElementById("order_item_list_div");
const total_amount_div = document.getElementById("total_amount_div");

const IMG_PATH = window.location.origin + "/membership/resources/";

for(const key in order_item_list){
    const item = order_item_list[key];

    const item_div = document.createElement("div");
    item_div.id = item["i_idx"];

    const item_photo = document.createElement("img");
    item_photo.className = "item_photo";
    item_photo.src = IMG_PATH + "upload/shop/" + item["i_photo_name"];
    item_div.appendChild(item_photo);

    const item_info = document.createElement("div");
    item_info.className = "item_info";

    const item_info_left = document.createElement("div");
    item_info_left.className = "item_info_left";

    const item_info_right = document.createElement("div");
    item_info_right.className = "item_info_right";

    const item_name = document.createElement("div");
    item_name.className = "item_name";
    item_name.innerHTML = item["i_name"];
    item_info_left.appendChild(item_name);

    const item_color = document.createElement("div");
    item_color.className = "item_color";
    item_color.innerHTML = item["i_color"];
    item_info_left.appendChild(item_color);

    item_info.appendChild(item_info_left);

    const item_amount = document.createElement("div");
    item_amount.className = "item_amount";
    item_amount.innerHTML = item["i_amount"];
    item_info_right.appendChild(item_amount);

    const item_price = document.createElement("div");
    item_price.className = "item_price";
    item_price.innerHTML = item["i_price"];
    item_info_right.appendChild(item_price);

    item_info.appendChild(item_info_right);

    item_div.appendChild(item_info)

    order_item_list_div.appendChild(item_div);
}

for(const key in totals){
    let total_amount = document.createElement("div");
    total_amount.id = key;
    total_amount.innerHTML = `${key}: ${totals[key]}`

    total_amount_div.appendChild(total_amount);
}

console.log(order_item_list);
console.log(totals);