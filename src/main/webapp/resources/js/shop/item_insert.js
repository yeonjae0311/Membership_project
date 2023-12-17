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

function change_img(event) {
	const element_id = event.target.id + "_img";

    const img_file_id = document.getElementById(event.target.id);
    const image_id = document.getElementById(element_id);
    // const story_img_div = document.getElementById("story_img_div");

    const img = img_file_id.files[0];
    let allowed_extensions = [".gif", ".jpg", ".png", ".bmp"];

    if (img) {
        const reader = new FileReader();

        reader.onload = function(e) {
            // 파일 내용을 읽어와서 이미지 소스로 설정
            image_id.src = e.target.result;
			image_id.style.width = "96%";
			// image_id.style.padding = "2%";

            // console.log(story_img_div)
            // console.log(window.screen.height * .4)
            // console.log(window.screen.width * .3)

            // story_img_div.st

            // console.log(image_id.naturalHeight)
            // console.log(image_id.naturalWidth)

            // if(image_id.naturalHeight < (window.screen.height * .4)){
            //     console.log("height")
            //     story_img_div.style.height = "" + image_id.naturalHeight + "px";
            // }

            // if(image_id.naturalWidth < (window.screen.width * .3)){
            //     console.log("width")
            //     story_img_div.style.width = "" + image_id.naturalWidth + "px";
            // }
        };
        
        // 파일의 확장자를 체크하여 허용된 확장자인 경우에만 이미지를 설정
        let file_extension = img.name.split('.').pop().toLowerCase();
        if (allowed_extensions.includes("." + file_extension)) {
            // 파일을 읽어옴
            reader.readAsDataURL(img);
        } else {
            alert("허용된 확장자가 아닙니다. GIF, JPG, PNG, BMP 파일만 업로드 가능합니다.");
            img_file_id.value = ""; // 파일 선택 창 비우기
        }
    }
}