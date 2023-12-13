const container = document.querySelector(".img_container");
const prevBtn = document.querySelector(".left");
const nextBtn = document.querySelector(".right"); 

(function addEvent(){
  prevBtn.addEventListener('click', translateContainer.bind(this, 1));
  nextBtn.addEventListener('click', translateContainer.bind(this, -1));
})();

function translateContainer(direction){
  const selectedBtn = (direction === 1) ? 'left' : 'right';
  container.style.transitionDuration = '1s';
  container.style.transform = `translateX(${direction * (100 / 5)}%)`;
  container.ontransitionend = () => reorganizeEl(selectedBtn);
}

function reorganizeEl(selectedBtn) {
  container.removeAttribute('style');
  (selectedBtn === 'left') ? container.insertBefore
  (container.lastElementChild, container.firstElementChild): container.appendChild(container.firstElementChild);
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