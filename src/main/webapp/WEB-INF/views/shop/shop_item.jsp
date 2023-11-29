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
			#test{background-color: red;}
		</style>
	</head>
	<body>
		<form>
			<img src="resources/img/idcheck_img.gif"><br>
			상품 이름<br>
			상품 가격<br>
			<div class="dropdown">
		      <button class="dropbtn"> 
		        <span class="dropbtn_icon"></span>
		        옵션 선택
		      </button>
		      <div class="dropdown-content">
		        <a href="#">black</a>
		        <a href="#">blue</a>
		        <a href="#">white</a>
      		  </div>
    		</div>
    		<div>
    			상세정보 이미지
    		</div>
    		<div id=test>
    			<input type="button" value="장바구니" onclick=send_shopping_cart()>
    			<input type="button" value="결제하기" onclick=send_shop_payment()>
    		</div>
		</form>
	</body>
</html>