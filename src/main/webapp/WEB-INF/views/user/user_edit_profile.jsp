<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<div>
		<img src="resources/img/kicet.gif">
		<!-- json으로 수정 -->
		user_name<br>
		user_email
	</div>
	<div onclick="location.href='user_info_form'">
		사용자 정보
	</div>
	<div onclick="location.href='user_order_list'">
		주문 내역
	</div>
	<div onclick="location.href='user_post'">
		글 작성 내역
	</div>
</body>
</html>