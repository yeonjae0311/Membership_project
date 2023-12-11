function master_board_first(){
    let unfixed_master_list = document.getElementById("unfixed_master_list");
    let unfixed_fan_list = document.getElementById("unfixed_fan_list");

    unfixed_master_list.style="display:block";
    unfixed_fan_list.style="display:none";				
}

function all_board_first(){			
    let unfixed_master_list = document.getElementById("unfixed_master_list");
    let unfixed_fan_list = document.getElementById("unfixed_fan_list");

    unfixed_master_list.style="display:none";
    unfixed_fan_list.style="display:block";				
}

window.onload = function(){
	let priority = document.getElementById('priority').value;
	if(priority==1){
		master_board_first();
	}else{
		all_board_first();
	}
};