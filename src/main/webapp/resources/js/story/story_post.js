function send(f){
    let s_content=f.s_content.value
    //빈 콘텐트도 가능
    f.method = "post";
    f.action = "story_post_insert";
    f.submit();
}