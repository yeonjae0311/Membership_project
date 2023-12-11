function check_fix(){
    let isfixed = document.getElementById('isfixed');
    let fixoption = document.getElementById('fixoption');
    
    switch(isfixed.value){
    case "1":
        isfixed.value ="0";
        fixoption.value = "공지글로 작성하기";
        break;
    case "0":
        isfixed.value = "1";
        fixoption.value = "일반글로 작성하기";
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