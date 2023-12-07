function send_shopping_cart(f){
				
	const i_name = f.i_name.value.trim();
	const i_color = f.i_color.value.trim();
	const cd_count = f.cd_count.value.trim();
			
	const url = "shopping_cart_insert";
	const param = {
		"i_name": encodeURIComponent(i_name),
		"i_color": encodeURIComponent(i_color),
		"cd_count": encodeURIComponent(cd_count)
	};
				
	sendRequest(url, param, return_page, "post");
} 
		
function return_page(...args){
	let res = args[0].param;

	if(res == 'success'){
		if(confirm("상품이 추가되었습니다.\n장바구니로 이동하시겠습니까?")){
			location.href='shopping_cart' ;	
		} else{
			return;
		}	
	} 
}
		
function item_delete(){
	const i_name = document.getElementById("i_name").value;
	console.log(i_name);
	const url = "item_delete";
	const param = {
		"i_name": encodeURIComponent(i_name)
	};
		
	sendRequest(url, param, delete_return, "post"); 
}

function test(){
	console.log("test");
}

function delete_return(...args){
	let res = args[0].param;

	if(res == 'success'){
		alert("해당 상품이 목록에서 삭제되었습니다.");
		location.href='shop';	
	} else{
		alert("상품 삭제에 오류가 발생했습니다.");
	} 
}

// 마스터 계정 확인해서 상품 삭제 버튼 숨기기 (localstorage 이용하기)
window.onload = function() {
	let is_master = localStorage.getItem('isMaster');
	console.log(localStorage)
	if(is_master == 0){
		document.getElementById("item_delete_id").style.display = "none"
	}
}

function send_shop_payment(){

	location.href = 'shop_payment';
		
}