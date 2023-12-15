function shop_item_select(f){
    f.action = "shop_item";
    f.submit();
}

window.onload = function(){
    let is_master = document.getElementById("is_master");

    if(is_master == 0){
        document.getElementById("add_item").style.display = "none";
    }
}