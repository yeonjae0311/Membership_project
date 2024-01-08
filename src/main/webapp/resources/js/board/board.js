function master_board_first(){
    let unfixed_master_list = document.getElementById("unfixed_master_list");
    let unfixed_fan_list = document.getElementById("unfixed_fan_list");

    unfixed_master_list.style="display: block";
    unfixed_fan_list.style="display: none";

    document.getElementById("board_title").innerHTML = "NewJeans";
}

function all_board_first(){			
    let unfixed_master_list = document.getElementById("unfixed_master_list");
    let unfixed_fan_list = document.getElementById("unfixed_fan_list");

    unfixed_master_list.style="display: none";
    unfixed_fan_list.style="display: block";
    
    document.getElementById("board_title").innerHTML = "Bunnys";
}

function adjust_size(e){
    let switch_value = e.target.dataset;
    
    const switch_img = document.getElementById("adjust_size_button");

    const fixed_list_table = document.getElementById("fixed_list_table").style;

    if(switch_value.value == "down"){
        switch_value.value = "up";
        switch_img.src = window.location.origin + "/membership/resources/img/arrow_" + switch_value.value + "_icon.png";

        console.log(fixed_list_table)
        fixed_list_table.maxHeight = "100%";
    }else{
        switch_value.value = "down";
        switch_img.src = window.location.origin + "/membership/resources/img/arrow_" + switch_value.value + "_icon.png";
        
        fixed_list_table.maxHeight = "14vh";
    }
}

window.onload = function(){
	let priority = document.getElementById('priority').value;
	if(priority==1){
		master_board_first();
	}else{
		all_board_first();
	}
};

function search(){
	let search_field_value = document.getElementById('search_field').value;
	let search_word_value = document.getElementById('search_word').value;
	
	location.href='board?&search_field='+search_field_value+'&search_word='+search_word_value;
}