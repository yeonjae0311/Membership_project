async function send_request(url, param, callBack, method){
	let response;
	let res;
	
	method = method.toUpperCase();
	
	let http_param = (param === null || param === "") ? null : param;
	
	if(method === "GET" && http_param !== null){
		let param_string = "?";
		
		for(let key in param){
			param_string += key + "=" + param[key] + "&";
		}
		
		url += param_string;
		
		url = url.slice(0, -1)
	}
		
	if(method === "GET"){
		response = await fetch(url, {
			method: method,
			headers: {"Content-Type": "application/json"}
		});
	}else{
		response = await fetch(url, {
			method: method,
			headers: {"Content-Type": "application/json"},
			body: JSON.stringify(http_param)
		});
	}
	
	if(response.ok === true && response.status === 200){
		res = await response.json();
	}
	
	callBack(res)
}
