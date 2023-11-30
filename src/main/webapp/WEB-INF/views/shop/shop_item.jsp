<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>MEMBERSHIP</title>
		<style>
			#shop_button_bar{background-color: red;}
			#item_img{object-fit:cover;}
			#item_info_div{width: 200px; 
					   	   height: 300px;}
			.item_img_div{height:300px;
 						  width: 300px;}		 
			#item_img {height: 100%;
				 	   width: 100%;
				       object-fit: contain;}  	   
			.item_detail_img_div{height:600px;
 						  		 width: 300px;}	
 			.dropdown-content a:hover{
 				 background-color : #ececec}

			.dropdown:hover .dropdown-content {
 				 display: block;}
			.dropdown-content{
			  display : none;
			  position : absolute;
			  z-index : 1; /*다른 요소들보다 앞에 배치*/
			  font-weight: 400;
			  background-color: #f9f9f9;
			  min-width : 200px;
			}		
			.dropdown-content a{
			  display : block;
			  text-decoration : none;
			  color : rgb(37, 37, 37);
			  font-size: 12px;
			  padding : 12px 20px;
			}
 			
		</style>
	</head>
	<body>
		<form>
			<div id=item_info_div>
				<div class=item_img_div>
					<img id=item_img src="resources/img/shortsleeve.jpg"><br>
				</div>
				${vo.i_name}<br>
				${vo.i_price}<br>
				<div class="dropdown">
			      <button class="dropbtn"> 
			        <span class="dropbtn_icon"></span>
			        옵션 선택
			      </button>
			      <div class="dropdown-content">
			      	<c:forEach var="color" items="${colors}">
			      		<a href="#">${color}</a>
			      	</c:forEach>		      
	      		  </div>
	    		</div>
    		</div>
    		<div class=item_detail_img_div>
    			<img id=item_detail_img src="resources/img/ktda">
    		</div>
    		<div id=shop_button_bar>
    			<input type="button" value="장바구니" onclick=send_shopping_cart()>
    			<input type="button" value="결제하기" onclick=send_shop_payment()>
    		</div>
		</form>
	</body>
</html>