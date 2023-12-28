function change_img() {
    const img_file_id = document.getElementById("s_img");
    const image_id = document.getElementById("story_img");
    // const story_img_div = document.getElementById("story_img_div");

    const img = img_file_id.files[0];
    let allowed_extensions = [".gif", ".jpg", ".png", ".bmp"];

    if (img) {
        const reader = new FileReader();

        reader.onload = function(e) {
            // 파일 내용을 읽어와서 이미지 소스로 설정
            image_id.src = e.target.result;

            if(image_id.naturalHeight > image_id.naturalWidth){
                image_id.style.height = "96%";
                image_id.style.width = "";
            }else{
                image_id.style.height = "";
                image_id.style.width = "96%";
            }

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
            alert("허용된 확장자가 아닙니다. GIF, JPG, PNG, BMP, JPEG, JFIF 파일만 업로드 가능합니다.");
            img_file_id.value = ""; // 파일 선택 창 비우기
        }
    }
}

function send(){

	const img_file = document.getElementById("s_img").value;
	
	if(img_file == ''){
		alert("이미지를 등록해주세요");
		return;
	}
	
    const story_form = document.getElementById("story_post_form")

    let s_content=story_form.s_content.value;
    //빈 콘텐트도 가능
    story_form.method = "post";
    story_form.action = "story_post_insert";
    story_form.submit();
}