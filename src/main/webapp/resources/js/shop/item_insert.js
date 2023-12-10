function upload(item_upload){
			 
	if(item_upload.i_name.value == ''){
		alert('상품명을 입력하세요');
		item_upload.i_name.focus();
		return;
	}
			 
	if(item_upload.i_price.value == ''){
		alert('상품 가격을 입력하세요');
		item_upload.i_price.focus();
		return;
	}
			 
	if(item_upload.i_color.value == ''){
		alert('상품 색상을 입력하세요');
		item_upload.i_color.focus();
		return;
	}
			 
	if(item_upload.i_amount.value == ''){
		alert('재고 수량을 입력하세요');
		return;
	}
			 
	if(item_upload.i_photo.value == ''){
		alert('상품이미지를 등록하세요');
		return;
	}
			 
	if(item_upload.i_detail_photo.value == ''){
		alert('상품 상세 이미지를 등록하세요');
		return;
	}
			 
	item_upload.submit();
}