function change_img() {
    let img_file_id = document.getElementById("photo_file_id");
    let image_id = document.getElementById("m_profile");
    const img = img_file_id.files[0];
    let allowed_extensions = [".gif", ".jpg", ".png", ".bmp",".jpeg",".jfif"];

    if (img) {
        const reader = new FileReader();
        
        // 파일의 확장자를 체크하여 허용된 확장자인 경우에만 이미지를 설정
        let file_extension = img.name.split('.').pop().toLowerCase();
        if (allowed_extensions.includes("." + file_extension)) {
            // 파일을 읽어옴
            reader.readAsDataURL(img);
            
        } else {
            alert("허용된 확장자가 아닙니다. GIF, JPG, PNG, BMP, JPEG, JFIF 파일만 업로드 가능합니다.");
            return;
        }
        
        reader.onload = function(e) {
            // 파일 내용을 읽어와서 이미지 소스로 설정
            image_id.src = e.target.result;
        };
    }
}

function photo_default_update(f){
    f.action="photo_default_upload";
    f.method="POST";
    f.submit();
}
    
function modify(f) {
    let img_file_id = document.getElementById("photo_file_id");
    const img = img_file_id.files[0];
    let allowed_extensions = [".gif", ".jpg", ".png", ".bmp",".jpeg",".jfif"];
    let file_extension = img.name.split('.').pop().toLowerCase();
    if(!allowed_extensions.includes("." + file_extension)) {
        alert("해당 파일은 GIF, JPG, PNG, BMP, JPEG, JFIF 파일이 아닙니다.");
        return;
    }
    f.action = "user_profile_modify";
    f.method = "POST";
    f.submit();
}
