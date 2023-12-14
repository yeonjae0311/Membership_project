window.onload = function(){
let images = document.querySelectorAll(".banner_img");
let current_idx = 0;
let position = 0;
const img_width = 60.1;  // css에서 설정한 width 값과 동일하게 맞춰주세요
const left_btn = document.querySelector(".left")
const right_btn = document.querySelector(".right")
const container = document.querySelector(".img_container")

/*function previous(){
  if(current_idx > 0){
   // right_btn.removeAttribute("disabled")
    position += img_width;
    container.style.transform = `translateX(${position}vw)`;
    current_idx = current_idx - 1;
  }
  else if(current_idx == 0){
    //left_btn.setAttribute('disabled', 'true');
    current_idx = images.length-1;
    position = -(images.length-1) * img_width;
    container.style.transform = `translateX(${position}vw)`;
  }
}*/

function next(){
  if(current_idx < images.length-1){
    //left_btn.removeAttribute("disabled")
    position -= img_width;
    container.style.transform = `translateX(${position}vw)`;
    current_idx = current_idx + 1;
  }
  else if(current_idx == images.length-1){
    //right_btn.setAttribute('disabled', 'true');
    current_idx = 0;
    position = 0;
    container.style.transform = `translateX(${position}vw)`;
  }
}
 
function init(){
  left_btn.addEventListener("click", previous)
  //left_btn.addEventListener("click", previous)
  right_btn.addEventListener("click", next)
}
 
setInterval(next, 6000);
 
init();
}





function managerfunc(){
    let unfixed_master_list = document.getElementById("unfixed_master_list");
    let unfixed_fan_list = document.getElementById("unfixed_fan_list");

    unfixed_master_list.style="display:block";
    unfixed_fan_list.style="display:none";				
}

function userfunc(){			
    let unfixed_master_list = document.getElementById("unfixed_master_list");
    let unfixed_fan_list = document.getElementById("unfixed_fan_list");

    unfixed_master_list.style="display:none";
    unfixed_fan_list.style="display:block";				
}