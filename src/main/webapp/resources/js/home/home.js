let isFilled = true;
		
function change(event){
    if(isFilled){
        isFilled = !isFilled;
        
        event.target.style.fill = "red";
    }else{
        isFilled = !isFilled;
        
        event.target.style.fill = "white";
    }
}
function logout(){
    localStorage.clear();
    location.href='logout';
}