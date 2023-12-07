<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${pageContext.request.contextPath}/resources/css/login/congratulations_register.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
</head>
<body>
	<div id="header_bar"></div>
	
	<div>
		회원가입을 축하합니다
		NewJeans Membership을 가입하시면 해당 혜택을 이용하실 수 있습니다
	</div>
		
	<div>	
		스토리 보기
		게시글 보기 및 작성
	</div>
	
	<div>	
		Membership 가입하러 가기
	</div>
	
	<div>
		<input type="button" value="가입하기" onclick="location.href='shop_payment'">
		<input type="button" value="홈으로" onclick="location.href='main'">
	</div>
	
	<div id="footer_bar"></div>
</body>
</html>