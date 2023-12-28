function check_fix(){
    let isfixed = document.getElementById('isfixed');
    let fixoption = document.getElementById('fixoption');
    
    switch(isfixed.value){
    case "1":
        isfixed.value ="0";
        fixoption.src = IMG_PATH + "pin_icon.png";
        break;
    case "0":
        isfixed.value = "1";
        fixoption.src = IMG_PATH + "pinned_icon.png";
        break;
    }
}

function send(f){				
    let title = f.b_title.value.trim();
    let content = f.b_content.value.trim();
    
    if(title == ''){
        alert('제목은 필수 사항입니다.')
        return;
    }
    
    if(content == ''){
        alert('내용은 필수 사항입니다.')
        return;
    }
    
    f.method = "post";
    f.action = "board_post_insert";
    f.submit();
}

function change_img() {
    const img_file_id = document.getElementById("b_img");
    const image_id = document.getElementById("board_img");
    // const story_img_div = document.getElementById("photo_preview");

    const img = img_file_id.files[0];
    let allowed_extensions = [".gif", ".jpg", ".png", ".bmp",".jpeg",".jfif"];

    if (img) {
        const reader = new FileReader();

        reader.onload = function(e) {
            // 파일 내용을 읽어와서 이미지 소스로 설정
            image_id.src = e.target.result;

            // console.log(image_id.naturalHeight)
            // console.log(image_id.naturalWidth)

            if(image_id.naturalHeight > image_id.naturalWidth){
                image_id.style.height = "96%";
                image_id.style.width = "";
            }else{
                image_id.style.height = "";
                image_id.style.width = "96%";
            }

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